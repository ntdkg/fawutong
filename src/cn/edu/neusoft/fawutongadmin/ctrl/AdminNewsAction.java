package cn.edu.neusoft.fawutongadmin.ctrl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import cn.edu.neusoft.fawutong.domain.News;
import cn.edu.neusoft.fawutong.util.UploadUtil;
import cn.edu.neusoft.fawutongadmin.service.AdminNewsService;

@Controller
public class AdminNewsAction {
	
	@Autowired
	private AdminNewsService newsService;
	
	@RequestMapping("/fawutongadmin/news")
	public String homepage(Model mv,String search){
		String ntitle;
		if (search == null || search.equals("")) {
			 ntitle = "%%";
		}else{
			 ntitle = "%"+search+"%";
		}
		List<News> news = newsService.getSearchNews(ntitle);
		mv.addAttribute("news", news);
		return "fawutongadmin/news";
	}
	
	@RequestMapping("/fawutongadmin/newsChange")
	public String adminUserChange(Model mv,String id) {
		News news = newsService.getFindNewsInfo_admin(id);
		mv.addAttribute("news", news);
		return "fawutongadmin/newsChange";
	}
	
	@RequestMapping("/fawutongadmin/newsDel")
	public String adminNewsDel(Model mv, String id) {
		try {
			newsService.delNewsInfo_admin(id);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			mv.addAttribute("msg", "信息删除失败");
			mv.addAttribute("href", "news.html");
			return "fawutongadmin/result";
		};
		mv.addAttribute("msg", "信息删除成功");
		mv.addAttribute("href", "news.html");
		return "fawutongadmin/result";
	}
	
	@RequestMapping(value="/fawutongadmin/newsEdit",method=RequestMethod.POST)
	public String adminNewsEdit(Model mv, News news,HttpServletRequest request,HttpSession session) {
		//获取上传图片
		//获取文件
		MultipartHttpServletRequest multipartRequest  =  (MultipartHttpServletRequest) request;
		MultipartFile imgFile  =  multipartRequest.getFile("imgFile"); 
		String path = request.getSession().getServletContext().getRealPath("/");
		System.out.println("本机tomcat服务器下地址"+path);
		String str = UploadUtil.fileUpload(imgFile,path,false);
		System.out.println("上传图片"+str);
		if(str!=null && str.equals("error")) {
			mv.addAttribute("msg", "更新信息头像失败");
			mv.addAttribute("href", "news.html");
			return "fawutongadmin/result";
		}
		//空值在sql做判断
		news.setNimg(str);
		//添加数据
		try {
			newsService.updateNewsInfo_admin(news);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			mv.addAttribute("msg", "信息更新失败");
			mv.addAttribute("href", "news.html");
			return "fawutongadmin/result";
		};
		mv.addAttribute("msg", "信息更新成功");
		mv.addAttribute("href", "news.html");
		return "fawutongadmin/result";
	}
}
