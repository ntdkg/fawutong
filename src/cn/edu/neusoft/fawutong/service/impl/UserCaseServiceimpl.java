package cn.edu.neusoft.fawutong.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.neusoft.fawutong.domain.UserCase;
import cn.edu.neusoft.fawutong.mapper.UserCaseDao;
import cn.edu.neusoft.fawutong.service.UserCaseService;

@Service
public class UserCaseServiceimpl implements UserCaseService {
	@Autowired
	private UserCaseDao dao;
	@Override
	public void addCaseService(UserCase usercase) {
		// TODO Auto-generated method stub
		dao.addCaseService(usercase);
	}
	@Override
	public List<UserCase> getUserCase() {
		// TODO Auto-generated method stub
		return dao.getUserCase();
	}
	@Override
	public List<UserCase> getUserAllCase(String id) {
		// TODO Auto-generated method stub
		return dao.getUserAllCase(id);
	}

}
