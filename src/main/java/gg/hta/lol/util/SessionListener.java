package gg.hta.lol.util;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import gg.hta.lol.dao.VisitCountDao;

public class SessionListener implements HttpSessionListener {
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		visitCnt(se);
	}
	public void visitCnt(HttpSessionEvent se) {
		HttpSession session = se.getSession(); 
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext()); 
		VisitCountDao dao = (VisitCountDao) context.getBean("visitCountDao");
		dao.setTotalCnt();
		int totalCnt=dao.getTotalCnt();
		int todayCnt=dao.getTodayCnt();
		session.setAttribute("totalCnt", totalCnt);
		session.setAttribute("todayCnt", todayCnt);
	}
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		
	}
}


