package gg.hta.lol.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDao {
	@Autowired 
	SqlSession sqlSession;
	private final String NAMESPACE = "gg.hta.lol.mapper.MessageMapper";
	
	public int sendMsg(HashMap<String, String> map) {
		return sqlSession.insert(NAMESPACE + ".sendMsg", map);
	}
	public int update(int msgNum) {
		return sqlSession.update(NAMESPACE + ".update", msgNum);
	}
}
