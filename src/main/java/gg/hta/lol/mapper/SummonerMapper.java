package gg.hta.lol.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.ExecutorType;

import gg.hta.lol.vo.SummonerVo;

public interface SummonerMapper {
	
	public int addSummoner(SummonerVo vo);
	
	public int updateSummoner(SummonerVo vo);
	
}
