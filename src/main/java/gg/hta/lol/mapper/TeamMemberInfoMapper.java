package gg.hta.lol.mapper;

import org.springframework.dao.DuplicateKeyException;

import gg.hta.lol.vo.MatchinfoVo;
import gg.hta.lol.vo.TeamInfoVo;
import gg.hta.lol.vo.TeamMemberinfoVo;

public interface TeamMemberInfoMapper {
	
	public int addTeamMemberInfo(TeamMemberinfoVo vo);
	
}
