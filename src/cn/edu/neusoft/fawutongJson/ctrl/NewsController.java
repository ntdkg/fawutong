package cn.edu.neusoft.fawutongJson.ctrl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.neusoft.fawutong.domain.News;
import cn.edu.neusoft.fawutong.service.NewsService;

@Controller
public class NewsController {
	
	@Autowired
	private NewsService newsService;
	
	@ResponseBody 
	@RequestMapping(value="/fawutongJson/getInfomations",method=RequestMethod.GET)
	public Map<String,Object> getAllinformation(HttpServletResponse response){
		Map<String,Object> map = new HashMap<String,Object>();
		response.setHeader("Access-Control-Allow-Origin", "*");
		List<News> list = newsService.getAllInfomation();
		if (list != null) {
			map.put("data", list);
			map.put("result", "succeed");
		}else{
			map.put("data", new ArrayList());
			map.put("result", "error");
		}
		return map;
	}
	
}
