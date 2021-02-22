package gg.hta.lol.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gg.hta.lol.vo.ReportVo;

@Repository
public class ReportDao {
	@Autowired
	private SqlSession sqlSession;
	private String NAMESPACE = "gg.hta.lol.mapper.CommunityMapper";
	
	public int report(HashMap<String, Object> map) {
		return sqlSession.insert(NAMESPACE + ".report", map);
	}
	
	public ReportVo checkReport (HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + ".checkReport", map);
	}
}
