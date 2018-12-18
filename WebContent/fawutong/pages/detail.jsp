<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>公告详情</title>

<link href="../css/common.css" rel="stylesheet" />
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet" type="text/css" media="all" />

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>


<script src="../js/LibJs/bootstrap.js"></script>
<script src="../js/LibJs/modernizr.custom.js"></script>
<link rel="stylesheet" href="../css/semantic.css" type="text/css" />
<link rel="stylesheet" href="../css/zyComment.css" type="text/css" />
<style type="text/css" media="print, screen">  
	label {
	    font-weight: bold;
	}
	a {
		font-family: 微软雅黑;
	}
	#articleComment {
		width: 800px;
		height: 1500px;
		overflow: auto;
	}
</style> 
<!-- <style type="text/css">
	h3 {
		font-family: '微软雅黑','arial rounded mt bold','楷体';	
	}
	.h3 {
		font-family: '微软雅黑','arial rounded mt bold','楷体';	
	}
</style> -->
 
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

</head>
<body>
	<jsp:include page="nomal_nav.jsp"></jsp:include>

	<!--header-->
	<div class="banner banner5">
	<div align="center" style="padding: 32px;">
		<a href="index.html"><img width="128px" height="128px" src="../img/img_logo_280px.png" style="border-radius: 100%;" /></a>
	</div>
	<div class="clearfix"> </div>
		 </div>  
	<!--single-page-->
	 <div class="banner-bdy sig">
		<div class="container">
			<div class="single">
			<div class="sing-img-text">
			
				<div class="sing-img-text1" style="font-family: '微软雅黑','arial rounded mt bold','楷体';">
					<h3 style="font-family: '微软雅黑','arial rounded mt bold','楷体';">${news.ntitle }</h3>
						<div class="admin-tag1">
							<p>该文章来自于 <a href="single.html">${news.nsource}</a> in <a href="#">中国</a> | <a href="single.html">10 Comments</a></p>
						</div>
						<img src="${pageContext.request.contextPath}/${news.nimg }" width="100%" height="500px"/>
					<p class="est">
					${news.ncontext}
					</span>
					<br>
					${news.ndate}
					</p>
					<div class="com">
						<h3 style="font-family: '微软雅黑','arial rounded mt bold','楷体'; border-left: solid 4px #FF5555; padding-left: 8px; padding-bottom: 8px;" class="commant">律师留言</h3>
						<ul class="media-list">
						  <li class="media">
							<div class="media-left">
							  <a href="#">
								<img class="media-object" src="../img/images/s1.jpg" alt="" />
							  </a>
							</div>
							<div class="media-body">
							  <h4 class="h3" class="media-heading">张律师</h4>
							  成都交投城市停车管理有限公司收取的停车费属于行政事业性收费，不同于专营停车场，提供的票据不属于停车凭证；双方之间没有履行发放停车卡、交押车辆钥匙等行为，难以证明双方已形成了事实车辆保管关系。因此，如果车主将车辆停在路边占道停车位时发生被盗，很难维权。
							  <a href="#">支持</a>
							</div>
						  </li>
						  <li class="media">
							<div class="media-left">
							  <a href="#">
								<img class="media-object" src="../img/images/s2.jpg" alt="" />
							  </a>
							</div>
							<div class="media-body">
							  <h4 class="h3" class="media-heading">赵律师</h4>
							  赵先生缴纳停车费给交投停车公司，其实，双方已经形成了事实上的保管合同关系。依据《中华人民共和国合同法》，保管人没有尽到自己的保管义务导致财物的丢失，那么保管人对托管人应当承担民事赔偿责任。
