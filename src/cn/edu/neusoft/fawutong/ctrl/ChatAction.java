package cn.edu.neusoft.fawutong.ctrl;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.neusoft.fawutong.domain.Users;

@Controller
@RequestMapping("/fawutong/pages/chat")
public class ChatAction {

	@RequestMapping("/chat")
	public String guide(HttpSession session){
		//先判断用户是否登录
		Users user = (Users) session.getAttribute("user");
		if (user != null) {
			return "/fawutong/pages/chat/chatroom";
		}
		return "redirect:../login.html";
	}
	
}
