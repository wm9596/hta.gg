package gg.hta.lol.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gg.hta.lol.vo.ReplyVo;

@Repository
public class ReplyDao {
	@Autowired private SqlSession sqlSession;
	private static String NAMESPACE = "gg.hta.lol.mapper.ReplyMapper";
	
	public int delete(int rNum) {
		return sqlSession.delete(NAMESPACE + ".delete", rNum);
	}
	
	public int insert(ReplyVo vo) {
		System.out.println("==================================");
		int n=sqlSession.insert(NAMESPACE + ".insert", vo);
		System.out.println("=================================="+n);
		return n;
	}
	
	public List<ReplyVo> list(int pNum) {
		return sqlSession.selectList(NAMESPACE + ".list", pNum);
	}
}
