package cn.edu.neusoft.fawutong.ctrl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.edu.neusoft.fawutong.domain.Delegate;
import cn.edu.neusoft.fawutong.domain.Users;
import cn.edu.neusoft.fawutong.service.DelegateService;
import cn.edu.neusoft.fawutong.service.UsersService;
import cn.edu.neusoft.fawutong.util.DateUtil;

@Controller
@RequestMapping("/fawutong/pages/delegation")
public class DelegationAction {
	
	@Autowired
	private DelegateService mService;
	@Autowired
	private UsersService usersService;
	
	@RequestMapping("/delegate")
	public String delegate(HttpSession session){
		
		Users user = (Users) session.getAttribute("user");
		if (user != null) {
			if (user.getLisLaw().equals("是")) {
				return "redirect:/fawutong/pages/lawyer/delegations.html";
			}
		}
		return "/fawutong/pages/delegation/delegate";
	}
	
	@RequestMapping("/writ")
	public String writ(HttpSession session){
		
		Users user = (Users) session.getAttribute("user");
		if (user != null) {
			if (user.getLisLaw().equals("是")) {
				
				return "redirect:/fawutong/pages/lawyer/delegations.html";
			}
		}
		return "/fawutong/pages/delegation/writ";
	}
	
	
	// 提交“案件代理”需求 价格30
	@RequestMapping(value="/delegationSubmit")
	public String delegationSubmit(Model mv, Delegate bean , HttpSession session) {
		Users user = (Users) session.getAttribute("user");
		double price = Double.valueOf(user.getUmoney());
		if(price >= 30.0) {
			try {
				bean.setDdeadline("无");
				bean.setDsendtime(DateUtil.getDateNowStr());
				switch (bean.getDcaseType()) {
				case "0":
				case "5":
					bean.setDcaseType("其他");
					break;
				case "1":
					bean.setDcaseType("家庭婚姻");
					break;
				case "2":
					bean.setDcaseType("财务纠纷");
					break;
				case "3":
					bean.setDcaseType("劳动纠纷");
					break;
				case "4":
					bean.setDcaseType("交通事故");
					break;
				default:
					bean.setDcaseType("其他");
					break;
				}
				//System.out.println(bean.toString());
				Map<String,String> moneyMap = new HashMap<String,String>();
				moneyMap.put("uid", user.getUid()+"");
				moneyMap.put("umoney", (price-30)+"");
				mService.addDelegation(bean);
				usersService.updateUserMoney(moneyMap);
				//更新Session中的数据
				user.setUmoney((price-30)+"");
				session.setAttribute("user", user);
			} catch (Exception e) {
				System.out.println(e);
				mv.addAttribute("msg", "提交失败：检查登录"+e.getMessage());
				mv.addAttribute("href", "delegate.html");
				return "/fawutong/pages/result";
			}
		}else{
			mv.addAttribute("msg", "账号余额不足或使用支付宝");
			mv.addAttribute("href", "delegate.html");
			return "/fawutong/pages/result";
		}
		mv.addAttribute("msg", "提交成功，可在“个人中心”中查看！");
		mv.addAttribute("href", "../user.html");
		return "/fawutong/pages/result";
	}
	
	
	// 提交“文书起草”需求 价格25
	@RequestMapping(value="/writSubmit", method=RequestMethod.POST)
	public String writSubmit(Model mv, Delegate bean,HttpSession session) {
		Users user = (Users) session.getAttribute("user");
		double price = Double.valueOf(user.getUmoney());
		if (price >= 25) {
			try {
				bean.setDsendtime(DateUtil.getDateNowStr());
				switch (bean.getDcaseType()) {
				case "0":
				case "5":
					bean.setDcaseType("其他");
					break;
				case "1":
					bean.setDcaseType("家庭婚姻");
					break;
				case "2":
					bean.setDcaseType("财务纠纷");
					break;
				case "3":
					bean.setDcaseType("劳动纠纷");
					break;
				case "4":
					bean.setDcaseType("交通事故");
					break;
				default:
					bean.setDcaseType("其他");
					break;
				}
				//System.out.println(bean.toString());
				Map<String,String> moneyMap = new HashMap<String,String>();
				moneyMap.put("uid", user.getUid()+"");
				moneyMap.put("umoney", (price-25)+"");
				mService.addWrit(bean);
				usersService.updateUserMoney(moneyMap);
				//更新Session中的数据
				user.setUmoney((price-25)+"");
				session.setAttribute("user", user);
			} catch (Exception e) {
				System.out.println(e);
				mv.addAttribute("msg", "提交失败：检查登录"+e.getMessage());
				mv.addAttribute("href", "writ.html");
				return "/fawutong/pages/result";
			}
		}else{
			mv.addAttribute("msg", "账号余额不足或使用支付宝");
			mv.addAttribute("href", "delegate.html");
			return "/fawutong/pages/result";
		}
		mv.addAttribute("msg", "提交成功，可在“个人中心”中查看！");
		mv.addAttribute("href", "../user.html");
		return "/fawutong/pages/result";
	}
}
