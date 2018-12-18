package cn.edu.neusoft.fawutong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.neusoft.fawutong.domain.Delegate;
import cn.edu.neusoft.fawutong.mapper.DelegateDao;
import cn.edu.neusoft.fawutong.service.DelegateService;


@Service
public class DelegateServiceImpl implements DelegateService {

	@Autowired
	private DelegateDao dao;
	
	@Override
	public List<Delegate> getDelegates() {
		return dao.getAllDelegates();
	}

	@Override
	public Delegate getFindDelegatesInfo(String id) {
		return dao.getFindDelegate(id);
	}

	@Override
	public void updateDelegateInfo(Delegate delegate) {
		dao.updateDelegate(delegate);
	}

	@Override
	public void delDelegateInfo(String id) {
		dao.delDelegate(id);
	}

	@Override
	public void addDelegation(Delegate bean) {
		dao.addDelegation(bean);
	}
	
	@Override
	public void addWrit(Delegate bean) {
		dao.addWrit(bean);
	}

	@Override
	public List<Delegate> getStatusDelegate(String Status) {
		// TODO Auto-generated method stub
		return dao.getStatusDelegate(Status);
	}	
	
}
