package cn.edu.neusoft.fawutongadmin.service;

import java.util.List;

import cn.edu.neusoft.fawutong.domain.News;

public interface AdminNewsService {
	public void addNewsService_admin(News news);
	public List<News> getSearchNews(String ntitle);
	public List<News> getNews_admin();
	public News getFindNewsInfo_admin(String id);
	public void updateNewsInfo_admin(News news);
	public void delNewsInfo_admin(String id);
}
