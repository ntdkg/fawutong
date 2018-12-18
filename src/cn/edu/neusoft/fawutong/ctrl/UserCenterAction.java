package cn.edu.neusoft.fawutong.ctrl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import cn.edu.neusoft.fawutong.domain.Delegate;
import cn.edu.neusoft.fawutong.domain.DelegateStatusStr;
import cn.edu.neusoft.fawutong.domain.UserCase;
import cn.edu.neusoft.fawutong.domain.Users;
import cn.edu.neusoft.fawutong.service.DelegateService;
import cn.edu.neusoft.fawutong.service.UserCaseService;
import cn.edu.neusoft.fawutong.service.UsersService;
import cn.edu.neusoft.fawutong.util.UploadUtil;
import cn.edu.neusoft.fawutong.util.UserStatusStr;

@Controller
@RequestMapping("/fawutong/pages")
public class UserCenterAction {
	
	@Autowired
	private UsersService usersService;
	@Autowired
	private UserCaseService userCaseService;
	@Autowired
	private DelegateService delService;
	
	//用户个人中心
	@RequestMapping("/user")
	public String userCenter(HttpSession session,Model mv){
		//从Session中获取用户
		Users user = (Users) session.getAttribute("user");
		if (user != null) { //说明有用户
			Map<String, Integer> nums = new HashMap<>();
			//判断用户是否是律师用户
			if (user.getLisLaw().equals("是")) {
				System.out.println("lvshijinru");
				//律师用户查看订单
				System.out.println(usersService.getMyOrderNum(user.getUid()+"") );
				nums.put("myOrderNum", usersService.getMyOrderNum(user.getUid()+""));
			}else{
				//普通用户查看自己的订单9
				nums.put("myOrderNum", usersService.getMyDelegateNum(user.getUid()+""));
			}
			nums.put("myCaseNum", usersService.getMyCaseNum(user.getUid()+""));
			nums.put("myLawyerNum", usersService.getMyLawyerNum(user.getUid()+""));
			mv.addAttribute("nums", nums);
			mv.addAttribute("user", user);
			return "fawutong/pages/user";
		}
		return "redirect:login.html";
	}
	
	//我的订单
	@RequestMapping("/user/orders")
	public String myOrders(Model mv,HttpSession session){
		Users user = (Users) session.getAttribute("user");
		if (user.getLisLaw().equals("是")) {
			//是律师的情况
			List<Delegate> list = usersService.getAllLawDelegates(user.getUid()+"");
			mv.addAttribute("delegates", list);
			mv.addAttribute("str", "取消代理");
		}else{
			//普通用户直接获取申请的delegate
			List<Delegate> list = usersService.getAllMyDelegates(user.getUid()+"");
			mv.addAttribute("delegates", list);
			mv.addAttribute("str", "取消订单");
		}
		return "/fawutong/pages/user/orders";
	}
	
	//完成订单
	@RequestMapping("/user/finishDel")
	public String finishDel(HttpSession session,String did,Model mv) {
		Users user = (Users) session.getAttribute("user");
		if (user == null) {
			return "redirect:../login.html";
		}
		try {
			//获取此事件
			Delegate delegate = delService.getFindDelegatesInfo(did);
			//律师用户
			if (user.getLisLaw().equals("是")) {
				//删除order表
				usersService.delOrderInfo(did);
				//删除delegate表
				delService.delDelegateInfo(did);
				//讲钱转到律师处
				double price = delegate.getDprice();
				double laPrice = Double.valueOf(user.getUmoney());
				Map<String,String> laMap = new HashMap<String,String>();
				laMap.put("uid", user.getUid()+"");
				laMap.put("umoney", (price+laPrice)+"");
				usersService.updateUserMoney(laMap);
				//刷新Session
				user.setUmoney((price+laPrice)+"");
				session.setAttribute("user", user);
			}else{ //普通用户
				//获取律师
				Users lawyer = usersService.getFindOrderLawUser(did);
				//删除delegate表,然后删除Order表
				delService.delDelegateInfo(did);
				usersService.delOrderInfo(did);
				//需要把钱转到律师处
				double price = delegate.getDprice();
				double laPrice = Double.valueOf(lawyer.getUmoney());
				Map<String,String> laMap = new HashMap<String,String>();
				laMap.put("uid", lawyer.getUid()+"");
				laMap.put("umoney", (price+laPrice)+"");
				usersService.updateUserMoney(laMap);
			}
		}catch (Exception e) {
			System.out.println(e);
			mv.addAttribute("msg", "完成订单失败");
			mv.addAttribute("href", "order.html");
			return "/fawutong/pages/user/result";
		}
		return "redirect:/fawutong/pages/user/orders.html";
	}
	
