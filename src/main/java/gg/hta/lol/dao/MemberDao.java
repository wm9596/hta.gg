package gg.hta.lol.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gg.hta.lol.security.CustomUserDetail;
import gg.hta.lol.vo.AuthVo;
import gg.hta.lol.vo.AuthoritiesVo;
import gg.hta.lol.vo.MemberVo;

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
	public int delete(int num) {
		return sqlSession.delete(NAMESPACE + ".delete",num); 
	}
	
	public int update(MemberVo vo) {
		return sqlSession.update(NAMESPACE + ".update", vo); 
	}
	
	public MemberVo selectOne(String username) {
		return sqlSession.selectOne(NAMESPACE + ".select", username); 
	}
	
	public List<MemberVo> selectList(){
		return sqlSession.selectList(NAMESPACE + ".list"); 
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
}