package gg.hta.lol.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gg.hta.lol.dao.BattingDao;
import gg.hta.lol.vo.BattingTeamInfoVo;
import gg.hta.lol.vo.MatchVo;

@Service
public class BattingService {
	@Autowired BattingDao dao;
	public int addTeam(String tname) {
		return dao.AddTeam(tname);
	}
	public List<BattingTeamInfoVo> teamlist(){
		return dao.teamlist();
	}
	public int addMatch(MatchVo vo) {
		return dao.AddMatch(vo);
	}
	public List<HashMap<String, Object>> matchinfo(String mDate){
		return dao.matchinfo(mDate);
	}
	public HashMap<String, Object> teamName(int mnum3){
		return dao.teamName(mnum3);
	}
	public List<String> teamName2(int mnum3){
		return dao.teamName2(mnum3);
	}

}
