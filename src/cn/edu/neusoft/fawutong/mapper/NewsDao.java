package cn.edu.neusoft.fawutong.mapper;

import java.util.List;

import cn.edu.neusoft.fawutong.domain.News;

public interface NewsDao {
	
	//获取所有的最新资讯
	public List<News> getAllInfomation();
	
	public List<News> getSearchNews(String ntitle);
	
	//获取所有案件
	public List<News> getAllNews();

	public News getFindNews(String id);
	
	public void updateNews(News news);
	
	public void delNews(String id);
	
	
}
