package gg.hta.lol.controller.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import gg.hta.lol.service.MailSendService;

@Controller
public class EmailController {
	@Autowired private MailSendService mailsender;
	
	@GetMapping(value = "/member/email/{id}/{email}", produces = "application/xml;charset=utf-8")
	@ResponseBody
	public String mailSend(@PathVariable("id")String id, @PathVariable("email")String email, HttpServletRequest request) { 	
		// 인증 메일 보내기 메서드
		mailsender.mailSendWithUserKey(email, id, request);
		StringBuffer sb = new StringBuffer();
		sb.append("<data>");
		sb.append("<code>" + "success" +"</code>");
		sb.append("</data>");
		return sb.toString();
		
	}
}
