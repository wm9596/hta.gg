package gg.hta.lol.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import gg.hta.lol.service.match.SearchService;
import gg.hta.lol.vo.ReplyVo;
import gg.hta.lol.vo.match.MostChampVo;
import gg.hta.lol.vo.match.SearchVo;
import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = 
		{
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security_config.xml",
		"file:src/main/webapp/WEB-INF/spring/email/email-config.xml"
		})
@Setter
public class VisitServiceTest {
	
	@Autowired
	private MemberService service;
	
	@Test
	public void getReply() {
		System.out.println("===================================");
		System.out.println(service.visitList());
	}
	
}
