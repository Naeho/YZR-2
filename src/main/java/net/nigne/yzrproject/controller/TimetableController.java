package net.nigne.yzrproject.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import net.nigne.yzrproject.domain.GenreVO;
import net.nigne.yzrproject.domain.MovieVO;
import net.nigne.yzrproject.domain.PlexVO;
import net.nigne.yzrproject.domain.TheaterVO;
import net.nigne.yzrproject.service.TheaterService;
import net.nigne.yzrproject.service.TimetableService;

@Controller
public class TimetableController {
   @Autowired
   private TheaterService theater_service;
   @Autowired
   private TimetableService tt_service;
   
   @RequestMapping(value = "/timetable", method = RequestMethod.GET)
   public String timetable(Model model, HttpServletRequest request) throws Exception {
      HttpSession session = request.getSession();
      String member_id = (String)session.getAttribute("member_id");
      List<TheaterVO> like_th = tt_service.getLike_theater(member_id);
      model.addAttribute("like_th", like_th);
      session.setAttribute("menu", "RESERVATION");
      return "timetable";
   }
   
   @RequestMapping(value = "/timetable/theater", method = RequestMethod.GET)
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
   
   @RequestMapping(value = "/timetable/tt", method = RequestMethod.GET)
   public ResponseEntity<Map<String,Object>> timetable(@RequestParam("theater_id") String theater_id, @RequestParam("day") String day){
      ResponseEntity<Map<String,Object>> entity = null;
      Map<String,Object> tt = tt_service.getTimetable(theater_id, day);
      Map<String,Object> tt2 = new HashMap<>();
      tt2.put("tt", tt);
      tt2.put("total", tt.size());
      try{
         entity = new ResponseEntity<Map<String,Object>>(tt2, HttpStatus.OK);
      }catch(Exception e){
         entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
      }
      
      return entity;
   }
   
   @RequestMapping(value = "/timetable/tt/movieInfo", method = RequestMethod.GET)
   public ResponseEntity<List<MovieVO>> tt_movie(@RequestParam("theater_id") String theater_id, @RequestParam("day") String day){
      ResponseEntity<List<MovieVO>> entity = null;
      
      List<MovieVO> mlist = tt_service.getMovieInfo(theater_id, day);
      try{
         entity = new ResponseEntity<List<MovieVO>>(mlist, HttpStatus.OK);
      }catch(Exception e){
         entity = new ResponseEntity<List<MovieVO>>(HttpStatus.BAD_REQUEST);
      }
      
      return entity;
   }
   
   @RequestMapping(value = "/timetable/tt/movieGenre", method = RequestMethod.GET)
   public ResponseEntity<List<GenreVO>> tt_movie_genre(@RequestParam("theater_id") String theater_id, @RequestParam("day") String day){
      ResponseEntity<List<GenreVO>> entity = null;
      
      List<GenreVO> glist = tt_service.getMovieGenre(theater_id, day);
      try{
         entity = new ResponseEntity<List<GenreVO>>(glist, HttpStatus.OK);
      }catch(Exception e){
         entity = new ResponseEntity<List<GenreVO>>(HttpStatus.BAD_REQUEST);
      }
      
      return entity;
   }
   
   @RequestMapping(value = "/timetable/tt/plexInfo", method = RequestMethod.GET)
   public ResponseEntity<List<PlexVO>> tt_plex_info(@RequestParam("theater_id") String theater_id, @RequestParam("day") String day){
      ResponseEntity<List<PlexVO>> entity = null;
      
      List<PlexVO> plist = tt_service.getPlexInfo(theater_id, day);
      try{
         entity = new ResponseEntity<List<PlexVO>>(plist, HttpStatus.OK);
      }catch(Exception e){
         entity = new ResponseEntity<List<PlexVO>>(HttpStatus.BAD_REQUEST);
      }
      
      return entity;
   }
}