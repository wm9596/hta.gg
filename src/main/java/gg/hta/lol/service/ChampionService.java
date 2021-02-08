package gg.hta.lol.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gg.hta.lol.dao.ChampionDao;

@Service
public class ChampionService {
	@Autowired
	private ChampionDao cDao;
	
	public String getChampionPicture(String championid) {
		return cDao.getChampionPicture(championid);
	}
}
