package gg.hta.lol.controller.community;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import gg.hta.lol.service.CommunityService;
import gg.hta.lol.service.ReplyService;
import gg.hta.lol.service.ReportService;
import gg.hta.lol.vo.CommunityVo;
import gg.hta.lol.vo.ReplyVo;
import gg.hta.lol.vo.ReportVo;
import oracle.jdbc.proxy.annotation.Post;

@Controller
public class DetailController {
	@Autowired private CommunityService service;
	@Autowired private ReportService reportService;
	
	@GetMapping("/community/detailMy")
	public String detailMy(int pNum, Model m) {
		CommunityVo vo=service.select(pNum);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("pNum",pNum);
		map.put("cNum",vo.getcNum());
		CommunityVo prev=service.prev(map);
		CommunityVo next=service.next(map);
		service.addCount(pNum);
		String content=vo.getContent();
		content=content.replaceAll("\n","<br>");
		vo.setContent(content);
		m.addAttribute("vo", vo);
		m.addAttribute("prev",prev);
		m.addAttribute("next",next);
		return ".header2.community.detail";
	}
	
	
	
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
	public List<ReplyVo> select(@PathVariable("pNum")int pNum) {
		
		System.out.println("==========================");
		List<ReplyVo> list = service1.list(pNum);
		return list;
	}
	
	@GetMapping(value = "/rereply/{rNum}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<ReplyVo>> selectReRe(@PathVariable("rNum")int rNum) {
		
		System.out.println("==========================");
		List<ReplyVo> list = service1.rereList(rNum);
		System.out.println(list);
		return new ResponseEntity<List<ReplyVo>>(list, list.size()>0?HttpStatus.OK:HttpStatus.NOT_FOUND);
	}

	@GetMapping(value = "/insert/{pNum}/{rWriter}/{rContent}", produces = "application/xml;charset=utf-8")
	@ResponseBody
	public String insert(@PathVariable("pNum")int pNum,@PathVariable("rWriter")String rWriter,@PathVariable("rContent")String rContent) {
		int n = service1.insert(new ReplyVo(0, pNum, 0, rWriter, rContent, null));
		int n1 = service1.update1(pNum);
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

	@GetMapping(value = "/delete/{rNum}/{pNum}", produces = "application/xml;charset=utf-8")
	@ResponseBody
	public String delete(@PathVariable("rNum")int rNum,@PathVariable("pNum")int pNum) {
		int n1 = service1.update2(pNum);
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
	
	@GetMapping(value = "/update/{pNum}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public int update(@PathVariable("pNum")int pNum) {
		return service.hit(pNum);
	}
	
	@GetMapping(value = "/update1/{pNum}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public int update1(@PathVariable("pNum")int pNum) {
		return service.noHit(pNum);
	}
	
	@GetMapping(value = "/reHitUpdate/{rNum}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public int update3(@PathVariable("rNum")int rNum) {
		System.out.println("�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�");
		return service1.rHit(rNum);
	}
	
	@GetMapping(value = "/reNohitUpdate/{rNum}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public int update4(@PathVariable("rNum")int rNum) {
		System.out.println("�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�");
		return service1.rNohit(rNum);
	}
	
	@GetMapping(value = "/reportPage")
	public String reportPage(int pNum, String username, Model model) {
		model.addAttribute("pNum", pNum);
		model.addAttribute("username", username);
		return "/community/reportPage";
	}
	
	@GetMapping(value = "/reportCheck", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Boolean reportCheck(int pNum, String username) {
		HashMap<String, Object> reportMap = new HashMap<String, Object>();
		reportMap.put("pNum", pNum);
		reportMap.put("username", username);
		ReportVo checkVo = reportService.checkReport(reportMap);
		if (checkVo == null) {
			return false;
		} else {
			return true;
		}
	}
	
	@PostMapping(value = "/report", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Boolean report(HttpServletRequest req) { // int pNum, String username, String detail
		HashMap<String, Object> reportMap = new HashMap<String, Object>();
		reportMap.put("pNum", req.getParameter("pNum"));
		reportMap.put("username", req.getParameter("username"));
		reportMap.put("detail", req.getParameter("detail"));
		int result = reportService.report(reportMap);
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}
}