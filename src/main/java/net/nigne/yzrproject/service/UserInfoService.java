/** 
*
*/
package net.nigne.yzrproject.service;

import net.nigne.yzrproject.domain.MemberVO;

/** 
* @FileName : UserInfoService.java 
* @Package  : net.nigne.yzrproject.service 
* @Date     : 2016. 7. 28. 
* @�ۼ���		: ���뼺
* @���α׷� 	: ����...
*/
public interface UserInfoService {
	public MemberVO getMemberInfo(String member_id);
	public void pwUpdate(String member_id, String newPw);
	public void userInfoUpdate(String member_id, MemberVO vo);
	public boolean pwFind(MemberVO vo);
}
