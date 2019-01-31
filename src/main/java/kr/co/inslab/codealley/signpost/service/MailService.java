package kr.co.inslab.codealley.signpost.service;

import kr.co.inslab.codealley.signpost.model.UserVO;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;

/**
 * Mail 서비스를 처리하는 클래스
 * @author minchulahn
 *
 */
@Repository("mailService")
public class MailService {

	private Log log = LogFactory.getLog(MailService.class);
	private String mailHost = "http://54.214.215.139:8080/mail/v1";

	/**
	 * 비밀번호 변경 요청에 대한 mail 전송
	 * @param userVO
	 * @param acceptlink
	 * @return
	 */
	public String requestPasswordMail(UserVO userVO, String acceptlink) {
		String result = null;

		try {
			JSONObject param = new JSONObject();
			param.put("project", "codealley");
			param.put("from", "administrator<no-reply@inslab.co.kr>");
			param.put("to", userVO.getEmail());
			param.put("subject", "Re Password");
			param.put("message_type", "html");
			param.put("message_format_file", "codealley_repassword.html");
			
			JSONObject message_param = new JSONObject();
			message_param.put("from", userVO.getUser_id());
			message_param.put("acceptlink",  acceptlink);
			
			param.put("message_param", message_param);
			
			HttpResponse<JsonNode> jsonResponse = Unirest
					.post(this.mailHost)
					.header("accept", "application/json")
					.body(param.toString())
					.asJson();
			
			result = jsonResponse.getBody().getObject().get("result").toString();
			log.info("Send Mail : " + result);

		} catch (UnirestException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
}
