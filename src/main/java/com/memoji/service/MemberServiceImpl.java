package com.memoji.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.memoji.dao.MemberDAO;
import com.memoji.domain.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;
	
	//회원가입
	@Override
	public void register(MemberVO vo) throws Exception {
		
		dao.register(vo);
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}

	/*
	 * @Override public MemberVO idChk(String userId) throws Exception { return
	 * dao.idChk(userId); }
	 */

	
	@Override public int idChk(MemberVO vo) throws Exception { 
		int result = dao.idChk(vo); 
		return result; 
	}
	 

}