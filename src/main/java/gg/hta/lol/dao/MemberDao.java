package gg.hta.lol.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gg.hta.lol.security.CustomUserDetail;
import gg.hta.lol.vo.AuthVo;
import gg.hta.lol.vo.AuthoritiesVo;
import gg.hta.lol.vo.MemberVo;
import gg.hta.lol.vo.PointVo;

@Repository
public class MemberDao {
	@Autowired private SqlSession sqlSession;
	public final String NAMESPACE = "gg.hta.lol.mapper.MemberMapper";
	public int insert(AuthVo vo) {
		return sqlSession.insert(NAMESPACE + ".code_add", vo);
	}
	public int insert(MemberVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert",vo);
	}
	public int insert(AuthoritiesVo vo) {
		return sqlSession.insert(NAMESPACE + ".auth_add", vo);
	}
	public int updatePwd(HashMap<String, Object> map) {
		return sqlSession.update(NAMESPACE + ".updatePwd", map); 
	}
	public MemberVo selectOne(String username) {
		return sqlSession.selectOne(NAMESPACE + ".select", username); 
	}
	public MemberVo selectOne(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + ".PwdEmailselect", map); 
	}
	public List<MemberVo> emailList(String email) {
		return sqlSession.selectList(NAMESPACE + ".Emailselect", email); 
	}
	public int authUpdate(AuthVo vo) {
		return sqlSession.update(NAMESPACE + ".AuthUpdate", vo);
	}
	public CustomUserDetail getAuthsList(String username){
		return sqlSession.selectOne(NAMESPACE + ".getAuths", username);
	}
	public int AuthDelte(String username) {
		return sqlSession.delete(NAMESPACE + ".AuthDelete",username);
	}
	public AuthVo selectAuth(String username) {
		return sqlSession.selectOne(NAMESPACE + ".AuthSelect", username);
	}
	public AuthVo EmailselectAuth(String email) {
		return sqlSession.selectOne(NAMESPACE + ".EmailAuthSelect", email);
	}
	public int update(MemberVo vo) {
		return sqlSession.update(NAMESPACE + ".update", vo);
	}
	public int updateSnickname(HashMap<String, String> hashmap) {
		return sqlSession.update(NAMESPACE + ".updateSnickname", hashmap);
	}
	public int delete(String username) {
		return sqlSession.update(NAMESPACE + ".delete",username); 
	}
	public int count(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + ".count",map);
	}
	public List<MemberVo> list(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE + ".list",map);
	}
	public int pointListCount(String username) {
		return sqlSession.selectOne(NAMESPACE + ".pointListCount", username);
	}
	public int pointPlusListCount(String username) {
		return sqlSession.selectOne(NAMESPACE + ".pointPlusListCount", username);
	}
	public int pointMinusListCount(String username) {
		return sqlSession.selectOne(NAMESPACE + ".pointMinusListCount", username);
	}
	public List<PointVo> pointList(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE + ".pointList",map);
	}
}