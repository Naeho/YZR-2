/** 
*
*/
package net.nigne.yzrproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.nigne.yzrproject.domain.CouponVO;
import net.nigne.yzrproject.domain.Criteria;
import net.nigne.yzrproject.persistence.UserCouponDAO;

/** 
* @FileName : UserCouponServiceImpl.java 
* @Package  : net.nigne.yzrproject.service 
* @Date     : 2016. 7. 28. 
* @�ۼ���		: ���뼺
* @���α׷� 	: ����...
*/
@Service
public class UserCouponServiceImpl implements UserCouponService {

	@Autowired
	UserCouponDAO dao;
	
	/** 
	* @Method Name	: getCouponTotal 
	* @Method ����	: 
	* @param member_id
	* @return 
	*/
	@Override
	@Transactional(readOnly = true)
	public long getCouponTotal(String member_id) {
		
		return dao.getCouponTotal(member_id);
	}
	@Override
	@Transactional(readOnly = true)
	public List<CouponVO> getCouponList(Criteria cri, String member_id) {
		
		return dao.getCouponList(cri, member_id);
	}

}
