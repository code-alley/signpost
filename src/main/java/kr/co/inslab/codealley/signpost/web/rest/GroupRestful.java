package kr.co.inslab.codealley.signpost.web.rest;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.inslab.codealley.signpost.model.CloudResourceVO;
import kr.co.inslab.codealley.signpost.model.DomainGroupsVO;
import kr.co.inslab.codealley.signpost.model.InviteVO;
import kr.co.inslab.codealley.signpost.model.VDomainGroupsVO;
import kr.co.inslab.codealley.signpost.service.GroupService;
import kr.co.inslab.codealley.signpost.service.LdapService;
import kr.co.inslab.codealley.signpost.web.data.UserInfo;

/**
 * 그룹 처리에 대한 REST API 정의 클래스
 * @author minchulahn
 *
 */
@RequestMapping("/rest")
@Controller
public class GroupRestful {

	@Autowired
	private GroupService groupService;
	
	@Autowired
	private LdapService ldapService;
	
	private Log log = LogFactory.getLog(GroupService.class);
	
	/**
	 * 그룹 정보
	 * @param userId
	 * @return
	 */
	@RequestMapping(value="/group", method = RequestMethod.GET)
    @ResponseBody
    public String getGroupInfo(HttpServletRequest request) {
		
		String result = "{\"result\": \"fail\"}";
		String group = request.getParameter("group");
    	String userId = request.getParameter("userId");
		
    	VDomainGroupsVO vDomainGroupsVO = new VDomainGroupsVO();
    	vDomainGroupsVO = this.groupService.getGroupInfo(group, userId);
    	
    	if(vDomainGroupsVO != null) {
    		result = "{\"result\": \"success\", \"group\": " + vDomainGroupsVO.toString() + "}";
    	}
    	
    	return result;
    }
	
	/**
	 * 사용자 그룹 리스트
	 * @param userId
	 * @return
	 */
	@RequestMapping(value="/group/{userId}", method = RequestMethod.GET)
    @ResponseBody
    public String getGroup(@PathVariable("userId") String userId) {
		
		JSONObject result = new JSONObject();
		JSONArray domainList = new JSONArray();
		
    	List<VDomainGroupsVO> groupVO = this.groupService.getGroupListByUser(userId);
    	if(groupVO != null){
    		for(int i=0;i<groupVO.size();i++){
        		JSONObject item = new JSONObject();
        		item.put("domain", groupVO.get(i).getDomain());
        		item.put("userid", groupVO.get(i).getUserId());
        		item.put("email", groupVO.get(i).getEmail());
        		item.put("role", groupVO.get(i).getRole());
        		domainList.put(item);
        	}
    	}
    	return result.put("group_list", domainList).toString();   
    }	
	
	/**
	 * 초대된 사용자 추가
	 * @param reqBody
	 * @return
	 */
	@RequestMapping(value="/group", method = RequestMethod.POST, consumes ={"application/json"})
    @ResponseBody
    public String addGroup(@RequestBody String reqBody) {

		JSONObject result = new JSONObject();
		result.put("result", false);
		
		JSONObject obj = new JSONObject(reqBody);
		
		if(!obj.has("group") || !obj.has("userId") || !obj.has("email") || !obj.has("role")){
			return result.put("error", "must be specify params(group, userId, to, role)").toString();
		}

		String group 	= obj.getString("group");
		String userId 	= obj.getString("userId");
		String email	= obj.getString("email");
		String role 	= obj.getString("role");
		
		//role 체크 (administrator or member)
		final String administrator = "administrator";
		final String member = "member";
		if(!role.equalsIgnoreCase(administrator) && !role.equalsIgnoreCase(member)){
			return result.put("error", "role value is wrong! (administrator or member)").toString();
		}
		
		int create, read, update, delete;
		create = read = update = delete = 0;
		if(role.equalsIgnoreCase(member)){
			create 	= obj.has("create") && obj.getBoolean("create") ? 1 : 0;
			read 	= 1;	// read permission : all user default
			update 	= obj.has("update") && obj.getBoolean("update") ? 1 : 0;
			delete 	= obj.has("delete") && obj.getBoolean("delete") ? 1 : 0;
		}else if(role.equalsIgnoreCase(administrator)){
			create = read = update = delete = 1;
		}
		
		// invite된 사용자 로그인시 가입된 그룹인지 체크
		DomainGroupsVO getGroupVO = new DomainGroupsVO();
		getGroupVO = this.groupService.getGroup(group, userId);
		
		if(getGroupVO != null) {
			return result.put("result", false).toString();
		}
		
		DomainGroupsVO vo = new DomainGroupsVO();
		vo.setDomain(group);
		vo.setUserId(userId);
		vo.setRole(role);
		vo.setPermCreate(create);
		vo.setPermRead(read);
		vo.setPermUpdate(update);
		vo.setPermDelete(delete);
    	this.groupService.insertGroup(vo);
    	
    	//LDAP 그룹 생성
    	this.ldapService.insertLdapGroup(group);
    	
    	return result.put("result", true).toString();
    }
	
