<%@page import="com.myweb.user.model.UserVO"%>
<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("user_id")==null){
		response.sendRedirect("user_login.jsp");
	}

	/*
	이 페이지에 들어왔을 때, getUserInfo() method 재활용 정보를 불러온 후에
	form 태그 내에 input 태그에 해당 값을 보여지게 처리
	id 태그 변경x
	*/
	UserDAO dao = UserDAO.getInstance();
	String id = (String)session.getAttribute("user_id");
	UserVO vo = dao.getUserInfo(id);
	
	String username = vo.getName();
	String useremail = vo.getEmail();
	String useraddress = vo.getAddress();
	
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
			<h2>회원정보 수정 페이지</h2>
			<hr>
			<form name="regform" action="user_update_ok.jsp" method="post">
 				<h2>회원 가입 페이지</h2>
 				<table>
 					<tr>
 						<td>아이디</td>
 						<td>
 						  <input type="text" name="id" value =<%=id %> readonly>
 						</td>
 					</tr>
 					<tr>
 						<td>이름</td>
 						<td><input type="text" name="name" value=<%=username %>></td>
 					</tr>
 					<tr>
 						<td>이메일</td>
 						<td><input type="email" name="email" value=<%=useremail %>></td>
 					</tr>
 					<tr>
 						<td>주소</td>
 						<td><input type="text" name="address" value=<%=useraddress %>></td>
 					</tr>
 				</table><br>
 				<input type="button" value="정보수정" class="btn btn-primary" onclick="check()">
 				<input type="button" value="마이페이지" class="btn btn-primary" onclick="location.href='user_mypage.jsp'">
 			</form>
		</div>
	</section> 			
        
    <!-- footer.jsp가 include 될 위치  -->	
	<%@ include file="../include/footer.jsp" %>
	
	<script>
	
	  function check() {
		  //form태그를 dom구조 형식으로 document.태그이름.태그이름 으로 하위 태그에 접근 가능함
		  if (document.regform.id.value == '') {
			  alert("이름은 필수 사항입니다.");
			  return;
		  }else if ( confirm("회원 정보 업데이트를 하시겠습니까?")) {
			  
			  //confirm() 확인창에 "확인"를 클릭시 true반환, "취소" 클릭시 false반환
			  document.regform.submit() ; //자바스크립트의 submit() 기능 : form의 submit을 클릭 기능
		  }

		  
		  
	  }

	</script>
</body>
</html>