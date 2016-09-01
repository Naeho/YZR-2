package net.nigne.yzrproject.persistence;

import java.sql.Array;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.AbstractQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Order;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.Subquery;

import org.hibernate.jpa.criteria.expression.function.AggregationFunction.COUNT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.nigne.yzrproject.domain.ActorVO;
import net.nigne.yzrproject.domain.DirectorVO;
import net.nigne.yzrproject.domain.GenreVO;
import net.nigne.yzrproject.domain.GpaVO;
import net.nigne.yzrproject.domain.MovieVO;
import net.nigne.yzrproject.domain.ReservationVO;
import net.nigne.yzrproject.domain.SeatVO;

@Repository
public class MovieDAOImpl implements MovieDAO {
			
	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public MovieVO getMovie(String movie_id) {
		MovieVO vo = new MovieVO();
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<MovieVO> cq = cb.createQuery(MovieVO.class);
		Root<MovieVO> root = cq.from(MovieVO.class);
		Predicate p = cb.equal(root.get("movie_id"), movie_id);
		cq.where(p);
		
		TypedQuery<MovieVO> tq = entityManager.createQuery(cq);
		vo = tq.getSingleResult();
		
		return vo;
	}

	@Override
	public List<MovieVO> genreMovie(String member_id) {
		
		// 회원 아이디로 예매내역에 있는 영화들의 장르중 가장 많이 본 장르 가져오기
		
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<String> genreQuery = cb.createQuery(String.class);
		Root<GenreVO> genreRoot = genreQuery.from(GenreVO.class);
		
		Subquery<ReservationVO> subQuery = genreQuery.subquery(ReservationVO.class);
		Root<ReservationVO> subQueryRoot = subQuery.from(ReservationVO.class);
		subQuery.select(subQueryRoot.get("movie_id"));
		subQuery.where(cb.equal(subQueryRoot.get("member_id"), member_id));
		
		// 예외처리구간
		
		CriteriaQuery<String> resQuery = cb.createQuery(String.class);
		Root<ReservationVO> resRootQuery = resQuery.from(ReservationVO.class);
		resQuery.select(resRootQuery.get("movie_id"));
		resQuery.where(cb.equal(resRootQuery.get("member_id"), member_id));
		
		TypedQuery<String> restq = entityManager.createQuery(resQuery);
		List<String> res_movie_id = restq.getResultList();
		
		List<MovieVO> genre_movie = null;
		if(res_movie_id.isEmpty()){
			CriteriaQuery<MovieVO> Query = cb.createQuery(MovieVO.class);
			Root<MovieVO> Root = Query.from(MovieVO.class);
			
			Query.where(cb.equal(Root.get("status"), "play"));
			Query.orderBy(cb.desc(Root.get("open_date")), cb.desc(Root.get("movie_id")));
			
			TypedQuery<MovieVO> movie_tq = entityManager.createQuery(Query).setFirstResult(0).setMaxResults(1);
			genre_movie = movie_tq.getResultList();
		// 예외처리 끝
		}else{
		
			genreQuery.select(genreRoot.get("movie_genre"));
			genreQuery.where(genreRoot.get("movie_id").in(subQuery));
			genreQuery.groupBy(genreRoot.get("movie_genre"));
			genreQuery.orderBy(cb.desc(cb.count(genreRoot.get("movie_genre"))));
			
			TypedQuery<String> tq = entityManager.createQuery(genreQuery);
			
			List<String> genre_list = tq.getResultList();
			// 가장 많이본 장르에 해당하는 영화들의 개봉날짜를 기준으로 최신 영화를 뽑아낸다
			
			CriteriaQuery<MovieVO> movieQuery = cb.createQuery(MovieVO.class);
			Root<MovieVO> movieRoot = movieQuery.from(MovieVO.class);
			
			Subquery<GenreVO> genreSubQuery = movieQuery.subquery(GenreVO.class);
			Root<GenreVO> genreSubQueryRoot = genreSubQuery.from(GenreVO.class);
			
			genreSubQuery.select(genreSubQueryRoot.get("movie_id"));
			genreSubQuery.where(cb.equal(genreSubQueryRoot.get("movie_genre"), genre_list.get(0)));
			
			movieQuery.where(cb.and(movieRoot.get("movie_id").in(genreSubQuery), cb.equal(movieRoot.get("status"), "play")));
			movieQuery.orderBy(cb.desc(movieRoot.get("open_date")));
			
			TypedQuery<MovieVO> mtq = entityManager.createQuery(movieQuery);
			genre_movie = mtq.getResultList();
		
			if(genre_movie.isEmpty() || res_movie_id.contains(genre_movie.get(0).getMovie_id())){
				Loop0: for(int g=0; g<genre_list.size(); g++){
					genreSubQuery.select(genreSubQueryRoot.get("movie_id"));
					genreSubQuery.where(cb.equal(genreSubQueryRoot.get("movie_genre"), genre_list.get(g)));
					
					movieQuery.where(cb.and(movieRoot.get("movie_id").in(genreSubQuery), cb.equal(movieRoot.get("status"), "play")));
					movieQuery.orderBy(cb.desc(movieRoot.get("open_date")));
					
					mtq = entityManager.createQuery(movieQuery);
					genre_movie = mtq.getResultList();
					for(int g2=0; g2<genre_movie.size(); g2++){
						if(!genre_movie.isEmpty() && !res_movie_id.contains(genre_movie.get(g2).getMovie_id())){
							break Loop0;
						}
					}
				}
			}
		}
		return genre_movie;
	}

