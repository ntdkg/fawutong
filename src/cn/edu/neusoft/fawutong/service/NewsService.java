package cn.edu.neusoft.fawutong.service;

import java.util.List;

import cn.edu.neusoft.fawutong.domain.News;

public interface NewsService {
	public List<News> getNews();
	public News getFindNewsInfo(String id);
	public List<News> getAllInfomation();
}
