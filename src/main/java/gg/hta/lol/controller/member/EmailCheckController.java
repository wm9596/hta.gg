package gg.hta.lol.controller.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import gg.hta.lol.service.MemberService;
import gg.hta.lol.vo.MemberVo;

@Controller
public class EmailCheckController {
	@Autowired MemberService service;
	//http://localhost:9090/lol/member/emailCheck/test@test ==> Å×½ºÆ®
	@GetMapping(value = "/member/emailCheck/{email}", produces = "application/xml;charset=utf-8")
	@ResponseBody
	public String select(@PathVariable("email")String email) {
		boolean using = false;
		if (email.substring(email.lastIndexOf("@")).trim().equals("@daum")) {
			email+=".net";
		}else {
			email+=".com";
		}
		List<MemberVo> list = service.emailList(email);
		StringBuffer sb = new StringBuffer();
		sb.append("<data>");
		if(!list.isEmpty()) {
			using = true;
			sb.append("<using>" + using +"</using>");
		}
		else {
			sb.append("<using>" + using +"</using>");		
		}
		sb.append("</data>");
		return sb.toString();
	}
	
	@GetMapping(value = "/member/emailCheck/{id}/{email}", produces = "application/xml;charset=utf-8")
	@ResponseBody
	public String select(@PathVariable("id")String id, @PathVariable("email")String email) {
		boolean using = false;
		if (email.substring(email.lastIndexOf("@")).trim().equals("@daum")) {
			email+=".net";
		}else {
			email+=".com";
		}
		MemberVo vo = service.selectOne(id, email);
		StringBuffer sb = new StringBuffer();
		sb.append("<data>");
		if(vo!=null) {
			using = true;
			sb.append("<using>" + using +"</using>");
		}
		else {
			sb.append("<using>" + using +"</using>");		
		}
		sb.append("</data>");
		return sb.toString();
	}
}
