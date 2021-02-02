package gg.hta.lol.controller.item;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import gg.hta.lol.service.ItemService;
import gg.hta.lol.vo.ItemVo;





@Controller
public class ItemController {
	@Autowired ItemService service;
@GetMapping("/item")
public String item(ItemVo vo) {

	return "item/item";
}
@GetMapping("iteminsert")
public String itemList(ItemVo vo) {
	service.item_insert(vo);
	return "item/item";
}

}
