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
	public CommunityVo next(int pNum) {
		return dao.next(pNum);
	}
	public CommunityVo prev(int pNum) {
		return dao.prev(pNum);
	}
	public int hit(int pNum) {
		return dao.hit(pNum);
	}
	public int noHit(int pNum) {
		return dao.noHit(pNum);
	}
	public int addCount(int pNum) {
		return dao.addCount(pNum);
	}
}