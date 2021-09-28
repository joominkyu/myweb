<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<h2>if절 확인</h2>
	<form action="jstl_if.jsp">	
		이름 : <input type ="text" name="name"><br>
		나이 : <input type ="text" name="age"><br>
		<input type="submit" value="확인">
	</form>
	<hr>
	<h2>else if 확인</h2>
		<form action="jstl_choose.jsp">	
		이름 : <input type ="text" name="name"><br>
		나이 : <input type ="text" name="age"><br>
		<input type="submit" value="확인">
	</form>
		<hr>
	<h2>else if 확인2</h2>
		<form action="jstl_choose2.jsp">	
		점수 : <input type ="text" name="point"><br>
		<input type="submit" value="확인">
	</form>
</body>
</html>