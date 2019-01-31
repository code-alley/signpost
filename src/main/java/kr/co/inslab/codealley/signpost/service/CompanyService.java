package kr.co.inslab.codealley.signpost.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import kr.co.inslab.codealley.signpost.model.CompanyVO;
import kr.co.inslab.codealley.signpost.model.CountryVO;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Billing 서비스에 대한 처리를 하는 클래스 
 * @author minchulahn
 *
 */
@Repository("companyService")
@Transactional
public class CompanyService {

	private Log log = LogFactory.getLog(CompanyService.class);

	@PersistenceContext
	private EntityManager entityManager;
	
	/*
	@Transactional(readOnly = true)
	public CompanyVO checkUserId(CompanyVO vo) {

		CompanyVO result = null;

		try {
			log.info("User is already in use : " + vo.toString());
			TypedQuery<CompanyVO> qry = entityManager.createNamedQuery(
					"company.selectByID", CompanyVO.class);
			qry.setParameter("user_id", vo.getUser_id());

			result = qry.getSingleResult();
		} catch (Exception e) {
		}

		return result;
	}
	*/
	
	/**
	 * Company 정보 추가
	 * @param vo
	 */
	public void insertCompany(CompanyVO vo) {
		log.info("Insert Company : " + vo.toString());
		entityManager.persist(vo);
	}
	
	/**
	 * Company 정보 호출
	 * @param userId
	 * @return
	 */
	@Transactional(readOnly = true)
	public CompanyVO selectCompany(String userId) {
		log.info("Select company user:" + userId);
		
		CompanyVO result = null;
		
		try {
			TypedQuery<CompanyVO> query = entityManager.createQuery("SELECT A FROM CompanyVO A WHERE A.user_id = :user_id", CompanyVO.class);
			query.setParameter("user_id", userId);
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
	 * Company 정보 업데이트
	 * @param userId
	 * @param vo
	 * @return
	 */
	public CompanyVO updateCompany(String userId, CompanyVO vo) {
		CompanyVO updated = selectCompany(userId);
		if(updated != null && updated.getId() > 0) {
			vo.setId(updated.getId());
			updated = entityManager.merge(vo);
		}
		
		return updated;
	}
	
	/**
	 * Company 정보 삭제
	 * @param name
	 * @param userId
	 * @return
	 */
	public int deleteCompany(String name, String userId) {
		log.info("Delete company name:" + name + " user:" + userId); 
		Query query = entityManager.createQuery("DELETE FROM CompanyVO WHERE name = :name AND user_id = :user_id");
		query.setParameter("name", name);
		query.setParameter("user_id", userId);
		return query.executeUpdate();
	}
	
	/**
	 * 각 나라별 도시 정보 호출
	 * @return
	 */
	@Transactional(readOnly = true)
	public List<CountryVO> selectCountries() {
		log.info("Select all countries");
		
		List<CountryVO> countries = null;
		
		try {
			TypedQuery<CountryVO> query = entityManager.createQuery("SELECT A FROM CountryVO A", CountryVO.class);
			countries = query.getResultList();
		} catch(Exception e) {
			if(e instanceof NoResultException) {
				log.error(e.getMessage());
			} else {
				log.error(e.getMessage(), e);
			}
		}
		
		return countries;
	}
}
