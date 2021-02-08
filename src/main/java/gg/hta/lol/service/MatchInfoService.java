package gg.hta.lol.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gg.hta.lol.dao.MatchInfoDao;

@Service
public class MatchInfoService {
	@Autowired
	private MatchInfoDao mDao;
	
	public String getMatchType(String matchId) {
		return mDao.getMatchType(matchId);
	}
}
