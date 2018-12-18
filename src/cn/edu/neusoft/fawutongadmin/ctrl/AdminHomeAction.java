package cn.edu.neusoft.fawutongadmin.ctrl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.edu.neusoft.fawutong.domain.Admin;
import cn.edu.neusoft.fawutongadmin.service.AdminService;

@Controller
public class AdminHomeAction {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/fawutongadmin/index")
	public String homepage(HttpSession session){
		//判断是否登录过
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin != null) {
			if (admin.getAacount() != null && !admin.getAacount().equals("")) {
				//说明用户之前登录过，直接进入
				return "redirect:users.html";
			}
		}
		return "fawutongadmin/index";
	}
	
	@RequestMapping(value = "/fawutongadmin/login" , method = RequestMethod.POST)
	public String adminLogin(HttpSession session,Model mv,String aacount,String apassword) {
		Map<String, String> adminMap = new HashMap<String,String>();
		adminMap.put("aacount", aacount);
		adminMap.put("apassword", apassword);
		//判读是否有此用户
		try {
			Integer row = adminService.getFindAdminRow_admin(aacount);
			if(row == 0) {
				mv.addAttribute("msg", "用户名错误");
				mv.addAttribute("href", "index.html");
				return "fawutongadmin/result";
			}
		}catch (Exception e) {
			System.out.println(e);
		}
		//与数据库对比
		try {
			//与数据库信息比对
			Admin admin = adminService.getFindAdmin_admin(adminMap);
			if (admin != null) { //获取到管理员信息
				session.setAttribute("admin", admin);
				return "redirect:users.html";
			}
		}catch (Exception e) {
			System.out.println(e);
		}
		mv.addAttribute("msg", "密码错误");
		mv.addAttribute("href", "index.html");
		return "fawutongadmin/result";
	}
	
	@RequestMapping("fawutongadmin/logout")
	public String adminLogout(HttpSession session) {
		session.removeAttribute("admin");
		session.invalidate();
		return "fawutongadmin/index";
	}
	
}
