package cn.edu.neusoft.fawutongadmin.ctrl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.edu.neusoft.fawutong.domain.Delegate;
import cn.edu.neusoft.fawutong.domain.DelegateStatusStr;
import cn.edu.neusoft.fawutong.domain.Users;
import cn.edu.neusoft.fawutongadmin.service.AdminDelegateService;
import cn.edu.neusoft.fawutongadmin.service.AdminOrderService;
import cn.edu.neusoft.fawutongadmin.service.AdminUsersService;

@Controller
public class AdminDelegateAction {
	
	@Autowired
	private AdminDelegateService delegateService;
	@Autowired
	private AdminOrderService orderService;
	@Autowired
	private AdminUsersService usersService;
	
	@RequestMapping("/fawutongadmin/otherTable")
	public String showDelegate(Model mv,String search){
		String dcaseType;
		if (search == null || search.equals("")) {
			dcaseType = "%%";
		}else{
			dcaseType = "%"+search+"%";
		}
		List<Delegate> delegates = delegateService.getSearchDelegates(dcaseType);
		mv.addAttribute("delegates", delegates);
		return "fawutongadmin/otherTable";
	}
	
	@RequestMapping("/fawutongadmin/delegateChange")
	public String delegateChange(Model mv,String did) {
		Delegate del = delegateService.getFindDelegatesInfo_admin(did);
		mv.addAttribute("del", del);
		return "/fawutongadmin/delegateChange";
	}
	
	@RequestMapping(value="/fawutongadmin/delegateEdit",method = RequestMethod.POST)
	public String delegateEdit(Delegate del,Model mv) {
		//后台不能修改发起人id，所以不做修改
		try {
			delegateService.updateDelegateInfo_admin(del);
		}catch (Exception e) {
			System.out.println(e);
			mv.addAttribute("msg", "案件代理修改失败");
			mv.addAttribute("href", "otherTable.html");
			return "fawutongadmin/result";
		};
		mv.addAttribute("msg", "案件代理修改成功");
		mv.addAttribute("href", "otherTable.html");
		return "fawutongadmin/result";
	}
	
	@RequestMapping("/fawutongadmin/delegateDel")
	public String adminDelDelegate(Model mv,String id) {
		//获取当前事件
		Delegate del = delegateService.getFindDelegatesInfo_admin(id);
		//判断事件状态
		if (del.getDstatus().equals(DelegateStatusStr.DELEGATE_ING)) {
			//需要删除订单，然后把钱退给用户
			orderService.delOrder(id);
		}
		//获取订单用户，刷新金钱
		Users user = usersService.getFindUsers_admin(del.getUid()+"");
		//需要把钱还给用户
		double price = del.getDprice();
		double myPrice = Double.valueOf(user.getUmoney());
		Map<String,String> userMap = new HashMap<String,String>();
		userMap.put("uid", user.getUid()+"");
		userMap.put("umoney", (price+myPrice)+"");
		try {
			delegateService.delDelegateInfo_admin(id);
			usersService.updateUserMoney_admin(userMap);
		}catch (Exception e){
			System.out.println(e);
			mv.addAttribute("msg", "删除案件代理失败");
			mv.addAttribute("href", "otherTable.html");
			return "fawutongadmin/result";
		}
		mv.addAttribute("msg", "删除案件代理成功");
		mv.addAttribute("href", "otherTable.html");
		return "fawutongadmin/result";
	}
}
