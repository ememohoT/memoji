package com.memoji.dao;

import java.util.List;

import com.memoji.domain.MemojiVO;

public interface MemoDAO {
	
	public List<MemojiVO> list(); // 조회
	
	public void create(MemojiVO vo); //쓰기
	
	public MemojiVO detail(int bno); //상세보기
	
	public void update(MemojiVO vo); //수정
	
	public void delete(int bno); //삭제
	
	public int count() throws Exception; //게시물 총 개수
	
	public List<MemojiVO> listPage(int displayPost, int postNum) throws Exception; // 게시물 목록 + 페이징
	
	public List<MemojiVO> listPageSearch(int displayPost, int postNum, String keyword) throws Exception; // 게시물 목록 + 페이징 + 검색
	
	public int searchCount(String keyword) throws Exception; // 게시물 총 개수 + 검색
	
	public List<MemojiVO> memoList();

	public List<MemojiVO> memoListPage(int displayPost, int postNum) throws Exception;

	public List<MemojiVO> memoListPageSearch(int displayPost, int postNum, String keyword) throws Exception;

	public void viewcnt(int bno);

}
