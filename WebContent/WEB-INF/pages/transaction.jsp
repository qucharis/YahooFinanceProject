<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Yahoo Finance System</title>
<link href='http://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Orbitron' rel='stylesheet' type='text/css'>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular-resource.min.js"></script><!-- angularJS Ajax call: http call -->
<title>Transaction Service Test</title>
<style type="text/css"> 
</style>

<script>
angular.module("mainModule", [])
	.controller("mainController", function ($scope, $http) {
  		$scope.request = {
  			code: "YHOO",
  			amount: 0
  		};
  		$scope.welcomeMsg = "Please enter the StockCode and Amount";
  		$scope.canShow = false;
  	    
  		$scope.buyRequest = function (request, resultVarName) {
  			
		    var pa = {
	        	code: request.code,
	        	amount: request.amount
		    };
		    var msg;
		    request.code = "goog";
    		$http({
    			method: "POST",
    			url: "rest/buySub",
    			params: pa,
    			data: msg,
    			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
    		}).success(function (data, status, headers, config) {
    			$scope[resultVarName] = data;
    			request.code = "";
    			request.amount = 0;
    			$scope.welcomeMsg = data; 
      		}) .error(function (data, status, headers, config) {
        		$scope[resultVarName] = "SUBMIT ERROR";
      		});
  		};
    		
    	$scope.sellRequest = function (request, resultVarName) {
      			
   		    var pa = {
   	        	code: request.code,
   	        	amount: request.amount
   		    };
   		    
       		$http({
       			method: "POST",
       			url: "rest/sellSub",
       			params: pa,
       			data:pa,
       			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
       		}).success(function (data, status, headers, config) {
       			$scope[resultVarName] = data;
    			request.code = "";
    			request.amount = 0;
    			$scope.welcomeMsg = data; 
         		}) .error(function (data, status, headers, config) {
           		$scope[resultVarName] = "SUBMIT ERROR";
         		});
    	};
  		
	});	
</script>


</head>
<body ng-app="mainModule">
<button id="buy" data-toggle="modal" data-target="#myModal1" type="submit" class="btn btn-primary btn-lg">Buy</button>
<button id="sell" data-toggle="modal" data-target="#myModal2" type="submit" class="btn btn-primary btn-lg">Sell</button>

<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
      	<!-- modal header -->
        	<div class="modal-header">
          		<button type="button" class="close" data-dismiss="modal">
          			<span aria-hidden="false"></span>
          		</button>
          		<h4 class="modal-title" id="myModalLabel2">Selling out</h4>
        	</div>
        	<!-- modal body -->
        	<div class="modal-body" ng-controller="mainController">
        		
          		<form class="form-horizontal" ng-submit="sellRequest(request, 'ajaxResult')" novalidate>
          			<div class = "panel panel-default">
          				<div class = "panel-body bg-primary">{{welcomeMsg}}</div>
          			</div>
          			
          			<!-- Username -->

          			<div class="form-group">
             				<label for="StockCode" class="col-sm-2 control-label">Stock Code:</label>
             				<span class="glyphicon glyphicon-asterisk"></span>
             				<div class="col-sm-6">
               				<input type="text" class="form-control"
               					id="code2" ng-model="request.code" 
               					placeholder="StockCode" name="code2" required>
               				
             				</div>
          				</div> 
          
           			<div class="alert" style="display:none;" id="userExist2">
        				<p>The user already exists</p>
           			</div>
         
         				<div class="form-group">
             				<label for="amount" class="col-sm-2 control-label">Amount:</label>
             				<span class="glyphicon glyphicon-asterisk"></span>
             				<div class="col-sm-6">
               				<input type="number" class="form-control" 
               					ng-model="request.amount" 
               					id="amount2" 
               					placeholder="Amount" name ="amount" required >
 	            			</div>
   	        		</div>
   	        		<div class="well well-sm">
          				<strong>
          					<span class="glyphicon glyphicon-asterisk"></span>
          					Required Field
          				</strong>
          			</div>

       	    		<div class="form-group">
           	  			<div class="col-sm-offset-2 col-sm-10">
               				<button type="submit" class="btn btn-default" >Submit</button>
             				</div>
           			</div>
         			</form>
       		</div>
		</div>
	</div>
</div>


<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
      	<!-- modal header -->
        	<div class="modal-header">
          		<button type="button" class="close" data-dismiss="modal">
          			<span aria-hidden="true"></span>
          		</button>
          		<h4 class="modal-title" id="myModalLabel">Buying In</h4>
        	</div>
        	<!-- modal body -->
        	<div class="modal-body" ng-controller="mainController">
          		<form class="form-horizontal" ng-submit="buyRequest(request, 'ajaxResult')" novalidate>
          			<div class = "panel panel-default">
          				<div class = "panel-body bg-primary">{{welcomeMsg}}</div>
          			</div>
          			
          			<!-- Username -->
          			<div class="form-group">
             				<label for="StockCode" class="col-sm-2 control-label">Stock Code:</label>
             				<span class="glyphicon glyphicon-asterisk"></span>
             				<div class="col-sm-6">
               				<input type="text" class="form-control"
               					id="code" ng-model="request.code" 
               					placeholder="StockCode" name="code" required>
             				</div>
          				</div> 
           
           			<div class="alert" style="display:none;" id="userExist">
        				<p>The user already exists</p>
           			</div>
         
         				<div class="form-group">
             				<label for="amount" class="col-sm-2 control-label">Amount:</label>
             				<span class="glyphicon glyphicon-asterisk"></span>
             				<div class="col-sm-6">
               				<input type="number" class="form-control" 
               					ng-model="request.amount" 
               					id="amount" 
               					placeholder="Amount" name ="amount" required >
 	            			</div>
   	        		</div>
   	        		<div class="well well-sm">
          				<strong>
          					<span class="glyphicon glyphicon-asterisk"></span>
          					Required Field
          				</strong>
          			</div>

       	    		<div class="form-group">
           	  			<div class="col-sm-offset-2 col-sm-10">
               				<button type="submit" class="btn btn-default" >Submit</button>
             				</div>
           			</div>
         			</form>
       		</div>
		</div>
	</div>
</div>


</body>
</html>