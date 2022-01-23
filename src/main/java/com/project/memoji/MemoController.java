package com.project.memoji;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.memoji.domain.MemojiVO;
import com.memoji.domain.Page;
import com.memoji.service.MemoService;

@Controller
@RequestMapping("/memo/*")
public class MemoController {
	
	@Inject
	private MemoService service;
	
	// list 보여주기
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String getList(Model model) throws Exception {
		
		List<MemojiVO> list = service.list();
		model.addAttribute("list",list);
		
		return "memo/list";
	}
	
	// 메모 추가 (작성 , create)
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String getcreate() throws Exception {
		
		return "memo/create";
	}
	
	// 메모 추가 post (작성)
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String postcreate(MemojiVO vo) throws Exception {
		
		service.create(vo);
		
		return "redirect:memoListPageSearch?num=1&keyword=";
	}
	
	// 상세페이지
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String getdetail(Model model, int bno) {
		
		service.viewcnt(bno);
		model.addAttribute("viewcnt", bno);
		
		MemojiVO data = service.detail(bno);
		model.addAttribute("data",data);

		return "memo/detail";
		
	}
	
	// 수정 페이지 이동
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String getupdate(int bno, Model model) throws Exception {
		
		MemojiVO data = service.detail(bno);
		model.addAttribute("data", data);
		return "memo/update";
	}
	
	// 수정 post
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String postupdate(MemojiVO vo) throws Exception {
		
		service.update(vo);
		return "redirect:memoListPageSearch?num=1&keyword=";
	}
	
	
	// 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String postdelete(int bno) throws Exception {
		
		service.delete(bno);
		return "redirect:memoListPageSearch?num=1&keyword=";
	}
	
	// 게시물 목록 + 페이징 추가
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void getlistPage(Model model, @RequestParam("num") int num) throws Exception {
		
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(service.count());
		
		List<MemojiVO> list = null;
		list = service.listPage(page.getDisplayPost(), page.getPostNum());
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		System.out.println("page 출력 : "+model.addAttribute("page", page));
		
	}
	
	// 게시물 목록 + 페이징 추가 + 검색
	@RequestMapping(value = "/listPageSearch", method = RequestMethod.GET)
	public void getListPageSearch(Model model, @RequestParam("num") int num, 
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword
			) throws Exception {
		
		Page page = new Page();
		
		page.setNum(num);
		//page.setCount(service.count());
		page.setCount(service.searchCount(keyword));
		
		//검색어
		page.setSearchTypeKeyword(keyword);
		
		List<MemojiVO> list = null;
		list = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), keyword);
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("keyword", keyword);

		
	}
	
	// new list page
	@RequestMapping(value="/memoList", method=RequestMethod.GET)
	public String getMemoList(Model model) {
		List<MemojiVO> list = service.memoList();
		model.addAttribute("list", list);

		return "memo/memoList";
	}
	

	// list + paging
	@RequestMapping(value = "/memoListPage", method = RequestMethod.GET)
	public void getMemoListPage(Model model, @RequestParam("num") int num) throws Exception {
		
		Page page = new Page();
		page.setNum(num);
		page.setCount(service.count());
		
		List<MemojiVO> list = null;
		list = service.memoListPage(page.getDisplayPost(), page.getPostNum());
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		
	}
	
	// list + paging + search
	@RequestMapping(value = "/memoListPageSearch", method = RequestMethod.GET)
	public void getMemoListPageSearch(Model model, @RequestParam("num") int num,
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword) throws Exception {
		
		Page page = new Page();
		page.setNum(num);
		//page.setCount(service.count());
		page.setCount(service.searchCount(keyword));
		
		List<MemojiVO> list = null;
		// list = service.memoListPage(page.getDisplayPost(), page.getPostNum());
		list = service.memoListPageSearch(page.getDisplayPost(), page.getPostNum(), keyword);
		list = service.memoListPageSearch(page.getDisplayPost(), page.getPostNum(), keyword);
		
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listChk", "empty");
		}
		
		//model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		model.addAttribute("keyword", keyword);
		
	}

	
}
