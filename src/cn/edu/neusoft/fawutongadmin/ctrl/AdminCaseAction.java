package cn.edu.neusoft.fawutongadmin.ctrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.edu.neusoft.fawutong.domain.Case;
import cn.edu.neusoft.fawutongadmin.service.AdminCaseService;

@Controller
public class AdminCaseAction {
	
	@Autowired
	private AdminCaseService caseService;
	
	@RequestMapping("/fawutongadmin/case")
	public String showCase(Model mv,String search){
		String ctitle;
		if (search == null || search.equals("")) {
			ctitle = "%%";
		}else{
			ctitle = "%"+search+"%";
		}
		//获取数据库数据
		List<Case> cases = caseService.getSearchCase(ctitle);
		mv.addAttribute("cases", cases);
		return "/fawutongadmin/case";
	}
	
	@RequestMapping("/fawutongadmin/caseChange")
	public String adminCaseChange(Model mv, String id) {
		//获取单用户信息
		Case ca = caseService.getFindCaseInfo_admin(id);
		mv.addAttribute("ca", ca);
		return "fawutongadmin/caseChange";
	}
	
	@RequestMapping(value="/fawutongadmin/caseEdit",method=RequestMethod.POST)
	public String adminCaseEdit(Model mv, Case ca) {
		
		try {
			caseService.updateCaseInfo_admin(ca);
		}catch (Exception e) {
			System.out.println(e);
			mv.addAttribute("msg", "修改失败");
			mv.addAttribute("href", "case.html");
			return "fawutongadmin/result";
		}
		
		mv.addAttribute("msg", "修改成功");
		mv.addAttribute("href", "case.html");
		return "fawutongadmin/result";
	}
	
	@RequestMapping("/fawutongadmin/caseDel")
	public String adminCaseDel(Model mv , String id) {
		try {
			caseService.delCaseInfo_admin(id);
		}catch (Exception e) {
			mv.addAttribute("msg", "删除失败");
			mv.addAttribute("href", "case.html");
			return "fawutongadmin/result";
		}
		mv.addAttribute("msg", "删除成功");
		mv.addAttribute("href", "case.html");
		return "fawutongadmin/result";
	}
	
}
