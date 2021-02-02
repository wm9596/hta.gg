package gg.hta.lol.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gg.hta.lol.member.dao.MemberDao;
import gg.hta.lol.member.vo.MemberVo;

@Service
public class MemberService {
	@Autowired private MemberDao dao;
	
	public int insert(MemberVo vo) {
		return dao.insert(vo);
	}
	public int delete(int num) {
		return dao.delete(num);
	}
	public int update(MemberVo vo) {
		return dao.update(vo);
	}
	public MemberVo selectOne(int num) {
		return dao.selectOne(num);
	}
	public List<MemberVo> selectList(){
		return dao.selectList();
	}
}
