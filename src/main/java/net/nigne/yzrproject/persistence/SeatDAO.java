package net.nigne.yzrproject.persistence;

import java.util.List;

import net.nigne.yzrproject.domain.SeatVO;

public interface SeatDAO {
	
	public List<SeatVO> getList(String theaterId, String plexNum, String startTime);
	public List<SeatVO> getIndex(String theaterId, String plexNum, String startTime);
	
	public void updateTempReservation(int SeatNo);
	public void updateReservation(int SeatNo);
	
	public void reservationCancel(int SeatNo);
	
	public List<Integer> getPrimary(String theaterId, String plexNum, String seat1, String seat2, String seat3, 
									String seat4, String seat5, String seat6, String seat7, String seat8, String startTime);
	public List<String> getReservationExist(String theaterId, String plexNum, String seat1, String seat2, String seat3, 
									  String seat4, String seat5, String seat6, String seat7, String seat8, String startTime);
	
	public Long getExtraSeatNum(String theaterId, String plexNum, String startTime);
	public Long getExtraSeatTime(String theaterId, String plexNum, String date);
	public List<SeatVO> getTempReservationSeatNo();
}
