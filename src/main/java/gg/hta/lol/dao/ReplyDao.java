package gg.hta.lol.dao;

import java.util.HashMap;
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
		System.out.println("1111111111111111111111111111111");
		int n=sqlSession.insert(NAMESPACE + ".insert", vo);
		System.out.println("=================================="+n);
		return n;
	}
	
	public int reInsert(ReplyVo vo) {
		System.out.println("222222222222222222222222222222222");
		int n=sqlSession.insert(NAMESPACE + ".reInsert", vo);
		return n;
	}
	
	public List<ReplyVo> list(int pNum) {
		return sqlSession.selectList(NAMESPACE + ".list", pNum);
	}
	
	public List<ReplyVo> rereList(int rNum) {
		return sqlSession.selectList(NAMESPACE + ".rereList", rNum);
	}
	
	public int update1(int pNum) {
		int n=sqlSession.update(NAMESPACE + ".pCount", pNum);
		return n;
	}
	
	public int update2(int pNum) {
		return sqlSession.update(NAMESPACE + ".mCount", pNum);
	}
	
	public int rHit(int rNum) {
		int n=sqlSession.update(NAMESPACE + ".rpCount", rNum);
		return n;
	}
	
	public int rHitCount(int rNum) {
		return sqlSession.selectOne(NAMESPACE+".rHitCount",rNum);
	}
	
	public int rNohit(int rNum) {
		int n=sqlSession.update(NAMESPACE + ".rnpCount", rNum);
		return n;
	}
	
	public int rNohitCount(int rNum) {
		return sqlSession.selectOne(NAMESPACE+".rNohitCount",rNum);
	}
	
	
	public int replyCount(String username) {
		return sqlSession.selectOne(NAMESPACE + ".replyCount", username);
	}
	
	public List<ReplyVo> replyList(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE + ".replyList", map);
	}
}
