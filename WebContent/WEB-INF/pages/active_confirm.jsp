<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirmation page</title>
<style type="text/css">
#time, p, a {
	text-align:center;
	font-family: 'Unkempt', cursive;
	letter-spacing: 2px;
	font-weight: 700;
}

</style>
</head>
<body>

	<p>Activation succcess!</p>

<script language="JavaScript1.2" type="text/javascript">
	function delayURL(url) {
   		var delay=document.getElementById("time").innerHTML;
   		if(delay>0){
   			delay--;
   			document.getElementById("time").innerHTML=delay;
   		} else {
   			window.top.location.href=url;
   		}
		setTimeout("delayURL('" + url + "')", 1000);
	}
</script>
	<span id="time" style="background: red">3</span>
	<br>
	<a href="http://localhost:8080/YahooFinanceProject/main.html">This page will goto Yahoo Finance page after 3 seconds, if not click this link</a>
<script type="text/javascript">
	delayURL("http://localhost:8080/YahooFinanceProject/main.html");
</script>&nbsp;

</body>
</html>