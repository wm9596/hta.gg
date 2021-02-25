package gg.hta.lol.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gg.hta.lol.vo.BattingLogVo;
import gg.hta.lol.vo.PointVo;

@Repository
public class PointDao {
	@Autowired SqlSession sqlSession;
	public final String NAMESPACE = "gg.hta.lol.mapper.PointMapper";
	public int battingInsert(String username) {
		return sqlSession.insert(NAMESPACE+".battingInsert",username);
	}
	public int battingInsertAdmin(PointVo vo) {
		return sqlSession.insert(NAMESPACE+".battingInsertAdmin",vo);
	}
	public int memberPointUpdate(BattingLogVo vo) {
		System.out.println("///////////////////");
		System.out.println(vo.getMNum()+","+vo.getUsername());
		return sqlSession.update(NAMESPACE+".memberPointUpdate",vo);
		
	}
	public int insert(PointVo vo) {
		return sqlSession.insert(NAMESPACE+".insert",vo);
	}
	public int update(HashMap<String, Object> map) {
		return sqlSession.insert(NAMESPACE+".update",map);
	}
}
