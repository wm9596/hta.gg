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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import gg.hta.lol.joinvo.MatchMoreJoinVo;
import gg.hta.lol.service.ChampionService;
import gg.hta.lol.service.MatchMoreJoinService;
import gg.hta.lol.service.MemberService;
import gg.hta.lol.util.PageUtil;
import gg.hta.lol.service.match.SearchService;
import gg.hta.lol.vo.CommunityVo;
import gg.hta.lol.vo.MemberVo;
import gg.hta.lol.vo.MessageVo;
import gg.hta.lol.vo.PointVo;
import gg.hta.lol.vo.QueueInfoVo;
import gg.hta.lol.vo.ReportVo;
import gg.hta.lol.vo.match.MostChampVo;
import gg.hta.lol.vo.match.SearchVo;

@Controller
public class MemberController {
	@Autowired private MemberService service;
	@Autowired private SearchService searchService;
	@Autowired private MatchMoreJoinService matchMoreJoinService;
	@Autowired private ChampionService championService;
	
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
	// ****************************************************** profile ******************************************************
	@ResponseBody
	@GetMapping("/registerProfile")
	public HashMap<String, Object> registerProfile(String snickname, Model model) {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		SearchVo searchVo = searchService.getSummoner(snickname);
		searchService.readMatchList(searchVo.getAccountId(), 0, 20,searchVo.getSnickname());
		
		QueueInfoVo soloVo = searchVo.getSolo();
		QueueInfoVo flexVo = searchVo.getFlex();
		
		List<MostChampVo> mlist = searchService.getMost(snickname);

		// championId -> championPicture 로 변경
		List<MatchMoreJoinVo> list =  matchMoreJoinService.getMatchInfoLastThree(snickname);
		int i = 0;
		for (MatchMoreJoinVo vo : list) {
			String championPicture = championService.getChampionPicture(vo.getChampionId());
			list.get(i).setChampionId(championPicture);
			i++;
		}
		
		resultMap.put("searchVo", searchVo);
		resultMap.put("soloVo", soloVo);
		resultMap.put("flexVo", flexVo);
		resultMap.put("mlist", mlist);
		resultMap.put("matchLastThree", list);
		
		return resultMap;
	}
	
	@ResponseBody
	@GetMapping("/registerProfileOk")
	public String registerProfileOk(String username, String snickname, Model model) {
		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("username", username);
		hashmap.put("snickname", snickname);
		service.updateSnickname(hashmap);
		return "";
	}
	
	@ResponseBody
	@GetMapping(value = "/checkProfile", produces = "application/text; charset=utf-8")
	public String registerProfileOk(String username, Model model) {
		String snickname = service.selectOne(username).getSnickname();
		
		return snickname;
	}
	// ****************************************************** profile ******************************************************
	
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
	@GetMapping("/member/member/pointList")
	public String pointList(@RequestParam(value = "score", defaultValue = "0")int score, @RequestParam(value="pageNum", defaultValue = "1")int pageNum, Principal principal, Model m) {
		int totalRowCount = 0;
		if(score == 1) {
			totalRowCount = service.pointPlusListCount(principal.getName());
		}else if(score == -1) {
			totalRowCount = service.pointMinusListCount(principal.getName());
		}else{
			totalRowCount = service.pointListCount(principal.getName());
		}
		PageUtil pu = new PageUtil(pageNum, 10,5,totalRowCount);
		int startRow = pu.getStartRow();
		int endRow = pu.getEndRow();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		map.put("score",score);
		map.put("username",principal.getName());
		List<PointVo> list = service.pointList(map);
		m.addAttribute("score", score);
		m.addAttribute("list", list);
		m.addAttribute("pu",pu);
		return ".mypage.pointList";
	}
	@GetMapping("/member/member/messageList")
	public ModelAndView messageList(@RequestParam(value="pageNum", defaultValue = "1")int pageNum, Principal principal) {
		int totalRowCount = service.messageListCount(principal.getName());
		PageUtil pu = new PageUtil(pageNum, 10,10,totalRowCount);
		HashMap<String, Object> map = new HashMap<String, Object>();
		int startRow = pu.getStartRow();
		int endRow = pu.getEndRow();
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		map.put("username",principal.getName());
		List<MessageVo> list = service.messageList(map);
		ModelAndView mv = new ModelAndView(".mypage.messageList");
		mv.addObject("list",list);
		mv.addObject("pu",pu);
		return mv;
	}
	@GetMapping("/member/member/scrapList")
	public String scrapList(@RequestParam(value="pageNum", defaultValue = "1")int pageNum, Principal principal, Model m) {
		int totalRowCount = service.scrapListCount(principal.getName());
		PageUtil pu = new PageUtil(pageNum, 10,5,totalRowCount);
		HashMap<String, Object> map = new HashMap<String, Object>();
		int startRow = pu.getStartRow();
		int endRow = pu.getEndRow();
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		map.put("username",principal.getName());
		List<CommunityVo> list = service.scrapList(map);
		m.addAttribute("list", list);
		m.addAttribute("pu",pu);
		return ".mypage.scrapList";
	}
	@RequestMapping("/member/admin/memberList")
	public String adminPage(@RequestParam(value="pageNum", defaultValue = "1")int pageNum, String field, String keyword, Model m) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword", keyword);
		int totalRowCount = service.count(map); 
		PageUtil pu = new PageUtil(pageNum, 10,5,totalRowCount);
		int startRow = pu.getStartRow();
		int endRow = pu.getEndRow();
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		List<MemberVo> list = service.list(map);
		m.addAttribute("list", list);
		m.addAttribute("pu",pu);
		m.addAttribute("field", field);
		m.addAttribute("keyword", keyword);
		return ".adminpage.memberList";
	}
	@GetMapping("/member/admin/report")
	public String reportPage(@RequestParam(value="pageNum", defaultValue = "1")int pageNum, Model m) {
		int totalRowCount = service.reportListCount();
		PageUtil pu = new PageUtil(pageNum, 10,5,totalRowCount);
		int startRow = pu.getStartRow();
		int endRow = pu.getEndRow();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		List<ReportVo> list = service.reportList(map);
		m.addAttribute("list", list);
		m.addAttribute("pu",pu);
		return ".adminpage.reportList";
	}
	@PostMapping("/member/admin/listDelete")
	public String listDelete(String[] mem) {		
		if(mem!=null) {
			for(int i=0 ; i<mem.length; i++) {
				service.delete(mem[i]);
			}
		}
		return "redirect:/member/admin/memberList"; 
	}
}
