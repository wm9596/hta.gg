package gg.hta.lol.mapper;

import java.util.List;

import org.springframework.dao.DuplicateKeyException;

import gg.hta.lol.vo.MatchinfoVo;
import gg.hta.lol.vo.TeamInfoVo;

public interface TeamInfoMapper {
	
	public int addTeaminfo(List<TeamInfoVo> vo);
	
}
