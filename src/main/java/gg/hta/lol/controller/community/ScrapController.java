package gg.hta.lol.controller.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import gg.hta.lol.service.ScrapService;
import gg.hta.lol.vo.ScrapVo;

@Controller
public class ScrapController {
	@Autowired
	private ScrapService service;
	
	@GetMapping(value = "/scrap/add/{pnum}/{name}",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public boolean addScrap(@PathVariable("pnum")int pnum,@PathVariable("name")String name) {
		ScrapVo vo = new ScrapVo(0, pnum, name);
		
		if(service.existScrap(vo)) {
			return false;
		}
		
		return service.addScrap(vo);
	}
	
}
