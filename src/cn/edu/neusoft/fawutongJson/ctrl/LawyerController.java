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
import cn.edu.neusoft.fawutong.domain.Order;
import cn.edu.neusoft.fawutong.domain.Users;
import cn.edu.neusoft.fawutong.service.UsersService;

@Controller
public class LawyerController {
	
	@Autowired
	private UsersService usersService;
	
	@SuppressWarnings("rawtypes")
	@ResponseBody
	@RequestMapping("/fawutongJson/getAllLawyerInfo")
	public Map<String,Object> getAllLayerInfo() {
		List<Users> users = usersService.getAllLawyers();
		Map<String,Object> map = new HashMap<String,Object>();
		if (users != null) {
			map.put("data", users);
		}else{
			map.put("data", new ArrayList());
		}
		map.put("result", "success");
		return map;
	}
	
	@SuppressWarnings("rawtypes")
	@ResponseBody
	@RequestMapping("/fawutongJson/getHot5LawyerInfo")
	public Map<String,Object> getHotLawyerInfo() {
		List<Users> users = usersService.getHot5Lawyers();
		Map<String,Object> map = new HashMap<String,Object>();
		if (users != null) {
			map.put("data", users);
		}else{
			map.put("data", new ArrayList());
		}
		map.put("result", "success");
		return map;
	}
	
	//律师接单
	@ResponseBody
	@RequestMapping(value="/fawutongJson/addNewDelegate",method=RequestMethod.POST)
	public Map<String,Object> addNewDelegate(String did,String lid,String oprice) {
		Map<String,Object> map = new HashMap<String,Object>();
		//生成订单
		Order bean = new Order();
		bean.setDid(Integer.valueOf(did));
		bean.setLid(Integer.valueOf(lid));
		bean.setOprice(oprice);
		//代理事件状态修改
		Map<String,Object> doMap = new HashMap<String,Object>();
		doMap.put("dsendtime", "");
		doMap.put("did", bean.getDid());
		doMap.put("dstatus", DelegateStatusStr.DELEGATE_ING);
		//对数据库信息修改
		try {
			usersService.updateDelegateStatusING(doMap);
			usersService.doDelegate(bean);
		}catch (Exception e) {
			System.out.println(e);
			map.put("data", "fail");
			map.put("result", "插入数据失败");
		}
		map.put("data", "succeed");
		map.put("result", "插入数据成功");
		return map;
	}
	
	//律师订单
	@SuppressWarnings("rawtypes")
	@ResponseBody
	@RequestMapping(value="/fawutongJson/getAllLawDelegates",method=RequestMethod.POST)
	public Map<String,Object> getLaywerOrder(String lid) {
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			List<Delegate> list = usersService.getAllLawDelegates(lid);
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
	
}
