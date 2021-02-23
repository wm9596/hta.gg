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
public class SearchServiceTest {
	
	@Autowired
	private SearchService service;
	
	@Test
	public void getTest() {
		SearchVo vo = service.getSummoner("더덕순대국");
		service.readMatchList(vo.getAccountId(), 0, 20,vo.getSnickname());
		
	}
	
//	@Test
	public void getMost() {
		List<MostChampVo> list = service.getMost("더덕순대국");
//		System.out.println(list);
	}
	
}
