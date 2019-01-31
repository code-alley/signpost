package kr.co.inslab.codealley.signpost.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.inslab.codealley.signpost.web.data.UserInfo;


public class CommonController {

	/**
	 * session 사용자 정보
	 * @param request
	 * @return UserInfo 객체
	 */
	public UserInfo getUserInfo(HttpServletRequest request)
	{
		HttpSession session = request.getSession(false);
		if (session != null) 
		{
			Object obj = session.getAttribute("UserInfo");
			if (obj != null) 
			{
				UserInfo user = (UserInfo)obj;
				
				return user;
			}
		}
		
		return null;
	}
}