	@Override
	public List<MovieVO> actorMovie(String member_id) {
		
		// 회원 아이디로 예매내역에 있는 영화중 가장 많이 본 배우 가져오기
		
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<String> actorQuery = cb.createQuery(String.class);
		Root<ActorVO> actorRoot = actorQuery.from(ActorVO.class);
		
		Subquery<ReservationVO> subQuery = actorQuery.subquery(ReservationVO.class);
		Root<ReservationVO> subQueryRoot = subQuery.from(ReservationVO.class);
		subQuery.select(subQueryRoot.get("movie_id"));
		subQuery.where(cb.equal(subQueryRoot.get("member_id"), member_id));
		
		// 예외처리 구간
		
		CriteriaQuery<String> resQuery = cb.createQuery(String.class);
		Root<ReservationVO> resRootQuery = resQuery.from(ReservationVO.class);
		resQuery.select(resRootQuery.get("movie_id"));
		resQuery.where(cb.equal(resRootQuery.get("member_id"), member_id));
		
		TypedQuery<String> restq = entityManager.createQuery(resQuery);
		List<String> res_movie_id = restq.getResultList();
		
		List<MovieVO> actor_movie = null;
		
		if(res_movie_id.isEmpty()){
			CriteriaQuery<MovieVO> Query = cb.createQuery(MovieVO.class);
			Root<MovieVO> Root = Query.from(MovieVO.class);
			
			Query.where(cb.equal(Root.get("status"), "play"));
			Query.orderBy(cb.desc(Root.get("open_date")), cb.desc(Root.get("movie_id")));
			
			TypedQuery<MovieVO> movie_tq = entityManager.createQuery(Query).setFirstResult(1).setMaxResults(1);
			actor_movie = movie_tq.getResultList();
		
			// 예외처리 끝
			
		}else{
			actorQuery.select(actorRoot.get("actor_name"));
			actorQuery.where(actorRoot.get("movie_id").in(subQuery));
			actorQuery.groupBy(actorRoot.get("actor_name"));
			actorQuery.orderBy(cb.desc(cb.count(actorRoot.get("actor_name"))));
			
			TypedQuery<String> tq = entityManager.createQuery(actorQuery);
			
			List<String> actor_list = tq.getResultList();
			
			// 가장 많이본 배우에 해당하는 영화들의 개봉날짜를 기준으로 최신 영화를 뽑아낸다
			
			CriteriaQuery<MovieVO> movieQuery = cb.createQuery(MovieVO.class);
			Root<MovieVO> movieRoot = movieQuery.from(MovieVO.class);
			
			Subquery<ActorVO> actorSubQuery = movieQuery.subquery(ActorVO.class);
			Root<ActorVO> actorSubQueryRoot = actorSubQuery.from(ActorVO.class);
			
			actorSubQuery.select(actorSubQueryRoot.get("movie_id"));
			actorSubQuery.where(cb.equal(actorSubQueryRoot.get("actor_name"), actor_list.get(0)));
			
			movieQuery.where(cb.and(movieRoot.get("movie_id").in(actorSubQuery), cb.equal(movieRoot.get("status"), "play")));
			movieQuery.orderBy(cb.desc(movieRoot.get("open_date")));
			
			TypedQuery<MovieVO> mtq = entityManager.createQuery(movieQuery);
			actor_movie = mtq.getResultList();
			
			if(actor_movie.isEmpty() || res_movie_id.contains(actor_movie.get(0).getMovie_id())){
				Loop1:  for(int a=0; a<actor_list.size(); a++){
						actorSubQuery.select(actorSubQueryRoot.get("movie_id"));
						actorSubQuery.where(cb.equal(actorSubQueryRoot.get("actor_name"), actor_list.get(a)));
						
						movieQuery.where(cb.and(movieRoot.get("movie_id").in(actorSubQuery), cb.equal(movieRoot.get("status"), "play")));
						movieQuery.orderBy(cb.desc(movieRoot.get("open_date")));
						mtq = entityManager.createQuery(movieQuery);
						actor_movie = mtq.getResultList();
						for(int a2=0; a2<actor_movie.size(); a2++){
							if(!actor_movie.isEmpty() && !res_movie_id.contains(actor_movie.get(a2).getMovie_id())){
								break Loop1;
							}
						}
				}
			}
		}
		return actor_movie;
	}

