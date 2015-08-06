<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
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

</style>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/angular.min.js"></script>
<script src="js/angular-resource.min.js"></script>

<script>
	$(document).ready(function() {
		$("#para1").hide();
		$("input[type='text']").on("blur", function() {
			var scode = $("#scode1").val();
			if (scode.length != 0) {
				$("#submit2").removeAttr("disabled");
			} else {
				$("#submit2").attr("disabled", "disabled");
			}
		});
		$("input[type='text']").on("blur", function() {
			var scode = $("#scode1").val();
			var sname = $("#stockName1").val();
			if (scode.length != 0 && sname.length != 0) {
				$("#submit1").removeAttr("disabled");
			} else {
				$("#submit1").attr("disabled", "disabled");
			}
		});
		$("#submit1").click(function() {
			var params = $("input").serialize();
			$.ajax({
				url : "addstock.html", // full name: "http://localhost:8080/Sample10/HelloServlet",
				type : "post",
				dataType : "html",
				data : params, // data to pass in
				success : function(response) {
					$("#para1").fadeIn(500);
					$("#para1").html(response);
				}
			});
		});
		$("#submit2").click(function() {
			var params = $("input").serialize();
			$.ajax({
				url : "removestock.html", // full name: "http://localhost:8080/Sample10/HelloServlet",
				type : "post",
				dataType : "html",
				data : params, // data to pass in
				success : function(response) {
					$("#para1").fadeIn(500);
					$("#para1").html(response);
				}
			});
		});

		$("#clear1").click(function() {
			$("#submit1").attr("disabled", "disabled");
			$("#submit2").attr("disabled", "disabled");
			$("#scodeAndSnameReq").hide();
			$("#scodeReq").hide();
			$("#snameReq").hide();
			$("#para1").fadeOut("slow");
			$("#scode1").val("");
			$("#stockName1").val("");
		});
	});
</script>

<script type="text/javascript">
	var module = angular.module("mainModule", []);
	module.controller("mainController", function($scope, $http) {
		$scope.parseStatus = "no transaction changed";

		$scope.parseTrans = function(resultVarName) {
			var msg;
			$http({
				method : "POST",
				url : "rest/parseCSV",
				data : msg,
				headers : {
					'Content-Type' : 'application/x-www-form-urlencoded'
				}
			}).success(function(data, status, headers, config) {
				$scope[resultVarName] = data;
				$scope.parseStatus = data;
			}).error(function(data, status, headers, config) {
				$scope[resultVarName] = "SUBMIT ERROR";
			});
		};
	});

	module.controller("stockController", function($scope, $http) {
		// Initialization
		$scope.stocksArray = [];
		$http({
			method : "GET",
			url : "rest/getStocks",
		}).success(function(data) {
			$scope.stocksArray = data;
		}).error(function(data) {
			//alert("AJAX Error!");
		});
	});
</script>
</head>
<body ng-app="mainModule">
	<div class="container">
		<h1>
			<%-- <font color="green">${title}</font> --%>
			<font color="green">Welcome back Admin</font>
		</h1>

		<div class="panel-group" id="accordion">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseOne">1. Stock Add or Remove:</a>
					</h3>
				</div>
				<div class="panel-collapse collapse" id="collapseOne" >
					<div class="panel-body">
						<table class="table table-striped">
							<tr>
								<td>Stock Code:</td>
								<td><input type="text" name="scode" id="scode1" /></td>
							</tr>
							<tr>
								<td>Stock Name:</td>
								<td><input type="text" name="stockName" id="stockName1" /></td>
							</tr>
							<tr>
								<td><button class="btn btn-warning" id="clear1">Clear</button></td>
								<td>
									<button class="btn btn-primary" id="submit1" disabled>Add Stock</button>
									<button class="btn btn-danger" id="submit2" disabled>Remove Stock</button>
								</td>
							</tr>
						</table>
						<h4 id="para1" style="color: red">No message</h4>
					</div>
				</div>
			</div>
			<div class="panel panel-warning">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseTwo">2. Commit All the Transactions:</a>
					</h4>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse">
					<div class="panel-body" ng-controller="mainController">
						<div>
							<button class="btn btn-success" ng-click="parseTrans('result')">Parse
								Requests</button>
						</div>
						<div>
							<h3>{{parseStatus}}</h3>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div  ng-controller="stockController">
			<h3>Stocks in the System</h3>
			<div class="table-responsive">
				<table id="stockList" border="1" style="width: 500px"
					class="table table-striped table-bordered table-hover table-responsive">
					<tr class="danger">
						<th>Stock Code</th>
						<th>Stock Name</th>
					</tr>

					<tr ng-repeat="stock in stocksArray" class="success">
						<td>{{stock.scode}}</td>
						<td>{{stock.stockName}}</td>
					</tr>
				</table>
			</div>
		</div>

		<a class="btn btn-danger" href="<c:url value='/j_spring_security_logout'/>">Logout</a>
	
	</div>

</body>
</html>