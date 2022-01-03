package com.memoji.domain;

public class Page {
	
	// 현재 페이지 번호
	private int num;
	
	// 게시물 총 개수
	private int count;
	
	// 한 페이지에 출력할 게시물 개수
	private int postNum;
	
	// 하단 페이징 번호 ([게시물 총 개수 / 한 페이지에 출력할 개수]의 올림)
	private int pageNum;
	
	// 출력할 게시물
	private int displayPost;
	
	// 블럭 당 표시할 페이징 번호의 개수
	private int pageNumCnt = 3;
	
	// 표시되는 페이지 번호 중 마지막 번호
	private int endPageNum;
	
	// 표시되는 페이지 번호 중 첫번째 번호
	private int startPageNum;
	
	// 다음/이전 표시 여부
	private boolean prev;
	private boolean next;
	
	// 데이터들 계산하는 메서드
	private void dataCalc() {
		
		if (num==1) {
			postNum = 5;
		} else postNum = 6;
		
		// 마지막 번호
		endPageNum = (int)(Math.ceil((double)num / (double)pageNumCnt) * pageNumCnt);
		
		// 시작 번호
		startPageNum = endPageNum - (pageNumCnt -1);
		
		// 마지막 번호 재계산
		int endpageNum_tmp = (int)(Math.ceil((double)count / (double)postNum));
		
		if (endPageNum > endpageNum_tmp) {
			
			endPageNum = endpageNum_tmp;
		}
		
		prev = startPageNum == 1 ? false : true;
		next = endPageNum * postNum >= count ? false : true;
		
		displayPost = (num - 1) * postNum;
	}
	
	
	// 검색타입 , 검색어
	private String searchTypeKeyword;
	
	public void setSearchTypeKeyword(String keyword) {
		
		if (keyword.equals("")) {
			keyword = "";
		} else {
			
			searchTypeKeyword = "&keyword" + keyword;
		}
	}
	
	public String getSearchTypeKeyword() {
		
		return searchTypeKeyword;
	}
	
	public void setNum(int num) {
		 this.num = num;
	}
	public int getNum(int num) {
		 return num;
	}

	public void setCount(int count) {
		 this.count = count;
		 // dataCalc 메서드 호출
		 dataCalc();
	}

	public int getCount() {
		 return count;
	}

	public int getPostNum() {
		 return postNum;
	}

	public int getPageNum() {
		 return pageNum;
	}

	public int getDisplayPost() {
		 return displayPost;
	}

	public int getPageNumCnt() {
		 return pageNumCnt;
	}

	public int getEndPageNum() {
		 return endPageNum;
	}

	public int getStartPageNum() {
		 return startPageNum;
	}

	public boolean getPrev() {
		 return prev;
	} 

	public boolean getNext() {
		 return next;
	}
}
