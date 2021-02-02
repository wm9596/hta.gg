package gg.hta.lol.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import gg.hta.lol.dao.MemberDao;
import gg.hta.lol.vo.MemberVo;

@Service
public class MemberService {
	@Autowired private PasswordEncoder encoder;
	@Autowired private MemberDao dao;
	
	public int insert(MemberVo vo) {
		String password = vo.getPassword();
		//vo.setPassword(encoder.encode(password));
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
