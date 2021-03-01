package gg.hta.lol.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gg.hta.lol.vo.hitLimitedVo;

@Repository
public class hitLimitedDao {
	@Autowired private SqlSession sqlSession;
	private static String NAMESPACE = "gg.hta.lol.mapper.hitLimitedMapper";
	
	public int hitLimitedInsert(hitLimitedVo vo) {
		return sqlSession.insert(NAMESPACE + ".hitLimitedInsert", vo);
	}
	public int hitLimited(hitLimitedVo vo) {
		return sqlSession.selectOne(NAMESPACE + ".hitLimited", vo);
	}
}