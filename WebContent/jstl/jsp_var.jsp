<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 변수 선언 -->
	<c:set var="test" value="100" /> <!-- scope 안쓰면 기본값 = page -->
	
	<!-- 변수 출력 -->
	<c:out value="${test }"></c:out>
	
	<!-- 변수 제거 -->
	<c:remove var="${test }"/>
</body>
</html>