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

import cn.edu.neusoft.fawutong.domain.Users;
import cn.edu.neusoft.fawutong.util.UploadUtil;
import cn.edu.neusoft.fawutong.util.UserStatusStr;
import cn.edu.neusoft.fawutongadmin.service.AdminUsersService;

@Controller
public class AdminUserAction {
	
	@Autowired
	private AdminUsersService usersService;
	
	@RequestMapping("/fawutongadmin/users" )
	public String adminUserShow(Model mv,String search) {
		System.out.println("get"+search);
		String uname;
		if (search == null || search.equals("")) {
			uname = "%%";
		}else{
			uname = "%"+search+"%";
		}
		List<Users> users = usersService.getSearchUsers_admin(uname);
		mv.addAttribute("users", users);
		return "fawutongadmin/users";
	}
	
	@RequestMapping(value="/fawutongadmin/userChange", method=RequestMethod.GET)
	public String adminUserChange(Model mv , String id) {
		//获取到数据
		if (id != null) {
			Users user = usersService.getFindUsers_admin(id);
			mv.addAttribute("user", user);
			return "/fawutongadmin/userChange";
		}
		return "redirect:/fawutongadmin/users";
	}
	
	@RequestMapping(value="/fawutongadmin/userdel")
	public String userDel(Model mv,String id) {
		if (id != null) {
			try {
				usersService.delUserInfo_admin(id);
			}catch (Exception e) {
				mv.addAttribute("msg", "删除失败");
				mv.addAttribute("href", "users.html");
				return "/fawutongadmin/result";
			}
			mv.addAttribute("msg", "删除成功");
			mv.addAttribute("href", "users.html");
			return "/fawutongadmin/result";
		}
		return "redirect:/fawutongadmin/users";
	}
	
	@RequestMapping(value="/fawutongadmin/userEdit",method=RequestMethod.POST)
	public String userEdit(Model mv, Users user,HttpServletRequest request,HttpSession session) {
		//判断是否是律师用户或者是未通过（未通过的用户默认转换成普通用户）
		if (!user.getLisLaw().equals("是") || user.getLstatus().equals(UserStatusStr.nopass)) {
			user.setLisLaw("否");
			user.setLcity("");
			user.setLoffice("");
			user.setLresume("");
			user.setLstatus("未通过");
			user.setLisHot(0);
		}
		//获取上传图片
		//获取文件
		MultipartHttpServletRequest multipartRequest  =  (MultipartHttpServletRequest) request;
		MultipartFile imgFile  =  multipartRequest.getFile("imgFile"); 
		String path = request.getSession().getServletContext().getRealPath("/");
		String str = UploadUtil.fileUpload(imgFile,path,true);
		System.out.println("上传图片"+str);
		if(str!=null && str.equals("error")) {
			mv.addAttribute("msg", "更新用户头像失败");
			mv.addAttribute("href", "users.html");
			return "/fawutongadmin/result";
		}
		//空值在sql做判断
		user.setLimage(str);
		//添加数据
		try {
			usersService.updateUserInfo_admin(user);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			mv.addAttribute("msg", "用户更新失败");
			mv.addAttribute("href", "users.html");
			return "/fawutongadmin/result";
		};
		mv.addAttribute("msg", "更新成功");
		mv.addAttribute("href", "users.html");
		return "/fawutongadmin/result";
	}
	
}
