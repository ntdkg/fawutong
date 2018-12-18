package cn.edu.neusoft.fawutong.ctrl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.edu.neusoft.fawutong.domain.Case;
import cn.edu.neusoft.fawutong.domain.News;
import cn.edu.neusoft.fawutong.domain.UserCase;
import cn.edu.neusoft.fawutong.domain.Users;
import cn.edu.neusoft.fawutong.service.CaseService;
import cn.edu.neusoft.fawutong.service.NewsService;
import cn.edu.neusoft.fawutong.service.UserCaseService;
import cn.edu.neusoft.fawutong.util.DateUtil;
import cn.edu.neusoft.fawutong.util.UserStatusStr;

@Controller
@RequestMapping("/fawutong/pages")
// 法院模块
public class CourtAction {
	
	@Autowired
	private CaseService caseService;
	@Autowired
	private NewsService newsService;
	@Autowired
	private UserCaseService usercaseService;
	
	//最新资讯
	@RequestMapping("/notification")
	public String caseNotification(){
		return "/fawutong/pages/notification";
	}
	
	//资讯详情
	@RequestMapping("/detail")
	public String caseNotificationDetail(String nid, Model mv){
		News news = newsService.getFindNewsInfo(nid);
		mv.addAttribute("news", news);
		return "/fawutong/pages/detail";
	}
	
	//案件查询
	@RequestMapping("/search")
	public String caseSearch(Model mv,String years,String month){//getFindCase
		String str = "";
		if (years != null && !years.equals("")) { //有年
			str = years;
		}
		if (month != null && !month.equals("")) {  //有月
			if (month.length() == 1) {
				month = "0"+month;
			}
			str = str+"-"+month;
		}
		List<Case> cases = caseService.selectFindCase(str);
		mv.addAttribute("cases", cases);
		mv.addAttribute("years", years);
		mv.addAttribute("month", month);
		return "/fawutong/pages/search";
	}
	
	//网上立案
	@RequestMapping("/filling")
	public String caseFilling(HttpSession session){
		Users users = (Users) session.getAttribute("user");
		if (users != null) {
			if (users.getUname() != null && !users.getUname().equals("")) {
				//说明用户之前登录过，直接进入
				return "/fawutong/pages/filling";
			}
		}
		return "/fawutong/pages/login";
	}
	
	@RequestMapping(value="/dofilling",method=RequestMethod.POST)
	public String docaseFilling(UserCase usercase,HttpServletRequest request,Model mv){
		
		if (usercase == null) {
			return "fawutong/pages/filling";
		}
		usercase.setSendtime(DateUtil.getDateNowStr());
		usercase.setUcstatus(UserStatusStr.passing);
		try {
			usercaseService.addCaseService(usercase);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			mv.addAttribute("msg", "提交失败："+e.getMessage());
			mv.addAttribute("href", "filling.html");
			return "fawutong/pages/result";
		}
		
		mv.addAttribute("msg", "提交成功！");
		mv.addAttribute("href", "../index.html");
		return "fawutong/pages/result";
	}
}
