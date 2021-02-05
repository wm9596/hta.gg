package gg.hta.lol.service;

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
//	    ------------------------------------- Member --------------------------------------
public void regist(AuthVo vo, String email) throws Exception {
    String key = new TempKey().generateKey(30);  // 인증키 생성
    vo.setCode(key);
    dao.insert(vo);
//member.setAuthkey(key);
    System.out.println("key : " + key);


    //메일 전송
    MailHandler sendMail = new MailHandler(mailSender);
    sendMail.setSubject("서비스 이메일 인증");
    sendMail.setText(
        new StringBuffer()
        	.append("<h1>메일인증</h1>")
        	.append("<a href='http://localhost:8080/email_test/emailConfirm?authKey=")
        	.append(key)
        	.append("' target='_blank'>이메일 인증 확인</a>")
        	.toString());

    	//밑에 수정하기 (본인걸로)
//    	sendMail.setFrom("서비스ID@gmail.com", "서비스 이름");
    	
    	
    	if(email.substring(email.lastIndexOf("@")).trim().equals("@daum")) {
    		sendMail.setTo(email+".net");
            sendMail.send();
    	}else {
    		sendMail.setTo(email+".com");
            sendMail.send();
    	}
    }
 
//    //이메일 인증 키 검증
//    public Member userAuth(String authkey) throws Exception {
//        Member member = new Member();
//        member = dao.chkAuth(authkey);
//   
//        if(member!=null){
//            try{
//                dao.successAuthkey(member);
//            }catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//        return member;
//    }

}
