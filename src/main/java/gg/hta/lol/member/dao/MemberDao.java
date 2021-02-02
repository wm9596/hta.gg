package gg.hta.lol.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gg.hta.lol.member.vo.MemberVo;

@Repository
public class MemberDao {
	@Autowired private SqlSessionTemplate sqlSession;
	
	public final String NAMESPACE = "gg.hta.lol.mapper.MemberMapper";
	
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
