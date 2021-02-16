package gg.hta.lol.mapper;

import java.util.List;

import gg.hta.lol.vo.SummonerVo;
import gg.hta.lol.vo.match.MostChampVo;
import gg.hta.lol.vo.match.SearchVo;

public interface SummonerMapper {
	
	public int addSummoner(SummonerVo vo);
	
	public int updateSummoner(SummonerVo vo);
	
	public SearchVo getSummonerInfo(String name);
	
	public List<MostChampVo> getMostChamp(String sname);
}
