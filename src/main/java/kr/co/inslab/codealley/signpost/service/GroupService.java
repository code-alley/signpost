package kr.co.inslab.codealley.signpost.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.co.inslab.codealley.signpost.model.CloudResourceVO;
import kr.co.inslab.codealley.signpost.model.DomainGroupsVO;
import kr.co.inslab.codealley.signpost.model.InviteVO;
import kr.co.inslab.codealley.signpost.model.VDomainGroupsVO;

/**
 * 그룹 및 invite정보를 관리하는 클래스
 * 
 * @author jdkim
 *
 */

@Repository("groupService")
@Transactional
public class GroupService {

private Log log = LogFactory.getLog(GroupService.class);
	
	@PersistenceContext
	private EntityManager entityManager;
	
	/**
	 * 그룹 정보 - domain_group 테이블 참조
	 * @param group
	 * @param userId
	 * @return
	 */
	@Transactional(readOnly = true)
	public DomainGroupsVO getGroup(String group, String userId) {
		log.info("Group : " + group);
		log.info("User : " + userId);
		
		DomainGroupsVO result = null;
		
		try {
			TypedQuery<DomainGroupsVO> query = entityManager.createQuery("SELECT A FROM DomainGroupsVO A WHERE domain = :group AND user_id = :userId", DomainGroupsVO.class);
			query.setParameter("group", group);
			query.setParameter("userId", userId);
			result = query.getSingleResult();
		} catch (Exception e) {
			log.error(e.getMessage());
		}

		return result;
	}
	
	/**
	 * 그룹 정보 - v_domain_group 테이블 참조
	 * @param group
	 * @param userId
	 * @return
	 */
	@Transactional(readOnly = true)
	public VDomainGroupsVO getGroupInfo(String group, String userId) {
		log.info("Group : " + group);
		log.info("User : " + userId);
		
		VDomainGroupsVO result = null;
		
		try {
			TypedQuery<VDomainGroupsVO> query = entityManager.createQuery("SELECT A FROM VDomainGroupsVO A WHERE domain = :group AND user_id = :userId", VDomainGroupsVO.class);
			query.setParameter("group", group);
			query.setParameter("userId", userId);
			result = query.getSingleResult();
		} catch(Exception e) {
			if(e instanceof NoResultException) {
				log.error(e.getMessage());
			} else {
				log.error(e.getMessage(), e);
			}
		}
		
		return result;
	}
	
	/**
	 * 사용자 그룹 리스트 
	 * @param userId
	 * @return
	 */
	@Transactional(readOnly = true)
	public List<VDomainGroupsVO> getGroupListByUser(String userId) {
		log.info("User : " + userId);
		
		List<VDomainGroupsVO> result = null;
		
		try {
			TypedQuery<VDomainGroupsVO> query = entityManager.createQuery("SELECT A FROM VDomainGroupsVO A WHERE user_id = :userId", VDomainGroupsVO.class);
			query.setParameter("userId", userId);
			result = query.getResultList();
		} catch(Exception e) {
			if(e instanceof NoResultException) {
				log.error(e.getMessage());
			} else {
				log.error(e.getMessage(), e);
			}
		}
		
		return result;
	}
	
	/**
	 * 그룹 사용자 리스트
	 * @param group
	 * @return
	 */
	@Transactional(readOnly = true)
	public String getGroupUserList(String group) {
		log.info("Group : " + group);

		String user_list = "{\"result\": \"fail\"}";
		List<VDomainGroupsVO> result = null;
		
		try {
			TypedQuery<VDomainGroupsVO> query = entityManager.createQuery("SELECT A FROM VDomainGroupsVO A WHERE domain = :group", VDomainGroupsVO.class);
			query.setParameter("group", group);
			result = query.getResultList();
			
	    	if(result != null) {
	    		user_list = "{\"result\": \"success\", \"group_users\": " + result.toString() + "}";
	    	}
		} catch(Exception e) {
			if(e instanceof NoResultException) {
				log.error(e.getMessage());
			} else {
				log.error(e.getMessage(), e);
			}
		}
		
		return user_list;
	}
	
	/**
	 * Invite 메일 전송 기록
	 * @param vo
	 */
	public void insertInvite(InviteVO vo) {
		log.info("Insert invite  : " + vo.toString());
		entityManager.persist(vo);
	}
	
