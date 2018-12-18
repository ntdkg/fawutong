package cn.edu.neusoft.fawutong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.neusoft.fawutong.domain.Case;
import cn.edu.neusoft.fawutong.mapper.CaseDao;
import cn.edu.neusoft.fawutong.service.CaseService;

@Service
public class CaseServiceImpl implements CaseService {

	@Autowired
	private CaseDao dao;
	
	@Override
	public List<Case> getCases() {
		return dao.getAllCase();
	}

	@Override
	public List<Case> getAllCase() {
		return dao.getAllCase();
	}
	@Override
	public List<Case> selectFindCase(String date){
		return dao.selectFindCase("%"+date+"%");
	}
	
}
