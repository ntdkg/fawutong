package cn.edu.neusoft.fawutong.socketmobile;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;


public class SimpleChatServer {  
	
//    public static void main(String[] args){  
//        //new SimpleChatServer().go();  
////        Map<String,String> map = ServerUtil.getServerInfo("from:账号&to:账号&isFirst:true&msg:in:fo");
////        System.out.println(map.toString());
//    }
      
    public static void go() throws IOException{  
    	ServerSocket serverSock = null;
        try{  
            serverSock = new ServerSocket(1234);  
            while(true){  
                Socket clientSocket = serverSock.accept();    
                ClientThread t = new ClientThread(clientSocket);  
                t.start();  
            }  
        }catch(Exception ex){  
            ex.printStackTrace();  
        }finally {
        	serverSock.close();
        }
    }  
} 