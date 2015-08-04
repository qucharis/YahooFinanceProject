<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="JSONArray" scope="request" class="org.json.JSONArray"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Yahoo Finance System</title>
<link href='http://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Orbitron' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Unkempt:400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Cinzel' rel='stylesheet' type='text/css'>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src= "js/angular.min.js"></script>
<script src="js/angular-resource.min.js"></script>
<!-- angularJS Ajax call: http call -->
<title>Transaction Service Test</title>
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
h3 {
	color: #27A0C4;
	text-align:center;
	font-family: 'Cinzel', serif;
	font-weight: 700;
	letter-spacing: 1px;
}
table {
	margin-left:auto; 
    margin-right:auto;
} 
html {
	min-height: 100%;
}

body {
	background-image: url(images/city.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<script>
var module = angular.module("mainModule", []);

module.controller("ShowTransactionController",function($scope,$http){
	$scope.requests = $.parseJSON('${Requests}');
});
</script>


</head>
<body ng-app="mainModule">


<!--NAVI BAR  -->
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
				<li class= "active"><a href = "/YahooFinanceProject/transaction.html">Transaction</a></li>
				<li><a href = "/YahooFinanceProject/marketdata.html">Market Data</a></li>
				<li><a href = "/YahooFinanceProject/history.html">History</a></li>
				<li><a href="<c:url value='/j_spring_security_logout'/>">Logout</a></li>
			</ul>
		</div>
	</div>
</div>


<!-- All request Transactions  -->
<div ng-controller="ShowTransactionController">
	<h3 style="text-align:center">Transaction Submitted</h3>
	<div class="table-responsive"> 
		<table id="stockList" border="1" style="width: 800px" class="table table-striped table-bordered table-hover table-responsive">
			<tr class="danger">
				<th>Index</th>
				<th>Stock Name</th>
				<th>Stock Code</th>
				<th>Requested Price</th>
				<th>Amount</th>
				<th>Requested Time</th>
			</tr>
	
			<tr ng-repeat="request in requests" class="success">
				<td>{{ $index + 1 }}</td>
				<td>{{request.stockName}}</td>
				<td>{{request.stockCode}}</td>
				<td>{{request.unitprice|number : 2}}</td>
				<td>
					<b ng-if="request.amount>0" style="color:green">{{request.amount}}</b>
					<b ng-if="request.amount<0" style="color:red">{{request.amount}}</b>
				</td>
				<td>{{request.ts}}</td>
			</tr>
		</table>
	</div>
</div>




</body>
</html>