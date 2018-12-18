<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"></script>
<link rel="stylesheet" href="../../css/common.css" />
<link href="../../css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="../../js/jquery-1.11.1.min.js"></script>
<script type="application/x-javascript">
function sendEm(){
     if($("#EMAIL").val()==""){
    	
        $("#EMAIL").tips({
            side:3,
            msg:'请输入邮箱',
            bg:'#AE81FF',
            time:2
        });
        $("#EMAIL").focus();
        return false;
    }
   /*  console.log( "#TITLE");
    if($("#TITLE").val()==""){
        $("#TITLE").tips({
            side:3,
            msg:'请输入标题',
            bg:'#AE81FF',
            time:2
        });
        $("#TITLE").focus();
        return false;
    } */
    if($("#CONTENT").val()==""){

        $("#nr").tips({
            side:1,
            msg:'请输入内容',
            bg:'#AE81FF',
            time:3
        });
        return false;
    }  

    var EMAIL = $("#EMAIL").val();
   // var TYPE  = $("#TYPE").val();
    var TITLE = $("#TITLE").val();
    var CONTENT = $("#CONTENT").val();

     $("#zhongxin").hide();
    $("#zhongxin2").show(); 

    $.ajax({
        type: "POST",
        url: 'sendEmailM.html',
        data: {EMAIL:EMAIL,TITLE:TITLE,CONTENT:CONTENT},
        dataType:'json',
       // contentType:"application/json;charset=utf-8",
        //beforeSend: validateData,
        cache: false,
        success: function(data){
            if("ok" == data.result){
                $("#msg").tips({
                        side:3,
                        msg:'发送成功！',
                        bg:'#68B500',
                        time:5
                      });
                setTimeout("showdiv()",1000);   
            }else{
                $("#msg").tips({
                        side:3,
                        msg:'发送失败!',
                        bg:'#68B500',
                        time:5
                      });
            }

        }
    });

}

</script>
<title>send email</title>
</head>
<body>

<div align="center">
	<h1 style="color: #454545; font-weight: bold; font-size: xx-large; margin-bottom: 0px; margin-top: 32px; margin-bottom:32px; text-align: center;">邮件发送</h1>
</div>
<div align="center">
	<img src="../../img/kefu.svg" width="260px" style="position: absolute; right: 10px;" />
	<table style="width:90%;" >
	    <tr>
	        <td style="margin-top:0px;">
	             <div>
		             <textarea name="EMAIL" id="EMAIL" rows="1" cols="50" style="width:80%; height:50px; padding-top:13px; padding-left: 16px;" placeholder="请选输入对方邮箱,多个请用(;)分号隔开">${email}</textarea>
	             </div>
	        </td>
	    </tr>
	    <tr>
	        <td>
	             <input type="text" name="TITLE" id="TITLE" value="" placeholder="请选输入邮件标题..." style="width:80%; height:50px; padding-left: 16px;"/>
	        </td>
	    </tr>
	    <tr>
	        <td id="nr">
	             <script id="editor" type="text/plain" style="width:650px;height:259px;"></script>
	        
	             <input type="text" name="CONTENT" id="CONTENT" value="" placeholder="请输入邮件内容..." style="width:80%; height:300px; padding-left: 16px;"/>
	        </td>
	    </tr>
	    <tr>
	        <td style="text-align: center;">
	            <a class="btn btn-mini btn-primary" style="background: #55DD77; color: white; border-radius: 20px; padding: 8px 25px; margin-right: 8px; border:0; margin-top: 32px;" onclick="sendEm();">发送</a>
	           <a class="btn btn-mini btn-danger" style="background: #FF5555; color: white; border-radius: 20px; padding: 8px 25px; margin-right: 8px; border:0; margin-top: 32px;" onclick="top.Dialog.close();">取消</a>
	        </td>
	    </tr>
	</table>
	</div>
	<div id="zhongxin2" class="center" style="display:none"><br/> <br/>
		<h4 class="lighter block green" id='msg'>发送成功</h4>
	</div>
	 
	</body>
</html>