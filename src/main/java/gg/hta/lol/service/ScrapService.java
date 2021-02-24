package gg.hta.lol.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gg.hta.lol.mapper.ScrapMapper;
import gg.hta.lol.vo.ScrapVo;

@Service
public class ScrapService {
	@Autowired
	private ScrapMapper mapper;
	
	public boolean addScrap(ScrapVo vo) {
		return mapper.addScrap(vo)>0;
	}
	
	public boolean existScrap(ScrapVo vo) {
		return mapper.existScrap(vo) >0; 
	}
	
}
