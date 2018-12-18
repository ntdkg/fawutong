package cn.edu.neusoft.fawutong.socketmobile;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Writer;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

public class ClientThread extends Thread {

	ArrayList<PrintWriter> clientOutputStreams;
	BufferedReader reader;  
    Socket sock;  
    InputStreamReader isReader;
    
	public ClientThread(Socket socket) {
		try{  
            this.sock = socket;  
            isReader = new InputStreamReader(sock.getInputStream());  
            reader = new BufferedReader(isReader);  
        }catch(Exception ex){  
            ex.printStackTrace();  
        }
	}

	private void isFirstOn(Map<String,String> map,PrintWriter writer) {
		 Iterator<SockInfo> it = SockManager.shareInstance().it.iterator(); 
         int i = 0;
         while(it.hasNext()) {
         	SockInfo info = (SockInfo)it.next();
         	if (info.send.equals(writer) && 
         		info.sendAccount.equals(map.get("from")) && 
         		info.getAccount.equals(map.get("to"))) {
         		//有缓存
         		info.strInfo.add(map.get("msg"));
         		i = 1;
         		break;
         	}
         }
         if (0 == i) {
         	SockInfo newinfo = new SockInfo(writer,map.get("from"),map.get("to"),map.get("msg"));
     		SockManager.shareInstance().it.add(newinfo);
         }
	}
	
	private void sendInfo(Map<String,String> map) {
		//我发送的人要是存在，说明他在服务器上
		Iterator<SockInfo> it = SockManager.shareInstance().it.iterator(); 
        while(it.hasNext()) {
        	SockInfo info = (SockInfo)it.next();
        	if (info.sendAccount.equals(map.get("to"))) {
        		//有缓存
        		PrintWriter writer = info.send;
        		try{    
        			writer.println(map.get("msg"));  
        			writer.flush();
        		}catch(Exception ex){  
        			ex.printStackTrace();  
        		}finally {
    
        		}
        	}
        }
	}
	
	private void getAllInfo(Map<String,String> map,PrintWriter writer) {
		Iterator<SockInfo> it = SockManager.shareInstance().it.iterator(); 
        while(it.hasNext()) {
        	SockInfo info = (SockInfo)it.next();
        	if (info.sendAccount.equals(map.get("to")) && 
        		info.getAccount.equals(map.get("from"))) {
        		//有缓存
        		for (int i = 0;i<info.strInfo.size();i++) {
        			try{    
            			writer.println(info.strInfo.get(i));  
            			writer.flush();
            		}catch(Exception ex){  
            			ex.printStackTrace();  
            		}finally {
            			
            		}
        		}
        	}
        }
	}
	
	private void deleteInfo(Map<String,String> map,PrintWriter writer) {
		Iterator<SockInfo> it = SockManager.shareInstance().it.iterator(); 
        while(it.hasNext()) {
        	SockInfo info = (SockInfo)it.next();
        	if (info.send.equals(writer) && 
        		info.sendAccount.equals(map.get("from")) && 
        		info.getAccount.equals(map.get("to"))) {
        		SockManager.shareInstance().it.remove(info);
        		break;
        	}
        }
	}
	
	@Override
	public void run() {
		// TODO Auto-generated method stub
//		super.run();
		String message;
		Map<String,String> map = null;
        try{  
        	PrintWriter writer = new PrintWriter(sock.getOutputStream());
        	
            while((message = reader.readLine()) != null){  
                System.out.println("server: read: " + message);  
                //从全局数组对象中获取单对单的信息(需要解密，暂未添加)
                //from:账号&to:账号&isFirst:true&msg:in:fo
                //message = Base64Util.getFromBase64(message);
                map = ServerUtil.getServerInfo(message);
                //判断是否存放
                this.isFirstOn(map, writer);
                //如果是第一次则将缓存放入其中
                if (map.get("isFirst").equals("true")) {
                	//将有关发送它数据下发
                	this.getAllInfo(map, writer);
                }
                //针对用户发送数据
                this.sendInfo(map);
            }  
            //没数据或者断开连接
            //删除对象类
        	this.deleteInfo(map, writer);
        }catch(Exception ex){  
            ex.printStackTrace();  
        }finally {
        	
        	try {
				this.reader.close();
				this.sock.close();
				this.isReader.close();
			} catch (IOException e) {
					// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
	}
	
}
