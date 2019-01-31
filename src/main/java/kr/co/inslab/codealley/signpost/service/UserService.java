package kr.co.inslab.codealley.signpost.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import kr.co.inslab.codealley.signpost.SHA1;
import kr.co.inslab.codealley.signpost.model.CloudResourceVO;
import kr.co.inslab.codealley.signpost.model.UserVO;
import kr.co.inslab.codealley.signpost.utils.AESCipher;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * 사용자 정보를 관리하는 서비스 클래스
 * @author minchulahn
 *
 */
@Repository("userService")
@Transactional
public class UserService {

	private Log log = LogFactory.getLog(UserService.class);

	@PersistenceContext
	private EntityManager entityManager;

	/**
	 * 로그인 확인 처리
	 * @param id
	 * @param passwd
	 * @return
	 */
	@Transactional(readOnly = true)
	public UserVO checkLogin(String id, String passwd) {

		UserVO result = null;

		log.info("Login : " + id);
		TypedQuery<UserVO> qry = entityManager.createNamedQuery("user_info.selectByID", UserVO.class);
		qry.setParameter("user_id", id);

		try {
			result = qry.getSingleResult();

			if (result != null) {
				if (SHA1.encrypt(passwd).equals(result.getPassword())){
					
					result.setLdapPassword(SHA1.encryptLdapPassword(passwd));
					
					return result;
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage());
		}

		return null;
	}
 
	/**
	 * 사용자 정보 호출
	 * @param vo
	 * @return
	 */
	@Transactional(readOnly = true)
	public UserVO selectUser(UserVO vo) {
		log.info("Select User : " + vo.toString());
		
		UserVO result = null;
		try {			
			TypedQuery<UserVO> qry = entityManager.createNamedQuery("user_info.selectByID", UserVO.class);
			qry.setParameter("user_id", vo.getUser_id());
			result = qry.getSingleResult(); 
		} catch (Exception e) {
			log.error(e.getMessage());
		}

		return result;
	}
	
	/**
	 * 사용자 정보 호출
	 * @param userid
	 * @return
	 */
	@Transactional(readOnly = true)
	public UserVO selectUser(String userid) {
		log.info("Select User : " + userid.toString());
		
		UserVO result = null;
		try {			
			TypedQuery<UserVO> qry = entityManager.createNamedQuery("user_info.selectByID", UserVO.class);
			qry.setParameter("user_id", userid);
			result = qry.getSingleResult(); 
		} catch (Exception e) {
			log.error(e.getMessage());
		}

		return result;
	}

	/**
	 * 사용자 정보 추가
	 * @param vo
	 */
	public void insertUser(UserVO vo) {
		log.info("Insert User : " + vo.toString());
		entityManager.persist(vo);
	}

	/**
	 * 사용자 정보 업데이트
	 * @param vo
	 */
	public void updateUser(UserVO vo) {
		log.info("Update User : " + vo.toString());
		entityManager.merge(vo);
	}

	/**
	 * 메일 정보 확인
	 * @param vo
	 * @return
	 */
	@Transactional(readOnly = true)
	public UserVO selectEmail(UserVO vo) {
		log.info("Select User for email : " + vo.toString());
		
		UserVO result = null;
		try {			
			TypedQuery<UserVO> qry = entityManager.createNamedQuery("user_info.selectByEmail", UserVO.class);
			qry.setParameter("email", vo.getEmail());
			result = qry.getSingleResult(); 
		} catch (Exception e) {
			log.error(e.getMessage());
		}

		return result;
	}
	
	/**
	 * 전체 사용자 정보 호출
	 * @return
	 */
	@Transactional(readOnly = true)
	public List<UserVO> selectAllUsers() {
		log.info("Select all users");
		
		List<UserVO> allUsers = null;
		
		try {
			TypedQuery<UserVO> query = entityManager.createQuery("SELECT A FROM UserVO A", UserVO.class);
			allUsers = query.getResultList();
		} catch(Exception e) {
			if(e instanceof NoResultException) {
				log.error(e.getMessage());
			} else {
				log.error(e.getMessage(), e);
			}
		}
		
		return allUsers;
	}
	
	/**
	 * 사용자 정보를 json 형식으로 생성후 암호화(비밀번호 초기화 메일 링크에 사용)
	 * @param userVO
	 * @return
	 */
	public String encryptReqPasswordAuthCode(UserVO userVO) {
		JsonObject json = new JsonObject();
		json.addProperty("userId", userVO.getUser_id());
		//json.addProperty("email", userVO.getEmail());
		
		String authCode = json.toString();
		log.info("authCode[" + authCode + "]");
		
		String encAuthCode = AESCipher.encrypt(authCode);
		log.info("encAuthCode[" + encAuthCode + "]");
		
		return encAuthCode;
	}
	
	/**
	 * 비밀번호 초기화 메일 링크에 포함된 authCode 복호화 
	 * @param authCode
	 * @return
	 */
	public JsonObject decryptReqPasswordAuthCode(String authCode) {
		String decAuthCode = AESCipher.decrypt(authCode);
		log.info("decAuthCode[" + decAuthCode + "]");
		
		JsonParser parser = new JsonParser();
		JsonObject authCodeJson = parser.parse(decAuthCode).getAsJsonObject();
		
		return authCodeJson;
	}
	
	/**
	 * 그룹별 리소스 사용량 조회
	 * @param userId
	 * @return
	 */
	@Transactional(readOnly = true)
	public List<CloudResourceVO> selectUserResources(String userId) {
		List<CloudResourceVO> result = null;
		try {
			TypedQuery<CloudResourceVO> query = entityManager.createQuery(""
					+ "SELECT NEW CloudResourceVO(A.domain, SUM(A.core), SUM(A.memory), SUM(A.disk)) "
					+ "FROM CloudResourceVO A "
					+ "WHERE A.user_id = :userId GROUP BY A.domain", CloudResourceVO.class);
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
}
