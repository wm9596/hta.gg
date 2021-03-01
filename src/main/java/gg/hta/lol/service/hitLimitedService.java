package gg.hta.lol.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gg.hta.lol.dao.hitLimitedDao;
import gg.hta.lol.vo.hitLimitedVo;

@Service
public class hitLimitedService {
	@Autowired private hitLimitedDao dao;
	public int insert(hitLimitedVo vo) {
		if(dao.hitLimited(vo) > 0) {
			return -99;
		}
		
		return dao.hitLimitedInsert(vo);
	}
//	public int hitLimited(hitLimitedVo vo) {
//		return dao.hitLimited(vo);
//	}
}