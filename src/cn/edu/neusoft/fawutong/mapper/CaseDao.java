package cn.edu.neusoft.fawutong.mapper;

import java.util.List;

import cn.edu.neusoft.fawutong.domain.Case;

public interface CaseDao {
	
	public List<Case> getAllCase();
	
	public List<Case> getSearchCase(String ctitle);
	
	public Case getFindCase(String id);
	
	public void updateCase(Case ca);
	
	public void delCase(String id);

	public List<Case> selectFindCase(String date);

}
