package kr.co.inslab.codealley.signpost.web.rest;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import kr.co.inslab.codealley.signpost.SHA1;
import kr.co.inslab.codealley.signpost.model.CloudResourceVO;
import kr.co.inslab.codealley.signpost.model.UserVO;
import kr.co.inslab.codealley.signpost.service.LdapService;
import kr.co.inslab.codealley.signpost.service.MailService;
import kr.co.inslab.codealley.signpost.service.UserService;
import kr.co.inslab.codealley.signpost.web.data.UserInfo;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 사용자정보 관리를 위한 REST API 정의 클래스
 * @author minchulahn
 *
 */
@RequestMapping("/rest")
@Controller
public class UserRestful {
	private Log log = LogFactory.getLog(UserService.class);

	@Autowired
	private UserService userService;
	@Autowired
	private MailService mailService;
	@Autowired
	private LdapService ldapService;
	
    /**
     * @Method Name  : loginCheck
     * @Date         : 2014. 12. 5. 
     * @Author       : minchulahn
     * @Explain      : 로그인 확인 서비스
     * @param session - 세션 객체
     * @param request - client 응답 객체
     * @return - 응답 url
     */
    @RequestMapping(value="/login", method = RequestMethod.POST)
    @ResponseBody
    public String loginCheck(HttpServletRequest request, Model uiModel)
    {
    	String id = request.getParameter("username");
    	String passwd = request.getParameter("password");
    	
    	//비밀번호 변경 요청에 의한 비밀번호 임시설정.
    	if(passwd == null) {
    		passwd = "new";
    	}
    	
    	JSONObject result = new JSONObject();
    	try
    	{
	    	UserVO vo = this.userService.checkLogin(id, passwd);
	    	if(vo != null) {
	    		HttpSession session = request.getSession();
	    		UserInfo userInfo = new UserInfo();
	    		userInfo.setting(vo);
	    		
	    		session.setAttribute("UserInfo", userInfo);
	    		result.put("result", "success");
	    		result.put("email", vo.getEmail());
    			return result.toString() ;
	    	}
    	}
    	catch(Exception e) {
    		log.error(e.getMessage());
    		result.put("error", e.getMessage());
    	} 
    	
    	return result.put("result", "fail").toString();
    }
    
    /**
     * @Method Name  : register
     * @Date         : 2014. 12. 04. 
     * @Author       : minchulahn
     * @Explain      : 회원가입 함수
     * @param UserVO - User 객체
     * @return - url 경로
     * @throws BadPaddingException 
     * @throws IllegalBlockSizeException 
     * @throws NoSuchPaddingException 
     * @throws NoSuchAlgorithmException 
     * @throws InvalidKeyException 
     */ 
    @RequestMapping(value="/register", method = RequestMethod.POST)
    @ResponseBody 
    public String register(HttpServletRequest request, Model uiModel,
    		@Valid UserVO userVoForm, BindingResult bindingResult) throws InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException
    {   
    	//form data validations
    	if (bindingResult.hasErrors()) {
    		for(FieldError error : bindingResult.getFieldErrors()){	            	 
            	log.error(error.getDefaultMessage());  	
            }	
            return "fail";
        }
    	
    	String userid = request.getParameter("userid");
    	//String passwd = request.getParameter("password");
    	String passwd = userVoForm.getPassword();
    	String name = request.getParameter("name");
	    String email = request.getParameter("email");
    	
    	UserVO userVO = new UserVO();
    	userVO.setUser_id(userid);
    	userVO.setPassword(passwd);
    	userVO.setName(name);
    	userVO.setEmail(email);
    	userVO.encryptPassword();
    	
    	if(this.userService.selectUser(userVO) != null) {
    		return "already_use_id";
    	}
    	
    	this.userService.insertUser(userVO);
    	
    	return "success";
    }  
    
    /**
     * @Method Name  : overlapCheck
     * @Date         : 2014. 12. 04. 
     * @Author       : minchulahn
     * @Explain      : 아이디 검사 서비스
     * @param session - 세션 객체
     * @param request - client 응답 객체
     * @return - 응답 url
     */
    @RequestMapping(value="/idcheck", method = RequestMethod.GET)
    @ResponseBody
    public String overlapCheck(HttpSession session, HttpServletRequest request)
    {    	
    	String id = request.getParameter("userid");
    	
    	UserVO vo = new UserVO();
    	vo.setUser_id(id);
    	
    	try
    	{
	    	vo = this.userService.selectUser(vo);
	    	if(vo != null) return "exist";
    	}
    	catch(Exception e) {
    		log.error(e.getMessage());
    	}
    	
    	return "ok";
    } 
    
    /**
     * @Method Name  : emailCheck
     * @Date         : 2015. 05. 21. 
     * @Author       : minchulahn
     * @Explain      : 이메일 검사 서비스
     * @param session - 세션 객체
     * @param request - client 응답 객체
     * @return - 응답 url
     */
    @RequestMapping(value="/emailcheck", method = RequestMethod.GET)
    @ResponseBody
    public String checkEmail(HttpSession session, HttpServletRequest request)
    {    	
    	String email = request.getParameter("email");
    	
    	UserVO vo = new UserVO();
    	vo.setEmail(email);
    	
    	try
    	{
	    	vo = this.userService.selectEmail(vo);
	    	if(vo != null) return "exist";
    	}
    	catch(Exception e) {
    		log.error(e.getMessage());
    	}
    	
    	return "ok";
    } 
    
