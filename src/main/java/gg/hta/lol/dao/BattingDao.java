package gg.hta.lol.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gg.hta.lol.vo.BattingTeamInfoVo;
import gg.hta.lol.vo.MatchVo;

@Repository
public class BattingDao {
	@Autowired SqlSession sqlSession;
	private static String NAMESPACE="gg.hta.lol.mapper.BattingMapper";
	
	public int AddTeam(String tname) {
		return sqlSession.insert(NAMESPACE+".addTeam",tname);
	}
	public List<BattingTeamInfoVo> teamlist(){
		return sqlSession.selectList(NAMESPACE+".teamlist");
	}
	public int AddMatch(MatchVo vo) {
		return sqlSession.insert(NAMESPACE+".addMatch",vo);
	}
	public List<HashMap<String, Object>> matchinfo(String mDate){
		return sqlSession.selectList(NAMESPACE+".matchinfo",mDate);
	}
	public HashMap<String, Object> teamName(int mnum3) {
		return sqlSession.selectOne(NAMESPACE+".teamName",mnum3);
	}
	public List<String> teamName2(int mnum3) {
		return sqlSession.selectList(NAMESPACE+".teamName2",mnum3);
	}
}
