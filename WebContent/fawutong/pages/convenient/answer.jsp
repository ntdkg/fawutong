<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>公告信息</title>
<!--css-->
<link href="../../css/common.css" rel="stylesheet" />
<link href="../../css/bootstrap.css" rel="stylesheet">
<link href="../../css/style.css" rel="stylesheet" type="text/css" media="all" />

<!--/css-->
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->		
<!-- js -->
<script src="../../js/LibJs/jquery.min.js"> </script>
<script src="../../js/LibJs/bootstrap.js"></script>
<script src="../../js/LibJs/modernizr.custom.js"></script>
<!-- /js -->
<!--fonts-->
<style type="text/css">
	h3 {
		font-family: '微软雅黑','arial rounded mt bold','楷体';	
	}
	.h3 {
		font-family: '微软雅黑','arial rounded mt bold','楷体';	
	}
</style>
<!--/fonts-->
<!--script-->
<script type="text/javascript" src="../js/LibJs/move-top.js"></script>
<script type="text/javascript" src="../js/LibJs/easing.js"></script>
<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},900);
				});
			});
			
		function showSubMenu(li){
			var subMenu = li.getElementsByTagName('ul')[0];
			subMenu.style.display = 'block';
		}

		function hideSubMenu(li){
			var subMenu = li.getElementsByTagName('ul')[0];
			subMenu.style.display = 'none';
		}
</script>
<!--/script-->
</head>
<body>
	<jsp:include page="../nomal_nav.jsp"/>
	
	<!--header-->
	<div class="banner banner5">
			     <div class="logo1">
				<a href="../../index.html"><img src="../../img/img_logo_280px.png" style="border-radius: 100%" /></a>
			</div>
	<div class="clearfix"> </div>
		 </div>  
	<!--single-page-->
	 <div class="banner-bdy sig">
		<div class="container">
			<div class="single">
			<div class="sing-img-text">
				<img src="../../img/1.jpeg" class="img-responsive" alt=" ">
				<div class="sing-img-text1" style="font-family: '微软雅黑','arial rounded mt bold','楷体';">
					<h3 style="font-family: '微软雅黑','arial rounded mt bold','楷体';">您搜索的相关案件指南</h3>
					<p class="est">
						案件详情：不知道说什么好
					</p>
					<div class="com">
						<h3 style="font-family: '微软雅黑','arial rounded mt bold','楷体';" class="commant">律师&网友解答</h3>
						<ul class="media-list">
						  <li class="media">
							<div class="media-left">
							  <a href="#">
								<img class="media-object" src="../../img/images/s1.jpg" alt="" />
							  </a>
							</div>
							<div class="media-body">
							  <h4 class="h3" class="media-heading">Simmy</h4>
							  Cras sit amet nibh libero, in gravida nulla. Nulla vel metus 
							  scelerisque ante sollicitudin commodo. Cras purus odio, 
							  vestibulum in vulputate at, tempus viverra turpis. 
							  Fusce condimentum nunc ac nisi vulputate fringilla. 
							  Donec lacinia congue felis in faucibus.
							  <a href="#">支持</a>
							</div>
						  </li>
						  <li class="media">
							<div class="media-left">
							  <a href="#">
								<img class="media-object" src="../../img/images/s2.jpg" alt="" />
							  </a>
							</div>
							<div class="media-body">
							  <h4 class="h3" class="media-heading">Sandra Rickon</h4>
							  Cras sit amet nibh libero, in gravida nulla. Nulla vel metus 
							  scelerisque ante sollicitudin commodo. Cras purus odio, 
							  vestibulum in vulputate at, tempus viverra turpis. 
							  Fusce condimentum nunc ac nisi vulputate fringilla. 
							  Donec lacinia congue felis in faucibus.
							  <a href="#" style="">支持</a>
							</div>
						  </li>
						  <li class="media">
							<div class="media-left">
							  <a href="#">
								<img class="media-object" src="../../img/images/s3.jpg" alt="" />
							  </a>
							</div>
							<div class="media-body">
							  <h4 class="h3" class="media-heading">Rita Rider</h4>
							  Cras sit amet nibh libero, in gravida nulla. Nulla vel metus 
							  scelerisque ante sollicitudin commodo. Cras purus odio, 
							  vestibulum in vulputate at, tempus viverra turpis. 
							  Fusce condimentum nunc ac nisi vulputate fringilla. 
							  Donec lacinia congue felis in faucibus.
							  <a href="#">支持</a>
							</div>
						  </li>
						</ul>
					</div>
					
				</div>
			</div>
			<div class="sing-img-text-left">
				<div class="blog-right1">
					<div class="search11">
						<h3 style="font-family: '微软雅黑','arial rounded mt bold','楷体';">搜索其他案件指南...</h3>
						<form>
							<input style="font-family: '微软雅黑','arial rounded mt bold','楷体'; width: 70%; border-radius: 20px; padding: 6px 10px; border: 1px #C0C0C0 solid;"  type="text" value="输入关键字" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '输入关键字';}" required="">
							<input style="font-family:'microsoft yahei'; background: #FF5555; color: white; width: 28%; border-radius: 20px; padding: 6px auto; font-size: medium;" type="submit" value="咨询">
						</form>
					</div>
					<div class="categories">
						<h3 style="font-family: '微软雅黑','arial rounded mt bold','楷体';">其他类似案件指南</h3>
						<ul>
							<li><a href="#">Aliquam dapibus tincidunt</a></li>
							<li><a href="#">Donec sollicitudin molestie</a></li>
							<li><a href="#">Fusce feugiat malesuada odio</a></li>
							<li><a href="#">Cum sociis natoque penatibus</a></li>
							<li><a href="#">Magnis dis parturient montes</a></li>
							<li><a href="#">Donec sollicitudin molestie</a></li>
						</ul>
					</div>
					<div class="categories categories-mid">
						<h3 style="font-family: '微软雅黑','arial rounded mt bold','楷体';">近期处理方案</h3>
						<ul>
							<li><a href="#">May 20,2009</a></li>
							<li><a href="#">July 31,2010</a></li>
							<li><a href="#">January 20,2012</a></li>
							<li><a href="#">November 2,2012</a></li>
							<li><a href="#">December 25,2014</a></li>
							<li><a href="#">January 14,2015</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="clearfix"> </div>
			<div class="leave-a-comment">
				<h3 style="font-family: '微软雅黑','arial rounded mt bold','楷体';">发表您的意见</h3> 
				<form>
					<input type="text" value="你的名称" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '您的名称';}" required="">
					<input type="text" value="手机号" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '手机号';}" required="">
					<input type="text" value="律师执照号" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '律师执照号';}" required="">
					<textarea type="text" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '您给出的建议与解答';}" required="">您给出的建议与解答</textarea>
					<input style="font-family: '微软雅黑','arial rounded mt bold','楷体';" type="submit" value="发表意见">
				</form>
			</div>
		</div>
		</div>
	</div>

<jsp:include page="../../footer.jsp"></jsp:include>
</body>

</html>