package net.nigne.yzrproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import net.nigne.yzrproject.domain.MemberVO;
import net.nigne.yzrproject.domain.PurchaseVO;
import net.nigne.yzrproject.service.PurchaseService;

@Controller
public class StoreController {
	@Autowired
	private PurchaseService service;

	@RequestMapping(value = "/store", method = RequestMethod.GET)
	public String store(HttpSession session) throws Exception {
		session.setAttribute("menu", "EVENT&CULTURE");
		return "store";
	}
	
	@RequestMapping(value = "/store/buy", method = RequestMethod.POST)
	public String snackBar(HttpServletRequest request, Model model) throws Exception {
		HttpSession session=request.getSession();
		session.setAttribute("menu", "EVENT&CULTURE");
		String member_id = (String)session.getAttribute("member_id");
		MemberVO vo = service.getUser_Info(member_id);
		
		model.addAttribute("member", vo);
		
		String product_name = request.getParameter("menu_name");
		String product_content = request.getParameter("menu_content");
		String product_price = request.getParameter("menu_price");
		String product_img = request.getParameter("menu_img");
		
		model.addAttribute("product_name", product_name);
		model.addAttribute("product_content", product_content);
		model.addAttribute("product_price", product_price);
		model.addAttribute("product_img", product_img);
		
		return "buy";
	
	}
	
	@RequestMapping(value = "/pay", method = RequestMethod.POST)
	public ModelAndView payPersist(PurchaseVO vo, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		
		System.out.println(vo.getMember_id());
		System.out.println(vo.getProduct_name());
		System.out.println(vo.getProduct_price());
		
		vo.setMember_id(member_id);
		service.payPersist(vo);
		
		return new ModelAndView("redirect:/store");
	}
	
}