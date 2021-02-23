package gg.hta.lol.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gg.hta.lol.dao.ReplyDao;
import gg.hta.lol.vo.ReplyVo;

@Service
public class ReplyService {
	@Autowired private ReplyDao dao;
	public int delete(int rNum) {
		return dao.delete(rNum);
	}
	public int insert(ReplyVo vo) {
		return dao.insert(vo);
	}
	public List<ReplyVo> list(int pNum){
		return dao.list(pNum);
	}
	public List<ReplyVo> rereList(int rNum){
		return dao.rereList(rNum);
	}
	public int update1(int pNum) {
		return dao.update1(pNum);
	}
	public int update2(int pNum) {
		return dao.update2(pNum);
	}
	public int rHit(int rNum) {
		dao.rHit(rNum);
		return dao.rHitCount(rNum);
	}
	public int rNohit(int rNum) {
		dao.rNohit(rNum);
		return dao.rNohitCount(rNum);
	}
	
	public int replyCount(String username) {
		return dao.replyCount(username);
	}
	public List<ReplyVo> replyList(HashMap<String, Object> map){
		return dao.replyList(map);
	}
}