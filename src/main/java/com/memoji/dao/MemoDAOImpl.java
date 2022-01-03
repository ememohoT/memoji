package com.memoji.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.memoji.domain.MemojiVO;

@Repository
public class MemoDAOImpl implements MemoDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.memoji.mappers.memoji";
	
	//게시물 목록 (list)
	
	public List<MemojiVO> list() {
		
		return sql.selectList(namespace + ".list");
	}
	
	// 게시물 등록
	@Override
	public void create(MemojiVO vo) {
		
		sql.insert(namespace + ".create", vo);
	}
	
	// 상세페이지
	@Override
	public MemojiVO detail(int bno) {
		
		return sql.selectOne(namespace + ".detail", bno);
	}
	
	// 수정
	@Override
	public void update(MemojiVO vo) {
		
		sql.update(namespace + ".update", vo);
	}
	
	// 삭제
	@Override
	public void delete(int bno) {
		
		sql.delete(namespace + ".delete", bno);
	}
	
	// 게시물 총 개수
	@Override
	public int count() throws Exception {
		
		return sql.selectOne(namespace + ".count");
	}
	
	@Override
	public List<MemojiVO> listPage(int displayPost, int postNum) throws Exception {
		
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		return sql.selectList(namespace + ".listPage", data);
	}
	
	// 게시물 목록 + 페이징 + 검색
	@Override
	public List<MemojiVO> listPageSearch(int displayPost, int postNum, String keyword)
			throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		data.put("keyword", keyword);
		
		return sql.selectList(namespace + ".listPageSearch", data);
	}
	
	
	// 게시물 총 개수 + 검색
	@Override
	public int searchCount(String keyword) throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("keyword", keyword);
		
		return sql.selectOne(namespace + ".searchCount", data);
	}


	// new 리스트페이지
	@Override
	public List<MemojiVO> memoList() {
		return sql.selectList(namespace + ".memoList");
	}

	
	@Override
	public List<MemojiVO> memoListPage(int displayPost, int postNum) throws Exception {
		
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		return sql.selectList(namespace + ".memoListPage", data);
	}

}
