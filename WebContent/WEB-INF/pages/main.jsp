<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Portfolio</title>
<link href='http://fonts.googleapis.com/css?family=Oxygen'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Orbitron'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Unkempt:400,700'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Cinzel'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/style.css" type="text/css">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">

<style type="text/css">
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

h2 {
	color: #F6FF52;
	text-align: center;
	font-family: 'Cinzel', serif;
	font-weight: 700;
	letter-spacing: 1px;
}

#tbl {
	float: right;
	font-size: 120%;
	width: 24%;
	margin-right: 1.5cm;
}

#tbl th {
	padding-right: 8px;
}

#towns {
	margin-left: auto;
	margin-right: auto;
	width: 500px;
	font-size: 100%;
}

.alert {
	display: none;
}

#addSuccess {
	color: red;
}

#chartdiv1 {
	width: 600px;
	height: 400px;
	float: left;
	margin-left: 3%;
}

#chartdiv2 {
	width: 600px;
	height: 400px;
	float: left;
	margin-left: 3%;
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
	background-image: url(images/back.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<script src="js/jquery.min.js"></script>
<script src="js/angular.min.js"></script>
<script src="js/angular-resource.min.js"></script>
<!-- angularJS Ajax call: http call -->
<script src="js/bootstrap.js"></script>
<script src="js/amcharts.js" type="text/javascript"></script>
<script src="js/pie.js" type="text/javascript"></script>
<jsp:useBean id="stockInfo" scope="request"
	class="com.mercury.beans.StockInfo" />

<script>
	var module = angular.module("mainModule", []);
	module.controller("mainController", function($scope, $http) {
		$scope.request = {
			amount : 0
		};
		$scope.isAmountValid = function() {
			if ($scope.request.amount > 0 && $scope.request.amount <= 1000000)
				return true;
		};

		$scope.currentbalance = $("#remoteBalance").text();
		$scope.welcomeMsg = "Please enter the Money you want to add";
		//$scope.canShow = false;	    
		$scope.addMoneyRequest = function(request, resultVarName) {
			var params = $.param({
				amount : request.amount
			});
			//var msg;
			$http({
				method : "POST",
				url : "rest/addBal",
				data : params,
				headers : {
					'Content-Type' : 'application/x-www-form-urlencoded'
				}
			}).success(function(data, status, headers, config) {
				$scope[resultVarName] = data;
				request.amount = 0;
				$scope.currentbalance = data;
				if ($scope.currentbalance > 99000000) {
					$scope.isAmountValid = false;
				}
				//$scope.welcomeMsg = data; 
			}).error(function(data, status, headers, config) {
				$scope[resultVarName] = "SUBMIT ERROR";
			});
		};
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

<script>
	var set1 = [];
	var set2 = [];
	var set3 = [];
</script>

<c:forEach var="stockInfo" items="${stockInfos}">
	<script>
		var up = ('${stockInfo.getCurrentPrice()}' * '${stockInfo.getAmount()}') | 0;
		var stock1 = {
			"stock" : "${stockInfo.getStockName()}",
			"price" : '${stockInfo.getAmount()}'
		};
		var stock2 = {
			"stock" : "${stockInfo.getStockName()}",
			"value" : up
		};
		var stock3 = {
			"scode":'${stockInfo.getScode()}',
			"stock" : '${stockInfo.getStockName()}',
			"amount" : '${stockInfo.getAmount()}',
			"price" : '${stockInfo.getCurrentPrice()}'
		}
		set1.push(stock1);
		set2.push(stock2);
		set3.push(stock3);
	</script>
</c:forEach>
<script>
	module.controller("displayController", function($scope) {
		$scope.stockInfos = set3;
	});
</script>


<script>
	var chart1;
	var chartData1 = set1;
	var chart2;
	var chartData2 = set2;

	AmCharts
			.ready(function() {
				// PIE CHART
				chart1 = new AmCharts.AmPieChart();
				chart2 = new AmCharts.AmPieChart();

				// title of the chart
				chart1.addTitle("Stock volume", 16);
				chart2.addTitle("Stock value", 16);

				chart1.dataProvider = chartData1;
				chart1.titleField = "stock";
				chart1.valueField = "price";
				chart1.sequencedAnimation = true;
				chart1.startEffect = "elastic";
				chart1.innerRadius = "10%";
				chart1.startDuration = 1;
				chart1.labelRadius = 10;
				chart1.balloonText = "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>";
				// the following two lines makes the chart 3D
				chart1.depth3D = 10;
				chart1.angle = 5;

				chart2.dataProvider = chartData2;
				chart2.titleField = "stock";
				chart2.valueField = "value";
				chart2.sequencedAnimation = true;
				chart2.startEffect = "elastic";
				chart2.innerRadius = "10%";
				chart2.startDuration = 1;
				chart2.labelRadius = 10;
				chart2.balloonText = "[[title]]<br><span style='font-size:14px'><b>$[[value]]</b> ([[percents]]%)</span>";
				// the following two lines makes the chart 3D
				chart2.depth3D = 10;
				chart2.angle = 5;

				// WRITE
				chart1.write("chartdiv1");
				chart2.write("chartdiv2");
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
					<li class="active"><a href="/YahooFinanceProject/main.html">Portfolio</a></li>
					<li><a href="/YahooFinanceProject/transaction.html">Transaction</a></li>
					<li><a href="/YahooFinanceProject/marketdata.html">Market
							Data</a></li>
					<li><a href="/YahooFinanceProject/history.html">History</a></li>
					<li><a href="<c:url value='/j_spring_security_logout'/>">Logout</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div ng-controller="mainController">
		<table  id="tbl">
			<tr>
				<th><button id="addmoney" data-toggle="modal"
						data-target="#balModal" class="btn btn-primary btn-sm">Add
						Money</button></th>
				<th>Your Balance: <span style="color: red">$<span></span></span><span id="j_name" style="color: red">{{currentbalance}}</span></th>
			</tr>
		</table>
		<!-- Add Money Modal -->
		<div class="modal fade" id="balModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- modal header -->
					<div class="modal-header">
						<button type="button" class="close"
							ng-click="myStyle={'display':'none'}" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Adding Money</h4>
					</div>
					<!-- modal body -->
					<div class="modal-body">
						<form name="balForm" class="form-horizontal"
							ng-submit="addMoneyRequest(request, 'ajaxResult')" novalidate>
							<div class="panel panel-default">
								<div class="panel-body bg-primary">{{welcomeMsg}}</div>
							</div>
							<!-- Amount -->
							<div class="form-group">
								<label for="amount" class="col-sm-2 control-label">Amount:</label>
								<span class="glyphicon glyphicon-asterisk"></span>
								<div class="col-sm-6">
									<input type="number" class="form-control" id="amount"
										ng-model="request.amount" placeholder="Amount" name="amount"
										required>
								</div>
							</div>
							<!--    	        		<div class="well well-sm">
          				<strong>
          					<span class="glyphicon glyphicon-asterisk"></span>
          					Required Field
          				</strong>
          			</div> -->

							<!-- alert -->
							<div class="alert" ng-style="myStyle" id="addSuccess">
								<p>Add Money Successfully</p>
							</div>
							<!-- modal footer -->
							<div class="modal-footer">
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button class="btn btn-default" data-dismiss="modal"
											ng-click="myStyle={'display':'none'}">Close</button>
										<button ng-disabled="!isAmountValid()" id="confirm"
											type="submit" class="btn btn-primary"
											ng-click="myStyle={'display':'block'}">Confirm</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<h2>
		<font>${ownershipInfo.message}</font>
	</h2>

	<div style="display: none">
		<p id="remoteBalance">${balance}</p>
		<!-- jsp expression -->
	</div>



	<%-- <h3>Your Balance: ${balance} <span><button id="submit1">Add Money</button></span></h3> --%>
	<table id="towns" ng-controller="displayController" width="200"
		border="1"
		class="table table-striped table-bordered table-hover table-responsive">
		<tr class = "danger">
			<th>Stock Name</th>
			<th>Stock Code</th>
			<th>Quantity</th>
			<th>Current Price</th>
		</tr>
		<tr  ng-repeat="stockInfo in stockInfos" class = "success">
			<td ng-if="stockInfo.amount !=0">{{stockInfo.stock}}</td>
			<td ng-if="stockInfo.amount !=0">{{stockInfo.scode}}</td>
			<td ng-if="stockInfo.amount !=0">{{stockInfo.amount}}</td>
			<td ng-if="stockInfo.amount !=0">{{stockInfo.price}}</td>
		</tr>
	</table>

	<div>
		<div class="center">
			<button id="buy" data-toggle="modal" data-target="#myModal1"
				type="submit" class="btn btn-primary btn-lg">Buy</button>
			<button id="sell" display="inline" data-toggle="modal"
				data-target="#myModal2" type="submit" class="btn btn-primary btn-lg">Sell</button>

		</div>
	</div>





	<div id="chartdiv1"></div>
	<div id="chartdiv2"></div>


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