    /**
	 * @Method Name : changePassword
	 * @Date : 2015. 05. 13.
	 * @Author : minchulahn
	 * @Explain : 패스워드 요청 함수
	 * @param request - client의 request 객체
	 * @param uiModel - UI 모델 객체
	 * @return - url 경로
	 */
	@RequestMapping(value = "/reqpassword", method = RequestMethod.POST)
	@ResponseBody
	public String changePassword(@RequestParam("userid") String userid, HttpServletRequest request, Model uiModel) {
		String result = "false";
		UserVO userVO = new UserVO();
		userVO = this.userService.selectUser(userid);

		if (userVO == null) {
			return "not_found_id";
		}
		
		//실제 비밀번호 변경은 메일 링크 클릭시에
//		String password = "new";
//		userVO.setPassword(password);
//		userVO.encryptPassword();
//		this.userService.updateUser(userVO);
		
		//사용자 정보 암호화
		String encAuthCode = this.userService.encryptReqPasswordAuthCode(userVO);
		
		String acceptlink = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() 
				+ "/initialPassword?authCode=" + encAuthCode;
		
		result = this.mailService.requestPasswordMail(userVO, acceptlink);

		return result;
	}
    
    /**
     * @Method Name  : UpdateUser
     * @Date         : 2015. 05. 08. 
     * @Author       : minchulahn
     * @Explain      : User 정보 수정
     * @param request - client의 request 객체
     * @param uiModel - UI 모델 객체
     * @return - url 경로
     */
    @RequestMapping(value="/updateUserInfo", method = RequestMethod.POST)
    @ResponseBody 
    public String updateUserInfo(HttpServletRequest request, Model uiModel, 
    		@Valid UserVO userVoForm, BindingResult bindingResult)
    {
    	//form data validations
    	if (bindingResult.hasErrors()) {
    		for(FieldError error : bindingResult.getFieldErrors()){	            	 
            	log.error(error.getDefaultMessage());  	
            }	
            return "fail";
        }
    	
    	String userid = request.getParameter("userid");
//    	String passwd = request.getParameter("password");
    	String passwd = userVoForm.getPassword();
    	String name = request.getParameter("name");
	    String email = request.getParameter("email");
	    
    	UserVO userVO = new UserVO();
    	userVO = this.userService.selectUser(userid);
    	
    	if(userVO != null)
    	{  
    		userVO.setUser_id(userid);
        	userVO.setPassword(passwd);
        	userVO.setName(name);
        	userVO.setEmail(email);
        	userVO.encryptPassword();
        	this.userService.updateUser(userVO);
        	
        	//LDAP 유저정보 변경
        	userVO.setLdapPassword(SHA1.encryptLdapPassword(passwd));
        	this.ldapService.updateLdapUser(userVO);
        	
    		return "success";
    	}

    	return "fail";
    }
    

    /**
     * @Method Name  : isSignUp
     * @Date         : 2015. 05. 13. 
     * @Author       : jdkim
     * @Explain      : 이메일 존재여부 확인 
     * @param session
     * @param request
     * @return
     */
    @RequestMapping(value="/signup", method = RequestMethod.GET)
    @ResponseBody
    public String isSignUp(HttpSession session, HttpServletRequest request)
    {    	
    	JSONObject result = new JSONObject();
    	String email = request.getParameter("email");
    	
    	UserVO vo = new UserVO();
    	vo.setEmail(email);
    	
    	try
    	{
	    	vo = this.userService.selectEmail(vo);
	    	
	    	
	    	if(vo != null) {
	    		result.put("result", true);
	    		result.put("user_id", vo.getUser_id());
	    		return result.toString();
	    	}
	    		
    	}
    	catch(Exception e) {
    		log.error(e.getMessage());
    	}
    	
    	return result.put("result", false).toString();
    }
    
    
    @RequestMapping(value="/all_users", method = RequestMethod.GET)
    @ResponseBody
    public String getAllUsers()
    {
    	String result = "{\"result\": \"fail\"}";
		List<UserVO> userVO = this.userService.selectAllUsers();
    	if(userVO != null) {
    		result = "{\"result\": \"success\", \"all_users\": " + userVO.toString() + "}";
    	}
    	
    	return result;
    }
    
    /**
     * 그룹별 리소스 사용량 조회
     * @param session
     * @return
     */
    @RequestMapping(value="/userResources", method = RequestMethod.GET)
    @ResponseBody
    public String getUserResources(HttpSession session) {
		UserInfo userInfo = (UserInfo)session.getAttribute("UserInfo");
		String userId = userInfo.getUser_id();
		
		log.info(String.format("getUserResources :: userId[%s]", userId));
		
		String result = "{\"result\": \"fail\"}";
		List<CloudResourceVO> cloudResourceVO = this.userService.selectUserResources(userId);
    	if(cloudResourceVO != null) {
    		result = "{\"result\": \"success\", \"groupResource\": " + cloudResourceVO.toString() + "}";
    	}
    	
    	return result;
    }
}
