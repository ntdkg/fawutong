package cn.edu.neusoft.fawutong.ctrl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.edu.neusoft.fawutong.domain.Users;
import cn.edu.neusoft.fawutong.service.UsersService;
import cn.edu.neusoft.fawutong.util.NomalImgSrc;
import cn.edu.neusoft.fawutong.util.UserStatusStr;

@Controller
@RequestMapping("/fawutong/pages")
public class AccountAction {
	
	@Autowired
	private UsersService usersService;
	
	//是否登录
	@RequestMapping("/isLogin")
	public String isLogin(HttpSession session,HttpServletRequest request){
		System.out.println(request.getSession().getServletContext().getRealPath("/"));
		if (session.getAttribute("user") == null) {
			return "/fawutong/pages/login";
		}
		return "redirect:user.html";
	}
	
	//登出
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		session.invalidate();
		return "redirect:../index.html";
	}
	
	//登录页面
	@RequestMapping("/login")
	public String login(HttpSession session){
		//从Session中拿出user
		Users user = (Users) session.getAttribute("user");
		//判断是否为空
		if (user != null) { //若不为空则已登录
			 return "/fawutong/pages/user";
		}
		return "/fawutong/pages/login";
	}
	
	@RequestMapping(value = "/userLogin" , method = RequestMethod.POST)
	public String userlogin(HttpSession session,Model mv,String uphone , String upassword) {
//		System.out.println("登录");
//		System.out.print(upassword);
		Map<String, String> userMap = new HashMap<String,String>();
		userMap.put("uphone", uphone);
		userMap.put("upassword", upassword);
		try {
			Integer row = usersService.selectIsUser(uphone);
			if (row == 0) {
				System.out.println("无用户");
				mv.addAttribute("msg", "用户名错误");
				mv.addAttribute("href", "login.html");
				return "/fawutong/pages/result";
			}
		}catch (Exception e){
			System.out.println(e);
		}
		//与数据库对比
		try {
			//与数据库信息比对
			Users user = usersService.getLoginUser(userMap);
			if (user != null) { //获取到管理员信息
				session.setAttribute("user", user);
				return "redirect:user.html";
			}
		}catch (Exception e) {
			System.out.println(e);
		}
		mv.addAttribute("msg", "密码错误");
		mv.addAttribute("href", "login.html");		
		return "fawutong/pages/result";
	}
	
	//注册
	@RequestMapping("/regist")
	public String regist(){
		return "/fawutong/pages/regist";
	}
	
	@RequestMapping(value="/userRegist",method = RequestMethod.POST)
	public String userRegist(Users users , Model mv , HttpSession session) {
		//服务器数据库抽风，下载处于没法自增id，手动自增
		Integer maxId = usersService.selectMaxUserId();
		users.setUid(maxId.intValue() + 1);
		users.setUmoney("0");
		users.setLisHot(0);
		users.setLimage(NomalImgSrc.userImg);
		//如果不是律师用户，删除用户多余信息
		if (!users.getLisLaw().equals("是")) {
			users.setLoffice("");
			users.setLresume("");
			users.setLcity("");
			users.setLstatus(UserStatusStr.nopass);
		}else{
			users.setLstatus(UserStatusStr.passing);
		}
		try {
			usersService.addNewUsers(users);
		}catch (Exception e) {
			System.out.println(e);
			mv.addAttribute("msg", "添加失败");
			mv.addAttribute("href", "regist.html");
			return "fawutong/pages/result";
		}
		//注册成功，则自动登录;
		session.setAttribute("user", users);
		return "redirect:user.html";
	}
}
