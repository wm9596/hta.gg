package gg.hta.lol.service.match;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gg.hta.lol.mapper.MatchInfoMapper;
import gg.hta.lol.vo.match.MatchListVo;
import gg.hta.lol.vo.match.ParticipantsVo;

@Service
public class MatchListService {
	@Autowired
	private MatchInfoMapper matchinfoMapper;
	
	public List<MatchListVo> getMatchList(String name,String type) {
		List<MatchListVo> list = matchinfoMapper.getMatchInfoList(name,type);
		List<ParticipantsVo> plist = matchinfoMapper.getParticipants(list.stream().map(MatchListVo::getMatchid).collect(Collectors.toList()));
		
		for (MatchListVo vo : list) {
			vo.setFriendly(plist.stream().filter(item -> {
				return item.getMatchid().equals(vo.getMatchid()) && item.getTeamid().equals(vo.getTeamid());
			}).collect(Collectors.toList()));
			vo.setEnemy(plist.stream().filter(item -> {
				return item.getMatchid().equals(vo.getMatchid()) && !item.getTeamid().equals(vo.getTeamid());
			}).collect(Collectors.toList()));
		}
		
		return list;
	}
}
