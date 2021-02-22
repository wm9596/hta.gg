package gg.hta.lol.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import gg.hta.lol.vo.VisitVo;

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
	public List<VisitVo> visitList(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE + ".list",map);
	}
	public int visitListCount() {
		return sqlSession.selectOne(NAMESPACE + ".count");
	}
}
