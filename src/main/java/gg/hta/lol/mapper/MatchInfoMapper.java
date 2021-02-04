package gg.hta.lol.mapper;

import java.sql.BatchUpdateException;

import org.springframework.dao.DuplicateKeyException;

import gg.hta.lol.vo.MatchinfoVo;

public interface MatchInfoMapper {
	
	public int addMatchinfo(MatchinfoVo vo) throws DuplicateKeyException;
}
