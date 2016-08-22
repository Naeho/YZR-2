/** 
*
*/
package net.nigne.yzrproject.persistence;

import net.nigne.yzrproject.domain.MemberVO;

/** 
* @FileName : UserInfoDAO.java 
* @Package  : net.nigne.yzrproject.persistence 
* @Date     : 2016. 7. 28. 
* @�ۼ���		: ���뼺
* @���α׷� 	: ����...
*/
public interface UserInfoDAO {
	public MemberVO getMemberInfo(String member_id);
	public void pwUpdate(String member_id, String newPw);
	public void userInfoUpdate(String member_id, MemberVO vo);
	public boolean pwFind(MemberVO vo);
}
