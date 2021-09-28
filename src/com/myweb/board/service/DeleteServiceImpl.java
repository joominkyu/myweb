package com.myweb.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.boardDAO;

public class DeleteServiceImpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//폼에서 전달된 값을 처리
		//폼에서 전달된 값을 처리
		String num = request.getParameter("num");
		
		//DAO객체를 생성
		boardDAO dao= boardDAO.getInstance();
		dao.delete(num);
		
	}
	
}
