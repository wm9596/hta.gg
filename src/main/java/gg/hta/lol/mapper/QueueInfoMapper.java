package gg.hta.lol.mapper;

import org.springframework.dao.DuplicateKeyException;

import gg.hta.lol.vo.QueueInfoVo;

public interface QueueInfoMapper {
	
	public int addQueueInfo(QueueInfoVo vo) throws DuplicateKeyException;
}
