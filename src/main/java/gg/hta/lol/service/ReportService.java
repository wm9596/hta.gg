package gg.hta.lol.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gg.hta.lol.dao.ReportDao;
import gg.hta.lol.vo.ReportVo;

@Service
public class ReportService {
	@Autowired
	private ReportDao reportDao;
	
	public int report (HashMap<String, Object> map) {
		return reportDao.report(map);
	}
	
	public ReportVo checkReport (HashMap<String, Object> map) {
		return reportDao.checkReport(map);
	}
}
