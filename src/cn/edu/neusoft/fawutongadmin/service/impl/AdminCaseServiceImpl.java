package cn.edu.neusoft.fawutongadmin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.neusoft.fawutong.domain.Case;
import cn.edu.neusoft.fawutong.mapper.CaseDao;
import cn.edu.neusoft.fawutongadmin.service.AdminCaseService;

@Service
public class AdminCaseServiceImpl implements AdminCaseService {

	@Autowired
	private CaseDao dao;
	
	@Override
	public List<Case> getCase_admin() {
		// TODO Auto-generated method stub
		return dao.getAllCase();
	}

	@Override
	public Case getFindCaseInfo_admin(String id) {
		// TODO Auto-generated method stub
		return dao.getFindCase(id);
	}

	@Override
	public void updateCaseInfo_admin(Case ca) {
		// TODO Auto-generated method stub
		dao.updateCase(ca);
	}

	@Override
	public void delCaseInfo_admin(String id) {
		// TODO Auto-generated method stub
		dao.delCase(id);
	}

	@Override
	public List<Case> getSearchCase(String ctitle) {
		// TODO Auto-generated method stub
		return dao.getSearchCase(ctitle);
	}

}
