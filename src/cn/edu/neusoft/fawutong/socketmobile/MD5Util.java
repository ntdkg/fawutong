package cn.edu.neusoft.fawutong.socketmobile;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Util {  
  
    /*** 
     * MD5加码 生成32位md5码 
     */  
	public static String getMd5(String plainText) {  
		try {  
			MessageDigest md = MessageDigest.getInstance("MD5");  
			md.update(plainText.getBytes());  
			byte b[] = md.digest();  
		   
			int i;  
		  
			StringBuffer buf = new StringBuffer("");  
			for (int offset = 0; offset < b.length; offset++) {  
				i = b[offset];  
				if (i < 0)  
					i += 256;  
				if (i < 16)  
					buf.append("0");  
				buf.append(Integer.toHexString(i));  
			}  
			//32位加密  
			return buf.toString();  
			// 16位的加密  
			//return buf.toString().substring(8, 24);  
		} catch (NoSuchAlgorithmException e) {  
			e.printStackTrace();  
			return null;  
		}  	
	}	  
  
    /** 
     * 加密解密算法 执行一次加密，两次解密 
     */   
    public static String convertMD5(String inStr){  
  
        char[] a = inStr.toCharArray();  
        for (int i = 0; i < a.length; i++){  
            a[i] = (char) (a[i] ^ 't');  
        }  
        String s = new String(a);  
        return s;  
  
    }  
  
    // 测试主函数  
    public static void main(String args[]) {  
        String s = new String("tangfuqiang");  
        System.out.println("原始：" + s);  
        System.out.println("MD5后：" + getMd5(s));  

  
    }  
} 