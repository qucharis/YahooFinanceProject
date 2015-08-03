<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
<style>
h4 {
	margin-bottom: 0cm;
	margin-left: 0.1cm;
}
</style>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular-resource.min.js"></script>

<script>
	$(document).ready(function() {
		$("#para1").hide();
		$("input[type='text']").on("blur",function(){
			var scode = $("#scode1").val();
			if(scode.length!=0){
				$("#submit2").removeAttr("disabled");
			}else{
				 $("#submit2").attr("disabled", "disabled");
			}
		});
		$("input[type='text']").on("blur",function(){
			var scode = $("#scode1").val();
			var sname = $("#stockName1").val();
			if(scode.length!=0&&sname.length!=0){
				$("#submit1").removeAttr("disabled");
			}else{
				 $("#submit1").attr("disabled", "disabled");
			}
		});
		$("#submit1").click(function() {
			var params=$("input").serialize(); 		
			$.ajax({
				url: "addstock.html", // full name: "http://localhost:8080/Sample10/HelloServlet",
				type: "post",
				dataType: "html",
				data: params,		// data to pass in
				success: function(response){
					$("#para1").fadeIn(500);
					$("#para1").html(response);
				}
			});	
		});
		$("#submit2").click(function() {
			var params=$("input").serialize(); 		
			$.ajax({
				url: "removestock.html", // full name: "http://localhost:8080/Sample10/HelloServlet",
				type: "post",
				dataType: "html",
				data: params,		// data to pass in
				success: function(response){
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
module.controller("mainController", function ($scope, $http) {
	$scope.parseStatus="no transaction changed";
	
	$scope.parseTrans=function(resultVarName){
		var msg;
		$http({
			method: "POST",
   			url: "rest/parseCSV",
   			data: msg,
   			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		}).success(function (data, status, headers, config){
			$scope[resultVarName] = data;
			$scope.parseStatus = data;
		}).error(function (data, status, headers, config){
			$scope[resultVarName] = "SUBMIT ERROR";
		});
	}
});


</script>
</head>
<body>
<h1><font color="green">${title}</font></h1>

<h4>Stock Add or Remove: <span id = "para1" style="color:red">No message</span></h4>
<table>
	<tr>
		<td>Stock Code: </td>
		<td><input type="text" name="scode" id="scode1"/></td>
	</tr>
	<tr>
		<td>Stock Name: </td>
		<td><input type="text" name="stockName" id="stockName1"/></td>
	</tr>
	<tr>
		<td><button id="clear1">Clear</button></td>
		<td>
			<button id="submit1" disabled>Add Stock</button>
			<button id="submit2" disabled>Remove Stock</button>
		</td>
	</tr>
</table>

<br/>
<br/>

<div ng-app="mainModule">
	<div ng-controller="mainController">
		<div>
			<button ng-click="parseTrans('result')">Parse Requests</button>
		</div>
		<div><h1>{{parseStatus}}</h1></div>
	</div>

</div>


<a href="<c:url value='/j_spring_security_logout'/>">Logout</a>
</body>
</html>