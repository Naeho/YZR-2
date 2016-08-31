package net.nigne.yzrproject.persistence;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import net.nigne.yzrproject.domain.SeatVO;

@Repository
public class SeatDAOImpl implements SeatDAO {
	
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<SeatVO> getList(String theaterId, String plexNum, String startTime) {
		// TODO Auto-generated method stub
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<SeatVO> mainQuery = cb.createQuery(SeatVO.class);
		Root<SeatVO> mainQueryroot = mainQuery.from(SeatVO.class);
		
		// select * from theater where theater_area = '지역이름'
		mainQuery.select(mainQueryroot).orderBy(cb.asc(mainQueryroot.get("seat_number")));
		mainQuery.where(cb.equal(mainQueryroot.get("theater_id"), theaterId),cb.equal(mainQueryroot.get("plex_number"), plexNum), cb.equal(mainQueryroot.get("start_time"), startTime));
		
		TypedQuery<SeatVO> tq = entityManager.createQuery(mainQuery);
		List<SeatVO> list = tq.getResultList();
		
		return list;
	}
	
	@Override
	public List<SeatVO> getIndex(String theaterId, String plexNum, String startTime) {
		// TODO Auto-generated method stub
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<SeatVO> mainQuery = cb.createQuery(SeatVO.class);
		Root<SeatVO> mainQueryroot = mainQuery.from(SeatVO.class);
		
		// select * from theater where theater_area = '지역이름'
		mainQuery.select(mainQueryroot.get("seat_index")).distinct(true).orderBy(cb.asc(mainQueryroot.get("seat_index")));
		mainQuery.where(cb.equal(mainQueryroot.get("theater_id"), theaterId),cb.equal(mainQueryroot.get("plex_number"), plexNum), cb.equal(mainQueryroot.get("start_time"), startTime));
		
		TypedQuery<SeatVO> tq = entityManager.createQuery(mainQuery);
		List<SeatVO> list = tq.getResultList();
		
		return list;
	}

	@Override
	public void updateReservation(int SeatNo) {
		// TODO Auto-generated method stub		
		
														//primarykey
		SeatVO seatVO = entityManager.find(SeatVO.class, SeatNo);
	
		SeatVO mergeVO = entityManager.merge(seatVO);
		mergeVO.setReservation_exist("1");

	}

