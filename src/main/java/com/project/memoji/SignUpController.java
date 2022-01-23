package com.project.memoji;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.memoji.domain.MemberVO;
import com.memoji.service.MemberService;

@Controller
@RequestMapping("/memo/*")
public class SignUpController {

	@Inject
	MemberService service;

	@Autowired
	BCryptPasswordEncoder passEncoder;

	// 회원가입 get
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public void getSignup() throws Exception {

		System.out.println("get register");

	}

	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	
	  public int idChk(MemberVO vo) throws Exception { 
		int result =
		service.idChk(vo); 
		System.out.println(result); 
		return result; 
		// 없으면 0, 있으면 1반환
	}
	
	/*
	 * public int idChk(HttpServletRequest req) throws Exception{ String userId =
	 * req.getParameter("userId"); //System.out.println("1"); MemberVO idCheck =
	 * service.idChk(userId); //System.out.println("2"); int result = 0;
	 * //System.out.println("3"); if(idCheck != null) result = 1;
	 * //System.out.println("4"); return result; }
	 */

	// 회원가입 post
	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception {
		System.out.println("post register");

		int result = service.idChk(vo);
		String inputPass = vo.getUserPass();
		String pass = passEncoder.encode(inputPass);
		
		try {
			if (result == 1) {
				return "/memo/signUp";
			}
			else if (result == 0) {
				vo.setUserPass(pass);
				service.register(vo);				
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		

		return "redirect:/";
	}

}