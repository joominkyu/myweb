package com.myweb.board.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.boardDAO;
import com.myweb.board.model.boardVO;
import com.myweb.util.Criteria;
import com.myweb.util.PageVO;

public class GetListServiceimpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		/*
		//DAO객체를 생성
		boardDAO dao = boardDAO.getInstance();	
		ArrayList<boardVO> list = dao.getList(); //목록 조회 결과를 list형태로 받음 
		
		//다음 화면에서 사용하기 위해서 request객체 강제 저장
		request.setAttribute("list", list);
		*/
		
		//페이징
		//DAO객체 생성
		boardDAO dao = boardDAO.getInstance();
		
		Criteria cri = new Criteria();
		
		if (request.getParameter("pageNum") != null) {
			String pageNum = request.getParameter("pageNum");
			cri.setPageNum(Integer.parseInt(pageNum));
		}
		
		ArrayList<boardVO> list = dao.getList(cri);
		
		request.setAttribute("list", list);
		
		//화면에 보여질 페이지 버튼을 계산 처리
		//1. 총 게시글 수
		int total = dao.getTotal();
		
		PageVO vo = new PageVO(total, cri);
		request.setAttribute("pageVO", vo);
		
	}
	

}

