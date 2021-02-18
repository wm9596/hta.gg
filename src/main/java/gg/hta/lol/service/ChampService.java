package gg.hta.lol.service;

import java.util.List;

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
}
