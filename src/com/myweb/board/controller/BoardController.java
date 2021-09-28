package com.myweb.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.service.ContentServiceImpl;
import com.myweb.board.service.DeleteServiceImpl;
import com.myweb.board.service.GetListServiceimpl;
import com.myweb.board.service.IBoardService;
import com.myweb.board.service.RegistServiceImpl;
import com.myweb.board.service.UpdateServiceImpl;


@WebServlet("*.board")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	//.board로 끝나는 요청은 이 컨트롤로 들어오게 처리됨.
	//1. get,post 요청을 하나의 메서드로 연결(doAction())
	//2. 컨텍스트 패스를 제거 /board/list.board 요청으로 들어오면 board_list화면으로 이동
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String command = uri.substring(path.length());
		
		IBoardService service = null;
		
		if (command.equals("/board/register.board")) { //글등록
			//서비스 객체 생성
			service = new RegistServiceImpl();
			service.execute(request, response);
		
			response.sendRedirect("list.board"); // 컨트롤러를 통해서 list.board로 전달
		
		}else if(command.equals("/board/list.board")) {
			//게시글 목록을 가지고 화면 이동 작업
			service = new GetListServiceimpl();
			service.execute(request, response);
			
			//목록을 가지고 service영역에서 설정한 값을 request강제 설정으로 전달(forward)
			RequestDispatcher dp = request.getRequestDispatcher("board_list.jsp");
			dp.forward(request, response);
		
		}else if (command.equals("/board/write.board")) { //글작성
			response.sendRedirect("board_write.jsp");
		
		}else if(command.equals("/board/content.board")) { //상세보기 화면 요청
			// 상세보기 위한 service 구성  -- ContentServiceImpl
			service = new ContentServiceImpl();
			service.execute(request, response);
			
			//강제 설정한 값(vo)을 전달
			RequestDispatcher dp = request.getRequestDispatcher("board_content.jsp");
			dp.forward(request, response);
		
		}else if(command.equals("/board/modify.board")) {
			service = new ContentServiceImpl();
			service.execute(request, response);
			
			RequestDispatcher dp = request.getRequestDispatcher("board_modify.jsp");
			dp.forward(request, response);
		}else if(command.equals("/board/update.board")) {
			/*
			 * 1.UpdateServiceImpl생성
			 * 2.서비스 영역세어 num,title,content를 받아서 update() 메소드 실행
			 * 3.DAO의 update()에서 update구문으로 데이터를 수정
			 * 4.수정한 페이지 이름으로 상세보기 화면으로 연결(단 필요한 값을 전달해야함)
			 * 
			 * sql = "update board set title=?, content=? where num=?";
			 */
			service = new UpdateServiceImpl();
			service.execute(request, response);
			
			String num = request.getParameter("num");
			response.sendRedirect("/MyWeb/board/content.board?num="+num);
		}else if(command.equals("/board/delete.board")) {
			/*
			 * 1.DeleteServiceImpl 생성
			 * 2.서비스 영역에서는 num을 받아서 delete()메소드를 실행
			 * 3.DAO의 delete()에서 delete 구문으로 삭제
			 * 4.페이지 이동은 목으로 처리함
			 * 
			 * sql = "delete from board where num=?";
			 * 
			 */
			service = new DeleteServiceImpl();
			service.execute(request, response);
			
			String num = request.getParameter("num");
			response.sendRedirect("/MyWeb/board/list.board");
		}
		
	}
}
