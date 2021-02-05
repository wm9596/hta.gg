package gg.hta.lol.mapper;

import gg.hta.lol.vo.ChampionVo;

public interface ChampionMapper {
	
	public int addChampion(ChampionVo vo);
	
	public int deleteAllChampion();
}
