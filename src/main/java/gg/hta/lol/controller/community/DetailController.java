package gg.hta.lol.controller.community;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import gg.hta.lol.service.CommunityService;
import gg.hta.lol.service.ReplyService;
import gg.hta.lol.vo.CommunityVo;
import gg.hta.lol.vo.ReplyVo;

@Controller
public class DetailController {
	@Autowired private CommunityService service;
	
	@GetMapping("/community/detail")
	public ModelAndView detail(int pNum, int cNum) {
		ModelAndView mv=new ModelAndView(".header2.community.detail");
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("pNum",pNum);
		map.put("cNum",cNum);
		
		
		CommunityVo vo=service.select(pNum);
		CommunityVo prev=service.prev(map);
		CommunityVo next=service.next(map);
		service.addCount(pNum);
		
		String content=vo.getContent();
		content=content.replaceAll("\n","<br>");
		vo.setContent(content);
		
		mv.addObject("vo",vo);
		mv.addObject("prev",prev);
		mv.addObject("next",next);
		
		return mv;
		
	}
	
	@Autowired ReplyService service1;
	@GetMapping(value = "/reply/{pNum}", produces = "application/xml;charset=utf-8")
	@ResponseBody
	public String select(@PathVariable("pNum")int pNum) {
		
		System.out.println("==========================");
		List<ReplyVo> list = service1.list(pNum);
		StringBuffer sb = new StringBuffer();
		sb.append("<contents>");
		for(ReplyVo vo:list) {
			sb.append("<content>");
			sb.append("<rNum>"+vo.getrNum()+"</rNum>");
			sb.append("<pNum>"+vo.getpNum()+"</pNum>");
			sb.append("<rWriter>"+vo.getrWriter()+"</rWriter>");
			sb.append("<regdate>"+vo.getRegdate()+"</regdate>");
			sb.append("<rContent>"+vo.getrContent()+"</rContent>");
			sb.append("</content>");
		}
		sb.append("</contents>");
		
		return sb.toString();
	}

	@GetMapping(value = "/insert/{pNum}/{rWriter}/{rContent}", produces = "application/xml;charset=utf-8")
	@ResponseBody
	public String insert(@PathVariable("pNum")int pNum,@PathVariable("rWriter")String rWriter,@PathVariable("rContent")String rContent) {
		int n = service1.insert(new ReplyVo(0, pNum, 0, rWriter, rContent, null));
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

	@GetMapping(value = "/delete/{rNum}", produces = "application/xml;charset=utf-8")
	@ResponseBody
	public String delete(@PathVariable("rNum")int rNum) {
		int n = service1.delete(rNum);
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