package cn.edu.neusoft.fawutongadmin.service;

import java.util.List;

import cn.edu.neusoft.fawutong.domain.Delegate;

public interface AdminDelegateService {
	
	public List<Delegate> getDelegates_admin();
	
	public List<Delegate> getSearchDelegates(String dcaseType);
	
	public Delegate getFindDelegatesInfo_admin(String id);
	
	public void updateDelegateInfo_admin(Delegate delegate);
	
	public void delDelegateInfo_admin(String id);
}
