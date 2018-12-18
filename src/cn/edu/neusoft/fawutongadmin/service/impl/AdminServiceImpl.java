package cn.edu.neusoft.fawutongadmin.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.neusoft.fawutong.domain.Admin;
import cn.edu.neusoft.fawutong.mapper.AdminDao;
import cn.edu.neusoft.fawutongadmin.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao dao;

	@Override
	public Admin getFindAdmin_admin(Map adminMap) {
		// TODO Auto-generated method stub
		return dao.getFindAdmin(adminMap);
	}

	@Override
	public Integer getFindAdminRow_admin(String aacount) {
		// TODO Auto-generated method stub
		return dao.getFindAdminRow(aacount);
	}
	
	
	
}
