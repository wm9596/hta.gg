package gg.hta.lol.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gg.hta.lol.dao.QueueInfoDao;
import gg.hta.lol.vo.QueueInfoVo;

@Service
public class QueueInfoService {
	@Autowired
	private QueueInfoDao qDao;
	
	public List<QueueInfoVo> getQueueInfo(String nickname) {
		return qDao.getQueueInfo(nickname);
	}
	
	public String getTier(HashMap<String, String> map) {
		return qDao.getTier(map);
	}
}