	/**
	 * 그룹 생성 시 LDAP 그룹 생성
	 * @param reqBody
	 * @return
	 */
	@RequestMapping(value="/addLdapGroup", method = RequestMethod.POST, consumes ={"application/json"})
    @ResponseBody
    public String addLdapGroup(@RequestBody String reqBody) {
		
		JSONObject result = new JSONObject();
		result.put("result", false);
		
		JSONObject obj = new JSONObject(reqBody);
		
		if(!obj.has("group")){
			return result.put("error", "must be specify params(group)").toString();
		}
		String group 	= obj.getString("group");
    	
    	//LDAP 그룹 생성
    	this.ldapService.insertLdapGroup(group);
    	
    	return result.put("result", true).toString();
    }
	
	/**
	 * 그룹 사용자 권한 변경
	 * @param request
	 * @param uiModel
	 * @return
	 */
	@RequestMapping(value="/updateGroupRole", method = RequestMethod.POST)
    @ResponseBody 
    public String updateGroupRole(HttpServletRequest request, Model uiModel)
    {
		String group = request.getParameter("group");
    	String userid = request.getParameter("userid");
    	String role = request.getParameter("role");

    	DomainGroupsVO domainGroupsVO = new DomainGroupsVO();
    	domainGroupsVO = this.groupService.getGroup(group, userid);
    	
    	if(domainGroupsVO != null)
    	{    		
    		//role 체크 (administrator or member)
    		final String administrator = "administrator";
    		final String member = "member";
    		int create, read, update, delete;
    		create = read = update = delete = 0;
    		
    		if(role.equalsIgnoreCase(member)){
    			read = 1;
    			create = update = delete = 0;
    		}else if(role.equalsIgnoreCase(administrator)){
    			create = read = update = delete = 1;
    		}
    		
    		domainGroupsVO.setDomain(group);
    		domainGroupsVO.setUserId(userid);
    		domainGroupsVO.setRole(role);
    		domainGroupsVO.setPermCreate(create);
    		domainGroupsVO.setPermRead(read);
    		domainGroupsVO.setPermUpdate(update);
    		domainGroupsVO.setPermDelete(delete);
        	this.groupService.updateGroup(domainGroupsVO);
        	
    		return "success";
    	}
    	
    	return "fail";
    }
	
