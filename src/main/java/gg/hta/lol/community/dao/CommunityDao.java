package gg.hta.lol.community.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gg.hta.lol.vo.CommunityVo;

@Repository
public class CommunityDao {
	@Autowired private SqlSession sqlSession;
	private static String NAMESPACE="gg.hta.lol.mapper.CommunityMapper";
	public int insert(CommunityVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}
	public int count(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + ".count", map);
	}
	public List<CommunityVo> list(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".list",map);
	}
	public int delete(int num) {
		return sqlSession.delete(NAMESPACE+".delete",num);
	}
	public int update(CommunityVo vo) {
		return sqlSession.update(NAMESPACE+".update",vo);
	}
	public CommunityVo select(int num) {
		return sqlSession.selectOne(NAMESPACE +".select",num);
	}
	public CommunityVo next(int num) {
		return sqlSession.selectOne(NAMESPACE +".next",num);
	}
	public CommunityVo prev(int num) {
		return sqlSession.selectOne(NAMESPACE +".prev",num);
	}
	public int addHit(int num) {
		return sqlSession.update(NAMESPACE+".pHit",num);
	}
	public int noHit(int num) {
		return sqlSession.update(NAMESPACE+".noHit",num);
	}
}