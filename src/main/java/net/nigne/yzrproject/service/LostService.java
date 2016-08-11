package net.nigne.yzrproject.service;

import java.sql.Timestamp;
import java.util.List;

import net.nigne.yzrproject.domain.ActorVO;
import net.nigne.yzrproject.domain.Criteria;
import net.nigne.yzrproject.domain.MovieVO;
import net.nigne.yzrproject.domain.DirectorVO;
import net.nigne.yzrproject.domain.GenreVO;
import net.nigne.yzrproject.domain.GpaVO;
import net.nigne.yzrproject.domain.LostVO;
import net.nigne.yzrproject.domain.MemberVO;
import net.nigne.yzrproject.domain.ReplyVO;
import net.nigne.yzrproject.domain.ReviewVO;

public interface LostService {
	
	public long getTotalCount(String member_id);
	public List<LostVO> getListPage(String member_id,Criteria criteria);
	public List<LostVO> getLostSearch(String member_id,String search,Criteria criteria);
	public long getSearchTotal(String member_id,String search);
	public MemberVO getMember(String member_id);
	public LostVO getLost(int no);


}