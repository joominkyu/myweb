<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-idth, initial-scale=1">
   

    <title>Welcome to MyWorld</title>

    <!-- Bootstrap Core CSS -->
    <link href="../css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../css/business-casual.css" rel="stylesheet">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
	
	 <!-- jQuery -->
    <script src="../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>

    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 2000 //changes the speed
    })
    </script>


</head>

<body>

 
 	<!-- header.jsp가 include될 위치 -->
 	<%@ include file="../include/header.jsp" %>
 
 	<section>
 		<div class="container">
 			<h3>My Web게시판</h3>
 			<table class="table table-boardered">
 				<thead>
 					<tr>
 						<th>글 번호</th>
 						<th>작성자</th>
 						<th>제목</th>
 						<th>날짜</th>
 						<th>조회수</th>
 					</tr>
 				</thead>
 				<!-- 반복처리됨 -->
 				<c:forEach var="vo" items="${list }">
	 				<tbody>
	 					<tr>
	 						<td>${vo.num }</td>
	 						<td>${vo.writer }</td>
	 						<td>
	 							<a href="content.board?num=${vo.num }">${vo.title }</a>
	 						</td>
	 						<td>${vo.regdate }</td>
	 						<td>${vo.hit }</td>
	 					</tr>
	 				</tbody>
 				</c:forEach>
 				<!-- 반복처리 끝 -->
 				<tbody>
 					<tr>
 						<td colspan="5" align="right">
 							<form action="#" class="form-inline">
 								<div class="form-group">
 									<input type="text" name="search" placeholder="제목검색" class="form-control">
 									<input type="submit" value="검색" class="btn btn-default">
 									<input type="button" value="글작성" class="btn btn-default" onclick="location.href='/MyWeb/board/write.board'">
 								</div>
 							</form>
 						</td>
 					</tr>
 				</tbody>
 			</table>
 		</div>
 	</section>
        
    <!-- footer.jsp가 include 될 위치  -->	
	<%@ include file="../include/footer.jsp" %>
</body>
</html>