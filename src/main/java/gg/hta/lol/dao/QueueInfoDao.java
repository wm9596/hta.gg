package gg.hta.lol.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gg.hta.lol.vo.QueueInfoVo;

@Repository
public class QueueInfoDao {
	@Autowired SqlSession sqlSession;
	
	String NAMESPACE = "gg.hta.lol.mapper.QueueInfoMapper";
	
	public List<QueueInfoVo> getQueueInfo(String nickname) {
		return sqlSession.selectList(NAMESPACE + ".getQueueInfo", nickname);
	}
	
	public String getTier(HashMap<String, String> map) {
		return sqlSession.selectOne(NAMESPACE + ".getTier", map);
	}
}
