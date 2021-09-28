package com.myweb.util;

public class PageVO {
	
	//화면에 그러질 버튼들의 개수를 계산하는 클래스 
	private int startPage; 	//시작번호
	private int endPage;	//끝번호
	private int total;		//전체 게시글 수
	
	private int pageNum;	//현재 조회하는 페이지 번호
	
	private boolean next;	//다음 버튼 활성화 여부
	private boolean prev;	//이전 버튼 활성화 여부
	
	private Criteria cri; 	//페이징 기준
	
	//생성자가 기본생자로 생성하지 않고, total과 Criteria를 받아서 계산을 처리하도록 함. 
	public PageVO(int total, Criteria cri) {
		//전달되는 매개변수에서 초기값을 저장함. 
		this.total = total;
		this.cri = cri;
		this.pageNum = cri.getPageNum();
		
		//끝페이지 계산
		// 조회하는 페이지 번호가 1 ~ 10 => 10
		// 조회하는 페이지 번호가 11 ~ 20 => 20
		// Math.ceil 올림
		// 계산식 = (int)Math.ceil(조회하는 페이지번호 / (double)10)*10
		this.endPage = (int)Math.ceil(cri.getPageNum()/(double)10) * 10;
		
		//시작 페이지 계산
		//계산식 = 끝페이지 번호 - 한번에 보여질 페이지 번호 + 1
		this.startPage = endPage -9;
		
		//페이지 번호가 적을 때 나타내는 진짜 끝번호 
		int realEnd = (int)Math.ceil(this.total/(double)cri.getCount());
		
		//마지막 페이지 세팅에서 보여줘야 하는 번호 
		if(this.endPage > realEnd) {
			this.endPage = realEnd;
		}
		
		//이전 페이지 버튼 활성화 여부
		//startPage => 1, 11, 21, 31 ,,,,
		//startPage가 1보다 크면 true
		this.prev = startPage > 1;
		
		//다음페이지 버튼 활성화 여부
		this.next = realEnd > this.endPage;	
	}

	//getter, setter 메서드 생성
	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	

}