	@Override
	public List<Integer> getPrimary(String theaterId, String plexNum, String seat1, String seat2, String seat3, 
								   String seat4, String seat5, String seat6, String seat7, String seat8, String startTime) {
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<Integer> mainQuery = cb.createQuery(Integer.class);
		Root<SeatVO> mainQueryroot = mainQuery.from(SeatVO.class);
		
		List<Integer> list = new ArrayList<Integer>();
		String seat[] = new String[8];
		seat[0] = seat1;
		seat[1] = seat2;
		seat[2] = seat3;
		seat[3] = seat4;
		seat[4] = seat5;
		seat[5] = seat6;
		seat[6] = seat7;
		seat[7] = seat8;

		String SeatIndex = "";
		int SeatNumber = 0;
		
		try{
			for(int i = 0; i < 8; i++) {
				if(seat[i] != ""){
					System.out.println("번째 = " + i);
					SeatIndex = seat[i].substring(0,1);
					SeatNumber = Integer.parseInt(seat[i].substring(1));
					System.out.println("Index = " + SeatIndex);
					System.out.println("Number = " + SeatNumber);
					System.out.println("theaterId = " + theaterId);
					System.out.println("plexNum = " + plexNum);
					System.out.println("startTime = " + startTime);
					mainQuery.select(mainQueryroot.get("no"));
					mainQuery.where(cb.equal(mainQueryroot.get("plex_number"), plexNum),
									cb.equal(mainQueryroot.get("theater_id"), theaterId),
									cb.equal(mainQueryroot.get("seat_index"), SeatIndex),
									cb.equal(mainQueryroot.get("seat_number"), SeatNumber),
									cb.equal(mainQueryroot.get("start_time"), startTime));
	
					TypedQuery<Integer> tq = entityManager.createQuery(mainQuery);
					list.add(tq.getSingleResult());

				}
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<String> getReservationExist(String theaterId, String plexNum, String seat1, String seat2, String seat3,
			String seat4, String seat5, String seat6, String seat7, String seat8, String startTime) {
		// TODO Auto-generated method stub
		String seat[] = new String[8];
		seat[0] = seat1;
		seat[1] = seat2;
		seat[2] = seat3;
		seat[3] = seat4;
		seat[4] = seat5;
		seat[5] = seat6;
		seat[6] = seat7;
		seat[7] = seat8;

		String SeatIndex = "";
		int SeatNumber = 0;
		List<String> list = new ArrayList<String>();
		
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<String> mainQuery = cb.createQuery(String.class);
		Root<SeatVO> mainQueryroot = mainQuery.from(SeatVO.class);
		
		try{
			for(int i = 0; i < 8; i++) {
				if(seat[i] != ""){
					SeatIndex = seat[i].substring(0,1);
					SeatNumber = Integer.parseInt(seat[i].substring(1));
					mainQuery.select(mainQueryroot.get("reservation_exist"));
					mainQuery.where(cb.equal(mainQueryroot.get("plex_number"), plexNum),
									cb.equal(mainQueryroot.get("theater_id"), theaterId),
									cb.equal(mainQueryroot.get("seat_index"), SeatIndex),
									cb.equal(mainQueryroot.get("seat_number"), SeatNumber),
									cb.equal(mainQueryroot.get("start_time"), startTime));
	
					TypedQuery<String> tq = entityManager.createQuery(mainQuery);
					//System.out.println("SingleResult = " + tq.getSingleResult());
					list.add(tq.getSingleResult());

				}
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void reservationCancel(int SeatNo) {
		// TODO Auto-generated method stub
		SeatVO seatVO = entityManager.find(SeatVO.class, SeatNo);
		
		SeatVO mergeVO = entityManager.merge(seatVO);
		mergeVO.setReservation_exist("0");
	}

	@Override
	public Long getExtraSeatNum(String theaterId, String plexNum, String startTime) {
		// TODO Auto-generated method stub
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<Long> mainQuery = cb.createQuery(Long.class);
		Root<SeatVO> mainQueryroot = mainQuery.from(SeatVO.class);

		mainQuery.select(cb.count(mainQueryroot));
		mainQuery.where(cb.equal(mainQueryroot.get("theater_id"), theaterId),
						cb.equal(mainQueryroot.get("plex_number"), plexNum),
						cb.equal(mainQueryroot.get("start_time"), startTime),
						cb.equal(mainQueryroot.get("reservation_exist"), "0"),
						cb.notEqual(mainQueryroot.get("seat_type"), "empty"));
		
		TypedQuery<Long> tq = entityManager.createQuery(mainQuery);

		return tq.getSingleResult();

	}

	@Override
	public Long getExtraSeatTime(String theaterId, String plexNum, String date) {
		// TODO Auto-generated method stub
		Long extraSeatTimeNum = 0l;

		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<Long> mainQuery = cb.createQuery(Long.class);
		Root<SeatVO> mainQueryroot = mainQuery.from(SeatVO.class);

		mainQuery.select(cb.countDistinct(mainQueryroot.get("start_time")));
		mainQuery.where(cb.equal(mainQueryroot.get("theater_id"), theaterId),
						cb.equal(mainQueryroot.get("plex_number"), plexNum),
						cb.equal(cb.substring(mainQueryroot.get("start_time"), 1, 10), date));
		
		TypedQuery<Long> tq = entityManager.createQuery(mainQuery);
		extraSeatTimeNum = tq.getSingleResult();

		return extraSeatTimeNum;
	}

	@Override
	public void updateTempReservation(int SeatNo) {
		// TODO Auto-generated method stub
		try{
			
			String currentTime = currentTime();
															//primarykey
			SeatVO seatVO = entityManager.find(SeatVO.class, SeatNo);
						SeatVO mergeVO = entityManager.merge(seatVO);
			mergeVO.setReservation_exist("2");
			mergeVO.setCurrent_time(currentTime);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	private String currentTime(){
		
		long now = System.currentTimeMillis();
		Date date = new Date(now);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm", java.util.Locale.getDefault());
		
		String currentTime = dateFormat.format(date);

		return currentTime;
	}

	@Override
	public List<SeatVO> getTempReservationSeatNo() {
		// TODO Auto-generated method stub
		
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<SeatVO> mainQuery = cb.createQuery(SeatVO.class);
		Root<SeatVO> mainQueryroot = mainQuery.from(SeatVO.class);
		
		// select * from theater where theater_area = '지역이름'
		mainQuery.select(mainQueryroot);
		mainQuery.where(cb.equal(mainQueryroot.get("reservation_exist"), "2"));
		
		TypedQuery<SeatVO> tq = entityManager.createQuery(mainQuery);
		List<SeatVO> list = tq.getResultList();
		
		return list;
	}

}
