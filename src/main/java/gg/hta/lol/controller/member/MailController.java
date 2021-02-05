package gg.hta.lol.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import gg.hta.lol.service.MailService;
import gg.hta.lol.service.MemberService;
import gg.hta.lol.vo.AuthVo;

@Controller
public class MailController {
	private final String HOME = "redirect:/";
    private final String SIGN_UP_VIEW = "sign/sign-up";
    private final String EMAIL_CONFIRM_VIEW = "sign/emailConfirm";
 
    @Autowired
    private MailService service;
    @GetMapping(value = "/member/email/{id}/{email}", produces = "application/xml;charset=utf-8")
    @ResponseBody
    public String mailSend(@PathVariable("id")String id, @PathVariable("email")String email) {
    	StringBuffer sb = new StringBuffer();
    	try {
			service.regist(new AuthVo(id, null), email);
			sb.append("<data>");
			sb.append("<code>success</code>");
			sb.append("</data>");
			return sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
			sb.append("<data>");
			sb.append("<code>fail</code>");
			sb.append("</data>");
			return sb.toString();
		}
    }
 
//    @RequestMapping(value = "/sign-up", method = RequestMethod.GET)
//    public String regist() throws Exception {
//        return SIGN_UP_VIEW;
//    }
// 
//    @RequestMapping(value = "/sign-up", method = RequestMethod.POST)
//    public String regist(Member user, RedirectAttributes rttr) throws Exception{
//    
//        System.out.println("regesterPost 진입 ");
//        memberSvc.regist(user);
//        rttr.addFlashAttribute("msg" , "가입시 사용한 이메일로 인증해주세요");
//        return HOME;
//    }
 
//    // confirm email authKey
//    @RequestMapping(value = "/emailConfirm", method = RequestMethod.GET)
//    public String emailConfirm(@RequestParam("authKey")String authkey, 
//                                Model model, RedirectAttributes rttr) throws Exception { 
//        
//        if(authkey == null) {
//            rttr.addFlashAttribute("msg", "인증키가 잘못되었습니다. 다시 인증해 주세요");
//            return HOME;
//        }
//        
//        Member member = memberSvc.userAuth(authkey);
//        if(member == null) {
//            rttr.addFlashAttribute("msg", "잘못된 접근 입니다. 다시 인증해 주세요");
//            return HOME;
//        }
//        model.addAttribute("user", member.getUser_name());
//        return EMAIL_CONFIRM_VIEW;
//    }
//}
}
