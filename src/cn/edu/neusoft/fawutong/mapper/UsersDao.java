package cn.edu.neusoft.fawutong.mapper;

import java.util.List;
import java.util.Map;

import cn.edu.neusoft.fawutong.domain.Delegate;
import cn.edu.neusoft.fawutong.domain.Order;
import cn.edu.neusoft.fawutong.domain.Users;

public interface UsersDao {
	
	public List<Users> getAllUsers_admin();
	
	public List<Users> getSearchUsers_admin(String uname);
	
	public Users getfindUser(String id);
	
	//管理员更新用户信息
	public void updateUser(Users user);
	
	//用户自己修改自己
	public void updateUserOfUser(Users user);
	//只有这一个方法能改变数据库中金额
	public void updateUserMoney(Map map);
	
	public void delUser(String id);

	public List<Users> getAllLawyers();
	
	public List<Users> getHot5Lawyers();

	public List<Users> selectKeywordLawyers(String keyword);
	
	public Users getOneLawyer(int id);
	
	public Integer selectIsUser(String uphone);
	
	public Users getLoginUser(Map userMap);
	
	public void addNewUser(Users user);
	
	public Integer getMyCaseNum(String uid);

	public Integer getMyOrderNum(String lid);

	public Integer getMyLawyerNum(String uid);

	public Integer getMyDelegateNum(String uid);
	
	public Integer getOrderOfDidNum(String did);
	
	public Integer selectIsCollection(Map map);
	
	public List<Delegate> getAllDelegates();

	public void doDelegate(Order bean);
	
	public void updateDelegateStatusING(Map map);

	public void addCollection(Map map);
	
	public List<Users> getAllMyLawyers(String uid);

	public void doNotCollecte(Map map);
	
	public List<Delegate> getAllMyDelegates(String uid);
	
	public List<Delegate> getAllLawDelegates(String lid);
	
	public void delOrderInfo(String did);
	
	public Users getFindOrderLawUser(String did);
	
	public Users getFindOrderNomalUser(String did);
	
	public Users getFindDelegateNomalUser(String did);
	
	public Integer selectMaxUserId();

	public String selectlaweremail(int uid);
}
