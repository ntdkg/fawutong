package cn.edu.neusoft.fawutongadmin.ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.neusoft.fawutong.domain.News;
import cn.edu.neusoft.fawutong.util.DateUtil;
import cn.edu.neusoft.fawutong.util.UploadUtil;
import cn.edu.neusoft.fawutongadmin.service.AdminNewsService;

@Controller
public class AdminUploadAction {
	
	@Autowired
	private AdminNewsService newService;
	
	@RequestMapping("/fawutongadmin/forms")
	public ModelAndView homepage(){
		ModelAndView mv=new ModelAndView("fawutongadmin/forms");
		return mv;
	}
	
	@RequestMapping(value="/fawutongadmin/addNews",method=RequestMethod.POST)
	public ModelAndView addNews(News news,HttpServletRequest request,HttpSession session) {
		//获取文件
		MultipartHttpServletRequest multipartRequest  =  (MultipartHttpServletRequest) request;
		MultipartFile imgFile  =  multipartRequest.getFile("imgFile"); 
		String path = request.getSession().getServletContext().getRealPath("/");
		String str = UploadUtil.fileUpload(imgFile,path,false);
		System.out.println("上传图片"+str);
		if (str == null || str.equals("")) {
			//默认图片保存图片
			str = "fawutongImg/upload/noimg.jpg";
		}else if(str.equals("error")) {
			ModelAndView mv=new ModelAndView("fawutongadmin/result");
			mv.addObject("msg", "上传图片失败，数据不更新");
			mv.addObject("href", "forms.html");
			return mv;
		}
		news.setNimg(str);
		//获取当前时间
		news.setNdate(DateUtil.getDateNowStr());
		//添加数据
		try {
			newService.addNewsService_admin(news);
		} catch (Exception e) {
			// TODO: handle exception
			ModelAndView mv=new ModelAndView("fawutongadmin/result");
			mv.addObject("msg", e);
			mv.addObject("href", "forms.html");
			return mv;
		}
		ModelAndView mv=new ModelAndView("fawutongadmin/result");
		mv.addObject("msg", "上传成功");
		mv.addObject("href", "forms.html");
		return mv;
	}
}
