package cn.edu.neusoft.fawutong.service;

import java.util.List;

import cn.edu.neusoft.fawutong.domain.Case;

public interface CaseService {
	
	public List<Case> getCases();

	public List<Case> getAllCase();

	List<Case> selectFindCase(String date);

	//public Case getAllCase(String id);
	
}
