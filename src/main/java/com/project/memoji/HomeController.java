package com.project.memoji;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.memoji.domain.MemberVO;
import com.memoji.service.MemberService;

@Controller
public class HomeController {
	
	@Inject
	MemberService service;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
		
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		System.out.println("home method");
		
		return "home";
	}
	
	
	//로그인
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		
		MemberVO login = service.login(vo);
		HttpSession session = req.getSession();
				
		boolean passMatch = passEncoder.matches(vo.getUserPass(), login.getUserPass());
		
		if (login != null && passMatch) {
			
			session.setAttribute("member", login); 

		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/";
		}

		return "redirect:/memo/memoListPageSearch?num=1&keyword=";
	}
	
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	
}
