package gg.hta.lol.service;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import gg.hta.lol.dao.MemberDao;
import gg.hta.lol.util.MailHandler;
import gg.hta.lol.util.TempKey;
import gg.hta.lol.vo.AuthVo;
import gg.hta.lol.vo.AuthoritiesVo;

@Service
public class MailService {
    @Autowired private JavaMailSender mailSender;
    @Autowired private MemberDao dao;

    public void regist(AuthVo vo, String email) throws Exception {
//    String key = new TempKey().generateKey(30);  // 인증키 생성
		dao.AuthDelte(vo.getUsername());
		Random random=new Random(); 
		String key = String.format("%04d", random.nextInt(10000));
	    vo.setCode(key);
	    dao.insert(vo);
	
	    //메일 전송
	    MailHandler sendMail = new MailHandler(mailSender);
	    sendMail.setSubject("안녕하세요 hta.gg 인증 메일입니다.");
	    sendMail.setText(
	        new StringBuffer()
	        	.append("<h1>메일인증</h1>")
	        	.append("인증 번호는 :")
	        	.append(key)
	        	.append("입니다.<br> 홈페이지로 돌아가서 이메일 인증번호를 입력해주세요.")
	        	.toString());
	
    	sendMail.setFrom("hta.gg@gmail.com", "hta.gg");
    	
    	if(email.substring(email.lastIndexOf("@")).trim().equals("@daum")) {
    		sendMail.setTo(email+".net");
            sendMail.send();
    	}else {
    		sendMail.setTo(email+".com");
            sendMail.send();
    	}
	}
    
    public String check(String username){
    	return dao.selectAuth(username).getCode();
    }		
}
