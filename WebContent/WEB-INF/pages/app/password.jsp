<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form  name="f" action="password.htm" method="POST" id="config-form">
  <p>Username:</p><input type="text" name="c_username" id="c_username" value="${login.username}" disabled/><br/>
  <p>Password:</p><input type="password" name="c_password" id="c_password"/>
  <p>New Password:</p><input type="password" name="c_n_password" id="c_n_password"/>
  <p>Confirm new Password:</p><input type="password" name="c_rn_password" id="c_rn_password"/>
  <input type="hidden" name="c_lid" value="${login.lid }"/>
  <button type="submit">confirm</button>
</form>
</body>
</html>