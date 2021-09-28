package com.myweb.user.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.myweb.util.jdbcutil;

public class UserDAO {
	/*
	 * 	DAO는 단수 DB연동을 담당하는 클래스 
	 * 	여러개 생성하도록 일반 클래스로 만들면 메모리 과부하가 올 수 있음
	 *	때문에 싱글톤 패턴을 적용하여 객체를 1개로 제한함
	 */
	
	//1. 스스로의 객체를멤버변수로 선언하고 한개로 제한
	private DataSource ds;
	private Context ct;
	private static UserDAO instance = new UserDAO();
	
	//2. 외부에서 객체를 생성할 수 없도록 생성자를 private 처리
	private UserDAO() {
		try {
			ct = new InitialContext();
			ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//3. 외부에서 객체를 요구할 경우에 getter 메서드만 써서 반환함
	public static UserDAO getInstance() {						///회원가입 여부 확인
		return instance;
	}
	
	//-------------중복되는 코드들을 멤버변수로 선언 
	//DB연동을 위한 변수 및 객체
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//--------------사용할 메서드들을 정의
	public int IdConfirm(String id) {
		int result = 0;
		
		String sql = "select * from users where id=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) result = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcutil.close(conn, pstmt, rs);
			
		}
		
		
		return result;
	}							///idConfirm 
	
	public int join(UserVO vo) {
		int result = 0;
		String sql = "insert into users (id,pw,name,email,address) values (?,?,?,?,?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getAddress());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcutil.close(conn, pstmt, rs);
		}
		
		return result;
	}			///join 
	
	public int login(String id, String pw) {
		int result = 0;
		String sql ="select * from users where id=? and pw=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if(rs.next()) result = 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcutil.close(conn, pstmt, rs);
		}
	
		return result;
	}			///login 
	
	public UserVO getUserInfo(String id) {
		UserVO vo = null;
		String sql = "select * from users where id = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				//db에서 getstring(column)을 통해 값을 얻어오고
				//db에서 gettimestamp(column)을 통해 시간도 훔쳐옴
				String name = rs.getString("name");
				String email = rs.getString("email");
				String address = rs.getString("address");
				Timestamp regdate = rs.getTimestamp("regdate");
				vo = new UserVO(id, null, name, email, address, regdate);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcutil.close(conn, pstmt, rs);
		}
		return vo;
	}
	
	public int ChangePw(String id,String pw) {
		int result = 0;
		
		String sql = "update users set pw = ? where id = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, id);
			
			result = pstmt.executeUpdate();
			if(rs.next()) result=1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcutil.close(conn, pstmt, rs);
		}
		return result;
	}
	
	public int userupdate(String id,String name,String email, String address) {
		int result = 0;
		
		String sql = "update users set name = ?, email = ?, address = ? where id = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(2,email);
			pstmt.setString(3,address);
			pstmt.setString(4,id);
			
			result = pstmt.executeUpdate();
			if(rs.next()) result =1;			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcutil.close(conn, pstmt, rs);
		}
		return result;
	}
	
	public int delete(String id) {
		int result = 0;
		
		String sql ="delete from users where id =?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			result = pstmt.executeUpdate();
			if(rs.next()) result =1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcutil.close(conn, pstmt, rs);
		}
		return result;
	}
}