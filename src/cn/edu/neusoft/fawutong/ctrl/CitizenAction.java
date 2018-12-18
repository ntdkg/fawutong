package cn.edu.neusoft.fawutong.ctrl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.mail.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sun.javafx.collections.MappingChange.Map;

import cn.edu.neusoft.fawutong.domain.Delegate;
import cn.edu.neusoft.fawutong.domain.Users;
import cn.edu.neusoft.fawutong.service.UsersService;
import cn.edu.neusoft.fawutong.util.JavaEmailSender;

@Controller
@RequestMapping("/fawutong/pages/convenient")
// 便民模块
public class CitizenAction {

	@Autowired
	private UsersService userService;
	
	@RequestMapping("/guide")
	public String guide(){
		return "/fawutong/pages/convenient/guide";
	}
	
	@RequestMapping("/mailcontact")
	public String mailcontact(Model mv, String keyword) {
		List<Users> hotLawyers = userService.getHot5Lawyers();
		mv.addAttribute("hotLawyers", hotLawyers);
		
		if (keyword == null) {
			List<Users> lawyers = userService.getAllLawyers();
			mv.addAttribute("lawyers", lawyers);
		} else {
			if (keyword.equals("")) {
				List<Users> lawyers = userService.getAllLawyers();
				mv.addAttribute("lawyers", lawyers);
			} else {
				List<Users> keywordLawyers = userService.selectKeywordLawyers("%"+keyword+"%");
				mv.addAttribute("lawyers", keywordLawyers);
			}
			
		}
		return "/fawutong/pages/convenient/mailcontact";
	}
//	@RequestMapping(value="/mailSubmit", method=RequestMethod.POST)
//	public String mailsend(Model mv, Users users,HttpSession session,int uid) {
//		Integer Lawyeremail = userService.selectlaweremail(uid);
//		mv.addAttribute("Lawyeremail", Lawyeremail);
//		return "/fawutong/pages/convenient/mailcontact";
//	}
	@RequestMapping(value="/emailView", method=RequestMethod.GET)
    public String goSendEmail(Model mv,HttpServletRequest request,Integer uid){
		String  email = userService.selectlaweremail(uid);
	//	mv.addAttribute("Lawyeremail", Lawyeremail);
       // String email = request.getParameter("email");
		System.out.println("进来了吗");
        if(email!=null&&!"".equals(email)){
            email = email.trim();
           // mv.setViewName("member/send_email");
            mv.addAttribute("email", email);
        }
        return "/fawutong/pages/convenient/goSendEmail";
    }
	/**
     * 发送邮件
     * @return
     * @throws Exception
     */
   // @RequestMapping(value="/sendEmailM",produces="application/json;charset=UTF-8",method=RequestMethod.POST)
	@RequestMapping(value="/sendEmailM",method=RequestMethod.POST)
    @ResponseBody
    public Object sendEmail(HttpServletRequest request)throws Exception{
		System.out.println("进来了吗21222");//内容
        HashMap<String, String> map = new HashMap<String,String>();
        String msg = "ok";      //发送状态
        String toEMAIL = request.getParameter("EMAIL");                 //对方邮箱
        String TITLE = request.getParameter("TITLE");                   //标题
        String CONTENT = request.getParameter("CONTENT");  
        System.out.println("进来了吗21");//内容
        JavaEmailSender.sendEmail(toEMAIL, TITLE, CONTENT);
        ((HashMap<String, String>) map).put("result", msg);
        return map;
    }
}
