package com.myweb.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//컨트롤러를 생성할 때에 매핑형식을 "확장자패턴.xxx" 로 변경


//@WebServlet("/TestController")
@WebServlet("*.test")
public class TestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TestController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request,response); //do Action 메소드에 어떤식이든 전달... 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		
		String path = request.getContextPath();
		
		String command = uri.substring(path.length());
		
		System.out.println(command);
		
		if (command.equals("/controller/join.test")) {
			//... 조인 요청... 
			System.out.println("join 동작 페이지로 이동");
		} else if(command.equals("/index.test")){
			RequestDispatcher dp = request.getRequestDispatcher("index.jsp");
			dp.forward(request, response);			
		}
		
	}

}