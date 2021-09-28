<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	/*
	1. form 으로 전달된 값을 처리
	2. login(id,pw-old) 가 맞는지 확인
	 맞지 않으면 뒤로가기
	3. 맞으면 changePassword()를 실행
	4. 성공하면 "비밀번호 변경처리가 되었습니다." Alert창  후 mypage이동
	       실패하면 "비밀번호 변경에 실패햤숩나다" Alert창 후 mypage 이동
	*/
	String id = (String)session.getAttribute("user_id");
	String op = request.getParameter("old_pw");
	String np = request.getParameter("new_pw");	
	
	UserDAO dao = UserDAO.getInstance();
	
	int result = dao.login(id,op);
	
	if(result==0){ // 비밀번호 틀린 경우
%>
		<script>
			history.go(-1);
		</script>	
<%
	}else{
		int result2 = dao.ChangePw(id,np);
		if(result2 == 1){ // 비밀번호 변경 성공
%>
			<script>
				alert("비밀번호 변경처리가 되었습니다.");
				location.href="user_mypage.jsp";
			</script>
<%			
		}else{ // 비밀ㄹ번호 변경 실패
%>
			<script>
				alert("비밀번호 변경에 실패했습니다.");
				location.href="user_mypage.jsp";
			</script>
<%			
		}
	}
%>


	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>