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

    <title>Trader Portfolio</title>

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

<script src="../js/jquery.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="https://www.google.com/jsapi"></script>
<script>
	$(document).ready(function() {
		setInterval("getMarketData()", 10000);	// Send request every 2 seconds
		getProperty();
		drawChart();
	});
	function getMarketData() {	
		$.ajax({
			url: "http://localhost:8080/Msi-Project/app/showPortfolio.htm",
			type: "post",
			dataType: "json",
			success: showData
		});	
	}
	function showData(data) {
		var rows = "";
		$("#stocks").empty();		
		$(data).each(function(i, item) {
			var sid = item.sid;
			var name = item.name;
			var price = item.price;
			var change = item.change;
			var percentChange = item.percentChange;
			var high = item.high;
			var low = item.low;
			var volumn = item.volumn;
			var color;
			if (change>0) color = "green";
			else if (change<0) color="red";
			else color="black";
			rows = "<tr>"+
			       "<td>" +sid+ "</td>"+
			       "<td>" +name +"</td>"+
			       "<td>"+ price + "</td>"+
			       "<td><font color=" + color + ">" + change + "</font></td>"+ 
			       "<td><font color=" + color + ">"+ percentChange + "</font></td>"+
			       "<td>"+ high +"</td>"+
			       "<td>"+ low + "</td>"+
			       "<td>" + volumn +"</td>"+
			       "</tr>";
			$(rows).appendTo("#stocks");
		})		
	}
	
	function getProperty() {	
		$.ajax({
			url: "http://localhost:8080/Msi-Project/app/showProperty.htm",
			type: "post",
			dataType: "json",
			success: showProperty
		});	
	}
	function showProperty(data) {
		var rows = "";
		$("#properties").empty();
		$(data).each(function(i, item) {
			var sid = item.sid;
			var price = item.price;
			var quantity = item.quantity;
			rows = "<tr>"+
		      	   "<td>" + sid + "</td>"+
		       	   "<td>" + price +"</td>"+
		       	   "<td>" + quantity +"</td>"+
		       	   "</tr>";
		    $(rows).appendTo("#properties");
		})
	}
	
	/***********************Draw Google Pie-Char************************************/
	// Load the Visualization API and the piechart package.
    google.load('visualization', '1.0', {'packages':['corechart']});
    // Set a callback to run when the Google Visualization API is loaded.
    google.setOnLoadCallback(drawChart);
    // Callback that creates and populates a data table,
    // instantiates the pie chart, passes in the data and
    //draws it.
  function drawChart() {
    // Create the data table.
    //var userID = "<c:out value="${trader.userID}"/>";
    var pieTable = new google.visualization.DataTable();
    var barTable = new google.visualization.DataTable();
    pieTable.addColumn('string', 'sid');
    pieTable.addColumn('number', 'value');
	barTable.addColumn('string', 'sid');
    barTable.addColumn('number', 'bought');
    barTable.addColumn('number', 'sold');
    $.ajax({
			url: "http://localhost:8080/Msi-Project/app/drawChart.htm",
			type: "post",
			dataType: "json",
			async:false,
			success: function(data) {
				$(data).each(function(i, item) {
					var sid = item.sid;
					var value = item.price*item.quantity;
					var bought = item.totalBought;
					var sold = item.totalSold;
					pieTable.addRow([sid, value]);
					barTable.addRow([sid, bought, sold]);
				});
			},
		error: function(msg) {
			alert("Error happened, please try again later.");
		}
		});
    //Set chart options
    var options = {'title':'Owned Stock Values', 'width':400, 'height':300};
    var options1 = {'title':'Bought and Sold', 'width':400, 'height':300};

    // Instantiate and draw our chart, passing in some options.
    var chart = new google.visualization.PieChart(document.getElementById('pie'));
    var chart1 = new google.visualization.ColumnChart(document.getElementById('bar'));
    chart.draw(pieTable, options);
    chart1.draw(barTable, options1);
  }
</script>
</head>

<body>

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
                    <li class="active">
                        <a href="${pageContext.request.contextPath}/app/portfolio.htm"><i class="fa fa-fw fa-table"></i> Portfolio</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/app/history.htm"><i class="fa fa-fw fa-table"></i> History</a>
                    </li>
                    <li>
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
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Portfolio
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="${pageContext.request.contextPath}/app/dashboard.htm">MarketData</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-table"></i> Portfolio
                            </li>
                        </ol>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->
            <!-- Add Stock By SymbolName -->
        <div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-money fa-fw"></i> Add Symbol</h3>
                            </div>
                            <div class="panel-body">
                                <form role="form" action="${pageContext.request.contextPath}/app/addSymbol.htm" method="post">
                                	<input class="form-control" name="symbol" placeholder="Enter Stock Symbol"><br>
                                	<button type="submit" class="btn btn-success"><i class="fa fa-wifi"></i> Submit</button>
                            		<button type="reset" class="btn btn-danger"><i class="fa fa-binoculars"></i> Reset</button>
                                </form>
                            </div>
                        </div>
         </div>
        
        
        <!-- Show Stock Information -->
        <div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-money fa-fw"></i> Interested Symbols</h3>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover table-striped" id=stockList>
                                        <thead>
                                            <tr>
                                                <th>Stock Id</th>
                                                <th>Name</th>
                                                <th>Price</th>
                                                <th>Change</th>
                                                <th>Percent Change</th>
                                                <th>High</th>
                                                <th>Low</th>
                                                <th>Volume</th>
                                            </tr>
                                        </thead>
                                        <tbody id="stocks"></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
         </div>
         
         <!-- Show Property Information -->
        <div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-money fa-fw"></i> Trader Portfolio</h3>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover table-striped" id=propertyList>
                                        <thead>
                                            <tr>
                                                <th>Stock Id</th>
                                                <th>Price</th>
                                                <th>Volume</th>
                                            </tr>
                                        </thead>
                                        <tbody id="properties"></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
         </div>
         
         <!-- Show Google Chart -->
         <div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-money fa-fw"></i> Stock Info Chart</h3>
                            </div>
                            <div class="row">
                            	<div class="panel-body">
                                	<div id="pie"></div>
                                	<div id="bar"></div>
                            	</div>
                            </div>
                            
                        </div>
         </div>

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
