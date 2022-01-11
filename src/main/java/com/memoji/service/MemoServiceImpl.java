package com.memoji.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.memoji.dao.MemoDAO;
import com.memoji.domain.MemojiVO;

@Service
public class MemoServiceImpl implements MemoService {
	
	@Inject
	private MemoDAO dao;
	
	//회원 목록(list)
	@Override
	public List<MemojiVO> list() {
		
		return dao.list();
	}
	
	// 게시글 등록
	@Override
	public void create(MemojiVO vo) {
		
		dao.create(vo);
	}
	
	// 상세보기
	@Override
	public MemojiVO detail(int bno) {
		return dao.detail(bno);
	}
	
	// 수정
	@Override
	public void update(MemojiVO vo) {
		
		dao.update(vo);
	}
	
	// 삭제
	@Override
	public void delete(int bno) {
		
		dao.delete(bno);
	}
	
	// 게시물 총 개수
	@Override
	public int count() throws Exception {
		
		return dao.count();
	}
	
	// 게시물 목록 + 페이징
	@Override
	public List<MemojiVO> listPage(int displayPost, int postNum) throws Exception {
		
		return dao.listPage(displayPost, postNum);
	}
	
	// 게시물 목록 + 페이징 + 검색
	@Override
	public List<MemojiVO> listPageSearch(int displayPost, int postNum, String keyword)
			throws Exception {
		return dao.listPageSearch(displayPost, postNum, keyword);
	}
	
	// 게시물 총 개수
	@Override
	public int searchCount(String keyword) throws Exception {
		return dao.searchCount(keyword);
	}

	// new list page
	@Override
	public List<MemojiVO> memoList() {
		return dao.memoList();
	}

	
	// new list + paging
	@Override
	public List<MemojiVO> memoListPage(int displayPost, int postNum) throws Exception {
		return dao.memoListPage(displayPost, postNum);
	}

	//new list + paging + search
	@Override
	public List<MemojiVO> memoListPageSearch(int displayPost, int postNum, String keyword) throws Exception {
		return dao.memoListPageSearch(displayPost, postNum, keyword);
	}

	

}
