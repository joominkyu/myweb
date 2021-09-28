package com.myweb.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.myweb.util.Criteria;
import com.myweb.util.jdbcutil;

public class boardDAO {
	
	//1.스스로 객체를 멤버 변수로 선언
	private static boardDAO instance = new boardDAO();
	
	private DataSource ds;
	private Context ctx;
	//2.외부에서 객체를 생성할 수 없도록 생성자에 private
	private boardDAO() {
		//커넥션 풀을 꺼내는 작업
		try {
			ctx = new InitialContext(); //초기 설정 파일 저장되는 객체
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			System.out.println("커넥션 풀링 에러 발생");
		}
	}
	
	//3. 외부에서 객체를 요구할 때 getter메서드만 써서 반환
	public static boardDAO getInstance() {
		return instance;
	}
	
	//-- 중복되는 코드는 멤버변수로 선언 ---
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public void regist(String writer, String title, String content) {
		
		String sql = "insert into board (writer,title,content) values (?,?,?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcutil.close(conn, pstmt, rs);
		}
	}
	
	/*
	//게시물 목록 조회 메서드
	public ArrayList<boardVO> getList()	{
		ArrayList<boardVO> list = new ArrayList<>();
		
		String sql = "select * from board order by num desc";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				// rs.getString(컬럼명), rs.getInt(), rs.getTimeStamp()
				// 기본 생성자를 생성한 후에 값을 처리하는 경우...
				// vo.setNum(rs.getInt("num"));  ...
				
				int num = rs.getInt("num");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");
				int hit = rs.getInt("hit");
				
				boardVO vo = new boardVO(num, writer, title, content, regdate, hit);
				
				//생성된 vo를 리스트 추가
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				jdbcutil.close(conn, pstmt, rs);
			} catch (Exception e2) {
				// TODO: handle exception
			}
			
		}
		
		return list;
	}
	*/
	
	//페이징 게시물 목록 처리 메서드
	public ArrayList<boardVO> getList(Criteria cri) {
		ArrayList<boardVO> list = new ArrayList<>();
		
		String sql = "select * from board order by num desc limit ?, ?";
		String sql_ora = "select * from "
				+ "(select rownum as rnum, T1.* from board T1 where rownum <=? order by num desc) " + 
				"where ?<= rnum";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql_ora);
			//mysql
			//pstmt.setInt(1, cri.getPageStart());//시작번호
			//pstmt.setInt(2, cri.getCount()); //몇개의 데이터 조회
			pstmt.setInt(1, cri.getCount_oracle());  //마지막 번호
			pstmt.setInt(2, cri.getPageStart());	 //시작 번호
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int num = rs.getInt("num");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");
				int hit = rs.getInt("hit");
				
				boardVO vo = new boardVO(num, writer, title, content, regdate, hit);
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				jdbcutil.close(conn, pstmt, rs);
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
	}
	
	//게시물 총 개수 알아오는 메소드
	public int getTotal() {
		int result = 0;
		
		String sql = "select count(*) as total from board";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("total");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				jdbcutil.close(conn, pstmt, rs);
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return result;
	}
	
	//getContent()메소드
	public boardVO getContent(String num1) {
		boardVO vo = null;
		
		String sql = "select * from board where num=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num1);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int num = rs.getInt("num");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");
				int hit = rs.getInt("hit");
				
				vo = new boardVO(num, writer, title, content, regdate, hit);
	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				jdbcutil.close(conn, pstmt, rs);
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return vo;
	}
	
	//조회수 업데이트
	public void upHit(String num) {
		
		String sql = "update board set hit = hit + 1 where num = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				jdbcutil.close(conn, pstmt, rs);
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
	}
	
	public void Update(String num, String title, String content) {
		
		String sql = "update board set title=?, content=? where num=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, num);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				jdbcutil.close(conn, pstmt, rs);
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
	}
	
	//게시판 삭제
	public void delete(String num) {
		
		String sql = "delete from board where num = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				jdbcutil.close(conn, pstmt, rs);
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
	}
	
}