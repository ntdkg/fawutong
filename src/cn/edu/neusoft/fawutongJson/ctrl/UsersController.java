package cn.edu.neusoft.fawutongJson.ctrl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.neusoft.fawutong.domain.Delegate;
import cn.edu.neusoft.fawutong.domain.DelegateStatusStr;
import cn.edu.neusoft.fawutong.domain.Users;
import cn.edu.neusoft.fawutong.service.DelegateService;
import cn.edu.neusoft.fawutong.service.UsersService;
import cn.edu.neusoft.fawutong.util.NomalImgSrc;
import cn.edu.neusoft.fawutong.util.UserStatusStr;

@Controller
public class UsersController {
	
	@Autowired
	private UsersService usersService;
	@Autowired
	private DelegateService delService;
	
	//测试返回json数据
	@ResponseBody 
	@RequestMapping("/fawutongJson/getUsers" )
	public List<Users> adminGetAllUsers() {
		List<Users> users = usersService.getAllLawyers();
		return users;
	}
	
	//用户注册
	@ResponseBody
	@RequestMapping(value="/fawutongJson/userRegist",method = RequestMethod.POST)
	public Map<String,Object> userRegist(Users users) {
		Map<String,Object> map = new HashMap<String,Object>();
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
			map.put("data", new ArrayList());
			map.put("des", "注册失败");
			map.put("result", "fail");
			return map;
		}
		map.put("data", users);
		map.put("des", "注册成功");
		map.put("result", "success");
		return map;
	}
	
	//判断用户是否登录
	@ResponseBody
	@RequestMapping("/fawutongJson/isLogin")
	public Map<String,String> isLogin(HttpSession session) {
		Map<String,String> map = new HashMap<String,String>();
		Users user = (Users) session.getAttribute("user");
		if (user != null) {
			map.put("status", "200");
			map.put("isLogin", "true");
		}else{
			map.put("status", "200");
			map.put("isLogin", "false");
		}
		return map;
	}
	
	@ResponseBody 
	@RequestMapping(value="/fawutongJson/checkUsers",method=RequestMethod.POST)
	public Map<String,String> checkUsers(String uphone) {
		Map<String,String> map = new HashMap<String,String>();
		Integer row = usersService.selectIsUser(uphone);
		if (row == 0) {
			map.put("ret", "1");
			map.put("msg", "该用户未注册");
		}else{
			map.put("ret", "0");
			map.put("msg", "该用户已注册");
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/fawutongJson/login",method=RequestMethod.POST)
	public Map<String,Object> userLogin(String username,String password) {
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String, String> userMap = new HashMap<String,String>();
		userMap.put("uphone", username);
		userMap.put("upassword", password);
		Users user = usersService.getLoginUser(userMap);
		if (user != null) {
			map.put("data", user);
			map.put("des", "成功登录");
			map.put("result", "success");
		}else{
			map.put("data", new ArrayList());
			map.put("des", "登录失败");
			map.put("result", "error");
		}
		return map;
	}
	
	//用户订单
	@ResponseBody
	@RequestMapping(value="/fawutongJson/getAllUserDelegates",method=RequestMethod.POST)
	public Map<String,Object> getLaywerOrder(String uid) {
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			List<Delegate> list = usersService.getAllMyDelegates(uid);
			if (list != null) {
				map.put("data", list);
			}else{
				map.put("data", new ArrayList());
			}
			map.put("status", "succeed");
		}catch (Exception e) {
			System.out.println(e);
			map.put("status", "fail");
			map.put("data", new ArrayList());
		}
		return map;
	}
	
	//用户/律师完成订单
	@ResponseBody
	@RequestMapping(value="/fawutongJson/finishOrder",method=RequestMethod.POST)
	public Map<String,Object> finishOrder(String did) {
		Map<String,Object> map = new HashMap<String,Object>();
		//完成订单->删除order和delegate信息，律师获取金额
		Users lawyer = usersService.getFindOrderLawUser(did);
		Delegate del = delService.getFindDelegatesInfo(did);
		//将钱转到律师处
		double price = Double.valueOf(del.getDprice());
		double laPrice = Double.valueOf(lawyer.getUmoney());
		Map<String,String> laMap = new HashMap<String,String>();
		laMap.put("uid", lawyer.getUid()+"");
		laMap.put("umoney", (price+laPrice)+"");
		try {
			usersService.updateUserMoney(laMap);
			//删除Order表和delegate表
			delService.delDelegateInfo(did);
			usersService.delOrderInfo(did);
		}catch (Exception e) {
			System.out.println(e);
			map.put("data", "fail");
			map.put("result", "信息失误");
			return map;
		}
		map.put("data", "succeed");
		map.put("result", "用户完成订单");
		map.put("price", price+laPrice);
		return map;
	}
	
	//用户/律师取消订单
	@ResponseBody
	@RequestMapping(value="/fawutongJson/cancelOrder",method=RequestMethod.POST)
	public Map<String,Object> cancelOrder(String did,String lisLaw) {
		Map<String,Object> map = new HashMap<String,Object>();
		//完成订单->删除order和delegate信息，律师获取金额
		System.out.println(did+lisLaw);
		Users user = usersService.getFindDelegateNomalUser(did);
		Delegate del = delService.getFindDelegatesInfo(did);
		//将钱还到普通用户处
		double price = Double.valueOf(del.getDprice());
		double uPrice = Double.valueOf(user.getUmoney());
		Map<String,String> uMap = new HashMap<String,String>();
		uMap.put("uid", user.getUid()+"");
		uMap.put("umoney", (price+uPrice)+"");
		double resultPrice = price+uPrice;
		try {
			//判断当前的订单状态
			if (del.getDstatus().equals(DelegateStatusStr.DELEGATE_ING) && lisLaw.equals("是")){ //正在受理的订单并且是律师用户
				//删除Order表
				usersService.delOrderInfo(did);
				//修改delegate表
				Map<String,Object> doMap = new HashMap<String,Object>();
				doMap.put("dsendtime", "");
				doMap.put("did", did+"");
				doMap.put("dstatus", DelegateStatusStr.DELEGATE_WAIT);
				usersService.updateDelegateStatusING(doMap);
				resultPrice -= price;
			}else if(del.getDstatus().equals(DelegateStatusStr.DELEGATE_ING) && !lisLaw.equals("是")){ //正在受理的订单并且是普通用户
				//删除Order表
				usersService.delOrderInfo(did);
				//删除delegate表
				delService.delDelegateInfo(did);
				//将金额返回
				usersService.updateUserMoney(uMap);
			}else{  //普通用户点击取消，并且是未受理的
				//删除delegate表
				delService.delDelegateInfo(did);
				//更新用户金额
				usersService.updateUserMoney(uMap);
			}
		}catch (Exception e) {
			System.out.println(e);
			map.put("data", "fail");
			map.put("result", "数据库异常");
		}
		map.put("data", "succeed");
		map.put("result", "取消订单成功");
		map.put("price", resultPrice);
		return map;
	}
}
