<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 			<form name="regform" action="user_join_ok.jsp" method="post">
 				<h2>회원 가입 페이지</h2>
 				<table>
 					<tr>
 						<td>아이디</td>
 						<td>
 						  <input type="text" name="id" placeholder="4글자 이상 8글자이하 ">
 						</td>
 					</tr>
 					<tr>
 						<td>비밀번호</td>
 						<td><input type="password" name="pw"></td>
 					</tr>
 					<tr>
 						<td>비밀번호 확인</td>
 						<td><input type="password" name="pw_check"></td>
 					</tr>
 					<tr>
 						<td>이름</td>
 						<td><input type="text" name="name"></td>
 					</tr>
 					<tr>
 						<td>이메일</td>
 						<td><input type="email" name="email"></td>
 					</tr>
 					<tr>
 						<td>주소</td>
 						<td><input type="text" name="address"></td>
 					</tr>
 				</table><br>
 				<input type="button" value="회원가입" class="btn btn-primary" onclick="check()">
 				<input type="button" value="로그인" class="btn btn-primary" onclick="location.href='user_login.jsp'">
 			</form>
 		</div>
 	</section>
        
    <!-- footer.jsp가 include 될 위치  -->	
	<%@ include file="../include/footer.jsp" %>
	
	<script>
	
	  function check() {
		  //form태그를 dom구조 형식으로 document.태그이름.태그이름 으로 하위 태그에 접근 가능함
		  if (document.regform.id.value == '') {
			  alert("아이디는 필수 입력 사항입니다.");
			  return;
		  }else if (document.regform.id.value.length < 4 || document.regform.id.value.length > 8 ) {
			  alert("아이디는 4글자 이상 8글자 이하로 입력하세요!!");
			  return;
		  }else if (document.regform.pw.value ==''){
			  alert("비밀번호는 필수 사항입니다.");
			  return;
		  }else if (document.regform.pw.value != document.regform.pw_check.value){
			  alert("비밀번호 확인을 체크하세요!!");
			  return;
		  }else if (document.regform.name.value == ''){
			  alert("이름은 필수 사항입니다.");
			  return;
		  }else if ( confirm("회원 가입을 하시겠습니까?")) {
			  //confirm() 확인창에 "예"를 클릭시 true반환, "아니오" 클릭시 false반환
			  document.regform.submit() ; //자바스크립트의 submit() 기능 : form의 submit을 클릭 기능
		  }

		  
		  
	  }

	</script>
</body>
</html>