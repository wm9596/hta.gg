package gg.hta.lol.mapper;

import java.util.List;

import gg.hta.lol.vo.SummonerVo;

public interface SummonerMapper {
	
	public int addSummoner(SummonerVo vo);
	
	public List<SummonerVo> list();
}