	@Override
	public List<MovieVO> directorMovie(String member_id) {
		
		// 회원 아이디로 예매내역에 있는 영화들의 감독중 가장 많이 본 장르 가져오기
		
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<String> directorQuery = cb.createQuery(String.class);
		Root<DirectorVO> directorRoot = directorQuery.from(DirectorVO.class);
		
		Subquery<ReservationVO> subQuery = directorQuery.subquery(ReservationVO.class);
		Root<ReservationVO> subQueryRoot = subQuery.from(ReservationVO.class);
		subQuery.select(subQueryRoot.get("movie_id"));
		subQuery.where(cb.equal(subQueryRoot.get("member_id"), member_id));
		
		CriteriaQuery<String> resQuery = cb.createQuery(String.class);
		Root<ReservationVO> resRootQuery = resQuery.from(ReservationVO.class);
		resQuery.select(resRootQuery.get("movie_id"));
		resQuery.where(cb.equal(resRootQuery.get("member_id"), member_id));
		
		TypedQuery<String> restq = entityManager.createQuery(resQuery);
		List<String> res_movie_id = restq.getResultList();
		
		// 예외처리 구간
		
		List<MovieVO> director_movie = null;
		if(res_movie_id.isEmpty()){
			CriteriaQuery<MovieVO> Query = cb.createQuery(MovieVO.class);
			Root<MovieVO> Root = Query.from(MovieVO.class);
			
			Query.where(cb.equal(Root.get("status"), "play"));
			Query.orderBy(cb.desc(Root.get("open_date")), cb.desc(Root.get("movie_id")));
			
			TypedQuery<MovieVO> movie_tq = entityManager.createQuery(Query).setFirstResult(2).setMaxResults(1);
			director_movie = movie_tq.getResultList();
		
			// 예외처리 끝
			
		}else{
			
			directorQuery.select(directorRoot.get("director_name"));
			directorQuery.where(directorRoot.get("movie_id").in(subQuery));
			directorQuery.groupBy(directorRoot.get("director_name"));
			directorQuery.orderBy(cb.desc(cb.count(directorRoot.get("director_name"))));
			
			TypedQuery<String> tq = entityManager.createQuery(directorQuery);
			
			List<String> director_list = tq.getResultList();
			
			// 가장 많이본 감독에 해당하는 영화들의 개봉날짜를 기준으로 최신 영화를 뽑아낸다
			
			CriteriaQuery<MovieVO> movieQuery = cb.createQuery(MovieVO.class);
			Root<MovieVO> movieRoot = movieQuery.from(MovieVO.class);
			
			Subquery<DirectorVO> directorSubQuery = movieQuery.subquery(DirectorVO.class);
			Root<DirectorVO> directorSubQueryRoot = directorSubQuery.from(DirectorVO.class);
			
			directorSubQuery.select(directorSubQueryRoot.get("movie_id"));
			directorSubQuery.where(cb.equal(directorSubQueryRoot.get("director_name"), director_list.get(0)));
			
			movieQuery.where(cb.and(movieRoot.get("movie_id").in(directorSubQuery), cb.equal(movieRoot.get("status"), "play")));
			movieQuery.orderBy(cb.desc(movieRoot.get("open_date")));
			
			TypedQuery<MovieVO> mtq = entityManager.createQuery(movieQuery);
			director_movie = mtq.getResultList();
			
			if(director_movie.isEmpty() || res_movie_id.contains(director_movie.get(0).getMovie_id())){
				Loop2 : for(int d=0; d<director_list.size(); d++){
					directorSubQuery.select(directorSubQueryRoot.get("movie_id"));
					directorSubQuery.where(cb.equal(directorSubQueryRoot.get("director_name"), director_list.get(d)));
					movieQuery.where(cb.and(movieRoot.get("movie_id").in(directorSubQuery), cb.equal(movieRoot.get("status"), "play")));
					movieQuery.orderBy(cb.desc(movieRoot.get("open_date")));
					
					mtq = entityManager.createQuery(movieQuery);
					director_movie = mtq.getResultList();
					for(int d2=0; d2<director_movie.size(); d2++){
						if(!director_movie.isEmpty() && !res_movie_id.contains(director_movie.get(d2).getMovie_id())){
							break Loop2;
						}
					}
				}
			}
		}
		return director_movie;
	}

