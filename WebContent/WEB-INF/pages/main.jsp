<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Portfolio</title>
<link href='http://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Orbitron' rel='stylesheet' type='text/css'>
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
table {
    width:20%;
    font-size: 120%;
}
.alert {
	display:none;
}
#addSuccess {
	color:red;
}
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular-resource.min.js"></script><!-- angularJS Ajax call: http call -->
<script src="js/bootstrap.js"></script>

<script>
angular.module("mainModule", [])
	.controller("mainController", function ($scope, $http) {
  		$scope.request = {
  			amount: 0
  		};
  		$scope.currentbalance = $("#remoteBalance").text();
  		$scope.welcomeMsg = "Please enter the Money you want to add";
  		//$scope.canShow = false;	    
		$scope.addMoneyRequest = function (request, resultVarName) {
		    var params = $.param({
	        	amount: request.amount
		    });
		    //var msg;
    		$http({
    			method: "POST",
    			url: "rest/addBal",
    			data: params,
    			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
    		}).success(function (data, status, headers, config) {
    			$scope[resultVarName] = data;
    			request.amount = 0;
    			$scope.currentbalance = data;
    			//$scope.welcomeMsg = data; 
      		}) .error(function (data, status, headers, config) {
        		$scope[resultVarName] = "SUBMIT ERROR";
      		});
  		}; 
	});	
</script>

<script>
$(document).ready(function() {
	$("input[type='number']").on("blur",function(){
 		var amount = $("#amount").val();
		if(amount>0){
			$("#confirm").removeAttr("disabled");
		}else{
			 $("#confirm").attr("disabled", "disabled");
		}
	});
});
</script>

</head>
<body ng-app="mainModule" ng-controller="mainController">

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
				<li class= "active"><a href = "/YahooFinanceProject/main.html">Portfolio</a></li>
				<li><a href = "/YahooFinanceProject/transaction.html">Transaction</a></li>
				<li><a href = "/YahooFinanceProject/marketdata.html">Market data</a></li>
				<li><a href = "/YahooFinanceProject/history.html">History</a></li>
				<li><a href="<c:url value='/j_spring_security_logout'/>">Logout</a></li>
			</ul>
		</div>
	</div>
</div>

<h1><font color="blue">${ownershipInfo.message}</font></h1>

<div style="display:none">
	<p id="remoteBalance">${balance}</p> <!-- jsp expression -->
</div>

<table id="tbl">
	<tr>
		<th>Your Balance: <span id="j_name" style="color:red">{{currentbalance}}</span></th>
		<th><button id="addmoney" data-toggle="modal" data-target="#balModal" class="btn btn-primary">Add Money</button></th>
	</tr>
</table>
<br/>
<%-- <h3>Your Balance: ${balance} <span><button id="submit1">Add Money</button></span></h3> --%>
<table width="200" border="1">
	<tr>
		<th>Stock Name</th>
		<th>Quantity</th>
	</tr>
	<c:forEach var="ownership" items="${ownershipInfo.ownerships}">
		<tr>
			<td>${ownership.stock.stockName}</td>
			<td>${ownership.quantity}</td>
		</tr>
	</c:forEach>
</table>

<!-- Add Money Modal -->
<div class="modal fade"	id="balModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- modal header -->
			<div class="modal-header">
				<button type="button" class="close" ng-click="myStyle={'display':'none'}" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
          		<h4 class="modal-title" id="myModalLabel">Adding Money</h4>
			</div>
			<!-- modal body -->
			<div class="modal-body">
				<form class="form-horizontal" ng-submit="addMoneyRequest(request, 'ajaxResult')" novalidate>
          			<div class = "panel panel-default">
          				<div class = "panel-body bg-primary">{{welcomeMsg}}</div>
          			</div>
          			<!-- Amount --> 
         			<div class="form-group">
             				<label for="amount" class="col-sm-2 control-label">Amount:</label>
             				<span class="glyphicon glyphicon-asterisk"></span>
             				<div class="col-sm-6">
               				<input type="number" class="form-control" id="amount" 
               					ng-model="request.amount" 
               					placeholder="Amount" name ="amount" required>
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
		          				<button class="btn btn-default" data-dismiss= "modal" ng-click="myStyle={'display':'none'}">Close</button>
		          				<button disabled id="confirm" type="submit" class="btn btn-primary" ng-click="myStyle={'display':'block'}">Confirm</button>
		        			</div>
		      			</div>
		    		</div>
         		</form>
			</div>
		</div>
	</div>
</div>

</body>
</html>