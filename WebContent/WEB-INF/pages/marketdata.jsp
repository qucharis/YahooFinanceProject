<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Market data</title>
<link href='http://fonts.googleapis.com/css?family=Orbitron'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Unkempt:400,700'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Cinzel'
	rel='stylesheet' type='text/css'>
<link href="css/bootstrap.css" rel="stylesheet">

<style type="text/css">
h3 {
	color: #F6FF52;
	text-align: center;
	font-family: 'Cinzel', serif;
	font-weight: 700;
	letter-spacing: 1px;
}

.yahoo {
	color: green;
	font-size: 36px;
	letter-spacing: 3px;
	font-family: 'Orbitron', sans-serif;
	font-weight: 700;
}

.finance {
	color: #D00000;
	font-size: 36px;
	letter-spacing: 3px;
	font-family: 'Orbitron', sans-serif;
	font-weight: 700;
}

table {
	margin-left: auto;
	margin-right: auto;
}

.center {
	margin: auto;
	width: 15%;
	padding: 10px;
}

html {
	min-height: 100%;
}

body {
	background-image: url(images/city2.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<script src="js/jquery.min.js"></script>
<script src="js/angular.min.js"></script>
<script src="js/angular-resource.min.js"></script>
<!-- angularJS Ajax call: http call -->
<script src="js/bootstrap.js"></script>
<script>
	var module = angular.module("mainModule", []);
	module.controller("mainController", function($scope, $interval, $http) {
		// Initialization
		$scope.stocksArray = $.parseJSON('${Requests}');
		$interval(function() {
			$http({
				method : "GET",
				url : "rest/market",
			}).success(function(data) {
				$scope.stocksArray = data;
			}).error(function(data) {
				//alert("AJAX Error!");
			});
		}, 2000);
	});

	module.controller("bsController", function($scope, $http) {

		$scope.request = {
			code : "",
			amount : null
		};
		$scope.welcomeMsg = "Please enter the StockCode and Amount";
		$scope.canShow = false;

		$scope.buyRequest = function(request, resultVarName) {

			var pa = {
				code : request.code,
				amount : request.amount
			};
			var msg = "";
			request.code = "";
			$http({
				method : "POST",
				url : "rest/buySub",
				params : pa,
				data : msg,
				headers : {
					'Content-Type' : 'application/x-www-form-urlencoded'
				}
			}).success(function(data, status, headers, config) {
				$scope[resultVarName] = data;
				request.code = "";
				request.amount = 0;
				$scope.welcomeMsg = data;
			}).error(function(data, status, headers, config) {
				$scope[resultVarName] = "SUBMIT ERROR";
			});
		};

		$scope.sellRequest = function(request, resultVarName) {

			var pa = {
				code : request.code,
				amount : request.amount
			};

			$http({
				method : "POST",
				url : "rest/sellSub",
				params : pa,
				data : pa,
				headers : {
					'Content-Type' : 'application/x-www-form-urlencoded'
				}
			}).success(function(data, status, headers, config) {
				$scope[resultVarName] = data;
				request.code = "";
				request.amount = null;
				$scope.welcomeMsg = data;
			}).error(function(data, status, headers, config) {
				$scope[resultVarName] = "SUBMIT ERROR";
			});
		};
	});
</script>
</head>
<body ng-app="mainModule">
	<div class="navbar navbar-default navbar-static-top">
		<div class="container">
			<a class="navbar-header" href="/YahooFinanceProject/login.html"><img
				src="images/dollar2.jpg" height="50" width="50"></a> <a
				class="navbar-header" class="navbar-header"
				href="/YahooFinanceProject/login.html"> <span class="yahoo">YAHOO</span>
				<span class="finance">FINANCE</span>
			</a>

			<button class="navbar-toggle" data-toggle="collapse"
				data-target=".navHeaderCollapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>

			<div class="collapse navbar-collapse navHeaderCollapse">
				<ul id="menu" class="nav navbar-nav navbar-right">
					<li><a href="/YahooFinanceProject/main.html">Portfolio</a></li>
					<li><a href="/YahooFinanceProject/transaction.html">Transaction</a></li>
					<li class="active"><a
						href="/YahooFinanceProject/marketdata.html">Market Data</a></li>
					<li><a href="/YahooFinanceProject/history.html">History</a></li>
					<li><a href="<c:url value='/j_spring_security_logout'/>">Logout</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div ng-controller="mainController">
		<h3>Real Time Market Data</h3>
		<div class="table-responsive">
			<table id="stockList" border="1" style="width: 500px"
				class="table table-striped table-bordered table-hover table-responsive">
				<tr class="danger">
					<th>Stock Code</th>
					<th>Stock Name</th>
					<th>Current Price</th>
					<th>Price Change</th>
				</tr>

				<tr ng-repeat="stock in stocksArray" class="success">
					<td>{{stock.scode}}</td>
					<td>{{stock.stockName}}</td>
					<td>{{stock.currentPrice}}</td>
					<td><b ng-if="stock.pricechange>0" style="color: green">{{stock.pricechange}}</b>
						<b ng-if="stock.pricechange<0" style="color: red">{{stock.pricechange}}</b>
						<b ng-if="stock.pricechange==0" style="color: black">{{stock.pricechange}}</b>
					</td>
				</tr>
			</table>
			</div>
	</div>

	<div class = "center">
		<button id="buy" data-toggle="modal" data-target="#myModal1" type="submit" class="btn btn-warning btn-lg">Buy</button>
		<button id="sell" display = "inline" data-toggle="modal" data-target="#myModal2" type="submit" class="btn btn-warning btn-lg">Sell</button>
	</div>
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- modal header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel2">Selling out</h4>
				</div>
				<!-- modal body -->
				<div class="modal-body" ng-controller="bsController">

					<form class="form-horizontal"
						ng-submit="sellRequest(request, 'ajaxResult')" novalidate>
						<div class="panel panel-default">
							<div class="panel-body bg-primary">{{welcomeMsg}}</div>
						</div>

						<!-- Username -->

						<div class="form-group">
							<label for="StockCode" class="col-sm-2 control-label">Stock
								Code:</label> <span class="glyphicon glyphicon-asterisk"></span>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="code2"
									ng-model="request.code" placeholder="StockCode" name="code2"
									required>

							</div>
						</div>

						<div class="alert" style="display: none;" id="userExist2">
							<p>The user already exists</p>
						</div>

						<div class="form-group">
							<label for="amount" class="col-sm-2 control-label">Amount:</label>
							<span class="glyphicon glyphicon-asterisk"></span>
							<div class="col-sm-6">
								<input type="number" class="form-control" min="0"
									ng-model="request.amount" id="amount2" placeholder="Amount"
									name="amount" required>
							</div>
						</div>
						<div class="well well-sm">
							<strong> <span class="glyphicon glyphicon-asterisk"></span>
								Required Field
							</strong>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default">Submit</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- modal header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Buying In</h4>
				</div>
				<!-- modal body -->
				<div class="modal-body" ng-controller="bsController">
					<form class="form-horizontal"
						ng-submit="buyRequest(request, 'ajaxResult')" novalidate>
						<div class="panel panel-default">
							<div class="panel-body bg-primary">{{welcomeMsg}}</div>
						</div>

						<!-- Username -->
						<div class="form-group">
							<label for="StockCode" class="col-sm-2 control-label">Stock
								Code:</label> <span class="glyphicon glyphicon-asterisk"></span>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="code"
									ng-model="request.code" placeholder="StockCode" name="code"
									required>
							</div>
						</div>

						<div class="alert" style="display: none;" id="userExist">
							<p>The user already exists</p>
						</div>

						<div class="form-group">
							<label for="amount" class="col-sm-2 control-label">Amount:</label>
							<span class="glyphicon glyphicon-asterisk"></span>
							<div class="col-sm-6">
								<input type="number" class="form-control" min="0"
									ng-model="request.amount" id="amount" placeholder="Amount"
									name="amount" required>
							</div>
						</div>
						<div class="well well-sm">
							<strong> <span class="glyphicon glyphicon-asterisk"></span>
								Required Field
							</strong>
						</div>

						<div class="form-group">
							<div class="c2ol-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default">Submit</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


</body>
</html>