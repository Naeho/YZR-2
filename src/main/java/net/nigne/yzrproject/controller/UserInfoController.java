package net.nigne.yzrproject.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.nigne.yzrproject.domain.MemberVO;
import net.nigne.yzrproject.service.MemberService;
import net.nigne.yzrproject.service.UserInfoService;

@Controller
public class UserInfoController {
	
	@Autowired
	private UserInfoService service;
	
	@Autowired // Class class = new ������(); �� ������ ���ֽ� ������̼� 
	private MemberService memberService;
	
	@RequestMapping(value = "/user/member/edit", method = RequestMethod.GET)
	public ModelAndView memberEdit(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		MemberVO vo = memberService.select(member_id);
		ModelAndView view = new ModelAndView(); 
		view.addObject("vo",vo);
		view.setViewName("user/memberEdit"); // ���� ������ �����ϰ� �ε��� �������� �Ѿ
		return view;
		
	}
	
	@RequestMapping(value = "/user/member/edit", method = RequestMethod.POST)
	public ModelAndView memberEditPage(@ModelAttribute MemberVO vo, HttpServletRequest request) throws Exception {
		System.out.println(vo.getMember_pw());
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		service.userInfoUpdate(member_id, vo);
		ModelAndView view=new ModelAndView();
		view.setViewName("user/index");
		return view;
	}
	
	@RequestMapping(value = "/user/memberPwEdit", method = RequestMethod.GET)
	public ModelAndView memberPwEdit(HttpSession session) throws Exception {
		ModelAndView view=new ModelAndView();
		String member_id = (String)session.getAttribute("member_id");
		view.addObject("password", service.getMemberInfo(member_id).getMember_pw());
		view.setViewName("user/memberPwEdit");
		return view;
	}
	
	
	@RequestMapping(value = "/user/pwFind", method = RequestMethod.POST)
	public ResponseEntity<Boolean> pwFind(@RequestParam("member_id") String member_id, @RequestParam("question") String question,@RequestParam("answer") String answer) throws Exception {
		ResponseEntity<Boolean> entity = null; // �� �� �κ��� �� ���ذ� �Ȱ�, �̰� ���������� �Ķ�����ΰ�? 
		MemberVO vo = new MemberVO();
		vo.setMember_id(member_id);
		vo.setQuestion(question);
		vo.setAnswer(answer);
		System.out.println(member_id);
		try{
			entity = new ResponseEntity<Boolean>(service.pwFind(vo),HttpStatus.OK); // �� �κе� ��������!!
			System.out.println(member_id);

		}catch(Exception e){
			entity = new ResponseEntity<Boolean>(HttpStatus.BAD_REQUEST); 
			System.out.println(answer);
		}
		return entity;
	}
	
	@RequestMapping(value = "/user/delete", method = RequestMethod.GET)
	public ModelAndView userDeletePage() throws Exception {
		ModelAndView view=new ModelAndView();
		view.setViewName("user/delete");
		return view;
	}
	
	@RequestMapping(value = "/user/member/pwChange", method = RequestMethod.POST)
	public ModelAndView PwChange(@RequestParam("newPw") String newPw, HttpSession session) throws Exception {
		ModelAndView view=new ModelAndView();
		String member_id = (String)session.getAttribute("member_id");
		service.pwUpdate(member_id, newPw);
		view.setViewName("/index");
		return view;
	}
	
}