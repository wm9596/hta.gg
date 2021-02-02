package gg.hta.lol.member.service;

import java.util.List;

import gg.hta.lol.member.dao.MemberDao;
import gg.hta.lol.member.vo.MemberVo;

public class MemberService {
	private MemberDao dao;
	public void setDao(MemberDao dao) {
		this.dao = dao;
	}
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
