package gg.hta.lol.service;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import gg.hta.lol.dao.MemberDao;
import gg.hta.lol.util.MailHandler;
import gg.hta.lol.vo.AuthVo;
import gg.hta.lol.vo.MemberVo;

@Service
public class MailService {
	@Autowired private JavaMailSender mailSender;
	@Autowired private MemberDao dao;

	public void regist(AuthVo vo, String email) throws Exception {
//      String key = new TempKey().generateKey(30);  // 암호화(이메일코드)
		dao.AuthDelte(vo.getUsername());
		Random random = new Random();
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
		if (email.substring(email.lastIndexOf("@")).trim().equals("@daum")) {
			sendMail.setTo(email + ".net");
			sendMail.send();
		} else {
			sendMail.setTo(email + ".com");
			sendMail.send();
		}
	}

	public String check(String username) {
		return dao.selectAuth(username).getCode();
	}
	
	public void idSearch(String email) throws Exception {
		Random random = new Random();
		String code = String.format("%04d", random.nextInt(10000));
		List<MemberVo> list = dao.emailList(email);
		for(MemberVo vo:list) {
			dao.authUpdate(new AuthVo(vo.getUsername(),code));
		}
	    //메일 전송
        MailHandler sendMail = new MailHandler(mailSender);
        sendMail.setSubject("안녕하세요 hta.gg 인증 메일입니다.");
        sendMail.setText(
           new StringBuffer()
              .append("<h1>아이디 찾기 메일인증</h1>")
              .append("인증 번호는 :")
              .append(code)
              .append("입니다.<br> 홈페이지로 돌아가서 이메일 인증번호를 입력해주세요.")
              .toString());
        sendMail.setFrom("hta.gg@gmail.com", "hta.gg");
        sendMail.setTo(email);
		sendMail.send();
	}
	
	public AuthVo idSeachCheck(String email) {
		return dao.EmailselectAuth(email);
	}
	
	public void pwdSearch(String id, String email) throws Exception {
		Random random = new Random();
		String code = String.format("%04d", random.nextInt(10000));
		dao.authUpdate(new AuthVo(id,code));
	    //메일 전송
        MailHandler sendMail = new MailHandler(mailSender);
        sendMail.setSubject("안녕하세요 hta.gg 인증 메일입니다.");
        sendMail.setText(
           new StringBuffer()
              .append("<h1>비밀번호찾기/변경 메일인증</h1>")
              .append("인증 번호는 :")
              .append(code)
              .append("입니다.<br> 홈페이지로 돌아가서 이메일 인증번호를 입력해주세요.")
              .toString());
        sendMail.setFrom("hta.gg@gmail.com", "hta.gg");
        sendMail.setTo(email);
		sendMail.send();
	}
}
