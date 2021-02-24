package gg.hta.lol.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import gg.hta.lol.vo.SummonerVo;
import gg.hta.lol.vo.match.MostChampVo;
import gg.hta.lol.vo.match.SearchVo;
import gg.hta.lol.vo.match.WinCountVo;

public interface SummonerMapper {
	
	public int addSummoner(SummonerVo vo);
	
	public int addSummonerList(List<SummonerVo> list);
	
	public int updateSummoner(SummonerVo vo);
	
	public SearchVo getSummonerInfo(String name);
	
	public List<MostChampVo> getChampLog(String sname);
	
	public List<WinCountVo> getChampWinCnt(@Param("snickname") String snickname,@Param("list") List<MostChampVo> list );
}
