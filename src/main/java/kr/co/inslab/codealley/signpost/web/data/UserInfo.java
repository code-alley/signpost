package kr.co.inslab.codealley.signpost.web.data; 

import kr.co.inslab.codealley.signpost.model.UserVO;
 
public class UserInfo extends UserVO {

	private static final long serialVersionUID = 1L;   
	
	/**
	 * 사용자 정보
	 * @return UserVO 사용자 정보
	 */
	public UserVO getUserVO()
	{
		return (UserVO)this;
	}
	
	/**
	 * 사용자 정보 설정
	 * @param user
	 */
	public void setting(UserVO user)
	{
		this.setUser_id(user.getUser_id()); 
		this.setPassword(user.getPassword());  
		this.setName(user.getName());
		this.setEmail(user.getEmail());  
		this.setLdapPassword(user.getLdapPassword());
	}
}