	@Override
	public List<MovieVO> basicMovie() {
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<MovieVO> cq = cb.createQuery(MovieVO.class);
		Root<MovieVO> root = cq.from(MovieVO.class);
		cq.where(cb.equal(root.get("status"), "play"));
		cq.orderBy(cb.desc(root.get("open_date")));
		
		TypedQuery<MovieVO> tq = entityManager.createQuery(cq).setFirstResult(0).setMaxResults(3);
		List<MovieVO> basic_movie = tq.getResultList();
		return basic_movie;
	}

	@Override
	   public List<MovieVO> getMovieChart(String play, String order) {
	      CriteriaBuilder cb = entityManager.getCriteriaBuilder();
	      CriteriaQuery<MovieVO> cq = cb.createQuery(MovieVO.class);
	      Root<MovieVO> root = cq.from(MovieVO.class);
	      
	      CriteriaQuery<String> gpaQuery = cb.createQuery(String.class);
	      Root<GpaVO> gpaRoot = gpaQuery.from(GpaVO.class);

	      gpaQuery.select(gpaRoot.get("movie_id"));
	      gpaQuery.orderBy(cb.desc(gpaRoot.get("avg")));
	      
	      TypedQuery<String> gpatq = entityManager.createQuery(gpaQuery);
	      List<String> gpa_list = gpatq.getResultList();
	      
	      Predicate p = cb.equal(root.get("status"), "play");
	      Predicate p2 = cb.notEqual(root.get("status"), "end");
	      List<Predicate> pl = new ArrayList<Predicate>();
	      
	      if("on".equals(play)){
	         cq.where(p);
	         if("예매율순".equals(order)){
	            cq.orderBy(cb.desc(root.get("reservation_rate")));
	         }else if("평점순".equals(order)){
	            for(int a=0; a<gpa_list.size(); a++){
	               pl.add(cb.or(cb.equal(root.get("movie_id"), gpa_list.get(a))));
	            }
	            cq.where(cb.and(p, cb.or(pl.toArray(new Predicate[pl.size()]))));
	         }else if("관람객순".equals(order)){
	            cq.orderBy(cb.desc(root.get("moviegoers_cnt")));
	         }
	         
	      }else if("off".equals(play)){
	         cq.where(p2);
	         if("예매율순".equals(order)){
	            cq.orderBy(cb.desc(root.get("reservation_rate")));
	         }else if("평점순".equals(order)){
	            for(int b=0; b<gpa_list.size(); b++){
	               pl.add(cb.or(cb.equal(root.get("movie_id"), gpa_list.get(b))));
	            }
	            cq.where(cb.and(p2, cb.or(pl.toArray(new Predicate[pl.size()]))));
	         }else if("관람객순".equals(order)){
	            cq.orderBy(cb.desc(root.get("moviegoers_cnt")));
	         }
	      }
	      
	      TypedQuery<MovieVO> tq = entityManager.createQuery(cq);
	      List<MovieVO> movie_chart = tq.getResultList();
	      
	      return movie_chart;
	   }

