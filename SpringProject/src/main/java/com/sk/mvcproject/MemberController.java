package com.sk.mvcproject;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */

// @Controller를 써주므로써 해당 클래스의 객체를 생성을 하고, 컨트롤러로 인정한다.

// 객체는 하나만 만들어진다
@Controller
public class MemberController {

	// 의존성 주입을 통해서 자동으로 memberdao객체를 만든다.
	@Resource(name = "memberdao")
	MemberDAO dao;

	@RequestMapping(value = "/registerform.do", method = RequestMethod.GET)
	public String registerform() {

		return "member/registerform";
	}

	@RequestMapping(value = "/register.do")
	public String register(Member member, Model model) throws Exception {

		dao.insert(member);
		model.addAttribute("member", member);
		return "member/register";
	}

	@RequestMapping(value = "/listmember.do")
	public String listmember(Model model) throws Exception {

		model.addAttribute("ml", dao.select());
		return "member/listmember";
	}
		
	
/*	// 철저하게 함수에게 모든 것을 맡긴다.
	// 출력용은 response
	@RequestMapping(value = "/test.do")
	public void test(HttpServletResponse response) throws Exception {
		
	}*/
	
	
/*	@RequestMapping(value = "/listmember.do")
	public ModelAndView listmember(Model model) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.addObject("ml",dao.select());
		mav.setViewName("member/listmember");
		
		return mav; 
	}*/
	

	@RequestMapping(value = "/edit_member_form.do")
	public String edit_member_form(Model model, String mem_id) throws Exception {

		Member m = dao.selectById(mem_id);

		String[] gender = new String[] { "", "" };
		String[] hobby = new String[] { "", "", "", "", "" };

		if (m.getGender().equals("man"))
			gender[0] = "checked";
		else
			gender[1] = "checked";

		if (m.getHobby().contains("운동"))
			hobby[0] = "checked";
		if (m.getHobby().contains("영화"))
			hobby[1] = "checked";
		if (m.getHobby().contains("여행"))
			hobby[2] = "checked";
		if (m.getHobby().contains("게임"))
			hobby[3] = "checked";
		if (m.getHobby().contains("독서"))
			hobby[4] = "checked";
		if (m.getHobby().contains("낚시"))
			hobby[5] = "checked";

		model.addAttribute("gender", gender);
		model.addAttribute("hobby", hobby);
		model.addAttribute("m", m);
		return "member/edit_member_form"; 
	}

	@ResponseBody
	@RequestMapping(value = "/delete_member.do",
			produces = "text/html;charset=UTF-8")
	public String delete_member(Model model, String mem_id) throws Exception {

		if (dao.delete(mem_id) == 1)
			return "<script> alert('삭제');location.href='listmember.do';</script>";
		else
			return "<script> alert('id없음');location.href='listmember.do';</script>";

	}
	
	@RequestMapping(value = "/loginform.do")
	public String loginform() {
		return "/member/loginform";
	} 
	
	@RequestMapping(value = "/login.do")
	public String login(String mem_id, String mem_pwd) {
		
		return "/member/login";
	}
	
	@RequestMapping(value = "/oneto50.do")
	public String oneto50(String mem_id, String mem_pwd) {
		
		return "1to50";
	}
	
	@RequestMapping(value = "/knowmejq.do")
	public String knowmejq(String mem_id, String mem_pwd) {
		
		return "knowmejq";
	}
	
	@RequestMapping(value = "/chat.do")
	public String chat(String mem_id, String mem_pwd) {
		
		return "chat";
	}
	
	
	

}
