package net.nigne.yzrproject.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.UsesSunHttpServer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.nigne.yzrproject.domain.ActorVO;
import net.nigne.yzrproject.domain.DirectorVO;
import net.nigne.yzrproject.domain.GenreVO;
import net.nigne.yzrproject.domain.GpaVO;
import net.nigne.yzrproject.domain.MovieVO;
import net.nigne.yzrproject.domain.ReservationVO;
import net.nigne.yzrproject.domain.ReviewVO;
import net.nigne.yzrproject.service.MovieService;
import net.nigne.yzrproject.service.ReviewService;

@Controller
public class MovieController {
   
   @Autowired
   private MovieService movie_service; 
   @Autowired
   private ReviewService Review_service;
   
   @RequestMapping(value = "/movie", method = RequestMethod.GET)
   public ModelAndView moviePage(HttpServletRequest request, Model model) throws Exception {
      HttpSession session=request.getSession();
      session.setAttribute("menu", "MOVIE");
      ModelAndView view=new ModelAndView();
      view.setViewName("movie");
      List<MovieVO> movie_chart = movie_service.getMovieChart("n", "평점순");
      model.addAttribute("movie_chart", movie_chart);
      
      return view;
   }
   
   @RequestMapping(value = "/movie/main", method = RequestMethod.GET)
   public ResponseEntity<List<MovieVO>> movie_chart(@RequestParam("category") String category, HttpServletRequest request){
      ResponseEntity<List<MovieVO>> entity = null;
      List<MovieVO> movie_chart = null;
      try{
         if("chart".equals(category)){
            movie_chart = movie_service.getMovieChart("off", "예매율순");
         }else if("schedule".equals(category)){
            movie_chart = movie_service.getMovieSchedule();
         }
         entity = new ResponseEntity<List<MovieVO>>(movie_chart, HttpStatus.OK);
      }catch(Exception e){
         entity = new ResponseEntity<List<MovieVO>>(HttpStatus.BAD_REQUEST);
      }
      
      return entity;
   }
   
   @RequestMapping(value = "/movie/main/select", method = RequestMethod.GET)
   public ResponseEntity<List<MovieVO>> play(@RequestParam("play") String play, @RequestParam("order") String order, HttpServletRequest request){
      ResponseEntity<List<MovieVO>> entity = null;
      List<MovieVO> movie_chart = null;
      
      try{
         movie_chart = movie_service.getMovieChart(play, order);
         entity = new ResponseEntity<List<MovieVO>>(movie_chart, HttpStatus.OK);
      }catch(Exception e){
         entity = new ResponseEntity<List<MovieVO>>(HttpStatus.BAD_REQUEST);
      }
      
      return entity;
   }

	@RequestMapping(value = "/movie/{movie_id}", method = RequestMethod.GET)
	public String home(Locale locale, Model model, @PathVariable("movie_id") String movie_id) throws Exception {
		
		MovieVO movievo = movie_service.getList(movie_id);
		model.addAttribute("movievo", movievo);
		List<ActorVO> actorlist = movie_service.getActor(movie_id);
		model.addAttribute("actorlist", actorlist);
		List<DirectorVO> directorlist = movie_service.getDirector(movie_id);
		model.addAttribute("directorlist", directorlist);
		List<GenreVO> genrelist = movie_service.getGenre(movie_id);
		model.addAttribute("genrelist", genrelist);
		GpaVO gpavo = movie_service.getGpa(movie_id);
		model.addAttribute("gpavo", gpavo);

		List<ReviewVO> reviewlist = Review_service.getReview(movie_id);
		model.addAttribute("reviewlist", reviewlist);
		return "movie_detail";
	}
	
	
	
	@RequestMapping(value = "/movie/gpachart/{movie_id}", method = RequestMethod.GET)
	public ResponseEntity<GpaVO> get(@PathVariable("movie_id") String movie_id) {
		ResponseEntity<GpaVO> entity = null;
		try {
			GpaVO vo = movie_service.getGpa(movie_id);
			entity = new ResponseEntity<>(vo, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/movie/gpachart/{movie_id}", method = RequestMethod.POST)
	public ResponseEntity<String> chart_update(@PathVariable("movie_id") String movie_id, @RequestBody GpaVO vo,HttpServletRequest request) {
		ResponseEntity<String> entity = null;
			try {
				movie_service.gpaUpdate(movie_id, vo.getActing(), vo.getDirection(), vo.getBeauty(), vo.getOst(), vo.getStory(),
						vo.getMale(), vo.getFemale(), vo.getTeenager(), vo.getTwenties(), vo.getThirties(),
						vo.getForties());
				entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/movie/viewAdder/{movieId}/{seatCnt}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> viewer(@PathVariable("movieId") String movieId,
													 @PathVariable("seatCnt") int seatCnt
			) {
		ResponseEntity<Map<String, Object>> entity = null;
		
		try{
			System.out.println("11111");
			int viewer = movie_service.getList(movieId).getReservation_cnt();
			int totalViewer = 0;
			float avrReservation = 0;
			System.out.println(viewer);
			System.out.println(seatCnt);
			viewer += seatCnt;
			System.out.println(viewer);
			//브라우저로 전송한다
			movie_service.addViewer(movieId, viewer);
			int movieCnt = (int)movie_service.getMovieCnt();
			
			for(int i = 0; i < movieCnt; i++) {
				totalViewer += movie_service.getPlayMovieList().get(i).getReservation_cnt();
			}
			
			System.out.println("총 관객수 = " + totalViewer);
			
			for(int i = 0; i < movieCnt; i++) {
				avrReservation = (float)(movie_service.getPlayMovieList().get(i).getReservation_cnt() / (float)totalViewer) * 100;
				movie_service.updateReservationRate(movie_service.getPlayMovieList().get(i), avrReservation);
			}
			
			entity = new ResponseEntity<>(HttpStatus.OK);
			
		} catch(Exception e){
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
}