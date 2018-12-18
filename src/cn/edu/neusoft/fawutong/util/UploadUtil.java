package cn.edu.neusoft.fawutong.util;

import java.io.File;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

public class UploadUtil {
	
	/*** 
     * 上传文件 用@RequestParam注解来指定表单上的file为MultipartFile 
     *  
     * @param file 
     * @return 
     */  
    public static String fileUpload(@RequestParam("file") MultipartFile file , String path ,boolean isUser) { //true为用户，其他都是资讯和案例，放在一起
    	String filePath = null;
    	//因为传过来的带"/"
//    	System.out.println(path.substring(0, path.length()-1));
//    	File pathFile = new File(path.substring(0, path.length()-1));
//    	//判断文件夹
//    	if  (!pathFile.exists())      
//    	{       
//    	    System.out.println("//不存在");  
//    	    pathFile.mkdir();    
//    	} 
        // 判断文件是否为空  
        if (!file.isEmpty()) {  
            try {  
                // 文件保存路径  
            	//服务器路径,项目一致服务器时，资源文件会被替换掉，为了安全，服务器先做好备份，然后图片资源还原
            	if (isUser) {
            		filePath = path + "fawutongImg/upload/userImg/" + file.getOriginalFilename();  
            	}else{
            		filePath = path + "fawutongImg/upload/newsImg/" + file.getOriginalFilename();
            	}
                // 转存文件  
                file.transferTo(new File(filePath));
                //System.out.println("服务器路径 ：" + filePath);
                if (isUser) {
                	filePath = "fawutongImg/upload/userImg/" + file.getOriginalFilename();  
                }else{
                	filePath = "fawutongImg/upload/newsImg/" + file.getOriginalFilename();
                }
            } catch (Exception e) {  
                e.printStackTrace();  
                return "error";
            }  
        }
        return filePath;  
    }
}
