package cn.edu.neusoft.fawutongJson.ctrl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.neusoft.fawutong.domain.Delegate;
import cn.edu.neusoft.fawutong.domain.DelegateStatusStr;
import cn.edu.neusoft.fawutong.domain.Users;
import cn.edu.neusoft.fawutong.service.DelegateService;
import cn.edu.neusoft.fawutong.service.UsersService;
import cn.edu.neusoft.fawutong.util.DateUtil;

@Controller
public class DelegateController {
	
	@Autowired
	private DelegateService delService;
	@Autowired
	private UsersService userService;
	
	@ResponseBody
	@RequestMapping("/fawutongJson/getAllDelegateInfo")
	public Map<String,Object> getAllDelegateInfo() {
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			List<Delegate> list = delService.getStatusDelegate(DelegateStatusStr.DELEGATE_WAIT);
			map.put("data", list);
			map.put("result", "succeed");
		}catch (Exception e) {
			map.put("data", new ArrayList());
			map.put("result", "数据库异常");
		}
		return map;
	}
	
	//文书起草  25
	@ResponseBody
	@RequestMapping(value = "/fawutongJson/addwrit" , method = RequestMethod.POST)
	public Map<String,Object> addWritInDataBase(Delegate delegate,String uid) {
		System.out.println("hello");
		Map<String,Object> map = new HashMap<String,Object>();
		//服务器放入时间
		delegate.setDsendtime(DateUtil.getDateNowStr());
		//放入申请id
		delegate.setUid(Integer.valueOf(uid));
		//放入金钱
		delegate.setDprice(25.0f);
		//放入状态
		delegate.setDstatus(DelegateStatusStr.DELEGATE_WAIT);
		//获取用户金额（个人认为金钱额放入post请求中不安全）
		Users user = userService.getFindUsers(uid);
		//获取用户剩余金钱
		double price = Double.valueOf(user.getUmoney());
		Map<String,String> uMap = new HashMap<String,String>();
		uMap.put("uid", uid);
		uMap.put("umoney", (price - 25)+"");
		try {
			//扣钱
			userService.updateUserMoney(uMap);
			//插入新的文书起草
			delService.addWrit(delegate);
		}catch (Exception e) {
			System.out.println(e);
			map.put("data", "fail");
			map.put("result", "插入数据失败");
		}
		map.put("data", "succeed");
		map.put("result", "插入数据");
		return map;
	}
	
	//案件代理   30
	@ResponseBody
	@RequestMapping(value = "/fawutongJson/addDelegate" , method = RequestMethod.POST)
	public Map<String,Object> addDelegateInDataBase(Delegate delegate,String uid) {
		Map<String,Object> map = new HashMap<String,Object>();
		//服务器放入申请时间
		delegate.setDsendtime(DateUtil.getDateNowStr());
		//放入申请id
		delegate.setUid(Integer.valueOf(uid));
		//放入金钱
		delegate.setDprice(30.0f);
		//放入状态
		delegate.setDstatus(DelegateStatusStr.DELEGATE_WAIT);
		//放入时间
		delegate.setDdeadline("无");
		//获取用户金额（个人认为金钱额放入post请求中不安全）
		Users user = userService.getFindUsers(uid);
		//获取用户剩余金钱
		double price = Double.valueOf(user.getUmoney());
		Map<String,String> uMap = new HashMap<String,String>();
		uMap.put("uid", uid);
		uMap.put("umoney", (price - 30)+"");
		try {
			//扣钱
			userService.updateUserMoney(uMap);
			//插入新的文件代理
			delService.addWrit(delegate);
		}catch (Exception e) {
			System.out.println(e);
			map.put("data", "fail");
			map.put("result", "插入数据");
		}
		map.put("data", "succeed");
		map.put("result", "插入数据");
		return map;
	}
}
