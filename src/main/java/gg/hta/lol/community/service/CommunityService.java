package gg.hta.lol.community.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gg.hta.lol.community.dao.CommunityDao;
import gg.hta.lol.vo.CommunityVo;

@Service
public class CommunityService {
	@Autowired private CommunityDao dao;
	public int insert(CommunityVo vo) {
		return dao.insert(vo);
	}
	public int count(HashMap<String,Object> map) {
		return dao.count(map);
	}
	public List<CommunityVo> list(HashMap<String,Object> map){
		return dao.list(map);
	}
	public CommunityVo select(int num) {
		return dao.select(num);
	}
	public int update(CommunityVo vo) {
		return dao.update(vo);
	}
	public int delete(int num) {
		return dao.delete(num);
	}
	public CommunityVo next(int num) {
		return dao.next(num);
	}
	public CommunityVo prev(int num) {
		return dao.prev(num);
	}
	public int addHit(int num) {
		return dao.addHit(num);
	}
	public int noHit(int num) {
		return dao.noHit(num);
	}
}