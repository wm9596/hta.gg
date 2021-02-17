package gg.hta.lol.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import gg.hta.lol.service.MemberService;
import gg.hta.lol.vo.MemberVo;

@Controller
public class IdCheckController {
	@Autowired MemberService service;
	@GetMapping(value = "/member/idCheck/{id}", produces = "application/xml;charset=utf-8")
	@ResponseBody
	public String select(@PathVariable("id")String id) {
		//http://localhost:9090/lol/member/idCheck/test11
		boolean using = false;
		MemberVo vo = service.selectOne(id);
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
