package gg.hta.lol.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gg.hta.lol.dao.MessageDao;

@Service
public class MessageService {
	@Autowired MessageDao messageDao;
	
	public int sendMsg (HashMap<String, String> map) {
		return messageDao.sendMsg(map);
	}
}
