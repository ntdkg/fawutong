package cn.edu.neusoft.fawutongadmin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.neusoft.fawutong.domain.Delegate;
import cn.edu.neusoft.fawutong.mapper.DelegateDao;
import cn.edu.neusoft.fawutongadmin.service.AdminDelegateService;

@Service
public class AdminDelegateServiceImpl implements AdminDelegateService {

	@Autowired
	private DelegateDao dao;

	@Override
	public List<Delegate> getDelegates_admin() {
		// TODO Auto-generated method stub
		return dao.getAllDelegates();
	}

	@Override
	public Delegate getFindDelegatesInfo_admin(String id) {
		// TODO Auto-generated method stub
		return dao.getFindDelegate(id);
	}

	@Override
	public void updateDelegateInfo_admin(Delegate delegate) {
		// TODO Auto-generated method stub
		dao.updateDelegate(delegate);
	}

	@Override
	public void delDelegateInfo_admin(String id) {
		// TODO Auto-generated method stub
		dao.delDelegate(id);
	}

	@Override
	public List<Delegate> getSearchDelegates(String dcaseType) {
		// TODO Auto-generated method stub
		return dao.getSearchDelegates(dcaseType);
	}
	
	
}
