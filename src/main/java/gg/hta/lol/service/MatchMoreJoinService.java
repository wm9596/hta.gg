package gg.hta.lol.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gg.hta.lol.dao.MatchMoreJoinDao;
import gg.hta.lol.joinvo.MatchMoreJoinVo;

@Service
public class MatchMoreJoinService {
	@Autowired MatchMoreJoinDao mDao;
	
	public List<MatchMoreJoinVo> getMatchInfoList(HashMap<String, Object> map) {
		return mDao.getMatchInfoList(map);
	}
}
