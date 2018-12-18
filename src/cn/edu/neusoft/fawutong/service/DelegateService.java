package cn.edu.neusoft.fawutong.service;

import java.util.List;

import cn.edu.neusoft.fawutong.domain.Delegate;

public interface DelegateService {
	
	public List<Delegate> getDelegates();
	
	public Delegate getFindDelegatesInfo(String id);
	
	public void updateDelegateInfo(Delegate delegate);
	
	public void delDelegateInfo(String id);

	public void addDelegation(Delegate bean);
	
	public void addWrit(Delegate bean);
	
	public List<Delegate> getStatusDelegate(String Status);
}
