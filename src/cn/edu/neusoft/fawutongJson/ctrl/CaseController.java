package cn.edu.neusoft.fawutongJson.ctrl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.neusoft.fawutong.domain.Case;
import cn.edu.neusoft.fawutong.service.CaseService;

@Controller
public class CaseController {
	
	@Autowired
	private CaseService caseService;
	
	@ResponseBody
	@RequestMapping("/fawutongJson/getAllCaseInfo")
	public Map<String,Object> getAllCase() {
		List<Case> cases = caseService.getAllCase();
		Map<String,Object> map = new HashMap<String,Object>();
		if (cases != null) {
			map.put("data", cases);
		}else{
			map.put("data", new ArrayList());
		}
		map.put("result", "success");
		return map;
	}
	
}
