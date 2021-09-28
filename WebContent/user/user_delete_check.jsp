<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("user_id")==null){
		response.sendRedirect("user_login.jsp");
	}
%>
	    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
			<h2>회원 탈퇴</h2>
			<hr>
			<form action="user_delete_check_ok.jsp" method="post">
 				<h2>회원 탈퇴 페이지</h2>
 				<table>
 					<tr>
 						<td>아이디</td>
 						<td>
 						  <input type="password" name="pw">
 						</td>
 					</tr>
				</table><br>
 				<input type="submit" value="확인">
 				<input type="button" value="마이페이지" class="btn btn-primary" onclick="location.href='user_mypage.jsp'">
 			</form>
		</div>
		</div>
	</section> 			
        
    <!-- footer.jsp가 include 될 위치  -->	
	<%@ include file="../include/footer.jsp" %>
</body>
</html>