package gg.hta.lol.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class VisitCountDao {
	@Autowired private SqlSession sqlSession;
	public final String NAMESPACE = "gg.hta.lol.mapper.VisitCountMapper";
	public int setTotalCnt() {
		return sqlSession.insert(NAMESPACE + ".insert");
	}
	public int getTotalCnt() {
		return sqlSession.selectOne(NAMESPACE + ".totalCnt");
	}
	public int getTodayCnt() {
		return sqlSession.selectOne(NAMESPACE + ".todayCnt");
	}
}
