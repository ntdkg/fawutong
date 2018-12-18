package cn.edu.neusoft.fawutong.socketmobile;
import java.io.PrintWriter;
import java.util.ArrayList;

public class SockManager {
	
	public ArrayList<SockInfo> it;
	static private SockManager manager = null;
	
	static public SockManager shareInstance() {
		if (null == manager) {
			manager = new SockManager();
		}
		return manager;
	}
	
	private SockManager() {
		it = new ArrayList<SockInfo>();
	}
	
}

