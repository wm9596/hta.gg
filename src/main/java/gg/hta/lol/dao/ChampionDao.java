package gg.hta.lol.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChampionDao {
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "gg.hta.lol.mapper.ChampionMapper";
	
	public String getChampionPicture (String championid) {
		return sqlSession.selectOne(NAMESPACE + ".getChampionPicture", championid);
	}
}
