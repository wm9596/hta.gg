package gg.hta.lol.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gg.hta.lol.vo.SummonerVo;

@Repository
public class SummonerDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	private String NAMESPACE = "gg.hta.lol.mapper.SummonerMapper";
	
	public SummonerVo getSummoner(String nickname) {
		return sqlSession.selectOne(NAMESPACE + ".getSummoner", nickname);
	}
}
