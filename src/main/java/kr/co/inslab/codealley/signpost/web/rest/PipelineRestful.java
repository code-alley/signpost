package kr.co.inslab.codealley.signpost.web.rest;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Pipeline 관리를 위한 REST API 정의 클래스
 * @author minchulahn
 *
 */
@RequestMapping("/rest")
@Controller
public class PipelineRestful {
	
	/**
	 * pipeline 정보 가져오기
	 * @param request
	 * @param group
	 * @return
	 */
	@RequestMapping(value="/getPipelineInfo/{group}", method = RequestMethod.GET)
	@ResponseBody
    public Map<String, Object> getPipelineInfo(HttpServletRequest request, @PathVariable("group") String group) {		
		Map<String, Object> message = new HashMap<String, Object>();
		//String fileUrl = "/Users/minchulahn/" + group + "_pipeline.json";
		String fileUrl = "/home/ubuntu/signpost/" + group + "_pipeline.json";
		JSONParser parser = new JSONParser();
		
		try {
			File file = new File(fileUrl);
			if(!file.exists()) {				
	    		message.put("result", "success");
	    		message.put("data", null);
	    		return message;
			}
			
			Object obj = parser.parse(new FileReader(fileUrl));
    		JSONObject jsonObject = (JSONObject) obj;    		
    		message.put("result", "success");
    		message.put("data", jsonObject);			
    	} catch (IOException e) {
    		e.printStackTrace();
    	} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}    	
    	return message;
    }
	
	/**
	 * pipeline 추가
	 * @param data
	 * @param group
	 * @return
	 */
	@RequestMapping(value = "/addPipeline/{group}", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Map<String, Object> addPipeline(@RequestBody String data, @PathVariable("group") String group) {
        Map<String, Object> message = new HashMap<String, Object>();
        
        //String fileUrl = "/Users/minchulahn/" + group + "_pipeline.json";
        String fileUrl = "/home/ubuntu/signpost/" + group + "_pipeline.json";
        
    	try {
    		FileWriter fileWriter = new FileWriter(fileUrl);
			fileWriter.write(data);
	    	fileWriter.flush();
	    	fileWriter.close();

			message.put("result", "success");
	        message.put("message", null);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
        return message;
    }
}
