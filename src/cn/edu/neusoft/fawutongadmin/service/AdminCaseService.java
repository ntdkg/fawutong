package cn.edu.neusoft.fawutongadmin.service;

import java.util.List;

import cn.edu.neusoft.fawutong.domain.Case;

public interface AdminCaseService {
	
	public List<Case> getCase_admin();
	
	public List<Case> getSearchCase(String ctitle);
	
	public Case getFindCaseInfo_admin(String id);
	
	public void updateCaseInfo_admin(Case ca);
	
	public void delCaseInfo_admin(String id);
}
