package gg.hta.lol.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gg.hta.lol.dao.ChampDao;
import gg.hta.lol.vo.ChampionVo;

@Service
public class ChampService {
	@Autowired  ChampDao dao;
	public int insertChamp(ChampionVo vo) {
		return dao.insertChamp(vo);
	}
	public int deleteChamp() {
		return dao.deleteChamp();
	}
	public List<ChampionVo> ChampAll_List(){
		return dao.ChampAll_List();
	}
	public ChampionVo selectList(int championid) {
		return dao.selectList(championid);
	}
	public int matchCount(int championid) {
		return dao.matchCount(championid);
	}
	public int banCount(int championid) {
		return dao.banCount(championid);
	}
	public int wincount(int championid) {
		return dao.wincount(championid);
	}public Map<String, Object> allCount(int championid){
		return dao.allCount(championid);
	}
	public Map<String,Object> maxCount(int championid){
		return dao.maxCount(championid);
	}
}
