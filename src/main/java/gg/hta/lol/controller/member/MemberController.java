package gg.hta.lol.controller.member;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import gg.hta.lol.service.MemberService;
import gg.hta.lol.service.QueueInfoService;
import gg.hta.lol.service.match.SearchService;
import gg.hta.lol.vo.MemberVo;
import gg.hta.lol.vo.QueueInfoVo;
import gg.hta.lol.vo.match.MostChampVo;
import gg.hta.lol.vo.match.SearchVo;

@Controller
public class MemberController {
	@Autowired private MemberService service;
	@Autowired private SearchService searchService;
	@Autowired private QueueInfoService queueInfoService;
	
	@RequestMapping(value="/member/join", method = RequestMethod.GET)
	public String joinForm() {
		return ".header2.member.join";
	}
	@RequestMapping(value="/member/join", method = RequestMethod.POST)
	public String join(MemberVo vo) {
		int n = service.insert(vo);
		if(n>0) {
			return ".header2.member.login";
		}else {
			return ".header2.member.error";
		}
	}
	@GetMapping("/member/member/info")
	public String myPage(Principal principal, Model m) {
		MemberVo vo = service.selectOne(principal.getName());
		m.addAttribute("vo", vo);
		return ".mypage.info";
	}
	@PostMapping(value = "/member/update")
	public String update(MemberVo vo, Principal principal, Model m) {
		int n = service.update(vo);
		if(n>0) {
			vo = service.selectOne(principal.getName());
			m.addAttribute("vo", vo);
			return ".mypage.info";
		}else {
			return ".header2.member.error";
		}
	}
	@GetMapping("/member/member/profile")
	public String myPage() {
		return ".mypage.profile";
	}
	
	@ResponseBody
	@GetMapping("/member/member/registerProfile")
	public HashMap<String, Object> registerProfile(String snickname, Model model) {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		SearchVo searchVo = searchService.getSummoner(snickname);
		searchService.readMatchList(searchVo.getAccountId(), 1, 3);
		
		QueueInfoVo soloVo = searchVo.getSolo();
		QueueInfoVo flexVo = searchVo.getFlex();
		
		List<MostChampVo> mlist = searchService.getMost(snickname);
		
		mlist.stream().forEach(item -> {
			if(item.getName().length()>5) {
				int diff = item.getName().length()-(item.getName().length()-5);
				item.setName(item.getName().substring(0, diff).concat("..."));
			}
		});
		
		resultMap.put("searchVo", searchVo);
		resultMap.put("soloVo", soloVo);
		resultMap.put("flexVo", flexVo);
		resultMap.put("mlist", mlist);
		
		return resultMap;
	}
	
	@GetMapping(value = "/member/member/delete", produces = {MediaType.APPLICATION_XML_VALUE})
	@ResponseBody
	public String delete(Principal principal) {
		StringBuffer sb = new StringBuffer();
		try {
			service.delete(principal.getName());
			sb.append("<data>");
				sb.append("<result>success</result>");
			sb.append("</data>");
			return sb.toString();
		}catch (Exception e) {
			e.printStackTrace();
			sb.append("<data>");
				sb.append("<result>fail</code>");
			sb.append("</data>");
			return sb.toString();
		}
	}
	@GetMapping("/member/admin/memberList")
	public String adminPage() {
		return ".adminpage.memberList";
	}
}
