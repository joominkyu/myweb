<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
	표현식 연산<br>
	<hr>
	<%=1+2 %><br>
	<%="안녕" %><br>
	<%=1>2||1==2 %><br>
	
	-------------------<br>
	<!-- 산술 연산 및 출력 -->
	
	${1+2}<br>
	${'안녕' }<br>
	
	<!-- 비교 논리 연산자 -->
	
	${1>2 || 1==2 }<br>
	${1>2 or 1==2 }<br>
	
	${1<2 && 1>2 }<br>
	${1<2 and 1>2 }<br>
	
	${'홍길동'=='홍길동'}<br>
	${'홍길동' eq '홍길동'}<br>
	
	<!-- 삼항 연산 -->
	${1==2 ? "같음" : "다름" }<br>
</html>