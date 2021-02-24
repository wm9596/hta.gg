package gg.hta.lol.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import gg.hta.lol.vo.MatchinfoVo;
import gg.hta.lol.vo.match.MatchInfosWrapper;
import gg.hta.lol.vo.match.MatchListVo;
import gg.hta.lol.vo.match.ParticipantsVo;

public interface MatchInfoMapper {
	
	public int addMatchinfo(List<MatchInfosWrapper> mlist);
	
	public List<MatchListVo> getMatchInfoList(@Param("snickname")String nickname,@Param("type")String type);
	
	public List<ParticipantsVo> getParticipants(List<String> nicknames);
	
	public List<String> getMatchList(String snickname);
}
