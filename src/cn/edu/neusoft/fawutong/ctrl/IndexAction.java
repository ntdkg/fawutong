package cn.edu.neusoft.fawutong.ctrl;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexAction {
	
	@RequestMapping("/index")
	public ModelAndView index(){
		ModelAndView mv=new ModelAndView("index"); // 在WebContent/index.html中跳转到真正主页
		return mv;
	}
	@RequestMapping("/404")
	public ModelAndView notFound(){
		ModelAndView mv=new ModelAndView("404");
		return mv;
	}
	@RequestMapping("/500")
	public ModelAndView serverError(){
		ModelAndView mv=new ModelAndView("500");
		return mv;
	}
	
	@RequestMapping("/fawutong/index")
	public String homepage(HttpSession session){
		return "fawutong/index";
	}
	
	@RequestMapping("/fawutong/pages/result")
	public String result() {
		return "/fawutong/pages/result";
	}

}
