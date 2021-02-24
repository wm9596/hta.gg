package gg.hta.lol.mapper;

import java.util.List;

import gg.hta.lol.vo.ScrapVo;

public interface ScrapMapper {
	
	public int addScrap(ScrapVo vo);
	
	public int existScrap(ScrapVo vo);
}
