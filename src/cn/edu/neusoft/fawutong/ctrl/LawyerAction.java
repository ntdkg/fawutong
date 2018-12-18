package cn.edu.neusoft.fawutong.ctrl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.edu.neusoft.fawutong.domain.Delegate;
import cn.edu.neusoft.fawutong.domain.DelegateStatusStr;
import cn.edu.neusoft.fawutong.domain.Order;
import cn.edu.neusoft.fawutong.domain.Users;
import cn.edu.neusoft.fawutong.service.UsersService;
import cn.edu.neusoft.fawutong.util.UserStatusStr;

@Controller
@RequestMapping("/fawutong/pages/lawyer")
public class LawyerAction {
	
	@Autowired
	private UsersService userService;
	
	
	/* 律师详情页面 */
	@RequestMapping(value="/{id}", method=RequestMethod.GET)
	public String lawyerDetail(@PathVariable("id") Integer id, Model mv , HttpSession session) {
		
		mv.addAttribute("lawyer", userService.getOneLawyer(id));
		mv.addAttribute("hotLawyers", userService.getHot5Lawyers());
		
		Map<String,String> colMap = new HashMap<String,String>();
		//获取user
		Users user = (Users) session.getAttribute("user");
		//如果用户登录过
		if (user != null ){
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("uid", user.getUid());
			map.put("lid", id);
			Integer row = userService.selectIsCollection(map);
			if (row == 1) {  //说明已收藏
				colMap.put("title", "已收藏");
				colMap.put("src", "closeCollection.html?id="+id);
				mv.addAttribute("isCol", colMap);
				return "/fawutong/pages/lawyer/detail";
			}
		}
		colMap.put("title", "收藏律师");
		colMap.put("src", "collection.html?id="+id);
		mv.addAttribute("isCol", colMap);
		return "/fawutong/pages/lawyer/detail";
	}
	
	
	/* 查找律师页面 */
	@RequestMapping("/search")
	public String lawyerSearch(Model mv, String keyword) {
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
		return "/fawutong/pages/lawyer/search";
	}
	
	@RequestMapping("/closeCollection")
	public String closeCollection(String id,HttpSession session ,Model mv) {
		//获取用户
		Users user = (Users) session.getAttribute("user");
		if (user == null) {
			return "redirect:../login.html";
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("uid", user.getUid()+"");
		map.put("lid", id);
		try {
			userService.doNotCollecte(map);
		}catch (Exception e) {
			System.out.println(e);
			mv.addAttribute("msg", "取消关注失败");
			mv.addAttribute("href", "search.html");
			return "/fawutong/pages/result";
		}
		return "redirect:"+id+".html";
	}
	
	/* 收藏律师 */
	@RequestMapping("/collection")
	public String collection(String id,HttpSession session,Model mv) {
		//获取用户
		Users user = (Users) session.getAttribute("user");
		if (user == null) {
			return "redirect:../login.html";
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("uid", user.getUid()+"");
		map.put("lid", id);
		try {
			userService.addCollection(map);
		}catch (Exception e) {
			System.out.println(e);
			mv.addAttribute("msg", "关注失败");
			mv.addAttribute("href", "search.html");
			return "/fawutong/pages/result";
		}
		mv.addAttribute("msg", "添加成功");
		mv.addAttribute("href", id+".html");
		return "/fawutong/pages/result";
	}
	
	/* 接单页面 */
	@RequestMapping("/delegations")
	public String lawyerDelegations(Model mv) {
		
		List<Delegate> delegates = userService.getAllDelegates();
		mv.addAttribute("delegates", delegates);
		
		return "/fawutong/pages/lawyer/delegations";
	}
	
	
	/* 接单逻辑 */
	@RequestMapping("/doDelegate")
	public String doDelegate(Model mv, Order bean, HttpSession session, String dsendtime) {
		try {
			Users user = (Users) session.getAttribute("user");
			if (user != null) {
				//他是律师，并且是通过的律师
				if(user.getLisLaw().equals("是") && user.getLstatus().equals(UserStatusStr.pass)) {
					bean.setLid(user.getUid());
					userService.doDelegate(bean);
					
					Map<String, Object> map = new HashMap<>();
					map.put("dsendtime", dsendtime);
					map.put("did", bean.getDid());
					map.put("dstatus", DelegateStatusStr.DELEGATE_ING);
					userService.updateDelegateStatusING(map);
				}
				else{
					mv.addAttribute("msg", "您暂时未通过检查，请等待");
					mv.addAttribute("href", "delegations.html");
					return "/fawutong/pages/result";
				}
			}
		} catch (Exception e) {
			System.out.println(e);
			mv.addAttribute("msg", "代理失败：检查登录"+e.getMessage());
			mv.addAttribute("href", "delegations.html");
			return "/fawutong/pages/result";
		}
		
		mv.addAttribute("msg", "代理成功，可在“个人中心”中查看！");
		mv.addAttribute("href", "../user.html");
		return "/fawutong/pages/result";
	}
}
