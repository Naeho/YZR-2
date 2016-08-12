package net.nigne.yzrproject.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.Subquery;

import org.springframework.stereotype.Repository;

import net.nigne.yzrproject.domain.CouponVO;
import net.nigne.yzrproject.domain.Criteria;
import net.nigne.yzrproject.domain.MovieVO;
import net.nigne.yzrproject.domain.ReservationVO;
import net.nigne.yzrproject.domain.SeatVO;
import net.nigne.yzrproject.domain.TheaterVO;

@Repository
public class ReservationDAOImpl implements ReservationDAO {
	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public List<ReservationVO> getReservation_list(String member_id) {
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<ReservationVO> cq = cb.createQuery(ReservationVO.class);
		Root<ReservationVO> root = cq.from(ReservationVO.class);
		Predicate p = cb.equal(root.get("member_id"), member_id);
		cq.where(p);
		
		TypedQuery<ReservationVO> tq = entityManager.createQuery(cq);
		List<ReservationVO> list = tq.getResultList();
		return list;
	}

	/** 
	* @Method Name	: getReservation 
	* @Method ����	: member_id�� reservation_list ���̺� �ִ� ���ų���, reservation_list ���̺� �ִ� movie_id�� movie���̺��� �����ߴ� ��ȭ���� ������ 
	* @param member_id
	* @return 
	*/
	@Override
	public Map<String,Object> getReservation(String member_id) {
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<ReservationVO> cq = cb.createQuery(ReservationVO.class);
		Root<ReservationVO> root = cq.from(ReservationVO.class);
		Predicate p = cb.equal(root.get("member_id"), member_id);
		cq.where(p).orderBy(cb.desc(root.get("reservation_date")));
		
		TypedQuery<ReservationVO> tq = entityManager.createQuery(cq);
		List<ReservationVO> list = tq.getResultList();
	
		//������ ��ȭ ���� Query
		CriteriaQuery<MovieVO> movieQuery = cb.createQuery(MovieVO.class);
        Root<MovieVO> movieRoot = movieQuery.from(MovieVO.class);
        movieQuery.select(movieRoot);
       
        //������ ���� ���� Query
  		CriteriaQuery<TheaterVO> theaterQuery = cb.createQuery(TheaterVO.class);
        Root<TheaterVO> theaterRoot = theaterQuery.from(TheaterVO.class);
        theaterQuery.select(theaterRoot);
              
        //����
        List<Predicate> movie = new ArrayList<Predicate>();
		List<Predicate> theater = new ArrayList<Predicate>();
		
        for(int a=0; a<list.size(); a++){
        	movie.add(cb.or(cb.equal(movieRoot.get("movie_id"), list.get(a).getMovie_id())));
        	theater.add(cb.or(cb.equal(theaterRoot.get("theater_id"), list.get(a).getTheater_id())));
        }
        
        //���� ���� ��ȭ ���
        movieQuery.where(cb.or(movie.toArray(new Predicate[movie.size()])));
		
        TypedQuery<MovieVO> movieTq = entityManager.createQuery(movieQuery);
		List<MovieVO> movieList = movieTq.getResultList();
		//select * from movie where movie_id = (select movie_id from reservation_list where member_id = member_id)
		
		//���� ���� ���� ���
		theaterQuery.where(cb.or(theater.toArray(new Predicate[theater.size()])));
		
        TypedQuery<TheaterVO> theaterTq = entityManager.createQuery(theaterQuery);
		List<TheaterVO> theaterList = theaterTq.getResultList();
		
		
		Map<String,Object> map = new HashMap<>();
		map.put("reservationList", list);
		map.put("reservationMovie", movieList);
		map.put("reservationTheater", theaterList);
		
		return map;
	}

	/** 
	* @Method Name	: getReservationTotal 
	* @Method ����	: 
	* @param member_id
	* @return 
	*/
	@Override
	public long getReservationTotal(String member_id) {
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<Long> cq = cb.createQuery(Long.class);
		Root<ReservationVO> root = cq.from(ReservationVO.class);
		//����ڿ� ��ġ�ϴ� ���ų���
		Predicate p = cb.equal(root.get("member_id"), member_id);
		
		cq.select(cb.count(root)).where(p);
		
		TypedQuery<Long> tq = entityManager.createQuery(cq);
		long reservationTotal = tq.getSingleResult();
		
		return reservationTotal;
	}

