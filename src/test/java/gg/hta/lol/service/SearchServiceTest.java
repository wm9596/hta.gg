package gg.hta.lol.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import gg.hta.lol.riotapi.DataRequester;
import gg.hta.lol.service.match.SearchService;
import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = {"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/security_config.xml"})
@Setter
public class SearchServiceTest {
	
	@Autowired
	private SearchService service;
	
	@Test
	public void getTest() {
		service.getSummonerInfo("크림몬");
	}
	
}
