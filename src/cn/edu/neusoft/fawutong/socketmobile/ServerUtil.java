package cn.edu.neusoft.fawutong.socketmobile;
import java.util.HashMap;
import java.util.Map;

public class ServerUtil {
	//工具，例如传输规则
	//"from:账号&to:账号&isFirst:true&msg:in:fo"
	public static Map<String,String> getServerInfo(String str) {
		System.out.println(str);
		Map<String,String> map = new HashMap<String,String>();
		int currentIndex = 0;
		int lastIndex = 0;
		for (int i = 0;i<str.length();i++) {
			String s = (String) str.substring(i, i+1);
			if (s.equals("&") || str.length() - 1 == i) {
				currentIndex = (i == str.length() - 1) ? str.length():i;
				String st = str.substring(lastIndex, currentIndex);
				System.out.println(st);
				for (int j = 0;j<st.length();j++) {
					String c = st.substring(j, j+1);
					if (c.equals(":")) {  //只需要获取第一个冒号即可
						map.put(st.substring(0, j), st.substring(j+1, st.length()));
						break;
					}
				}
				lastIndex = i+1;
			}
		}
		return map;	
	}
}
