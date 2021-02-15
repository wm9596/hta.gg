package gg.hta.lol.controller.batting;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import gg.hta.lol.service.BattingService;
import gg.hta.lol.vo.MatchVo;

@Controller
public class BattingadminInsert {
	@Autowired
	BattingService service;

	@GetMapping(value = "/battingTeam/insert")
	public String adminInsert() {
		return "batting/teaminsert";
	}

	@GetMapping(value = "/insertTeam") // 새로운팀추가
	@ResponseBody
	public Map<String, Object> addTeam(String tname) {

		int n = service.addTeam(tname);
		System.out.println(n);
		System.out.println(tname);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("code", "success");
			return map;

		} catch (Exception ex) {
			ex.printStackTrace();
			map.put("code", "fail");
			return map;
		}
	}

	@GetMapping(value = "/listTeam", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE }) // 팀 목록 불러오기
	@ResponseBody
	public Map<String, Object> listTeam() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", service.teamlist());
		return map;
	}

	@GetMapping(value = "/insertmatch")
	@ResponseBody
	public String addbatting(MatchVo vo) { // 매치정보추가(승리팀은 업데이트형식으로)
		
		System.out.println(vo.toString()+"////////////////////////");
		service.addMatch(vo);
		return "{\"code\":\"" + vo + "\"}";
	}
	
	@GetMapping(value="/winupdate")
	@ResponseBody
	public String winUpdate(MatchVo vo) {
		service.winupdate(vo);
		
		return "{\"code\":\"" + vo + "\"}";
	}
	@GetMapping(value="/battingdeleteTeam")
	@ResponseBody
	public String deleteTeam(int tnum) {
		service.battingdeleteTeam(tnum);
		return "{\"code\":\"good \"}";
	}

}
