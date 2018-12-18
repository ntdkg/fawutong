package cn.edu.neusoft.fawutong.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.neusoft.fawutong.domain.Users;

public class LawyerUserLoginInterceptor implements HandlerInterceptor{

	//全部完成后处理
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	//拦截后处理 
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		if(user != null) {   
			if (user.getUphone() != null && ! user.getUphone().equals("")) {
			     //判断用户是否是律师用户
				if (user.getLisLaw().equals("是")) {
					return true;
				}
			}
		}
		response.sendRedirect("/fawutongWeb/fawutong/pages/login.html"); 
		return false;  
	}
}
