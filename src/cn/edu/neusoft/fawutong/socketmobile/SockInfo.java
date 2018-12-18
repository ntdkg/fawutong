package cn.edu.neusoft.fawutong.socketmobile;
import java.io.PrintWriter;
import java.util.ArrayList;

class SockInfo {
	
	//发送方
	PrintWriter send;
	//发送方账号
	String sendAccount;
	//接受方账号
	String getAccount;
	
	//发送信息infolist;
	public ArrayList<String> strInfo;
	
	public SockInfo(PrintWriter send,String sendAccount,String getAccount,String info) {
		this.send = send;
		this.sendAccount = sendAccount;
		this.getAccount = getAccount;
		this.strInfo = new ArrayList<String>();
		this.strInfo.add(info);
	}
	
}