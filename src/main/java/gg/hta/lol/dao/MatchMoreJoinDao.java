package gg.hta.lol.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gg.hta.lol.joinvo.MatchMoreJoinVo;

@Repository
public class MatchMoreJoinDao {
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "gg.hta.lol.mapper.MatchMoreJoinMapper";
	
	public List<MatchMoreJoinVo> getMatchInfoList(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".getMatchInfoList", map);
	}
}
