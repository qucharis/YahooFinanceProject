<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE htm>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Hello, ${name}</h1>
<h1>Hello, ${trader.first_name} ' ${trader.last_name }</h1>

<form name="f" action="config.htm" method="POST" id="config-form">
	<p>UID: ${trader.lid }</p>
	<p>Username:</p><input type="text" name="c_username" id="c_username" value="${name}" disabled/><br/>
	<p>first name:</p><input type="text" name="c_firstname" id="c_firstname" value="${trader.first_name}"/><br/>
	<p>last name:</p><input type="text" name="c_lastname" id="c_lastname" value="${trader.last_name}"/><br/>
	<p>phone number:</p><input type="text" name="c_phone" id="c_phone" value="${trader.phone}"/><br/>
	<p>email:</p><input type="email" name="c_email" id="c_email" value="${trader.email}"/><br/>
	<p>address:</p><input type="text" name="c_address" id="c_address" value="${trader.address}"/><br/>
	<p>city:</p><input type="text" name="c_city" id="c_city" value="${trader.city}"/><br/>
	<p>State:</p><input type="text" name="c_state" id="c_state" value="${trader.home_state}"/><br/>
	<p>zipcode:</p><input type="text" name="c_zipcode" id="c_zipcode" value="${trader.zipcode}"/><br/>
	<input type="hidden" name="c_lid" value="${trader.lid }"/>
	<button type="submit">confirm</button>
</form>

<a href="<c:url value='/j_spring_security_logout'/>">Logout</a>
</body>
</html>