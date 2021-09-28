package com.myweb.util;

public class Criteria {
	// mysql : select * from board order by num desc limit ?,?;
	//  => 첫번째 ? - 시작위치 , 두번째 ? - 출력 개수
	// oracle : select * from (select rownum as rnum, T1.* from board T1 where rownum <=? order by num desc) where ?<= rnum;
	//  => 첫번째 ? - 출력할 내용의 끝, 두번째 ? -출력할 내용의 시작  Rownum을 기준으로
	
	// 각 페이지 당 몇개의 결과를 출력할지 를 결정... 
	private int pageNum;  //페이지 번호
	private int count;    //페이지 몇개의 데이터를 보여줄지 
	
	public Criteria() {
		//최초 게시판에 진입할 때 기본값 1번 페이지, 10개의 데이터를 세팅
		this.pageNum = 1;
		this.count = 10;
	}

	public Criteria(int pageNum, int count) {
		// 전달받은 매개변수를 이용한 페이지값 출력
		super();
		this.pageNum = pageNum;
		this.count = count;
	}
	
	// limit x, count 구문에 전달될 x값을 구하는 메서드
	public int getPageStart() {
		return ((pageNum -1 )* count)+1;  // +1은 오라클 사용하는 분들.... mysql은 +1을 빼고 작업
	}

	//getter, setter 생성
	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getCount() {
		return count;
	}
	
	//DAO에서 oracle DB에 질의 시에 사용
	public int getCount_oracle() {
		return (pageNum * count);
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	
	

}