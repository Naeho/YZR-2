package net.nigne.yzrproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.nigne.yzrproject.domain.MemberVO;
import net.nigne.yzrproject.persistence.MemberDAO;

@Service // ����Ŭ���� ������̼� , �̰͵� �ʼ��� �ٿ��־�� �ϴ°ǰ�?
public class MemberServiceImpl implements MemberService {

	
	@Autowired
	private MemberDAO dao;
	
	@Transactional(rollbackFor={Exception.class}) // �����ϰ�? Ʈ����� ó��!!
	@Override // �������̵�
	public void insert(MemberVO vo) {
		
		dao.insert(vo);

	}
	@Transactional(readOnly=true) // ���� true???
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
}
