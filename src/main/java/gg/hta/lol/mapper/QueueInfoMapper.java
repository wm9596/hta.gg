package gg.hta.lol.mapper;

import java.util.List;

import org.springframework.dao.DuplicateKeyException;

import gg.hta.lol.vo.QueueInfoVo;

public interface QueueInfoMapper {
	
	public int addQueueInfo(QueueInfoVo vo) ;
	
	public List<QueueInfoVo> getQueueInfo(String snickname);
	
	public int updateQueueInfo(QueueInfoVo vo);
}
