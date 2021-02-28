package gg.hta.lol.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import gg.hta.lol.dao.MemberDao;
import gg.hta.lol.dao.VisitCountDao;
import gg.hta.lol.security.CustomUserDetail;
import gg.hta.lol.vo.AuthoritiesVo;
import gg.hta.lol.vo.CommunityVo;
import gg.hta.lol.vo.MemberVo;
import gg.hta.lol.vo.MessageVo;
import gg.hta.lol.vo.PointVo;
import gg.hta.lol.vo.ReportVo;
import gg.hta.lol.vo.VisitVo;

@Service
public class MemberService {
	@Autowired private PasswordEncoder encoder;
	@Autowired private MemberDao dao;
	@Autowired private VisitCountDao vdao;
	public int insert(MemberVo vo) {
		String password = vo.getPassword();
		vo.setPassword(encoder.encode(password));
		dao.insert(vo);
		AuthoritiesVo avo = new AuthoritiesVo();
		avo.setUsername(vo.getUsername());
		if(vo.getUsername().equals("admin")) {
			avo.setAuthority("ROLE_ADMIN");
		}else {
			avo.setAuthority("ROLE_MEMBER");
		}
		dao.insert(avo);
		return 1;
	}
	public CustomUserDetail userDetail(String username) {
		return dao.getAuthsList(username);
	}
	public int updatePwd(String username, String password) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		password = encoder.encode(password);
		map.put("username", username);
		map.put("password", password);
		return dao.updatePwd(map);
	}
	public MemberVo selectOne(String username) {
		return dao.selectOne(username);
	}
	public List<MemberVo> list(HashMap<String, Object> map){
		return dao.list(map);
	}
	public List<MemberVo> emailList(String email) {
		return dao.emailList(email);
	}
	public MemberVo selectOne(String username,String email) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("username", username);
		map.put("email", email);
		return dao.selectOne(map);
	}
	public int update(MemberVo vo) {
		vo.setPassword(encoder.encode(vo.getPassword()));
		return dao.update(vo);
	}
	public int updateSnickname(HashMap<String, String> hashmap) {
		return dao.updateSnickname(hashmap);
	}
	public int delete(String username) {
		return dao.delete(username);
	}
	public int count(HashMap<String, Object> map) {
		return dao.count(map);
	}
	public int pointListCount(String username){
		return dao.pointListCount(username);
	}
	public int pointPlusListCount(String username){
		return dao.pointPlusListCount(username);
	}
	public int pointMinusListCount(String username){
		return dao.pointMinusListCount(username);
	}
	public List<PointVo> pointList(HashMap<String, Object> map){
		return dao.pointList(map);
	}
	public List<VisitVo> visitList(){
		return vdao.visitList();
	}
	public int visitListCount() {
		return vdao.visitListCount();
	}
	public int reportListCount() {
		return dao.reportListCount();
	}
	public List<ReportVo> reportList(HashMap<String, Object> map){
		return dao.reportList(map);
	}
	public int messageListCount(String username) {
		return dao.messageListCount(username);
	}
	public List<MessageVo> messageList(HashMap<String, Object> map){
		return dao.messageList(map);
	}
	public int scrapListCount(String username) {
		return dao.scrapListCount(username);
	}
	public List<CommunityVo> scrapList(HashMap<String, Object> map){
		return dao.scrapList(map);
	}
}
