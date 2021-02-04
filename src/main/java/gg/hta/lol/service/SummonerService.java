package gg.hta.lol.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gg.hta.lol.dao.SummonerDao;
import gg.hta.lol.vo.SummonerVo;

@Service
public class SummonerService {
	@Autowired
	private SummonerDao sDao;
	
	public SummonerVo getSummoner(String nickname) {
		return sDao.getSummoner(nickname);
	}
}
