package kr.co.inslab.codealley.signpost.service;

import java.util.List;

import javax.naming.Name;
import javax.naming.directory.Attributes;
import javax.naming.directory.BasicAttribute;
import javax.naming.directory.BasicAttributes;
import javax.servlet.http.HttpSession;

import kr.co.inslab.codealley.signpost.model.UserVO;
import kr.co.inslab.codealley.signpost.web.data.UserInfo;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ldap.NamingException;
import org.springframework.ldap.core.ContextMapper;
import org.springframework.ldap.core.DirContextOperations;
import org.springframework.ldap.core.LdapTemplate;
import org.springframework.ldap.support.LdapNameBuilder;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import static org.springframework.ldap.query.LdapQueryBuilder.query;

@Repository("ldapService")
public class LdapService {

	private Log log = LogFactory.getLog(LdapService.class);
	
	@Autowired
	private LdapTemplate ldapTemplate;
	
	/**
	 * LDAP 그룹 생성
	 * @param groupName
	 */
	public void insertLdapGroup(String groupName) {
		log.info("## insertLdapGroup start ##");
		
		BasicAttribute oc = new BasicAttribute("objectClass");
		oc.add("organizationalUnit");
		oc.add("top");
		
		Attributes attrs = new BasicAttributes();
		attrs.put(oc);
		
		Name dn = LdapNameBuilder.newInstance()
			    .add("ou", groupName)
			    .build();
		
		if(!this.existsDn(dn)) {
			ldapTemplate.bind(dn, null, attrs);
			log.info("## insertLdapGroup Creation successful DN["+dn+"] ##");
		}

		//그룹에 유저 등록
    	ServletRequestAttributes reqAttr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
    	HttpSession session = reqAttr.getRequest().getSession();
    	UserInfo userInfo = (UserInfo)session.getAttribute("UserInfo");
    	this.insertLdapUser(groupName, userInfo);
    	
		log.info("## insertLdapGroup end ##");
	}
	
	/**
	 * LDAP 그룹 삭제
	 * @param groupName
	 */
	public void deleteLdapGroup(String groupName) {
		log.info("## deleteLdapGroup start ##");
		Name dn = LdapNameBuilder.newInstance()
			    .add("ou", groupName)
			    .build();
		//하위 엔트리까지 모두 삭제
		ldapTemplate.unbind(dn, true);
		log.info("## deleteLdapGroup Deleted successful DN["+dn+"] ##");
		log.info("## deleteLdapGroup end ##");
	}
	
	/**
	 * LDAP 사용자 생성
	 * @param groupName
	 * @param userInfo
	 */
	public void insertLdapUser(String groupName, UserInfo userInfo) {
		log.info("## insertLdapUser start ##");
		
		String userId = userInfo.getUser_id();
		String name =  userInfo.getName();
		String password = userInfo.getLdapPassword();
		String email = userInfo.getEmail();
		
		BasicAttribute oc = new BasicAttribute("objectClass");
        oc.add("inetOrgPerson");
        oc.add("person");  
        oc.add("top"); 
        
        Attributes attrs = new BasicAttributes();
        attrs.put(oc);
        attrs.put("uid", userId);
        attrs.put("sn", name); 
        attrs.put("givenName", name);
        attrs.put("userpassword", password);
        attrs.put("mail", email);
		
        Name dn = LdapNameBuilder.newInstance()
			    .add("ou", groupName)
			    .add("cn", userId)
			    .build();
        
        if(!this.existsDn(dn)) {
        	ldapTemplate.bind(dn, null, attrs);
        	log.info("## insertLdapUser Creation successful DN["+dn+"] ##");
		}
		
        log.info("## insertLdapUser end ##");
	}
	
	/**
	 * LDAP 유저 정보 변경
	 * @param userVO
	 */
	public void updateLdapUser(UserVO userVO) {
		log.info("## updateLdapUser start ##");
		
		//ID로 유저 검색 (여러 그룹에 중복으로 들어갈수있으므로 복수가능)
		List<DirContextOperations> userContextList = ldapTemplate.search(
		         query().where("objectclass").is("person")
		         		.and("cn").is(userVO.getUser_id()),
		         new ContextMapper <DirContextOperations>() {
		            public DirContextOperations mapFromContext(Object ctx) {
		            	DirContextOperations context = (DirContextOperations) ctx;
		               return context;
		            }
		         });
		
		//검출된 유저 정보 변경
		for (DirContextOperations userContext : userContextList) {
			
			userContext.setAttributeValue("sn", userVO.getName());
			userContext.setAttributeValue("givenName", userVO.getName());
			userContext.setAttributeValue("userpassword", userVO.getLdapPassword());
			userContext.setAttributeValue("mail", userVO.getEmail());
			
			ldapTemplate.modifyAttributes(userContext);
			
			log.info("## updateLdapUser Changed successful DN["+userContext.getDn()+"] ##");
		}
		
		log.info("## updateLdapUser end ##");
	}
	
	/**
	 * LDAP 유저 삭제
	 * @param groupName
	 * @param userId
	 */
	public void deleteLdapUser(String groupName, String userId) {
		log.info("## deleteLdapUser start ##");
		Name dn = LdapNameBuilder.newInstance()
			    .add("ou", groupName)
			    .add("cn", userId)
			    .build();
		
		ldapTemplate.unbind(dn);
		log.info("## deleteLdapUser Deleted successful DN["+dn+"] ##");
		log.info("## deleteLdapUser end ##");
	}
	
	/**
	 * DN 존재여부 확인
	 * @param dn
	 * @return
	 */
	public boolean existsDn(Name dn) {
		try {
	        ldapTemplate.lookup(dn);
	        log.info("Already exists DN["+dn+"] ##");
	        return true;
	    } catch (NamingException  e) {
	        return false;
	    }
	}
}
