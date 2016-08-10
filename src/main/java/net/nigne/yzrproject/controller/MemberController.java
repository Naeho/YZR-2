package net.nigne.yzrproject.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.nigne.yzrproject.domain.MemberVO;
import net.nigne.yzrproject.service.MemberService;

@Controller // ��Ʈ�ѷ� Ŭ�������� �׻� �� ������̼��� Ŭ���� ���� �ۼ����־�� ��
public class MemberController {
   
	@Autowired // Class class = new ������(); �� ������ ���ֽ� ������̼� 
	private MemberService service;

	@RequestMapping(value = "/member", method = RequestMethod.POST) // url�� ���� �ּҰ� �ԷµǸ� �� Ŭ����? �� �޼���(��?) ȣ��? POST���!!
	public ModelAndView member(MemberVO vo, HttpServletRequest request, @RequestParam("email1") String email1, @RequestParam("email2") String email2) throws Exception { // �𵨾غ� Ÿ���� �����ΰ�? ���� ���� �ϴ°�?
		vo.setGrade("normal"); // �߰��� ��ä�� Į������ ��������
		vo.setEmail(email1 + "@" + email2);
		service.insert(vo); // ���� Ŭ������ ��ü�� �޼��带 ȣ���� with ���VO �Ķ���͸� ���ڰ����� �Ѱ���
		ModelAndView view = new ModelAndView();
		
		HttpSession session = request.getSession();
		session.setAttribute("member_id", vo.getMember_id());
		session.removeAttribute("error");
		view = new ModelAndView("redirect:/index");
		view.addObject("vo", vo);
		view.setViewName("user/memberConfirm"); // ���� ������ �����ϰ� ���ؽ� �������� �Ѿ
		return view;
	}
 
	@RequestMapping(value = "/member", method = RequestMethod.GET) // GET ������� ���� ���޹����� �� �޼��尡 ȣ���
	public String memberPage() throws Exception {
	return "member";
	}
	
	@RequestMapping(value = "/member/check", method = {RequestMethod.GET, RequestMethod.POST}) // �ߺ�Ȯ�� üũ �޼��� url , GET ���
	public ResponseEntity<Boolean> memberCheck(@RequestParam("member_id") String member_id) throws Exception {
		ResponseEntity<Boolean> entity = null; // �� �� �κ��� �� ���ذ� �Ȱ�, �̰� ���������� �Ķ�����ΰ�? 
		try{
			entity = new ResponseEntity<Boolean>(service.idCheck(member_id),HttpStatus.OK); // �� �κе� ��������!!
		}catch(Exception e){
			entity = new ResponseEntity<Boolean>(false,HttpStatus.BAD_REQUEST); 
		}
		return entity;
	}
	
	@RequestMapping(value = "user/member/delete", method =  RequestMethod.POST) // �ߺ�Ȯ�� üũ �޼��� url , GET ���
	public ResponseEntity<Boolean> memberDelete(@RequestParam("member_pw") String member_pw, @RequestParam("member_id") String member_id) throws Exception {
		ResponseEntity<Boolean> entity = null; // �� �� �κ��� �� ���ذ� �Ȱ�, �̰� ���������� �Ķ�����ΰ�? 
		try{
			entity = new ResponseEntity<Boolean>(service.pwCheck(member_pw, member_id),HttpStatus.OK); // �� �κе� ��������!!
		}catch(Exception e){
			entity = new ResponseEntity<Boolean>(HttpStatus.BAD_REQUEST); 
		}
		return entity;
	}
	
	@RequestMapping(value = "/user/member/deleteConfirm", method = RequestMethod.POST) // �ߺ�Ȯ�� üũ �޼��� url , GET ���
	public ModelAndView memberDeleteConfirm(HttpServletRequest request, @RequestParam("pw") String pw) throws Exception {
		ModelAndView view = new ModelAndView();
		HttpSession session = request.getSession();
		System.out.println(pw);
		String member_id =  (String)session.getAttribute("member_id");
		try{
			service.delete(member_id);
			session.removeAttribute("member_id");
		}catch(Exception e){
			e.printStackTrace();
		}
		view.setViewName("index");
		return view;
	}
	
	@RequestMapping(value = "/user/idSearch", method = RequestMethod.GET)
	public ModelAndView idSearch(){
		ModelAndView view = new ModelAndView();
		view.setViewName("user/idSearch");
		return view;
	}
	
	@RequestMapping(value = "/user/pwSearch", method = RequestMethod.GET)
	public ModelAndView pwPage(){
		ModelAndView view = new ModelAndView();
		view.setViewName("user/pwSearch");
		return view;
	}
	
	@RequestMapping(value = "/user/pwSearch", method = RequestMethod.POST)
	public ModelAndView pwSearch(){
		ModelAndView view = new ModelAndView();
		view.setViewName("user/pwSearch");
		return view;
	}
	
}