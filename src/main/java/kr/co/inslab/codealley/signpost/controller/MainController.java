package kr.co.inslab.codealley.signpost.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.JsonObject;
import com.google.gson.JsonSyntaxException;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;

import kr.co.inslab.codealley.signpost.model.UserVO;
import kr.co.inslab.codealley.signpost.model.VDomainGroupsVO;
import kr.co.inslab.codealley.signpost.service.GroupService;
import kr.co.inslab.codealley.signpost.service.UserService;
import kr.co.inslab.codealley.signpost.web.data.UserInfo;

@Controller
public class MainController extends CommonController {
	
	private Log log = LogFactory.getLog(MainController.class);
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private GroupService groupService;

	/**
	 * index 페이지 접근
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/")
	public String index(HttpServletRequest request, Model model) {
		String userId = null;
		userId = request.getParameter("userid");
		
		//비밀번호 요청 link로 접근한 경우
		if(userId != null) {
			UserVO userVO = new UserVO();
			userVO = this.userService.selectUser(userId);
			model.addAttribute("user", userVO);
			
			return "common/redirect_page";
		}		
		return "common/index";
	}
	
	/**
	 * 사용자 로그아웃 처리 이후 index 페이지 접근
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("UserInfo");
		return "common/index";
	}
	
	/**
	 * Main 페이지 접근
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(HttpServletRequest request, Model model) {
		UserInfo user = this.getUserInfo(request);
		UserVO userVO = new UserVO();
		userVO = this.userService.selectUser(user.getUser_id());
		model.addAttribute("user", userVO);
		
		return "main/main";
	}

	/**
	 * dashboard 페이지 접근
	 * @param group
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/dashboard/{group}", method = RequestMethod.GET)
    public String groupDashboard(@PathVariable("group") String group, HttpServletRequest request, Model model) {
		UserInfo user = this.getUserInfo(request);
		UserVO userVO = new UserVO();
		userVO = this.userService.selectUser(user.getUser_id());
		model.addAttribute("user", userVO);
		model.addAttribute("group", group);
		
		return "dashboard/dashboard";
    }
	
	/**
	 * pipeline wizard 페이지 접근
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/pipeline_wizard", method = RequestMethod.GET)
	public String displayPipelineWizard(HttpServletRequest request, Model model) {
		UserInfo user = this.getUserInfo(request);
		UserVO userVO = new UserVO();
		userVO = this.userService.selectUser(user.getUser_id());
		model.addAttribute("user", userVO);
		
		return "pipeline/pipeline_wizard";
	}
	
	/**
	 * 테스트를 위해 생성한 sample pipeline wizard 페이지 접근
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/sample_pipeline_wizard", method = RequestMethod.GET)
	public String displaySamplePipelineWizard(HttpServletRequest request, Model model) {
		UserInfo user = this.getUserInfo(request);
		UserVO userVO = new UserVO();
		userVO = this.userService.selectUser(user.getUser_id());
		model.addAttribute("user", userVO);
		
		return "pipeline/sample_pipeline_wizard";
	}
	
	/**
	 * pipeline 관리 페이지 접근
	 * @param group
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "pipeline_manager/{group}", method = RequestMethod.GET)
	public String displayPipelineManager(@PathVariable("group") String group, HttpServletRequest request, Model model) {
		UserInfo user = this.getUserInfo(request);
		UserVO userVO = new UserVO();
		userVO = this.userService.selectUser(user.getUser_id());
		model.addAttribute("user", userVO);
		model.addAttribute("group", group);
		
		return "pipeline/pipeline_manager";
	}
	
	/**
	 * pipeline 추가 페이지 접근
	 * @param group
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "add_pipeline/{group}", method = RequestMethod.GET)
	public String displayAddPipeline(@PathVariable("group") String group, HttpServletRequest request, Model model) {
		UserInfo user = this.getUserInfo(request);
		UserVO userVO = new UserVO();
		userVO = this.userService.selectUser(user.getUser_id());
		model.addAttribute("user", userVO);
		model.addAttribute("group", group);
		
		return "pipeline/add_pipeline";
	}
	
	/**
	 * pipeline 수정 페이지 접근
	 * @param group
	 * @param name
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "edit_pipeline/{group}", params = {"name"}, method = RequestMethod.GET)
	public String displayEditPipeline(@PathVariable("group") String group, @RequestParam(value = "name") String name, 
			HttpServletRequest request, Model model) {
		UserInfo user = this.getUserInfo(request);
		UserVO userVO = new UserVO();
		userVO = this.userService.selectUser(user.getUser_id());
		model.addAttribute("user", userVO);
		model.addAttribute("group", group);
		model.addAttribute("pipeline_name", name);
		
		return "pipeline/add_pipeline";
	}
	
	/**
	 * App 설치 페이지 접근
	 * @param category
	 * @param group
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/tool/add/{group}", params = {"category"}, method = RequestMethod.GET)
	public String displayAddTool(@RequestParam(value = "category") String category, @PathVariable("group") String group, 
			HttpServletRequest request, Model model) {
		UserInfo user = this.getUserInfo(request);
		UserVO userVO = new UserVO();
		userVO = this.userService.selectUser(user.getUser_id());
		model.addAttribute("user", userVO);
		model.addAttribute("group", group);
		model.addAttribute("category", category);
		
		return "pipeline/add_tool";
	}
	
	/**
	 * 사용자 정보 수정 페이지 접근
	 * @param request
	 * @param model
	 * @param tab_number
	 * @return
	 */
	@RequestMapping(value = "/user/myinfo/{tab_number}", method = RequestMethod.GET)
	public String displayUserInfo(HttpServletRequest request, Model model, @PathVariable("tab_number") int tab_number) {
		UserInfo user = this.getUserInfo(request);
		UserVO userVO = new UserVO();
		userVO = this.userService.selectUser(user.getUser_id());
		model.addAttribute("user", userVO);
		model.addAttribute("tab", tab_number);
    	
		return "user/user_info";
	}
	
