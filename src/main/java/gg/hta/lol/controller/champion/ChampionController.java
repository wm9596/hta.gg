package gg.hta.lol.controller.champion;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import gg.hta.lol.service.ChampService;
import gg.hta.lol.vo.ChampionVo;


@Controller
public class ChampionController {
	@Autowired ChampService service;
	@GetMapping(value="/champ/ChampInsert")
	public String ChmapList() {
		return "champ/ChampInsert";
	}

	@ResponseBody
	@PostMapping(value="champ/ChampInsert2" ,produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public String ChamInsert2(ChampionVo vo) {
		System.out.println(vo.toString());
	
		service.insertChamp(vo);
		return "{\"code\":\"" + vo + "\"}";
	}
	@ResponseBody
	@GetMapping(value="/champ/ChampDelete" )
	public String ChampDelete() {
		
		service.deleteChamp();
		
		return "{\"code\":\"dd\"}";
	}
	@GetMapping(value="/champ/ChampList1")
	public String ChampList() {
		return "champ/ChampList";
	}
	
	@ResponseBody
	@GetMapping(value="/champ/ChampList",produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public Map<String,Object> ChampAll_List() {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("map",service.ChampAll_List());

		return map;
		
	}
	
	@GetMapping(value="/champ/selectList{championid}")
	public String selectList(int championid,Model mv) {
		mv.addAttribute("championid",championid);
		return "champ/selectList";
	}
	
	@ResponseBody
	@GetMapping(value="/champ/selectList1")
	public ChampionVo selectList1(int championid) {
		System.out.println(championid);
		service.selectList(championid);
	
		return service.selectList(championid);
	}
	
}