	@Override
	public List<MovieVO> getMovieSchedule() {
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<MovieVO> cq = cb.createQuery(MovieVO.class);
		Root<MovieVO> root = cq.from(MovieVO.class);
		
		cq.where(cb.equal(root.get("status"), "schedule"));
		cq.orderBy(cb.asc(root.get("open_date")));
		
		TypedQuery<MovieVO> tq = entityManager.createQuery(cq);
		List<MovieVO> movie_schedule = tq.getResultList();
	
		return movie_schedule;
	}
	@Override
	public MovieVO getList(String movie_id) {
		// TODO Auto-generated method stub
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<MovieVO> cq = cb.createQuery(MovieVO.class);
		Root<MovieVO> root = cq.from(MovieVO.class);
		Predicate p = cb.equal(root.get("movie_id"), movie_id);
		cq.select(root).where(p);
		TypedQuery<MovieVO> tq = entityManager.createQuery(cq);
		MovieVO vo = tq.getSingleResult();
		return vo;
	}

	@Override
	public List<ActorVO> getActor(String movie_id) {
		// TODO Auto-generated method stub
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<ActorVO> cq = cb.createQuery(ActorVO.class);
		Root<ActorVO> root = cq.from(ActorVO.class);
		Predicate p = cb.equal(root.get("movie_id"), movie_id);
		cq.select(root).where(p);
		TypedQuery<ActorVO> tq = entityManager.createQuery(cq);
		List<ActorVO> actorlist = tq.getResultList();
		return actorlist;
	}

	@Override
	public List<DirectorVO> getDirector(String movie_id) {
		// TODO Auto-generated method stub
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<DirectorVO> cq = cb.createQuery(DirectorVO.class);
		Root<DirectorVO> root = cq.from(DirectorVO.class);
		Predicate p = cb.equal(root.get("movie_id"), movie_id);
		cq.select(root).where(p);
		TypedQuery<DirectorVO> tq = entityManager.createQuery(cq);
		List<DirectorVO> directorlist = tq.getResultList();
		return directorlist;
	}

	@Override
	public GpaVO getGpa(String movie_id) {
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<GpaVO> cq = cb.createQuery(GpaVO.class);
		Root<GpaVO> root = cq.from(GpaVO.class);
		Predicate p = cb.equal(root.get("movie_id"), movie_id);
		cq.select(root);
		cq.where(p);
		TypedQuery<GpaVO> tq = entityManager.createQuery(cq);
		GpaVO vo = tq.getSingleResult();
		return vo;
	}

	@Override
	public void gpaUpdate(String movie_id, int acting, int direction, int beauty, int ost, int story, int male,
			int female, int teenager, int twenties, int thirties, int forties) throws Exception {
		// TODO Auto-generated method stub
		GpaVO vo = entityManager.find(GpaVO.class, getGpa(movie_id).getMovie_id());
		GpaVO mergevo = entityManager.merge(vo);
		mergevo.setActing(
				(vo.getActing() * (vo.getFemale() + vo.getMale()) + acting) / (vo.getFemale() + vo.getMale() + 1));
		mergevo.setDirection((vo.getDirection() * (vo.getFemale() + vo.getMale()) + direction)
				/ (vo.getFemale() + vo.getMale() + 1));
		mergevo.setBeauty(
				(vo.getBeauty() * (vo.getFemale() + vo.getMale()) + beauty) / (vo.getFemale() + vo.getMale() + 1));
		mergevo.setOst((vo.getOst() * (vo.getFemale() + vo.getMale()) + ost) / (vo.getFemale() + vo.getMale() + 1));
		mergevo.setStory(
				(vo.getStory() * (vo.getFemale() + vo.getMale()) + story) / (vo.getFemale() + vo.getMale() + 1));
		mergevo.setMale(vo.getMale() + male);
		mergevo.setFemale(vo.getFemale() + female);
		mergevo.setTeenager(vo.getTeenager() + teenager);
		mergevo.setTwenties(vo.getTwenties() + twenties);
		mergevo.setThirties(vo.getThirties() + thirties);
		mergevo.setForties(vo.getForties() + forties);
	}