	/** 
	* @Method Name	: getReservationPage 
	* @Method ����	: 
	* @param member_id
	* @return 
	*/
	@Override
	public Map<String, Object> getReservationPage(String member_id, Criteria criteria) {
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<ReservationVO> cq = cb.createQuery(ReservationVO.class);
		Root<ReservationVO> root = cq.from(ReservationVO.class);
		Predicate p = cb.equal(root.get("member_id"), member_id);
		cq.where(p).orderBy(cb.desc(root.get("reservation_date")));
		
		TypedQuery<ReservationVO> tq = entityManager.createQuery(cq).setFirstResult(criteria.getStartPage()).setMaxResults(criteria.getArticlePerPage());
		List<ReservationVO> list = tq.getResultList();
	
		//������ ��ȭ ���� Query
		CriteriaQuery<MovieVO> movieQuery = cb.createQuery(MovieVO.class);
        Root<MovieVO> movieRoot = movieQuery.from(MovieVO.class);
        movieQuery.select(movieRoot);
       
        //������ ���� ���� Query
  		CriteriaQuery<TheaterVO> theaterQuery = cb.createQuery(TheaterVO.class);
        Root<TheaterVO> theaterRoot = theaterQuery.from(TheaterVO.class);
        theaterQuery.select(theaterRoot);
              
        //����
        List<Predicate> movie = new ArrayList<Predicate>();
		List<Predicate> theater = new ArrayList<Predicate>();
		
        for(int a=0; a<list.size(); a++){
        	movie.add(cb.or(cb.equal(movieRoot.get("movie_id"), list.get(a).getMovie_id())));
        	theater.add(cb.or(cb.equal(theaterRoot.get("theater_id"), list.get(a).getTheater_id())));
        }
        
        //���� ���� ��ȭ ���
        movieQuery.where(cb.or(movie.toArray(new Predicate[movie.size()])));
		
        TypedQuery<MovieVO> movieTq = entityManager.createQuery(movieQuery);
		List<MovieVO> movieList = movieTq.getResultList();
		//select * from movie where movie_id = (select movie_id from reservation_list where member_id = member_id)
		
		//���� ���� ���� ���
		theaterQuery.where(cb.or(theater.toArray(new Predicate[theater.size()])));
		
        TypedQuery<TheaterVO> theaterTq = entityManager.createQuery(theaterQuery);
		List<TheaterVO> theaterList = theaterTq.getResultList();
		
		
		Map<String,Object> map = new HashMap<>();
		map.put("reservationList", list);
		map.put("reservationMovie", movieList);
		map.put("reservationTheater", theaterList);
		
		return map;
	}

	/** 
	* @Method Name	: reservationCancel 
	* @Method ����	: 
	* @param reservation_code 
	*/
	@Override
	public void reservationCancel(String reservation_code) {
		//���ų����� ������
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<ReservationVO> cq = cb.createQuery(ReservationVO.class);
		Root<ReservationVO> root = cq.from(ReservationVO.class);
		Predicate p = cb.equal(root.get("reservation_code"), reservation_code);
		cq.where(p);
		
		TypedQuery<ReservationVO> tq = entityManager.createQuery(cq);
		ReservationVO vo = tq.getSingleResult();
		
		//���ų������� ������ view_seat�� seat���̺��� �¼� ���� ���¸� �ٲ� 
		CriteriaQuery<SeatVO> seatQuery = cb.createQuery(SeatVO.class);
		Root<SeatVO> seatRoot = seatQuery.from(SeatVO.class);
		seatQuery.select(seatRoot);
		
		//reservation_list���� ������ view_seat�� ,�� ����
		String[] view_seat = vo.getView_seat().split(",");
		
		//����
        List<Predicate> seatWhere = new ArrayList<Predicate>();
		
		Predicate tempSeatIndex = null;
		Predicate tempSeatNumber = null;
		
		//���� view_seat���� seat_index�� seat_number�� ������ ���ǿ� ���� 
		//view_seat�� ���̸�ŭ 
		//(seat_index = seat_index and seat_number = seat_number) or (seat_index = seat_index and seat_number = seat_number)
		//or �ݺ�
		for(int i = 0; i < view_seat.length; i++){
			//seat_index�� ���� seat_number�� ����
			tempSeatIndex = cb.equal(seatRoot.get("seat_index"), view_seat[i].substring(0, 1));
			tempSeatNumber = cb.equal(seatRoot.get("seat_number"), view_seat[i].substring(1, view_seat[i].length()));
			
			seatWhere.add(cb.or(cb.and(tempSeatIndex,tempSeatNumber)));
		}
		
		seatQuery.where(cb.or(seatWhere.toArray(new Predicate[seatWhere.size()])));

		TypedQuery<SeatVO> seatTq = entityManager.createQuery(seatQuery);
		List<SeatVO> seatList = seatTq.getResultList();
		//select * from seat where (seat_index = seat_index and seat_number = seat_number) or (seat_index = seat_index and seat_number = seat_number)
		
		
		for(SeatVO seat : seatList){
			seat = entityManager.find(SeatVO.class, seat.getNo());
			SeatVO mergevo = entityManager.merge(seat);
			mergevo.setReservation_exist("0");
			System.out.println("Reservation_exist : "+seat.getReservation_exist());
		}
		
		entityManager.remove(vo);
	}

	@Override
	public void reservationPersist(ReservationVO vo) {
		// TODO Auto-generated method stub
		System.out.println("12131312413123124122414");
		try{
			entityManager.persist(vo);
		} catch(Exception e){
			e.printStackTrace();
		}
		
		
		
	}

}
