package kr.co.inslab.codealley.signpost;

import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.inslab.codealley.signpost.model.VDomainGroupsVO;
import kr.co.inslab.codealley.signpost.service.GroupService;
import kr.co.inslab.codealley.signpost.web.data.UserInfo;

public class CustomInterceptor extends HandlerInterceptorAdapter {

	private Log log = LogFactory.getLog(CustomInterceptor.class);
	private String prefix = "";
	private String domain;
	private HttpSession session;
	private GroupService groupService;
	
	public CustomInterceptor(String domain, GroupService groupService) {
		this.domain = domain;
		this.groupService = groupService;
	}
		
	/* (non-Javadoc)
	 * @see org.springframework.web.servlet.handler.HandlerInterceptorAdapter#preHandle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object)
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String requestUri = request.getRequestURI();
		int index = requestUri.indexOf("/", 1);
		if(index > 0) prefix = requestUri.substring(0, index);		
		if(requestUri.startsWith(prefix+"/common")) return true;
		if(requestUri.startsWith(prefix+"/rest")) return true;
		if(requestUri.startsWith(prefix+"/resources")) return true;
		if(requestUri.startsWith(prefix+"/group")) return true;
		if(requestUri.startsWith(prefix+"/initialPassword")) return true;
		
		session = request.getSession(false);
		log.info("Session:" + session);
				
		if(session != null) {
			if(session.getAttribute("UserInfo") != null) {
				if(requestUri.equals(prefix+"/")) {
					response.sendRedirect(prefix+"/main");
					return false;
				}

				UserInfo userInfo = (UserInfo) session.getAttribute("UserInfo");
				if(userInfo != null) {
					URL url = new URL(request.getRequestURL().toString());
					String host = url.getHost().toString();
					String subDomain = host.split("\\.")[0];
					
					//Host 체크
					//domain : codealley.co
					if (!host.equals(domain)) {
						// 서브 도메인으로 접근
						// 사용자가 소유한 그룹 체크
						List<VDomainGroupsVO> domains = this.groupService.getGroupListByUser(userInfo.getUser_id());
						
						if (domains.size() != 0) {
							boolean groupExist = false;

							for (VDomainGroupsVO domain:domains) {
								if (subDomain.equals(domain.getDomain().toString())) {
									groupExist = true;
									break;
								}
							}
							// 서브도메인이 사용자가 소유한 그룹이 아닌 경우 세션 제거
							if (!groupExist) {
								session.invalidate();
								response.sendRedirect(prefix+"/");
								return false;
							}
						} else {
							session.invalidate();
							response.sendRedirect(prefix+"/");
							return false;
						}
					}
				}
			} else {
				session.invalidate();
				response.sendRedirect(prefix+"/");
				return false;
			}
		}
		
		return true;
	}

	/* (non-Javadoc)
	 * @see org.springframework.web.servlet.handler.HandlerInterceptorAdapter#postHandle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object, org.springframework.web.servlet.ModelAndView)
	 */
	@Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {		
		if(session != null) {
			if(session.getAttribute("UserInfo") != null) {
				if(modelAndView != null) {
					URL url = new URL(request.getRequestURL().toString());
					String host = url.getHost().toString();
					String subDomain = host.split("\\.")[0];
					
					if(modelAndView.getModel().containsKey("group")) {
						String group = modelAndView.getModel().get("group").toString();
						
						if(!subDomain.equals(group)) {
							session.invalidate();
							response.sendRedirect(prefix);
						}
					}
				}
			}
		}
    }
     
    /* (non-Javadoc)
     * @see org.springframework.web.servlet.handler.HandlerInterceptorAdapter#afterCompletion(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object, java.lang.Exception)
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        if(ex != null) {
    		String uri = request.getRequestURI();
    		String prefix = "";
    		int index = uri.indexOf("/", 1);
    		if(index > 0) prefix = uri.substring(0, index);
    		
    		response.sendRedirect(prefix+"/common/error/exception");	
        }
    }
}
