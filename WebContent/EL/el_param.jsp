<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 폼태그로 이름, 아이디 , 비밀번호를 전달 -el_param_ok.jsp로 -->
	<form action="el_param_ok.jsp" method="post">
		이름 : <input type="text" name="name"><br>
		아이디 : <input type="text" name="id"><br>
		비밀번호 : <input type="password" name="pw"><br>
		<input type="submit" value="확인">
	</form>
</body>
</html>