具体到此事来说，交投停车公司应当对赵先生车辆失窃承担一定责任。
							  <a href="#">支持</a>
							</div>
						  </li>
						  <li class="media">
							<div class="media-left">
							  <a href="#">
								<img class="media-object" src="../img/images/s3.jpg" alt="" />
							  </a>
							</div>
							<div class="media-body">
							  <h4 class="h3" class="media-heading">李律师</h4>
							  建议咨询我们。
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
						<img height="80px" width="100%" src="../img/img_banner_03.jpg" class="img-responsive" style="margin-bottom: 16px; border-radius: 10px;">
						<h3 style="font-family: '微软雅黑','arial rounded mt bold','楷体'; border-left: solid 4px #FF5555; padding-left: 8px; padding-bottom: 8px;">你可能还想知道...</h3>
						<form>
							<input style="font-family: '微软雅黑','arial rounded mt bold','楷体'; width: 70%; border-radius: 20px; padding: 6px 10px; border: 1px #C0C0C0 solid;"  type="text" value="输入关键字" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '输入关键字';}" required="">
							<input style="font-family:'microsoft yahei'; background: #FF5555; color: white; width: 28%; border-radius: 20px; padding: 6px auto; font-size: medium;" type="submit" value="查找">
						</form>
					</div>
					<div class="categories">
						<h3 style="font-family: '微软雅黑','arial rounded mt bold','楷体'; border-left: solid 4px #FF5555; padding-left: 8px; padding-bottom: 8px;">其他类似案件</h3>
						<ul>
							<li><a href="#">交通事故</a></li>
							<li><a href="#">家庭婚姻</a></li>
							<li><a href="#">版权纠纷</a></li>
							<li><a href="#">公司经营</a></li>
						</ul>
					</div>
					<div class="categories categories-mid">
						<h3 style="font-family: '微软雅黑','arial rounded mt bold','楷体'; border-left: solid 4px #FF5555; padding-left: 8px; padding-bottom: 8px;">按时间查看</h3>
						<ul>
							<li><a href="#">2016.10</a></li>
							<li><a href="#">2016.09</a></li>
							<li><a href="#">2016.08</a></li>
							<li><a href="#">2016.07</a></li>
						</ul>
					</div>
					<div class="related-posts">
						<h3 style="font-family: '微软雅黑','arial rounded mt bold','楷体'; border-left: solid 4px #FF5555; padding-left: 8px; padding-bottom: 8px;">律师信息</h3>
						<div class="related-post">
							<div class="related-post-left">
								<a href="single.html"><img src="../img/images/team-2.jpg" class="img-responsive" alt=" " style="border-radius: 10px;"/></a>
							</div>
							<div class="related-post-right">
								<h4><a href="single.html">王律师</a></h4>
								<p>Aliquam dapibus tincidunt metus. 
									<span>Praesent justo dolor, lobortis.</span>
								</p>
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="related-post">
							<div class="related-post-left">
								<a href="single.html"><img src="../img/images/team-1.jpg" class="img-responsive" alt=" " style="border-radius: 10px;"/></a>
							</div>
							<div class="related-post-right">
								<h4><a href="single.html">张律师</a></h4>
								<p>Aliquam dapibus tincidunt metus. 
									<span>Praesent justo dolor, lobortis.</span>
								</p>
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="related-post">
							<div class="related-post-left">
								<a href="single.html"><img src="../img/images/team-3.jpg" class="img-responsive" alt=" " style="border-radius: 10px;"/></a>
							</div>
							<div class="related-post-right">
								<h4><a href="single.html">马律师</a></h4>
								<p>Aliquam dapibus tincidunt metus. 
									<span>Praesent justo dolor, lobortis.</span>
								</p>
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="related-post">
							<div class="related-post-left">
								<a href="single.html"><img src="../img/images/team-3.jpg" class="img-responsive" alt=" " style="border-radius: 10px;"/></a>
							</div>
							<div class="related-post-right">
								<h4><a href="single.html">陈律师</a></h4>
								<p>Aliquam dapibus tincidunt metus. 
									<span>Praesent justo dolor, lobortis.</span>
								</p>
							</div>
						 
						</div>
					</div>
				</div>
			</div> 
		 <div class="clearfix"> </div> 
			<div id="articleComment"></div>
<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../js/zyComment.js"></script>
<script type="text/javascript">
var agoComment = [
				  {"id":1,"userName":"游客1","time":"2016-04-04","sortID":0,"content":"你好"},
				  {"id":2,"userName":"游客2","time":"2016-04-04","sortID":0,"content":"你好"},
				  {"id":3,"userName":"站长","time":"2016-04-04","sortID":1,"content":"你好"},
				  {"id":4,"userName":"站长","time":"2016-04-04","sortID":2,"content":"你好"},
				  {"id":5,"userName":"游客3","time":"2016-04-04","sortID":0,"content":"你好"},
				  {"id":6,"userName":"游客2","time":"2016-04-04","sortID":4,"content":"你好"},
				  ];
$("#articleComment").zyComment({
	"width":"355",
	"height":"33",
	"agoComment":agoComment,
	"callback":function(comment){
		console.info("填写内容返回值：");
		console.info(comment);
		// 添加新的评论
		$("#articleComment").zyComment("setCommentAfter",{"id":123, "name":"name", "content":"content", "time":"2016-04-14"});
	}
});
</script>
		 </div>
		</div>
	</div>
 
	<jsp:include page="../footer.jsp" />
</body>
</html>