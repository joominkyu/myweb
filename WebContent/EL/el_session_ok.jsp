<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- session에 있는 값은 sessionScope.이름.이름
	application에 있는 값을 얻을 때는 application.이름.이름
	 -->
	 ${sessionScope.id }<br>
	 ${sessionScope.vo.email }<br>
	 ${applicationScope.admin }<br>
</body>
</html>