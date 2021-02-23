package gg.hta.lol.controller.community;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import gg.hta.lol.service.MessageService;

@Controller
public class MessageController {
	@Autowired 
	MessageService msgService;
	
	@GetMapping("/sendMsgPage")
	public String sendMsgPage(String sender, String receiver, Model model) {
		model.addAttribute("sender", sender);
		model.addAttribute("receiver", receiver);
		return "community/sendMsgPage";
	}
	
	@ResponseBody
	@PostMapping(value = "/sendMsg", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Boolean sendMsg(HttpServletRequest req) {
		String sender = req.getParameter("sender");
		String receiver = req.getParameter("receiver");
		String msg = req.getParameter("msg");
		
		System.out.println(sender);
		System.out.println(receiver);
		System.out.println(msg);
		
		HashMap<String, String> msgMap = new HashMap<String, String>();
		msgMap.put("sender", sender);
		msgMap.put("receiver", receiver);
		msgMap.put("msg", msg);
		int check = msgService.sendMsg(msgMap);
		
		if (check > 0) {
			return true;
		} else {
			return false;
		}
	}
}
