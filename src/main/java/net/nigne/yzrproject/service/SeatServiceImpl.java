package net.nigne.yzrproject.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.nigne.yzrproject.domain.SeatVO;
import net.nigne.yzrproject.persistence.SeatDAO;

@Service
public class SeatServiceImpl implements SeatService {
	
	@Autowired
	private SeatDAO dao;

	@Override
	public List<SeatVO> getList(String theaterId, String plexNum, String startTime) {
		// TODO Auto-generated method stub
		return dao.getList(theaterId, plexNum, startTime);
	}

	@Override
	public List<SeatVO> getIndex(String theaterId, String plexNum, String startTime) {
		// TODO Auto-generated method stub
		return dao.getIndex(theaterId, plexNum, startTime);
	}
	
	@Transactional(rollbackFor=Exception.class)
	@Override
	public void updateReservation(int SeatNo) {
		dao.updateReservation(SeatNo);	
	}

	@Override
	public List<Integer> getPrimary(String theaterId, String plexNum, String seat1, String seat2, String seat3,
								 String seat4, String seat5, String seat6, String seat7, String seat8, String startTime) {
		// TODO Auto-generated method stub
		return dao.getPrimary(theaterId, plexNum, seat1, seat2, seat3, seat4, seat5, seat6, seat7, seat8, startTime);
	}

	@Override
	public List<String> getReservationExist(String theaterId, String plexNum, String seat1, String seat2, String seat3,
			String seat4, String seat5, String seat6, String seat7, String seat8, String startTime) {
		// TODO Auto-generated method stub
		return dao.getReservationExist(theaterId, plexNum, seat1, seat2, seat3, seat4, seat5, seat6, seat7, seat8, startTime);
	}

	@Transactional(rollbackFor=Exception.class)
	@Override
	public void reservationCancel(int SeatNo) {
		// TODO Auto-generated method stub
		dao.reservationCancel(SeatNo);
	}

	@Override
	public Long getExtraSeatNum(String theaterId, String plexNum, String startTime) {
		// TODO Auto-generated method stub
		return dao.getExtraSeatNum(theaterId, plexNum, startTime);
	}

	@Override
	public Long getExtraSeatTime(String theaterId, String plexNum, String date) {
		// TODO Auto-generated method stub
		return dao.getExtraSeatTime(theaterId, plexNum, date);
	}
	
	@Transactional(rollbackFor=Exception.class)
	@Override
	public void updateTempReservation(int SeatNo) {
		// TODO Auto-generated method stub
		dao.updateTempReservation(SeatNo);
	}
	
	@Transactional(rollbackFor=Exception.class)
	@Override
	public void getTempReservationTimeoverCancel() {
		// TODO Auto-generated method stub
		
		List<SeatVO> seatNoList = dao.getTempReservationSeatNo();
		int updateFlag = 0;
		for(int i = 0; i < seatNoList.size(); i++){
			System.out.println("ºñ±³ = "+compareDate(seatNoList.get(i).getCurrent_time()));
			updateFlag = compareDate(seatNoList.get(i).getCurrent_time());
			if(updateFlag >= 0) {
				dao.reservationCancel(seatNoList.get(i).getNo());
			}
		}
	
	}
	
	private int compareDate(String previousTime){
		long now = System.currentTimeMillis();

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm", java.util.Locale.getDefault());
		
		Date currentDate = new Date(now);
		Date previousDate;
		try {
			previousDate = dateFormat.parse(previousTime);
			previousDate.setMinutes(previousDate.getMinutes()+3);
			
			int i = currentDate.compareTo(previousDate);
			
			return i;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			return 0;
		}


	}

}
