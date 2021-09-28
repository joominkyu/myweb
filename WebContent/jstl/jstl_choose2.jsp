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
	<!-- 
	choose절을 이용하여 90점이상이면 a
	80점 이상이면 b, 70점 이상이면c, 나머진f
	 -->
	<c:choose>
		<c:when test="${param.point>=90 }">
			A
		</c:when>
		<c:when test="${param.point>=80 }">
			B
		</c:when>
		<c:when test="${param.point>=70 }">
			B
		</c:when>
		<c:otherwise>
			F
		</c:otherwise>
	</c:choose>

</body>
</html>