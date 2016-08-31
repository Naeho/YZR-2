package net.nigne.yzrproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import net.nigne.yzrproject.domain.MemberVO;
import net.nigne.yzrproject.persistence.MemberDAO;

@Service // 서비스클래시 어노테이션 , 이것도 필수로 붙여주어야 하는건가?
public class MemberServiceImpl implements MemberService {

	
	@Autowired
	private MemberDAO dao;
	
	@Transactional(rollbackFor={Exception.class}) // 간단하게? 트랜잭션 처리!!
	@Override // 오버라이드
	public void insert(MemberVO vo) {
		
		dao.insert(vo);

	}
	@Transactional(readOnly=true) // 와이 true???
	@Override 
	public boolean idCheck(String member_id){
		
		return dao.idCheck(member_id);
	}
	
	@Transactional(readOnly=true)
	@Override 
	public boolean pwCheck(String member_pw, String member_id){
		
		return dao.pwCheck(member_pw, member_id);
	}
	
	@Transactional(readOnly=true)
	@Override
	public MemberVO select(String member_id) {
		return dao.select(member_id);
	}
	
	@Transactional(rollbackFor={Exception.class})
	@Override
	public void delete(String member_id) {
		try{
			dao.delete(member_id);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	@Override
	@Transactional
	public MemberVO getMemberInfo(String member_id) {
		
		return dao.getMemberInfo(member_id);
	}

	@Override
	@Transactional(rollbackFor=Exception.class)
	public void pwUpdate(String member_id, String newPw) {
		
		dao.pwUpdate(member_id, newPw);
		
	}

	@Override
	@Transactional(rollbackFor=Exception.class)
	public void userInfoUpdate(String member_id, MemberVO vo) {
		
		dao.userInfoUpdate(member_id, vo);
	}

	@Override
	public boolean pwFind(MemberVO vo){
		
		return dao.pwFind(vo);
	}
	@Override
	public String idSearch(String member_name, String email) {
		
		return dao.idSearch(member_name, email);
	}
	
	@Override
	public MemberVO getMember(String member_id) {
		// TODO Auto-generated method stub
		return dao.getMember(member_id);
	}
	@Override
	@Transactional(rollbackFor=Exception.class)
	public void pointUpdate(String memberId, int point) {
		
		dao.pointUpdate(memberId, point);
	}
}
