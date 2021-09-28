<%@page import="com.myweb.user.model.UserVO"%>
<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 로그인으로부터 입력값 처리
	// 2. dao에 메서드를 생성 (login(id,pw))
	// 3. 결과값이 있다면 성공의 의미로 1을 반환 아닐시 0을 반환
	// 4. 성공시 특별페이지로 이동 user_mypage.jsp 세션처리  user_id 
	// 5. 아닐시 뒤로가기
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//DAO 객체 생성 
	UserDAO dao = UserDAO.getInstance();
	//VO 객체 생성
	//회원가입 여부 확인 
	int result = dao.login(id, pw);
		if(result==1){
			UserVO vo = dao.getUserInfo(id);
			String name = vo.getName();
			String address = vo.getAddress();
			session.setAttribute("user_id", id);
			session.setAttribute("user_name", name);
			%>
			<script>
				alert("<%=id %>님 환영합니다");
				location.href="user_mypage.jsp";
			</script>
			<%
		} else {
			%>
			<script>
				alert("로그인에 실패하였습니다. 다시한번 확인해주세요")
				history.go(-1);
			</script>
			<%
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