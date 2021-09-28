<%@page import="com.myweb.user.model.UserVO"%>
<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	/*
	1. form값을 처리
	2. DAO연동을 통해 update method를 호출해 수정
	3. 매개변수 값은 vo로 저장
	4. 수정 성공시 "회원 정보가 수정되었습니다" 출력 후 mypage로 이동(name세션 변경)
		수정 실패시 "회원 정보 수정에 실패했습니다." 출력후 mypage로 이동
	*/
	if(session.getAttribute("user_id")==null){
		response.sendRedirect("user_login.jsp");
	}
	
	
	String id = (String)session.getAttribute("user_id");
	
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	
	UserDAO dao = UserDAO.getInstance();
	int result = dao.userupdate(id,name,email,address);
	
	if(result==1){
		UserVO vo = new UserVO();
		vo.setName(name);
		vo.setEmail(email);
		vo.setAddress(address);
%>
		<script>
			alert("회원 정보가 수정되었습니다.");
<%
			session.setAttribute("user_name",name);
%>
			location.href="user_mypage.jsp";
		</script>
<%		
	}else{
%>
		<script>
			alert("회원 정보 수정에 실패했습니다.");
			location.href="user_mypage.jsp";
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