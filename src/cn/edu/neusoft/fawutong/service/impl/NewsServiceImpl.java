package cn.edu.neusoft.fawutong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.neusoft.fawutong.domain.News;
import cn.edu.neusoft.fawutong.mapper.NewsDao;
import cn.edu.neusoft.fawutong.service.NewsService;


@Service
public class NewsServiceImpl implements NewsService {

	@Autowired
	private NewsDao dao;
	
	@Override
	public List<News> getNews() {
		// TODO Auto-generated method stub
		return dao.getAllNews();
	}

	@Override
	public News getFindNewsInfo(String id) {
		// TODO Auto-generated method stub
		return dao.getFindNews(id);
	}

	@Override
	public List<News> getAllInfomation() {
		// TODO Auto-generated method stub
		return dao.getAllInfomation();
	}
	
}
