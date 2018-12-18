package cn.edu.neusoft.fawutongadmin.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.neusoft.fawutong.mapper.UsersDao;
import cn.edu.neusoft.fawutongadmin.service.AdminOrderService;
@Service
public class AdminOrderServiceImpl implements AdminOrderService {

	@Autowired
	private UsersDao dao;

	@Override
	public void delOrder(String did) {
		// TODO Auto-generated method stub
		dao.delOrderInfo(did);
	}
	
}
