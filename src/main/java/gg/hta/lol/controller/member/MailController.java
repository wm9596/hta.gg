package gg.hta.lol.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import gg.hta.lol.service.MailService;
import gg.hta.lol.vo.AuthVo;

@Controller
public class MailController { 
    @Autowired private MailService service;
    @GetMapping(value = "/member/email/{id}/{email}", produces = {MediaType.APPLICATION_XML_VALUE})
    @ResponseBody
    public String mailSend(@PathVariable("id")String id, @PathVariable("email")String email) {
    	StringBuffer sb = new StringBuffer();
    	try {
			service.regist(new AuthVo(id, null), email);
			sb.append("<data>");
				sb.append("<result>success</result>");
			sb.append("</data>");
			return sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
			sb.append("<data>");
				sb.append("<result>fail</code>");
			sb.append("</data>");
			return sb.toString();
		}
    }
    @GetMapping(value = "/member/code/{id}", produces = {MediaType.APPLICATION_XML_VALUE})
    @ResponseBody
    public String code(@PathVariable("id")String id) {
    	StringBuffer sb = new StringBuffer();
    	try {
			String key = service.check(id);
			sb.append("<data>");
				sb.append("<code>");
					sb.append(key);
				sb.append("</code>");
			sb.append("</data>");
			return sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
			sb.append("<data>");
				sb.append("<code>fail</code>");
			sb.append("</data>");
			return sb.toString();
		}
    }
    @GetMapping(value = "/member/idSearch/{email}", produces = {MediaType.APPLICATION_XML_VALUE})
    @ResponseBody
    public String mailSend(@PathVariable("email")String email) {
    	StringBuffer sb = new StringBuffer();
    	try {
    		if (email.substring(email.lastIndexOf("@")).trim().equals("@daum")) {
    			service.idSearch(email+".net");
    		}else {
    			service.idSearch(email+".com");
    		}
			sb.append("<data>");
				sb.append("<result>success</result>");
			sb.append("</data>");
			return sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
			sb.append("<data>");
				sb.append("<result>fail</code>");
			sb.append("</data>");
			return sb.toString();
		}
    }
    @GetMapping(value = "/member/idSearchCode/{email}", produces = {MediaType.APPLICATION_XML_VALUE})
    @ResponseBody
    public String SearchCode(@PathVariable("email")String email) {
    	StringBuffer sb = new StringBuffer();
    	try {
    		if (email.substring(email.lastIndexOf("@")).trim().equals("@daum")) {
    			email=email+".net";
    		}else {
    			email=email+".com";
    		}
    		String code = service.idSeachCheck(email).getCode();
			String username = service.idSeachCheck(email).getUsername();
			sb.append("<data>");
				sb.append("<code>");
					sb.append(code);
				sb.append("</code>");
				sb.append("<id>");
					sb.append(username);
				sb.append("</id>");
			sb.append("</data>");
			return sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
			sb.append("<data>");
				sb.append("<code>fail</code>");
			sb.append("</data>");
			return sb.toString();
		}
    }
    @GetMapping(value = "/member/pwdSearch/{id}/{email}", produces = {MediaType.APPLICATION_XML_VALUE})
    @ResponseBody
    public String PwdmailSend(@PathVariable("id")String id, @PathVariable("email")String email) {
    	StringBuffer sb = new StringBuffer();
    	try {
    		if (email.substring(email.lastIndexOf("@")).trim().equals("@daum")) {
    			service.pwdSearch(id, email+".net");
    		}else {
    			service.pwdSearch(id, email+".com");
    		}
			sb.append("<data>");
				sb.append("<result>success</result>");
			sb.append("</data>");
			return sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
			sb.append("<data>");
				sb.append("<result>fail</code>");
			sb.append("</data>");
			return sb.toString();
		}
    }
}
