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
	<%--
		<%
		//1~100까지 합
		int sum = 0;
		for(int i =1;i<=100;i++){
			sum +=i;
		}
		%>
		<%=sum %>
	 --%>
	<!-- jstl 변수 선언 -->
	<c:set var="sum" value="0"/>
	<c:forEach var="i" begin="1" end="100" step="1">
		<c:set var="sum" value="${sum + i }"/>
	</c:forEach>
	결과 : ${sum }
	결과 : <c:out value="${sum }"/>
	
	<hr>
	<h2>구구단 3단 출력</h2>
	<c:forEach var="i" begin="1" end="9" step="1">
		<c:out value="3*${i }=${i*3 }"/><br>
	</c:forEach>
		<hr>
		
	<h2>구구단 출력</h2>
	<c:forEach var="i" begin="1" end="9" step="1">
		<c:forEach var="j" begin="1" end="9" step="1">
			<c:out value="${i }x${j}=${i*j }"/><br>
		</c:forEach>
	</c:forEach>
	
	<%
		int[] arr = {1,2,3,4,5,6};
		for(int a:arr){
			out.println(a);			
		}
	%>
	<br>
	<c:set var="arr2" value="<%=new int[] {1,2,3,4,5,6}%>"/>
	<h3>jstl을 이용한 양상된 for문 출력</h3>
	<c:forEach var="i" items="${arr2 }">
		${i }<br>
	</c:forEach>
</body>
</html>