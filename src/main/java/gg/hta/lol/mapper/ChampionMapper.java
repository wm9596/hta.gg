package gg.hta.lol.mapper;

import java.util.List;

import gg.hta.lol.vo.ChampionVo;

public interface ChampionMapper {
	
	public int addChampion(ChampionVo vo);
	
	public int deleteAllChampion();
	
	public int updateWin(List<String> list);
	
	public int updateLose(List<String> list);
	
	public int updateBan(List<String> championId);
	
}
