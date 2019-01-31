package kr.co.inslab.codealley.signpost.web.rest;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.co.inslab.codealley.signpost.model.CompanyVO;
import kr.co.inslab.codealley.signpost.model.CountryVO;
import kr.co.inslab.codealley.signpost.service.CompanyService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Billing 처리에 대한 REST API 정의 클래스
 * @author minchulahn
 *
 */
@RequestMapping("/rest")
@Controller
public class BillingRestful {
	
	@Autowired
	private CompanyService companyService;
    
	/**
	 * Company 정보를 추가하는 API
	 * @param request
	 * @return
	 */
    @RequestMapping(value="/company", method = RequestMethod.POST)
    @ResponseBody 
    public String createCompany(HttpServletRequest request) {   
    	CompanyVO companyVO = makeCompanyFromRequest(request);
    	/*
    	if(this.companyService.checkUserId(companyVO) != null) {
    		return "exist";
    	} else {
    		this.companyService.insertCompany(companyVO);
    	}
    	*/
    	this.companyService.insertCompany(companyVO);    	
    	return "success";
    }
    
    /**
     * Company 정보를 가져오는 API
     * @param userId
     * @return
     */
    @RequestMapping(value="/company/{userId}", method = RequestMethod.GET)
    @ResponseBody
    public String getCompany(@PathVariable("userId") String userId) {
    	CompanyVO vo = companyService.selectCompany(userId);
    	if(vo != null) {
    		return "{\"result\": \"success\", \"company\": " + vo.toString() + "}";
    	} else {
    		return "{\"result\": \"fail\"}";
    	}
    }

    /**
     * Company 정보를 업데이트 하는 API
     * @param userId
     * @param request
     * @return
     */
    @RequestMapping(value="/company/{userId}", method = RequestMethod.POST)
    @ResponseBody
    public String editCompany(@PathVariable("userId") String userId, HttpServletRequest request) {
    	CompanyVO vo = companyService.updateCompany(userId, makeCompanyFromRequest(request));
    	
    	if(vo != null) {
    		return "{\"result\": \"success\", \"company\": " + vo.toString() + "}";
    	} else {
    		return "{\"result\": \"fail\"}";
    	}
    }
    
    /**
     * Company 정보를 업데이트 하는 API
     * @param userId
     * @param vo
     * @return
     */
    @RequestMapping(value="/company/{userId}", method = RequestMethod.PUT)
    @ResponseBody
    public String editCompany1(@PathVariable("userId") String userId, @RequestBody CompanyVO vo) {
    	//CompanyVO vo = makeCompanyFromRequest(params);
    	vo = companyService.updateCompany(userId, vo);
    	if(vo != null) {
    		return "{\"result\": \"success\", \"company\": " + vo.toString() + "}";
    	} else {
    		return "{\"result\": \"fail\"}";
    	}
    }
    
    /**
     * Company 정보를 삭제하는 API
     * @param name
     * @param userId
     * @return
     */
    @RequestMapping(value="/company/{name}", method = RequestMethod.DELETE)
    @ResponseBody
    public String deleteCompany(@PathVariable("name") String name, @RequestParam("userId") String userId) {
    	String result = "{\"result\": \"fail\"}";
    	int entities = companyService.deleteCompany(name, userId);
    	if(entities > 0) {
    		result = "{\"result\": \"success\"}";
    	}
    	
    	return result;
    }

    /**
     * 각 나라별 도시 정보를 가져오는 API
     * @return
     */
    @RequestMapping(value = "/countries", method = RequestMethod.GET)
    @ResponseBody
    public String getCountries() {
    	String result = "{\"result\": \"fail\"}";
    	List<CountryVO> countries = companyService.selectCountries();
    	if(countries != null) {
    		result = "{\"result\": \"success\", \"countries\": " + countries.toString() + "}";
    	}
    	
    	return result;
    }
    
    /**
     * Company 정보 설정
     * @param request
     * @return
     */
    private CompanyVO makeCompanyFromRequest(HttpServletRequest request) {
    	String user_id = request.getParameter("userId");
    	String name = request.getParameter("name");
    	String id_number = request.getParameter("id_number");
    	String vat_number = request.getParameter("vat_number");
    	String website = request.getParameter("website");
    	String work_phone = request.getParameter("work_phone");
    	
    	String address1 = request.getParameter("address1");
    	String address2 = request.getParameter("address2");
    	String city = request.getParameter("city");
    	String state = request.getParameter("state");
    	String postal_code = request.getParameter("postal_code");
    	int country_id = request.getParameter("country_id") == null ?
    			0 : Integer.parseInt(request.getParameter("country_id"));
    	
    	String contact_first_name = request.getParameter("contact_first_name");
    	String contact_last_name = request.getParameter("contact_last_name");
    	String contact_email = request.getParameter("contact_email");
    	String contact_phone = request.getParameter("contact_phone");
    	
    	CompanyVO companyVO = new CompanyVO();
    	companyVO.setUser_id(user_id);
    	companyVO.setName(name);
    	companyVO.setId_number(id_number);
    	companyVO.setVat_number(vat_number);
    	companyVO.setWebsite(website);
    	companyVO.setWork_phone(work_phone);
    	companyVO.setAddress1(address1);
    	companyVO.setAddress2(address2);
    	companyVO.setCity(city);
    	companyVO.setState(state);
    	companyVO.setPostal_code(postal_code);
    	companyVO.setCountry_id(country_id);
    	companyVO.setContact_first_name(contact_first_name);
    	companyVO.setContact_last_name(contact_last_name);
    	companyVO.setContact_email(contact_email);
    	companyVO.setContact_phone(contact_phone);
    	
    	return companyVO;
    }
}
