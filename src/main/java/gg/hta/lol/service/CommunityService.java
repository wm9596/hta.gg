package gg.hta.lol.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gg.hta.lol.dao.CommunityDao;
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
	public CommunityVo select(int pNum) {
		return dao.select(pNum);
	}
	public int update(CommunityVo vo) {
		return dao.update(vo);
	}
	public int delete(int pNum) {
		
		System.out.println(pNum);
		return dao.delete(pNum);
	}
	public CommunityVo next(HashMap<String, Object> map) {
		return dao.next(map);
	}
	public CommunityVo prev(HashMap<String, Object> map) {
		return dao.prev(map);
	}
	public int hit(int pNum) {
		dao.hit(pNum);
		return dao.hitCount(pNum);
	}
	public int noHit(int pNum) {
		dao.noHit(pNum);
		return dao.nohitCount(pNum);
	}
	public int addCount(int pNum) {
		return dao.addCount(pNum);
	}
	public List<CommunityVo> list(String username){
		return dao.boardList(username);
	}
	public int boardCount(String username) {
		return dao.boardCount(username);
	}
}