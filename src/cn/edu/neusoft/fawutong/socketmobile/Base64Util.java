package cn.edu.neusoft.fawutong.socketmobile;
import java.io.UnsupportedEncodingException;
import java.util.Base64;    
  
public class Base64Util {  
    // 加密  
    public static String getBase64(String str) {  
        byte[] b = null;  
        String s = null;  
        try {  
            b = str.getBytes("utf-8");  
        } catch (UnsupportedEncodingException e) {  
            e.printStackTrace();  
        }  
        if (b != null) {  
            s = Base64.getEncoder().encodeToString(b);  
        }  
        return s;  
    }
    
    // 解密  
    public static String getFromBase64(String s) {  
        byte[] b = null;  
        String result = null;  
        if (s != null) {  
            try {  
                b = Base64.getDecoder().decode(s);  
                result = new String(b, "utf-8");  
            } catch (Exception e) {  
                e.printStackTrace();  
            }  
        }  
        return result;  
    }  
    
    public static void main(String args[]) {  
        String s = new String("tangfuqiang");  
        System.out.println("原始：" + s);  
        System.out.println("base64后：" + getBase64(s));  
        System.out.println("base64解密后：" + getFromBase64(getBase64(s)));
  
    }  
}  