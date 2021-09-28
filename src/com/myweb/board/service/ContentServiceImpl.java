package com.myweb.board.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.boardDAO;
import com.myweb.board.model.boardVO;

public class ContentServiceImpl implements IBoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		/// 1. dao에 getContent(num)메서드 생성하고 호출
		/// 2. getContent()메서드에서는 num을 가지고, 
		//		게시글에 대한 정보를 조회해서 boardVO객체인 vo에 담는 코드를 작성
		/// 3. 메서드 리턴타입 : boardVO
		/// 4. 화면전송을 위한 리턴값을 vo라는 이름으로 강제 저장
	
		//request에서 num 파라미터 값 처리
		String num = request.getParameter("num");
		//DAO객체 생성.
		boardDAO dao = boardDAO.getInstance();
		boardVO vo = dao.getContent(num);
		
		//쿠키를 사용하여 처리 - 조회수 쿠키 카운트 처리 
		Cookie[] arr = request.getCookies();
		
		boolean bool = true;
		for(Cookie c : arr) {
			if(c.getName().equals("hitNum"+num)) { 		//쿠키 이름이 게시글 번호 쿠키인지 확인
				bool = false;
				break;
			}
		}
		
		//조회수 업데이트
		if(bool) {		//bool이 true 이면 동작
			dao.upHit(num);
		}
		
		//강제 저장
		request.setAttribute("vo", vo);
		
		//중복 증가 방지를 위한 쿠키 생성(1)
		Cookie hitCoo = new Cookie("hitNum"+num, num);
		hitCoo.setMaxAge(30);
		response.addCookie(hitCoo);
	}
	

}