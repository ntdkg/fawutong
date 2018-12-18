package cn.edu.neusoft.fawutongadmin.service;

import java.util.List;
import java.util.Map;

import cn.edu.neusoft.fawutong.domain.Users;

public interface AdminUsersService {
	
	
	//获取所有用户
	public List<Users> getUsers_admin();
	
	public List<Users> getSearchUsers_admin(String uname);
	
	//获取单用户
	public Users getFindUsers_admin(String id);
	//更新数据
	public void updateUserInfo_admin(Users user);
	//删除用户
	public void delUserInfo_admin(String id);
	//更新用户金钱
	public void updateUserMoney_admin(Map map);
}
