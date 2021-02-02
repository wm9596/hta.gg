package gg.hta.lol.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import gg.hta.lol.dao.MemberDao;
import gg.hta.lol.vo.AuthoritiesVo;
import gg.hta.lol.vo.MemberVo;

@Service
public class MemberService {
	//@Autowired private PasswordEncoder encoder;
	@Autowired private MemberDao dao;
	
	public int insert(MemberVo vo) {
//		String password = vo.getPassword();
//		vo.setPassword(encoder.encode(password));
//		dao.insert(vo);
//		AuthoritiesVo avo = new AuthoritiesVo();
//		avo.setUsername(vo.getUsername());
//		if(vo.getUsername().equals("admin")) {
//			avo.setAuthority("ROLE_ADMIN");
//		}else {
//			avo.setAuthority("ROLE_MEMBER");
//		}
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("username",vo.getUsername());
//		map.put("authority",avo.getAuthority());
//		dao.insertAuth(map);
		return 1;
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
