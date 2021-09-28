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
 		<div align="center">
 			<form name="writeform" action="update.board" method="post" >
 				<h2>게시판 글작성 페이지</h2>
 				<hr>
 				<table border='1' style="width=500px;">
 					<tr>
 						<td>글번호</td>
 						<td><input type="text" name="num" value="${vo.num }" readonly></td>
 						<td>작성자</td>
 						<td><input type="text" name="writer" value="${vo.writer }" readonly></td>
 					</tr>
 					<tr>
 						<td>글제목</td>
 						<td colspan="3">
 							<input type="text" name="title" value="${vo.title }" style="width:100%;">
 						</td>
 					</tr>
  					<tr>
 						<td>글내용</td>
 						<td colspan="3" align="center">
 							<textarea name="content" rows="10" style="width:100%;">${vo.content }</textarea>
 					</tr>
 					<tr>
 						<td colspan="4" align="center">
 							<input type="button" value="수정하기" onclick="modifycheck()">
 							<input type="button" value="목록" onclick="location.href='list.board'">
 							<input type="button" value="삭제하기" onclick="location.href='delete.board?num=${vo.num}'">
 						</td>
 					</tr>		
 				</table>
 			</form>
 		</div>
 	</section>      
    <!-- footer.jsp가 include 될 위치  -->	
	<%@ include file="../include/footer.jsp" %>
	
	<script>
	
	 function modifycheck() {
		  //글제목에 공백을 확인하고, 공백이 아니라면 submit() 처리
		  if (document.writeform.title.value == "") {
			  alert("글제목을 입력하세요.");
			  return;
		  }else if (confirm("게시글을 등록하겠습니까?")) {
			  document.writeform.submit();
		  }
	  }

	</script>
</html>