package com.memoji.service;

import java.util.List;

import com.memoji.domain.MemojiVO;

public interface MemoService {
	
	public List<MemojiVO> list();
	
	public void create(MemojiVO vo);
	
	public MemojiVO detail(int bno);
	
	public void update(MemojiVO vo);
	
	public void delete(int bno);
	
	public int count() throws Exception;
	
	public List<MemojiVO> listPage(int displayPost, int postNum) throws Exception;
	
	public List<MemojiVO> listPageSearch(int displayPost, int postNum, String keyword) throws Exception;
	
	public int searchCount(String keyword) throws Exception;
	
	public List<MemojiVO> memoList();

	public List<MemojiVO> memoListPage(int displayPost, int postNum) throws Exception;

	public List<MemojiVO> memoListPageSearch(int displayPost, int postNum, String keyword) throws Exception;

	public void viewcnt(int bno);
	
}