	public List<GenreVO> getGenre(String movie_id) {
		// TODO Auto-generated method stub
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<GenreVO> cq = cb.createQuery(GenreVO.class);
		Root<GenreVO> root = cq.from(GenreVO.class);
		Predicate p = cb.equal(root.get("movie_id"), movie_id);
		cq.select(root).where(p);
		TypedQuery<GenreVO> tq = entityManager.createQuery(cq);
		List<GenreVO> genrelist = tq.getResultList();
		return genrelist;
	}
	
	
	@Override
	public List<MovieVO> getMovieList(String order) {
		// TODO Auto-generated method stub
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<MovieVO> mainQuery = cb.createQuery(MovieVO.class);
		Root<MovieVO> mainQueryroot = mainQuery.from(MovieVO.class);
		
		if("reservation_rate".equals(order)) {
			mainQuery.select(mainQueryroot).orderBy(cb.desc(mainQueryroot.get("reservation_rate")));
			mainQuery.where(cb.equal(mainQueryroot.get("status"), "play"));
		} else {
			mainQuery.select(mainQueryroot).orderBy(cb.asc(mainQueryroot.get("title")));
			mainQuery.where(cb.equal(mainQueryroot.get("status"), "play"));
		}
		
		TypedQuery<MovieVO> tq = entityManager.createQuery(mainQuery);
		List<MovieVO> list = tq.getResultList();
		
		return list;
	}

	@Override
	public List<MovieVO> getMovieId(String movieName) {
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<MovieVO> mainQuery = cb.createQuery(MovieVO.class);
		Root<MovieVO> mainQueryroot = mainQuery.from(MovieVO.class);
		
		// select * from theater where theater_area = '지역이름'
		mainQuery.select(mainQueryroot);
		mainQuery.where(cb.equal(mainQueryroot.get("title"), movieName));
		
		TypedQuery<MovieVO> tq = entityManager.createQuery(mainQuery);
		List<MovieVO> list = tq.getResultList();
		
		return list;
	}


	@Override
	public void addViewer(String movieId, int viewer) {
		// TODO Auto-generated method stub
		MovieVO movieVO = entityManager.find(MovieVO.class, movieId);
		
		MovieVO mergeVO = entityManager.merge(movieVO);
		mergeVO.setReservation_cnt(viewer);
	}

	@Override
	public long getMovieCnt() {
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<Long> mainQuery = cb.createQuery(Long.class);
		Root<MovieVO> mainQueryroot = mainQuery.from(MovieVO.class);
		
		
		mainQuery.select(cb.count(mainQueryroot));
		mainQuery.where(cb.equal(mainQueryroot.get("status"), "play"));
		
		
		TypedQuery<Long> tq = entityManager.createQuery(mainQuery);

		return tq.getSingleResult();
	}

	@Override
	public List<MovieVO> getPlayMovieList() {
		// TODO Auto-generated method stub
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<MovieVO> mainQuery = cb.createQuery(MovieVO.class);
		Root<MovieVO> mainQueryroot = mainQuery.from(MovieVO.class);
		
		
		mainQuery.select(mainQueryroot).orderBy(cb.desc(mainQueryroot.get("movie_id")));
		mainQuery.where(cb.equal(mainQueryroot.get("status"), "play"));
		
		
		TypedQuery<MovieVO> tq = entityManager.createQuery(mainQuery);
		List<MovieVO> list = tq.getResultList();
		
		return list;
	}

	@Override
	public void updateReservationRate(MovieVO vo, float reservationRate) {
		// TODO Auto-generated method stub
		MovieVO mergeVO = entityManager.merge(vo);
		mergeVO.setReservation_rate(reservationRate);
	}

	

}
