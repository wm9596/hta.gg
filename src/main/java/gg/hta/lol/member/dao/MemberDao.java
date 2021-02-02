package gg.hta.lol.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import gg.hta.lol.member.vo.MemberVo;

public class MemberDao {
	private SqlSessionTemplate sqlSession;
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	public final String NAMESPACE = "gg.hta.mybatis.mapper.MemberMapper";
	
	public int insert(MemberVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert",vo);
	}
	
	public int delete(int num) {
		return sqlSession.delete(NAMESPACE + ".delete",num); 
	}
	
	public int update(MemberVo vo) {
		return sqlSession.update(NAMESPACE + ".update", vo); 
	}
	
	public MemberVo selectOne(int num) {
		return sqlSession.selectOne(NAMESPACE + ".select", num); 
	}
	
	public List<MemberVo> selectList(){
		return sqlSession.selectList(NAMESPACE + ".list"); 
	}
}
