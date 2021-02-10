package gg.hta.lol.controller.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import gg.hta.lol.service.CommunityService;

@Controller
public class DeleteController {
	@Autowired CommunityService service;
	
	
	@GetMapping(value="/community/delete/{pNum}", produces = "application/xml;charset=utf-8")
	@ResponseBody
	public String delete(@PathVariable("pNum")int pNum) {
		int n = service.delete(pNum);
		StringBuffer sb = new StringBuffer();
		sb.append("<result>");
		try {
			sb.append("<code>success</code>");
		}catch(Exception e) {
			e.printStackTrace();
			sb.append("<code>fail</code>");
		}
		sb.append("</result>");
		return sb.toString();
	}
}