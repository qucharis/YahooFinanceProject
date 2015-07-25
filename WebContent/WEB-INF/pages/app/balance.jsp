<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Yahoo Finance System</title>

    <!-- Bootstrap Core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


    <!-- AngularJS library -->
    <script src="<c:url value='/js/angular.min.js'/>"></script>
    <script>
    angular.module("balanceModule",[])
    .controller("creditcardController",['$scope', '$http', '$templateCache', 
                                        function($scope, $http, $templateCache){
    	$scope.getAllCreditcards = function(){
    		$http({
    			method: 'POST',
    			url: 'allcards.htm',
        		header: {
        			'Content-Type': 'application/x-www-form-urlencoded'
        		},
        		data: {},
        		cache: $templateCache
    		}).success(function(data, status){
    			$scope.allcards = data;
    		}).error(function(data, status){
    			alert(data);
    		});
    	};
    	
    	$scope.addCreditCard = function(){
    		var sendData = 
        		"card_holder" + $scope.holderName +
        		"&card_number" + $scope.cardNo +
        		"&expire_month" + $scope.exmm +
        		"&expire_year" + $scope.exyy +
        		"&code" + $scope.cvv
        	;
        	$http.post('addcard.htm', sendData, {
        		header: {
            		'Content-Type': 'application/x-www-form-urlencoded'
            	},
            	cache: $templateCache
        	}).success(function(data, status){
        		$scope.allcards = data;
        		alert("received");
        	}).error(function(data, status){
        		alert(data);
        	});
    	};
    	
    	$scope.addBalance = function(){
    		
    	}
    	
    	//validation
    	
    }]);
    </script>
</head>

<body ng-app="balanceModule">

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${pageContext.request.contextPath}/app/dashboard.htm">Yahoo Finance System</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${shownName}<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="${pageContext.request.contextPath}/app/profile.htm"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/app/settings.htm"><i class="fa fa-fw fa-gear"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="<c:url value='/j_spring_security_logout'/>"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li>
                        <a href="${pageContext.request.contextPath}/app/dashboard.htm"><i class="fa fa-fw fa-dashboard"></i> MarketData</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/app/portfolio.htm"><i class="fa fa-fw fa-table"></i> Portfolio</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/app/history.htm"><i class="fa fa-fw fa-table"></i> History</a>
                    </li>
                    <li class="active">
                        <a href="${pageContext.request.contextPath}/app/balance.htm"><i class="fa fa-fw fa-file"></i> Balance</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/app/transaction.htm"><i class="fa fa-fw fa-file"></i> Transaction</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row" ng-controller="creditcardController">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Add Balance
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="dashboard.htm">Dashboard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-file"></i> Balance
                            </li>
                        </ol>
                    </div>
                    <div class="col-lg-8">
                    	<h2>Your balance: ${bal}</h2>
                    	<h2>Add Balance</h2>
                    	<form class="form-horizontal" action="addAmount.htm" method="POST" name="cardform" role="form" novalidate>
                    		<div id="creditcard-info" class="form-group" style="background:#77f">
                    			<div class="col-sm-1"></div><h3 class="col-sm-10">   Credit Card Information</h3>
                    			<div class="form-group">
                    				<div class="col-sm-8 col-sm-offset-1"  ng-class="{ 'has-error': cardform.cardNo.$invalid && cardform.cardNo.$dirty }">
                    					<input class="form-control" id="creditCardNo" placeholder="Card Number" 
                    					name="cardNo" ng-model="cardNo"
                    					ng-pattern="/^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$/" required/>
                    				</div>
                    				<div class="col-sm-2"  ng-class="{ 'has-error': cardform.cvv.$invalid && cardform.cvv.$dirty }">
                    					<input class="form-control" id="code" placeholder="CVV" 
                    						name="cvv" ng-model="cvv"
                    						ng-pattern="/^[0-9]{3}$/" required/>
                    				</div>
                    			</div>
                    			<div class="form-group">                    			
                    			<label for="ex-year" class="col-sm-2 control-label">Expire Time:</label>
                    				<div class="col-sm-2"  ng-class="{ 'has-error': cardform.exmm.$invalid && cardform.exmm.$dirty }">
                    					<input type="text" class="form-control" id="ex-month" 
                    						placeholder="mm" name="exmm" ng-model="exmm"
                    						ng-pattern="/^(([1-9])|(0[1-9])|(1[1-2]))$/" required/></div>
                    				<div class="col-sm-2"  ng-class="{ 'has-error': cardform.exyy.$invalid && cardform.exyy.$dirty }">
                    					<input type="text" class="form-control" id="ex-year" 
                    						placeholder="yy" name="exyy" ng-model="exyy"
                    						ng-pattern="/^(20)?[0-9][0-9]$/" required/></div>
                    			</div>                    			
                    			<div class="form-group" ng-class="{ 'has-error': cardform.holderName.$invalid && cardform.holderName.$dirty }">
                    				<label for="cc-name" class="col-sm-2 control-label">Name:</label>
                    				<div class="col-sm-8"><input type="text" class="form-control" id="cc-name" 
                    					placeholder="Holder's name" name="holderName" ng-model="holderName"
                    					ng-pattern="/^[A-Z][a-zA-Z]*( [A-Z][a-zA-Z]*)*$/"/></div>
                    			</div>
                    		</div>
                    		<div id="balance-info" class="form-group" >
                    			<label for="balance-input" class="col-sm-2 control-label">Balance:</label>
                    			<div class="col-sm-6" ng-class="{ 'has-error': cardform.bal.$invalid && cardform.bal.$dirty }">
                    				<input type="number" class="form-control" name="bal" id="balance-input" placeholder="Balance" ng-model="bal" required/>
                    			</div>
                    			<button class="btn btn-primary" ng-disabled="cardform.$invalid">Submit</button>
                    		</div>
                    	</form>
                    </div>
                    <!-- /.pay-content -->
                    <!--  div class="col-lg-4" ng-init="getAllCreditcards()">
                    	<h2>Saved Credit Cards</h2>
                    	<table class="table table-hover" id="allccards">
                    		<thead><tr><th>Number</th></tr></thead>
                    		<tbody>
                    			<tr ng-repeat="c in allcards">
                    				<td>{{c.card_number}}</td>
                    			</tr>
                    		</tbody>
                    	</table>
                    </div>-->
                    <!-- /.creditcard-content -->
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>

</body>

</html>
