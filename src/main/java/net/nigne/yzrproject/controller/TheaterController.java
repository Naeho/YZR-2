package net.nigne.yzrproject.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import net.nigne.yzrproject.domain.TheaterVO;
import net.nigne.yzrproject.service.TheaterService;
import net.nigne.yzrproject.service.TimetableService;

@Controller
public class TheaterController {
	@Autowired
	private TheaterService theater_service;
	@Autowired
	private TimetableService tt_service;
	
	@RequestMapping(value = "/theater", method = RequestMethod.GET)
	public String timetable(Model model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("menu", "THEATER");
		String member_id = (String)session.getAttribute("member_id");
		List<TheaterVO> like_th = tt_service.getLike_theater(member_id);
		model.addAttribute("like_th", like_th);
		return "theater";
	}
	
	@RequestMapping(value = "/theater/lo", method = RequestMethod.GET)
	public ResponseEntity<List<TheaterVO>> theater(@RequestParam("location") String location){
		ResponseEntity<List<TheaterVO>> entity = null;
		List<TheaterVO> theater_list = null;
		
		try{
			theater_list = theater_service.getTheater(location);
			entity = new ResponseEntity<List<TheaterVO>>(theater_list, HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<List<TheaterVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}