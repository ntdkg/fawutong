package cn.edu.neusoft.fawutong.mapper;

import java.util.Map;

import cn.edu.neusoft.fawutong.domain.Admin;

public interface AdminDao {
	
	public Admin getFindAdmin(Map adminMap);
	
	public Integer getFindAdminRow(String aacount);
}
