<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>amCharts examples</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <script src="js/amcharts.js" type="text/javascript"></script>
        <script src="js/pie.js" type="text/javascript"></script>
        <jsp:useBean id="stockInfo" scope="request" class="com.mercury.beans.StockInfo"/>
        
        
        <script>
        	var set1 = [];
        	var set2 = [];
        </script>
        <c:forEach var="stockInfo" items="${stockInfos}">
        <script>
         	var up = ('${stockInfo.getCurrentPrice()}'*'${stockInfo.getAmount()}')|0;
         	var stock1 = {"stock":"${stockInfo.getStockName()}","price":'${stockInfo.getAmount()}'};
         	var stock2 = {"stock":"${stockInfo.getStockName()}",
        		 "value":up};
        	set1.push(stock1);
         	set2.push(stock2);
        </script>
		</c:forEach>
        <script>
        
            var chart1;
            var chartData1 = set1;
            var chart2;
            var chartData2 = set2;
            
            AmCharts.ready(function () {
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

    <body>
    	
        <div id="chartdiv1" style="width:600px; height:400px;"></div>
        <div id="chartdiv2" style="width:600px; height:400px; display: inline;"></div>
    </body>

</html>