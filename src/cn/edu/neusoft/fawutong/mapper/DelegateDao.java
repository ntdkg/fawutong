package cn.edu.neusoft.fawutong.mapper;

import java.util.List;

import cn.edu.neusoft.fawutong.domain.Delegate;

public interface DelegateDao {
	public List<Delegate> getAllDelegates();
	public List<Delegate> getSearchDelegates(String dcaseType);
	public Delegate getFindDelegate(String id);
    public void updateDelegate(Delegate delegate);
    public void delDelegate(String id);
	public void addDelegation(Delegate bean);
	public void addWrit(Delegate bean);
	public List<Delegate> getStatusDelegate(String dstatus);
}