	//取消订单
	@RequestMapping("/user/cancelDel")
	public String cancelDel(HttpSession session,String did,Model mv) {
		Users user = (Users) session.getAttribute("user");
		if (user == null) {
			return "redirect:../login.html";
		}
		try {
			//获取此事件
			Delegate delegate = delService.getFindDelegatesInfo(did);
			//律师用户
			if (user.getLisLaw().equals("是")) {
				//删除order表，并且修改为待受理
				usersService.delOrderInfo(did);
				Map<String, Object> map = new HashMap<>();
				map.put("dsendtime", "");
				map.put("did", did);
				map.put("dstatus", DelegateStatusStr.DELEGATE_WAIT);
				usersService.updateDelegateStatusING(map);
			}else{ //普通用户
				//删除delegate表,然后删除Order表
				delService.delDelegateInfo(did);
				//判断order是否有数据
				if (usersService.getOrderOfDidNum(did) > 0) {
					System.out.println("order有数据");
					usersService.delOrderInfo(did);
				}
				//需要把钱还给用户
				double price = delegate.getDprice();
				double myPrice = Double.valueOf(user.getUmoney());
				Map<String,String> userMap = new HashMap<String,String>();
				userMap.put("uid", user.getUid()+"");
				userMap.put("umoney", (price+myPrice)+"");
				usersService.updateUserMoney(userMap);
				user.setUmoney((price+myPrice)+"");
				//刷新Session
				session.setAttribute("user", user);
			}
		}catch (Exception e) {
			System.out.println(e);
			mv.addAttribute("msg", "取消失败");
			mv.addAttribute("href", "order.html");
			return "/fawutong/pages/user/result";
		}
		return "redirect:/fawutong/pages/user/orders.html";
	}
	
	//我的立案
	@RequestMapping("/user/cases")
	public String  MyCase(Model mv,UserCase userCase,HttpSession session){
		//从Session拿出uid
		Users user = (Users) session.getAttribute("user");
		if (user == null) {
			return "redirect:../login.html";
		}
		List<UserCase> usercases=userCaseService.getUserAllCase(user.getUid()+"");
		mv.addAttribute("usercases", usercases);
		return "/fawutong/pages/user/cases";
	}
	
	//用户修改信息
	@RequestMapping("/user/userChange")
	public String userChange(HttpSession session,Model mv) {
		//从Session中获取用户
		Users user = (Users) session.getAttribute("user");
		if (user != null) { //说明有用户
			mv.addAttribute("user", user);
			return "fawutong/pages/user/userChange";
		}
		return "redirect:../login.html";
	}
	
