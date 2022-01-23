package com.memoji.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.memoji.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	//my batis
	@Inject
	private SqlSession sql;
	
	// mapper
	private static String namespace = "com.memoji.mappers.memoji";
	
	@Override
	public void register(MemberVO vo) throws Exception {
		
		sql.insert(namespace + ".register", vo);
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		//return sql.selectOne(namespace + ".login", vo);
		
		return sql.selectOne(namespace + ".loginBcrypt", vo);
	}

	/*
	 * @Override public MemberVO idChk(String userId) throws Exception { return
	 * sql.selectOne(namespace + ".idChk", userId); }
	 */

	
	@Override public int idChk(MemberVO vo) throws Exception { 
		int result = sql.selectOne(namespace + ".idChk", vo); 
		return result; 
	}
	 

}
