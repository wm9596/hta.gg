package gg.hta.lol.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gg.hta.lol.dao.RatingDao;

@Service
public class RatingService {
	@Autowired
	private RatingDao rDao;
	
	public double getRatingAvg(String snickname) {
		return rDao.getRatingAvg(snickname);
	}
	
	public int addRating(HashMap<String, Object> map) {
		return rDao.addRating(map);
	}
}
