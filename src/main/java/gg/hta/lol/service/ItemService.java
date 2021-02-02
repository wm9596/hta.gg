package gg.hta.lol.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gg.hta.lol.dao.ItemDao;
import gg.hta.lol.vo.ItemVo;



@Service
public class ItemService {
	@Autowired private ItemDao dao;
	public int item_insert(ItemVo vo) {
		return dao.item_insert(vo);
	}
	
}
