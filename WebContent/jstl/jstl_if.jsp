<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- jstl 사용하기 위해 반드시 선언 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="true">
	무조건 실행되는 문장
	</c:if>
	
	<hr>
	
	<c:if test="${param.name eq '홍길동' }">
		홍길동입니다.
	</c:if>

	<c:if test="${param.name == '이순신' }">
		이순신입니다.
	</c:if>
	
	<%--
	age 값이 20 이상이면 성인
	20 미만이면 미성년차
	 --%>
	 <c:if test="${param.age>=20 }">
	 	성인입니다.
	 </c:if>
	 <c:if test="${param.age<20 }">
	 	미성년입니다.
	 </c:if> 
	
</body>
</html>