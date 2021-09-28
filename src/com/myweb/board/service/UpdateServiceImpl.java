package com.myweb.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.boardDAO;

public class UpdateServiceImpl implements IBoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//폼에서 전달된 값을 처리
		//폼에서 전달된 값을 처리
		String num = request.getParameter("num");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		//DAO객체를 생성
		//regist메소드를 호출 (write,title,context)가지는 ... 
		boardDAO dao= boardDAO.getInstance();
		dao.Update(num, title, content);
		
	}
	
}
