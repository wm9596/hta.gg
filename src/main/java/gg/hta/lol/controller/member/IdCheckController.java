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
public class IdCheckController {
	@Autowired MemberService service;
	@GetMapping(value = "/member/idCheck/{id}", produces = "application/xml;charset=utf-8")
	@ResponseBody
	public String select(@PathVariable("id")String id) {
		//http://localhost:9090/lol/member/idCheck/test11 ==> Å×½ºÆ®
		boolean using = false;
		
		List<MemberVo> list = service.list();
		StringBuffer sb = new StringBuffer();
		sb.append("<data>");
		for(MemberVo vo:list) {
			if(id.equals(vo.getUsername())) {
				using = true;
				sb.append("<using>" + using +"</using>");
				sb.append("</data>");
				return sb.toString();
			}
//			else {
//				sb.append("<using>" + using +"</using>");		
//			}
		}
		sb.append("</data>");
		return sb.toString();
	}
}
