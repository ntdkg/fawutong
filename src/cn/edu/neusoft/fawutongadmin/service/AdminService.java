package cn.edu.neusoft.fawutongadmin.service;

import java.util.Map;

import cn.edu.neusoft.fawutong.domain.Admin;

public interface AdminService {
	public Admin getFindAdmin_admin(Map adminMap);

	public Integer getFindAdminRow_admin(String aacount);
}
