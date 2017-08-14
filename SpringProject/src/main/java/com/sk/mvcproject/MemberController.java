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

// @Controller�� ���ֹǷν� �ش� Ŭ������ ��ü�� ������ �ϰ�, ��Ʈ�ѷ��� �����Ѵ�.

// ��ü�� �ϳ��� ���������
@Controller
public class MemberController {

	// ������ ������ ���ؼ� �ڵ����� memberdao��ü�� �����.
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
		
	
/*	// ö���ϰ� �Լ����� ��� ���� �ñ��.
	// ��¿��� response
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

		if (m.getHobby().contains("�"))
			hobby[0] = "checked";
		if (m.getHobby().contains("��ȭ"))
			hobby[1] = "checked";
		if (m.getHobby().contains("����"))
			hobby[2] = "checked";
		if (m.getHobby().contains("����"))
			hobby[3] = "checked";
		if (m.getHobby().contains("����"))
			hobby[4] = "checked";
		if (m.getHobby().contains("����"))
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
			return "<script> alert('����');location.href='listmember.do';</script>";
		else
			return "<script> alert('id����');location.href='listmember.do';</script>";

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
