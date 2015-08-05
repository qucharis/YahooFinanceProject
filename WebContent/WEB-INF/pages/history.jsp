<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>History</title>
<link href='http://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Orbitron' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Unkempt:400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Cinzel' rel='stylesheet' type='text/css'>
<link href="css/bootstrap.css" rel="stylesheet">

<style type="text/css">
h3 {
	color: #F6FF52;
	text-align:center;
	font-family: 'Cinzel', serif;
	font-weight: 900;
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
	margin-left:auto; 
    margin-right:auto;
}

html {
	min-height: 100%;
}

body {
	background-image: url(images/city3.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}

.bar {
 	/* margin-left:auto; */
 	text-align:center; 
 	font-size: 20px;
 	color: #F6FF52;
}

.glyphicon {
	font-size: 25px;
	position: relative;
	top: 10px;
}
.search {
	color: black;
}
</style>
<script src="js/1.10.2/jquery.min.js"></script>
<script src= "js/angular.min.js"></script>
<script src="js/angular-resource.min.js"></script><!-- angularJS Ajax call: http call -->
<script src="js/bootstrap.js"></script>

<script>
	var app = angular.module("mainModule", []);
	app.controller("mainController", function($scope, $interval, $http) {
		// Initialization
		$scope.historyArray = [];
		$scope.search = [];
		//$interval(function() {
			$http({
				method: "POST",
				url: "rest/historyrecord",
				//params: {name: ""},
				//data: "hello",
				headers: {'Content-Type': 'application/x-www-form-urlencoded'}
			}).success(function(data) {
				$scope.historyArray = data;
			}).error(function(data) {
				alert("AJAX Error!");
			});
		//}, 2000);
	});
</script>

</head>

<body ng-app="mainModule">

<div class="navbar navbar-default navbar-static-top">
	<div class="container">
		<a class="navbar-header" href="/YahooFinanceProject/login.html"><img src="images/dollar2.jpg" height="50" width="50"></a> 
		<a class="navbar-header" class="navbar-header" href="/YahooFinanceProject/login.html"> 
			<span class="yahoo">YAHOO</span> <span class="finance">FINANCE</span>
		</a>
		
		<button class="navbar-toggle" data-toggle= "collapse" data-target= ".navHeaderCollapse">
			<span class= "icon-bar"></span>
			<span class= "icon-bar"></span>
			<span class= "icon-bar"></span>
		</button>
		
		<div class= "collapse navbar-collapse navHeaderCollapse">
			<ul id= "menu" class= "nav navbar-nav navbar-right">
				<li><a href = "/YahooFinanceProject/main.html">Portfolio</a></li>
				<li><a href = "/YahooFinanceProject/transaction.html">Transaction</a></li>
				<li><a href = "/YahooFinanceProject/marketdata.html">Market Data</a></li>
				<li class= "active"><a href = "/YahooFinanceProject/history.html">History</a></li>
				<li><a href="<c:url value='/j_spring_security_logout'/>">Logout</a></li>
			</ul>
		</div>
	</div>
</div>

	<div ng-controller="mainController">
		<h3>Hello {{historyArray[0].user.userName}}, this is your transaction history</h3>
		<div class="bar">
			<br>
		<!-- Create a binding between the searchString model and the text field -->
			
			<p>
				<input class="search" type="text" ng-model="searchString" placeholder="Enter your search criteria" />
				<span class="glyphicon glyphicon-search"></span>
			</p>
			<br>
			<br>
	</div>
		<div class="table-responsive"> 
			<table id="stockList" border="1" style="width: 800px" class="table table-striped table-bordered table-hover table-responsive">
				<tr class="danger">
					<th>Index</th>
					<th>Stock Code</th>
					<th>Stock Name</th>
					<th>Amount</th>
					<th>Unit Price</th>
					<th>Transaction Time</th>
					
				</tr>
				<tr ng-repeat="history in historyArray | filter:searchString" class="success">
					
					<td ng-if="$odd" >{{ $index + 1 }}</td>
					<td ng-if="$even">{{ $index + 1 }}</td>
					<td ng-if="$odd" >{{history.stock.scode | uppercase}}</td>
					<td ng-if="$even">{{history.stock.scode | uppercase}}</td>
					<td ng-if="$odd" >{{history.stock.stockName}}</td>
					<td ng-if="$even">{{history.stock.stockName}}</td>
					<td ng-if="$odd" >{{history.amount}}</td>
					<td ng-if="$even">{{history.amount}}</td>
					<td ng-if="$odd" >{{history.unitprice}}</td>
					<td ng-if="$even">{{history.unitprice}}</td>
					<td ng-if="$odd" >{{history.time}}</td>
					<td ng-if="$even">{{history.time}}</td>
					<%-- <td>
						<b ng-if="stock.change>0" style="color:green">{{stock.change}}</b>
						<b ng-if="stock.change<0" style="color:red">{{stock.change}}</b>
						<b ng-if="stock.change==0" style="color:black">{{stock.change}}</b>
					</td> --%>
				</tr>
			</table>
		</div>
	</div>

</body>
</html>