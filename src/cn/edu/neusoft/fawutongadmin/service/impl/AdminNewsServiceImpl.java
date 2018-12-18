package cn.edu.neusoft.fawutongadmin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.neusoft.fawutong.domain.News;
import cn.edu.neusoft.fawutong.mapper.NewsDao;
import cn.edu.neusoft.fawutong.mapper.UploadDao;
import cn.edu.neusoft.fawutongadmin.service.AdminNewsService;

@Service
public class AdminNewsServiceImpl implements AdminNewsService {

	@Autowired
	private UploadDao uploadDao;
	@Autowired
	private NewsDao newsDao;
	
	@Override
	public void addNewsService_admin(News news) {
		// TODO Auto-generated method stub
		uploadDao.addNews_admin(news);
	}

	@Override
	public List<News> getNews_admin() {
		// TODO Auto-generated method stub
		return newsDao.getAllNews();
	}

	@Override
	public News getFindNewsInfo_admin(String id) {
		// TODO Auto-generated method stub
		return newsDao.getFindNews(id);
	}

	@Override
	public void updateNewsInfo_admin(News news) {
		// TODO Auto-generated method stub
		newsDao.updateNews(news);
	}

	@Override
	public void delNewsInfo_admin(String id) {
		// TODO Auto-generated method stub
		newsDao.delNews(id);
	}

	@Override
	public List<News> getSearchNews(String ntitle) {
		// TODO Auto-generated method stub
		return newsDao.getSearchNews(ntitle);
	}

}