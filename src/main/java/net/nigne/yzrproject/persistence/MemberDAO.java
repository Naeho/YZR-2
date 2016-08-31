
package net.nigne.yzrproject.persistence;

import net.nigne.yzrproject.domain.MemberVO;

public interface MemberDAO {
	
	public void insert(MemberVO vo);
	public MemberVO select(String member_id);
	public void delete(String member_id);
	public boolean idCheck(String member_id);
	public boolean pwCheck(String member_pw, String member_id);
	public MemberVO getMemberInfo(String member_id);
	public void pwUpdate(String member_id, String newPw);
	public void userInfoUpdate(String member_id, MemberVO vo);
	public boolean pwFind(MemberVO vo);
	public String idSearch(String member_name, String email);
	public MemberVO getMember(String member_id);
	public void pointUpdate(String memberId, int point);
}
