package cn.edu.neusoft.fawutongadmin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.neusoft.fawutong.domain.Users;
import cn.edu.neusoft.fawutong.mapper.UsersDao;
import cn.edu.neusoft.fawutongadmin.service.AdminUsersService;

@Service
@Transactional
public class AdminUsersServiceImpl implements AdminUsersService {

	@Autowired
	private UsersDao dao;
	
	@Override
	public List<Users> getUsers_admin() {
		// TODO Auto-generated method stub
		return dao.getAllUsers_admin();
	}

	@Override
	public Users getFindUsers_admin(String id) {
		// TODO Auto-generated method stub
		return dao.getfindUser(id);
	}

	@Override
	public void updateUserInfo_admin(Users user) {
		// TODO Auto-generated method stub
		dao.updateUser(user);
	}

	@Override
	public void delUserInfo_admin(String id) {
		// TODO Auto-generated method stub
		dao.delUser(id);
	}

	@Override
	public List<Users> getSearchUsers_admin(String uname) {
		// TODO Auto-generated method stub
		return dao.getSearchUsers_admin(uname);
	}

	@Override
	public void updateUserMoney_admin(Map map) {
		// TODO Auto-generated method stub
		dao.updateUserMoney(map);
	}

}
