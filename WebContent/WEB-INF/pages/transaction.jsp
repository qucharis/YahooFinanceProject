<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transaction</title>
<link href='http://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Orbitron' rel='stylesheet' type='text/css'>
<link href="css/bootstrap.css" rel="stylesheet">

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
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular-resource.min.js"></script><!-- angularJS Ajax call: http call -->
<script src="js/bootstrap.js"></script>

</head>
<body>
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
				<li><a href = "/YahooFinanceProject/marketdata.html">Market data</a></li>
				<li><a href = "/YahooFinanceProject/history.html">History</a></li>
				<li><a href="<c:url value='/j_spring_security_logout'/>">Logout</a></li>
			</ul>
		</div>
	</div>
</div>

</body>
</html>