package gg.hta.lol.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import gg.hta.lol.service.match.SearchService;
import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = 
		{
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security_config.xml",
		"file:src/main/webapp/WEB-INF/spring/email/email-config.xml"
		})
@Setter
public class SearchServiceTest {
	
	@Autowired
	private SearchService service;
	
	@Test
	public void getTest() {
		try {
			service.searchSummonerInfo("오리지널찰떡쿠키");
		}catch (DuplicateKeyException e) {
			System.out.println("중복값있음");
		}
		
	}
	
}
