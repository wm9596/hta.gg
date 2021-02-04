package gg.hta.lol.mapper;

import org.springframework.dao.DuplicateKeyException;

import gg.hta.lol.vo.SummonerVo;

public interface SummonerMapper {
	
	public int addSummoner(SummonerVo vo) throws DuplicateKeyException;
	
}
