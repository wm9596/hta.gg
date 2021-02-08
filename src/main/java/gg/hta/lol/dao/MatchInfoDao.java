package gg.hta.lol.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MatchInfoDao {
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "gg.hta.lol.mapper.MatchInfoMapper";
	
	public String getMatchType(String matchId) {
		return sqlSession.selectOne(NAMESPACE + ".getMatchType", matchId);
	}
}