	/**
	 * invite메일 전송기록 정보얻기 
	 * @param userId
	 * @param toMail
	 * @param group
	 * @return
	 */
	@Transactional(readOnly = true)
	public List<InviteVO> selectInvite(String group, String from, String to) {
		
		List<InviteVO> result = null;
		
		try {
			TypedQuery<InviteVO> query = entityManager.createQuery("SELECT A FROM InviteVO A WHERE A.domain = :group and A.from_user_id = :from and A.to_user_email = :to", InviteVO.class);
			query.setParameter("group", group);
			query.setParameter("from", from);
			query.setParameter("to", to);
			result = query.getResultList();
		} catch(Exception e) {
			if(e instanceof NoResultException) {
				log.error(e.getMessage());
			} else {
				log.error(e.getMessage(), e);
			}
		}
		
		return result;
	}
	
	/**
	 * 그룹 추가 - 초대에 의한 그룹 추가 
	 * @param vo
	 */
	public void insertGroup(DomainGroupsVO vo) {
		log.info("Insert Group  : " + vo.toString());
		entityManager.persist(vo);
	}
	
	/**
	 * 그룹 정보 변경
	 * @param vo
	 */
	public void updateGroup(DomainGroupsVO vo) {
		log.info("Update Group : " + vo.toString());
		entityManager.merge(vo);
	}
	
	/**
	 * 그룹 정보 삭제
	 * @param name
	 * @return
	 */
	/*public int deleteGroup(String group) {
		log.info("Delete group domain:" + group);
		Query query = entityManager.createQuery("DELETE FROM DomainVO WHERE domain = :group");
		query.setParameter("group", group);
		return query.executeUpdate();
	}*/
	
	/**
	 * group 삭제에 의한 사용자 정보 삭제
	 * @param group
	 * @param email
	 * @return
	 */
	public int deleteMemberByGroup(String group) {
		log.info("Delete group :" + group);
		Query query = entityManager.createQuery("DELETE FROM DomainGroupsVO WHERE domain = :group");
		query.setParameter("group", group);
		return query.executeUpdate();
	}
	
	/**
	 * 사용자 삭제에 의한 관련 그룹 정보 삭제
	 * @param group
	 * @param userId
	 * @return
	 */
	public int deleteGroupByMember(String group, String userId) {
		log.info("Delete group domain: " + group + " userId: " + userId);
		Query query = entityManager.createQuery("DELETE FROM DomainGroupsVO WHERE domain = :group AND user_id = :userId");
		query.setParameter("group", group);
		query.setParameter("userId", userId);
		return query.executeUpdate();
	}
	
	/**
	 * invite 정보 삭제
	 * @param name
	 * @param userId
	 * @return
	 */
	public int deleteInvite(String group, String email) {
		log.info("Delete group :" + group + " email:" + email);
		Query query = entityManager.createQuery("DELETE FROM InviteVO WHERE domain = :group AND to_user_email = :email");
		query.setParameter("group", group);
		query.setParameter("email", email);
		return query.executeUpdate();
	}
	
	/**
	 * group 삭제에 의한 invite 정보 삭제
	 * @param group
	 * @param email
	 * @return
	 */
	public int deleteGroupInvite(String group) {
		log.info("Delete group :" + group);
		Query query = entityManager.createQuery("DELETE FROM InviteVO WHERE domain = :group");
		query.setParameter("group", group);
		return query.executeUpdate();
	}
	
	/**
	 * 그룹에 속한 툴별 리소스 사용량 조회
	 * @param userId
	 * @param domain
	 * @return
	 */
	@Transactional(readOnly = true)
	public List<CloudResourceVO> selectGroupResources(String userId, String domain) {
		List<CloudResourceVO> result = null;
		try {
			TypedQuery<CloudResourceVO> query = entityManager.createQuery("SELECT A FROM CloudResourceVO A WHERE A.user_id = :userId AND A.domain = :domain", CloudResourceVO.class);
			query.setParameter("userId", userId);
			query.setParameter("domain", domain);
			result = query.getResultList();
		} catch(Exception e) {
			if(e instanceof NoResultException) {
				log.error(e.getMessage());
			} else {
				log.error(e.getMessage(), e);
			}
		}
		
		return result;
	}
}
