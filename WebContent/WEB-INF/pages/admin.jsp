<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script>
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
</head>
<body>
<h1><font color="green">${title}</font></h1>

<table>
	<tr>
		<th>Stock(+/-)</th>
		<th id = "para1" style="color:red">No message</th>
	</tr>
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
<a href="<c:url value='/j_spring_security_logout'/>">Logout</a>
</body>
</html>