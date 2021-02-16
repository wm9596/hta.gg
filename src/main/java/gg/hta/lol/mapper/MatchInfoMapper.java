package gg.hta.lol.mapper;

import java.sql.BatchUpdateException;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DuplicateKeyException;

import gg.hta.lol.vo.MatchinfoVo;
import gg.hta.lol.vo.match.MatchListVo;
import gg.hta.lol.vo.match.ParticipantsVo;

public interface MatchInfoMapper {
	
	public int addMatchinfo(MatchinfoVo vo);
	
	public List<MatchListVo> getMatchInfoList(@Param("snickname")String nickname,@Param("type")String type);
	
	public List<ParticipantsVo> getParticipants(List<String> nicknames);
}