	//用户更新数据
	@RequestMapping(value="/user/userEdit",method = RequestMethod.POST)
	public String userEdit(Users user,Model mv,HttpSession session,HttpServletRequest request) {
		//从Session拿出原有的User
		Users reUser = (Users) session.getAttribute("user");
		//因为前台js公开
		if (user.getLisLaw().equals("是") && user.getLoffice().equals("")) {
			mv.addAttribute("msg", "数据格式不对");
			mv.addAttribute("href", "../user.html");
			return "/fawutong/pages/user/result";
		}
		//判断是否是律师用户（因为一旦不是律师用户，数据库中的status存为未通过）
		if (!user.getLisLaw().equals("是")) {
			user.setLcity("");
			user.setLoffice("");
			user.setLresume("");
			user.setLstatus(UserStatusStr.nopass);
		}else{
			//判断用户之前是否是律师,若之前不是，现在申请，设置为正在审核中
			if (reUser.getLisLaw().equals("否")) {
				user.setLstatus(UserStatusStr.passing);
			}else{
				user.setLstatus(reUser.getLstatus());
			}
		}
		//获取上传图片
		//获取文件
		MultipartHttpServletRequest multipartRequest  =  (MultipartHttpServletRequest) request;
		MultipartFile imgFile  =  multipartRequest.getFile("imgFile"); 
		String path = request.getSession().getServletContext().getRealPath("/");
		String str = UploadUtil.fileUpload(imgFile,path,true);
		System.out.println("上传图片"+str);
		if(str!=null && str.equals("error")) {
			mv.addAttribute("msg", "更新用户头像失败");
			mv.addAttribute("href", "../user.html");
			return "/fawutong/pages/user/result";
		}
		user.setLimage(str);
		try {
			usersService.updateUserOfUser(user);
		}catch (Exception e) {
			System.out.println(e);
			mv.addAttribute("msg", "用户更新失败");
			mv.addAttribute("href", "../user.html");
			return "/fawutong/pages/user/result";
		}
		//通过id拿出最新的用户信息
		Users newUser = usersService.getFindUsers(user.getUid()+"");
		//Session刷新
		session.setAttribute("user", newUser);
		mv.addAttribute("msg", "用户更新成功");
		mv.addAttribute("href", "../user.html");
		return "/fawutong/pages/user/result";
	}
	
	//我的律师
	@RequestMapping("/user/lawyers")
	public String myLawyers(Model mv, HttpSession session){
		Users users = (Users) session.getAttribute("user");
		if (users != null) {
			if (users.getUid() != 0 && users.getUname()!=null) {
				
				List<Users> myLawyers = usersService.getAllMyLawyers(users.getUid()+"");
				mv.addAttribute("myLawyers", myLawyers);
			}
		} else {
			System.out.println("未登录");
		} 		
		return "/fawutong/pages/user/lawyers";
	}
		
		
	//取消收藏律师
	@RequestMapping("/user/doNotCollecte")
	public String doNotCollecte(Model mv, HttpSession session, String lid){
		Users users = (Users) session.getAttribute("user");
		if (users != null) {
			if (users.getUid() != 0 && users.getUname()!=null) {
				
				Map<String, Object> map = new HashMap<>();
				map.put("lid", lid);
				map.put("uid", users.getUid());
				usersService.doNotCollecte(map);
			}
		} else {
			System.out.println("未登录");
		}
		return "redirect:/fawutong/pages/user/lawyers.html";
	}
	
	//申请律师
	@RequestMapping("/user/apply")
	public String apply(HttpSession session) {
		
		return "/fawutong/pages/user/apply";
	}
	
	@RequestMapping("/user/applyLawyer")
	public String applyLawyer(HttpSession session,Users user,Model mv) {
		Users reUser = (Users) session.getAttribute("user");
		//判断是不是普通普通用户
		if (reUser.getLisLaw().equals("是") || reUser.getUid() != user.getUid()) {
			mv.addAttribute("msg", "用户你打开方式不对");
			mv.addAttribute("href", "../user.html");
			return "/fawutong/pages/user/result";
		}
		//如果是普通用户
		reUser.setLisLaw("是");
		reUser.setLisHot(0);
		reUser.setLstatus(UserStatusStr.passing);
		//讲新传进来的数据放入
		reUser.setLcity(user.getLcity());
		reUser.setLname(user.getLname());
		reUser.setLresume(user.getLresume());
		reUser.setLoffice(user.getLoffice());
		try {
			usersService.updateUserOfUser(reUser);
		}catch (Exception e) {
			mv.addAttribute("msg", "申请失败");
			mv.addAttribute("href", "../user.html");
			return "/fawutong/pages/user/result";
		}
		//新数据存入Session
		session.setAttribute("user", reUser);
		mv.addAttribute("msg", "提交成功，正在审核中");
		mv.addAttribute("href", "../user.html");
		return "/fawutong/pages/user/result";
	}
}
