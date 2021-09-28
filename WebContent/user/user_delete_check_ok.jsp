<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	1. form받음
	2. login 재활용해서 확인
	3. login > 0 > 비밀번호를 확인하세요 alert 마이페이지
	   login > 1 > delete() 실행
	4. 삭제 성공시 회원 탈퇴 처리 되었습니다 출력 > 세션 삭제 > 마이페이지
	    삭제 실패시 탈퇴에 실패했습니다 출력 > 마이페이지
	*/
	String id = (String)session.getAttribute("user_id");
	String pw = request.getParameter("pw");
	
	UserDAO dao = UserDAO.getInstance();
	int result = dao.login(id,pw);
	
	if(result==0){
%>
	<script>
		alert("비밀번호를 확인하세요");
		history.go("user_mypage.jsp");
	</script>
		
<%
	}else{
		int result2 = dao.delete(id);
		if(result2==1){	
			session.invalidate();
%>
			<script>
				alert("회원 탈퇴 처리 되었습니다");
			</script>
<%
			response.sendRedirect("/MyWeb");
		}else{
%>
			<script>
				alert("회원 탈퇴에 실패했습니다.");
				history.go("user_mypage.jsp");
			</script>
<%			
		}
	}
%>