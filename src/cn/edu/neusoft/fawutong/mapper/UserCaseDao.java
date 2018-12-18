package cn.edu.neusoft.fawutong.mapper;

import java.util.List;

import cn.edu.neusoft.fawutong.domain.UserCase;

public interface UserCaseDao {

	public void addCaseService(UserCase usercase);

	public List<UserCase> getUserCase();
	
	public List<UserCase> getUserAllCase(String id);
}
