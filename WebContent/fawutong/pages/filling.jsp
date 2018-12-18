<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>网上立案</title>

<link href="../css/common.css" rel="stylesheet"/>
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet" type="text/css" media="all" />

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Seed Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<script src="../js/LibJs/jquery.min.js"> </script>
<script src="../js/LibJs/bootstrap.js"></script>
<script src="../js/LibJs/modernizr.custom.js"></script>

<script type="text/javascript" src="../js/LibJs/move-top.js"></script>
<script type="text/javascript" src="../js/LibJs/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},900);
			});
		});
</script>

</head>
<body style="font-family: 'microsoft yahei';">
	
	<jsp:include page="nomal_nav.jsp"></jsp:include>
	
		<div class="banner banner5">
		<div align="center" style="padding: 32px;">
			<a href="index.html"><img width="128px" height="128px" src="../img/img_logo_280px.png" style="border-radius: 100%;" /></a>
		</div>
		<h1 style="color: #FFFFFF; font-weight: bold; margin-bottom: 32px; text-align: center;">网上立案</h1>
		<div class="clearfix"> </div>
	 </div>  
	
	<div class="contact">
		<div class="container"> 
			 <div align="center" class="contact-content">
	       		<form role="form" method="POST" action="dofilling.html" style="width: 65%;">
		       		<select id="peopleNum" style="margin-bottom: 10px; float: left; width: 47%;" class="form-control" data-toggle="select">
						<option value="0" style="color: #B2BCC5;">立案类型</option>
						<option value="1">民事案件</option>
						<option value="2">刑事案件</option>
					</select>
					<select id="peopleNum" name="uctype" style="margin-bottom: 10px;  float: right; width: 47%;" class="form-control" data-toggle="select">
						<option value="0" style="color: #B2BCC5;">请选择</option>
						<option value="人格权纠纷">人格权纠纷</option>
						<option value="婚姻家庭纠纷">婚姻家庭纠纷</option>
			    		<option value="继承纠纷">继承纠纷</option>
			    		<option value="不动产登记纠纷">不动产登记纠纷</option>
			    		<option value="物权保护纠纷">物权保护纠纷</option>
			    		<option value="其他...">其他...</option>
					</select>
					<input type="hidden" name="uid" value="${sessionScope.user.uid}"/>
	       			<!-- <input id="startTime" name="sendtime" type="datetime-local" value="" placeholder="立案时间" class="form-control" style="width: 100%;" /> -->
	       			<input name="nickname" style="border-radius: 5px;" type="text" class="textbox" placeholder="姓名" value="${(empty sessionScope.user.lname)? '姓名': sessionScope.user.lname }" required="required" >
				    <input name="idcode" style="border-radius: 5px;" type="text" class="textbox" placeholder="身份证号" value="" required="required">
					<input name="telephone" style="border-radius: 5px;" type="text" class="textbox" placeholder="联系方式" value="${sessionScope.user.uphone }" required="required">	
					<div class="clear"> </div>
				    <div>
					    	<textarea name="description" style="border-radius: 5px;" value="Message:" placeholder="描述您的案件..." required="required" ></textarea>
				    </div>	
				   <div class="submit"> 
					    <input type="submit" value="提交" style="background: #FF5555; color: white; font-weight: bold; border-radius: 20px; padding: 10px 45px;" />
		           </div>
				</form>
			 </div>
	 	</div>	
	 </div>	        	
	<jsp:include page="../footer.jsp"/>
</body>
</html>