	/**
	 * 그룹 관리자 설정 페이지 접근
	 * @param group
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/settings/manage", params = {"group"}, method = RequestMethod.GET)
	public String displayGroupSettingsManage(@RequestParam(value = "group") String group, HttpServletRequest request, Model model) {
		UserInfo user = this.getUserInfo(request);
		UserVO userVO = new UserVO();
		userVO = this.userService.selectUser(user.getUser_id());
		String user_list = this.groupService.getGroupUserList(group);
		
		model.addAttribute("user", userVO);
		model.addAttribute("group", group);
		model.addAttribute("user_list", user_list);
		
		return "settings/group_settings_manage";
	}
	
	/**
	 * Billing 설정 페이지 접근
	 * @param group
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/settings/billing_info", params = {"group"}, method = RequestMethod.GET)
	public String displayGroupSettingsBilling(@RequestParam(value = "group") String group, HttpServletRequest request, Model model) {
		UserInfo user = this.getUserInfo(request);
		UserVO userVO = new UserVO();
		userVO = this.userService.selectUser(user.getUser_id());
		String user_list = this.groupService.getGroupUserList(group);
    	
		List<VDomainGroupsVO> domainVO = this.groupService.getGroupListByUser(userVO.getUser_id());
		
		model.addAttribute("user", userVO);
		model.addAttribute("group", group);
		model.addAttribute("user_list", user_list);
		
		return "billing/billing_info";
	}
	
	/**
	 * 그룹 초대 확인 처리
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/group/invite/verify", method = RequestMethod.GET)
	public String inviteVerify(HttpServletRequest request, Model model) {
		
		String group 		= request.getParameter("group");
		String from 		= request.getParameter("from");
		String to 			= request.getParameter("to");
		String role 		= request.getParameter("role");
		
		
//		System.out.println("==============================================================");
//		System.out.println("Host | " + request.getServerName() + ":" + request.getServerPort() + request.getContextPath());
//		System.out.println("==============================================================");
		if(group == null || from == null || to == null || role == null)
			return "error/invalid_access";

		String host = request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
		String url = "http://" + host + "/rest/group/invite/{group}/{from}/{to:.+}/{role}";
		url = String.format("http://%s/rest/group/invite/%s/%s/%s/%s", host, group, from, to, role);
		try {
			HttpResponse<JsonNode> check_response = Unirest.get(url).asJson();
			System.out.println("response" + check_response.getBody());
			JSONObject check_obj = check_response.getBody().getObject();
			if(check_obj.getBoolean("result") == false) {
				return "error/invalid_access";
			}

			model.addAttribute("invite_group", group);
			model.addAttribute("invite_userId", from);
			model.addAttribute("invite_email", to);
			model.addAttribute("invite_role", role);

			url = "http://" + host + "/rest/isexist?email=" + to;

			HttpResponse<String> response = Unirest.post(url)
					.field("email", to)
					.asString();
			System.out.println("response" + response.getBody());

			if(response.getBody().equalsIgnoreCase("true")){
				//가입되어있는경우.. 로그인 여부..
				JSONObject obj = new JSONObject(response.getBody());
				if(obj.has("user_id")){
					UserInfo user = this.getUserInfo(request);
					if(user.getUser_id().equalsIgnoreCase(user.getUser_id()))
						return "dashboard/dashboard";
				}
			}
		} catch (UnirestException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "common/index";
	}
	
	/**
	 * 비밀번호 찾기 메일 본문의 링크를 통한 접속
	 * 링크에 포함된 authCode 복호화 후 해당 아이디 비밀번호 변경 처리
	 * @param authCode
	 * @param model
	 * @return
	 */
	@RequestMapping("/initialPassword")
	public String initialPassword(@RequestParam("authCode") String authCode, Model model) {
		try {
			//authCode 복호화
			JsonObject authCodeJson = this.userService.decryptReqPasswordAuthCode(authCode);

			String userId = authCodeJson.get("userId").getAsString();
			
			UserVO userVO = this.userService.selectUser(userId);
			
			if(userVO != null) {
				
				String password = "new";
				userVO.setPassword(password);
				userVO.encryptPassword();
				this.userService.updateUser(userVO);
	        	
				model.addAttribute("user", userVO);
				
				return "common/redirect_page";
			}
			
		}catch (JsonSyntaxException e) {
			log.error(e);
			return "common/index";
		}
		
		return "common/index";
	}
}
