package gg.hta.lol.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RatingDao {
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "gg.hta.lol.mapper.RatingMapper";
	
	public double getRatingAvg(String snickname) {
		return sqlSession.selectOne(NAMESPACE + ".getRatingAvg", snickname);
	}
	
	public int addRating (HashMap<String, Object> map) {
		return sqlSession.insert(NAMESPACE + ".addRating", map);
	}
	
	public int getRatingCnt(String snickname) {
		return sqlSession.selectOne(NAMESPACE + ".getRatingCnt", snickname);
	}
}