	/**
	 * 그룹 멤버 삭제
	 * invite 기록 삭제와 ldap 사용자 삭제
	 * @param reqBody
	 * @return
	 */
	@RequestMapping(value="/group", method = RequestMethod.DELETE, consumes ={"application/json"})
    @ResponseBody
    public String deleteGroupMember(@RequestBody String reqBody) {
		String result = "{\"result\": \"fail\"}";
		
		JSONObject obj = new JSONObject(reqBody);
		if(!obj.has("group") || !obj.has("userId") || !obj.has("email")){
			return result;
		}
		
		String group = obj.getString("group");
		String userId = obj.getString("userId");
		String email = obj.getString("email");
    	
    	log.info("group : " + group + " userId : " + userId);
    	
    	int entities1 = this.groupService.deleteGroupByMember(group, userId);
    	int entities2 = this.groupService.deleteInvite(group, email);
    	
    	if(entities1 > 0 && entities2 > 0) {
    		
    		//LDAP 유저 삭제
    		this.ldapService.deleteLdapUser(group, userId);
    		
    		result = "{\"result\": \"success\"}";
    	}
    	
    	return result;
    }
	
	/**
	 * 그룹 삭제 시
	 * 그룹에 추가된 사용자 삭제, invite 기록 삭제, ldap 그룹 삭제
	 * @param reqBody
	 * @return
	 */
	@RequestMapping(value="/deleteGroup", method = RequestMethod.DELETE, consumes ={"application/json"})
    @ResponseBody
    public String deleteGroup(@RequestBody String reqBody) {
		String result = "{\"result\": \"fail\"}";
		
		JSONObject obj = new JSONObject(reqBody);
		if(!obj.has("group")){
			return result;
		}		
		String group = obj.getString("group");
		
		log.info("group : " + group);
		int entities1 = this.groupService.deleteMemberByGroup(group);
    	int entities2 = this.groupService.deleteGroupInvite(group);
    	
    	if(entities1 >= 0 && entities2 >= 0) {
    		
    		//LDAP 그룹 삭제
    		this.ldapService.deleteLdapGroup(group);
    		
    		result = "{\"result\": \"success\"}";
    	}
    	
    	return result;
    }
	
	/**
	 * invite메일 기록 : 기존에 보낸invite인지 확인용도로 쓰임.
	 * @param reqBody
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/group/invite", method = RequestMethod.POST, consumes ={"application/json"})
    @ResponseBody
    public String addInvite(@RequestBody String reqBody, HttpServletRequest request) {
		
		JSONObject obj = new JSONObject(reqBody);
		
		InviteVO vo = new InviteVO();
		vo.setDomain(obj.getString("group"));
		vo.setFrom_user_id(obj.getString("from"));
		vo.setTo_user_email(obj.getString("to"));
		
		this.groupService.insertInvite(vo);
		
		return "success";
    }
	
	/**
	 * 이미 보낸 invite메일인지 확인
	 * @param groupName
	 * @param fromUser
	 * @param toUserEmail
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/group/invite/{group}/{from}/{to:.+}/{role}", method = RequestMethod.GET)
    @ResponseBody
    public String checkInvite(@PathVariable("group") String group,
    							@PathVariable("from") String from,
    							@PathVariable("to") String to,
    							@PathVariable("role") String role,
    							HttpServletRequest request) {
		
		JSONObject result = new JSONObject();
		List<InviteVO> inviteList = this.groupService.selectInvite(group, from, to);
		
		if( inviteList != null && inviteList.size() > 0 )
			return result.put("result", true).toString();
		else
			return result.put("result", false).toString();
    }
	
	/**
	 * 그룹에 속한 툴별 리소스 사용량 조회
	 * @param session
	 * @param group
	 * @return
	 */
	@RequestMapping(value="/groupResources", method = RequestMethod.GET)
    @ResponseBody
    public String getGroupResources(HttpSession session, @RequestParam("group") String group) {
		UserInfo userInfo = (UserInfo)session.getAttribute("UserInfo");
		String userId = userInfo.getUser_id();
		
		log.info(String.format("getGroupResoucres :: userId[%s] group[%s]", group, userId));
		
		String result = "{\"result\": \"fail\"}";
		List<CloudResourceVO> cloudResourceVO = this.groupService.selectGroupResources(userId, group);
    	if(cloudResourceVO != null) {
    		result = "{\"result\": \"success\", \"groupResource\": " + cloudResourceVO.toString() + "}";
    	}
    	
    	return result;
    }
}
