package cn.edu.neusoft.fawutong.service;

import java.util.List;
import java.util.Map;

import cn.edu.neusoft.fawutong.domain.Delegate;
import cn.edu.neusoft.fawutong.domain.Order;
import cn.edu.neusoft.fawutong.domain.Users;

public interface UsersService {
	
	//获取单用户
	public Users getFindUsers(String id);
	//用户自己修改自己
	public void updateUserOfUser(Users user);
	
	//修改金额
	public void updateUserMoney(Map map);
	
	//得到所有律师用户
	public List<Users> getAllLawyers();
	
	//得到热门前五的律师用户
	public List<Users> getHot5Lawyers();
	
	//关键字搜索律师
	public List<Users> selectKeywordLawyers(String keyword);
	public Users getOneLawyer(int id);
	//查看用户是否存在
	public Integer selectIsUser(String uphone);
	//验证登录
	public Users getLoginUser(Map userMap);
	//添加新用户
	public void addNewUsers(Users user);
	
	public Integer selectIsCollection(Map map);
	public void addCollection(Map map);
	
	public Integer getMyCaseNum(String uid);
	public Integer getMyOrderNum(String lid);
	public Integer getOrderOfDidNum(String did);
	public Integer getMyLawyerNum(String uid);
	public Integer getMyDelegateNum(String uid);
	
	public List<Delegate> getAllDelegates();
	public void doDelegate(Order bean);
	public void updateDelegateStatusING(Map<String, Object> map);
	public List<Users> getAllMyLawyers(String string);
	public void doNotCollecte(Map<String, Object> map);
	
	public List<Delegate> getAllMyDelegates(String uid);
	public List<Delegate> getAllLawDelegates(String lid);
	
	public void delOrderInfo(String did);
	
	public Users getFindOrderLawUser(String did);
	
	//貌似没用上这个方法
	public Users getFindOrderNomalUser(String did);
	
	public Users getFindDelegateNomalUser(String did);
	
	public Integer selectMaxUserId();
	public String selectlaweremail(int uid);
}
