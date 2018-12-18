<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cn.edu.neusoft.fawutong.domain.Users" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="Cache-Control" content="no-transform" /> 
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=yes" />
	<style type="text/css"> 
@media(max-width:960px)
{
   /* 网页全屏显示 */
    body {width:100%;} 
     /* 正文全屏显示 */
    #navigation{width:100%} 
    
}
</style>
		<title>法务通</title>
		<link rel="stylesheet" href="css/common.css" type="text/css">
		
		
		<style type="text/css">
			
 		</style>
		
		<script type="text/javascript">
		
        window.onload = function () {
            var container = document.getElementById('banner_container');
            var list = document.getElementById('banner_list');
			var imgs = list.getElementsByTagName('img');
            var buttons = document.getElementById('banner_buttons').getElementsByTagName('span');
            var prev = document.getElementById('banner_prev');
            var next = document.getElementById('banner_next');
            var index = 1;
            var len = 5;
            var animated = false;
            var interval = 4500; //切换轮播的时间间隔
            var winWidth = 1096; //window.screen.width; //屏幕宽度
    			var clientHeight = document.documentElement.clientHeight; //页面可视区域高度
            var timer = null;

			/*实现"回到顶部"按钮*/
            var timer2 = null;
            var toTop = document.getElementById('toTop');
            var isTop = true;
            var osTop = 0;
            window.onscroll = function() {
                //滚动条距离顶部的高度
                osTop = document.documentElement.scrollTop || document.body.scrollTop;
                //返回顶部的过程中滑动滚动条打断返回
                if (!isTop) {
                    clearInterval(timer2);
                }
                if (osTop >= clientHeight) {
                    //在远离一个可视高度时显示返回顶部按钮
                    toTop.style.display = 'block';
                } else {
                    toTop.style.display = 'none';
                }
                isTop = false;
            }
            toTop.onclick = function() {
                timer2 = setInterval(function() {
                    var step = Math.floor(-osTop / 6);
                    document.documentElement.scrollTop = document.body.scrollTop = osTop + step;
                    isTop = true;
                    if (osTop == 0) {
                        clearInterval(timer2);
                    }
                }, 30);
            }

			//初始化属性
			container.style.width = winWidth-18+'px';
			list.style.width = (winWidth*7)+'px';
			list.style.left = -winWidth+'px';
			for(var i = 0; i < imgs.length; i++){
				imgs[i].style.width = winWidth+'px';
				imgs[i].style.height = 400+'px';
			}

			/*切换轮播图*/
            function animate (offset) {
                if (offset == 0) {
                    return;
                }
                animated = true;
                var time = 500;
                var inteval = 10;
                var speed = offset/(time/inteval);
                var left = parseInt(list.style.left) + offset;

                var go = function (){/*滑动效果*/
                    if ( (speed > 0 && parseInt(list.style.left) < left) || (speed < 0 && parseInt(list.style.left) > left)) {
                        list.style.left = parseInt(list.style.left) + speed + 'px';
                        setTimeout(go, inteval);
                    }
                    else {
                        list.style.left = left + 'px';
                        if(left>-winWidth){
                            list.style.left = -winWidth * len + 'px';
                        }
                        if(left<(-winWidth * len)) {
                            list.style.left = -winWidth+'px';
                        }
                        animated = false;
                    }
                }
                go();
            }

			/*更新导航点*/
            function showButton() {
				//把之前点亮的导航点置为未点亮
                for (var i = 0; i < buttons.length ; i++) {
                    if( buttons[i].className == 'on'){
                        buttons[i].className = '';
                        break;
                    }
                }
				//把当前导航点置为点亮
                buttons[index - 1].className = 'on';
            }

			/*自动轮播*/
            function play() {
                timer = setTimeout(function () {
                    next.onclick();
                    play();
                }, interval);
            }
			/*停止轮播*/
            function stop() {
                clearTimeout(timer);
            }

			/*右箭头*/
            next.onclick = function () {
                if (animated) {
                    return;
                }
                if (index == 5) {
                    index = 1;
                }
                else {
                    index += 1;
                }
                animate(-winWidth);
                showButton();
            }
			/*左箭头*/
            prev.onclick = function () {
                if (animated) {
                    return;
                }
                if (index == 1) {
                    index = 5;
                }
                else {
                    index -= 1;
                }
                animate(winWidth);
                showButton();
            }

			/*导航点的点击事件*/
            for (var i = 0; i < buttons.length; i++) {
                buttons[i].onclick = function () {
                    if (animated) {
                        return;
                    }
                    if(this.className == 'on') {//点击当前导航点不执行代码
                        return;
                    }
                    var myIndex = parseInt(this.getAttribute('index'));
                    var offset = -winWidth * (myIndex - index);

                    animate(offset);
                    index = myIndex;
                    showButton();
                }
            }

            container.onmouseover = stop;//鼠标进入区域就停止轮播
            container.onmouseout = play;//鼠标离开就自动轮播

            play();
        }
		
		
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
		<a href="javascript:;" id="toTop" title="回到顶部"></a>
	
		<div id="navigation" align="center">
			<ul style="text-decoration: none;">
				<li class="webTitle">法务通</li>
				<li><a href="index.html">首页</a></li>
				<li onMouseOver="showSubMenu(this)" onMouseOut="hideSubMenu(this)">
					<a>法院 ▾</a>
					<ul>
						<li><a href="pages/search.html" target="_blank">案件查询</a></li>
						<li><a href="pages/notification.html" target="_blank">最新资讯</a></li>
						<li><a href="pages/filling.html" target="_blank">网上立案</a></li>
					</ul>
				</li>
				<li onMouseOver="showSubMenu(this)" onMouseOut="hideSubMenu(this)">
					<a>律师 ▾</a>
					<ul>
						<li><a href="pages/lawyer/search.html" target="_blank">查询律师</a></li>
						<li><a href="pages/delegation/writ.html" target="_blank">文书起草</a></li>
						<li><a href="pages/delegation/delegate.html" target="_blank">案件代理</a></li>
					</ul>
				</li>
				<li onMouseOver="showSubMenu(this)" onMouseOut="hideSubMenu(this)">
					<a>便民 ▾</a>
					<ul>
						<li><a href="pages/convenient/guide.html" target="_blank">案例样式</a></li>
						<li><a href="pages/chat/chat.html">在线沟通</a></li>
						<li><a href="pages/convenient/mailcontact.html">邮件联系</a></li>
					</ul>
				</li>
				<li><a href="#" target="_blank">关于</a></li>
			</ul>
			<div id="navigation_user" target="_blank">
				<a href="pages/isLogin.html" >
					<p> 
						${(empty sessionScope.user.uname)? '请登录' : sessionScope.user.uname}  
					</p>
					<img src="${pageContext.request.contextPath}/${(empty sessionScope.user.limage)? 'fawutongImg/upload/head_white_128.png' : sessionScope.user.limage}">
				</a>
				${(empty sessionScope.user.uname)? '' : '<a href="pages/logout.html" style="font-size:10px;"><p>[退出]</p></a>'}
			</div>
		</div>
		<div style="height:60px; background:#FF5555; left:0; right:0;"><!--占位--></div>
		
	    <div id="banner_container" align="center">
	        <div id="banner_list">
	            <img src="img/5.jpg" alt="5"/>
	            <a href="#" target="_blank"><img src="img/1.jpeg" alt="1"/></a>
	            <a href="#" target="_blank"><img src="img/2.png" alt="2"/></a>
	            <a href="#" target="_blank"><img src="img/3.jpeg" alt="3"/></a>
	            <a href="#" target="_blank"><img src="img/4.jpeg" alt="4"/></a>
	            <a href="#" target="_blank"><img src="img/5.jpg" alt="5"/></a>
	            <img src="img/1.jpeg" alt="1"/>
	        </div>
	        <div id="banner_buttons">
	    		<span class="on" index="1"></span>
	    		<span index="2"></span>
	    		<span index="3"></span>
	    		<span index="4"></span>
	    		<span index="5"></span>
	    	</div>
	        <a href="javascript:;" id="banner_prev" class="banner_arrow">◀</a>
	        <a href="javascript:;" id="banner_next" class="banner_arrow">▶</a>
	    </div>
	
		<div align="center" style="margin: 32px;">
			
			<div style="height: 360px; width: 1096px;">
				<div style="position: relative; width: 30%; height: 100%; background-image: url(img/img_banner_02.jpg); background-repeat: no-repeat; background-size: cover; float: left;">
					<h2 style="color: white; padding: 25px; background-color: rgba(0,0,0,.6); position: absolute; bottom: 0px; left: 0px; right: 0px; text-align: center;">
						法院模块
					</h2>
				</div>
				<div style="width: 70%; height: 100%; background: white; float: left;">
					<ul style="list-style: none;">
						<li style="width: 50%; height: 180px; float: left;">
							<div style="height: 180px;">
								<a href="pages/search.html" target="_blank">
									<div style="background-color: #FF5555; background-repeat: no-repeat; background-size: cover; width: 100%; height: 180px; position: relative;">
										<h3 style="color: white; padding: 16px; background-color: rgba(0,0,0,.6); position: absolute; bottom: 0px; left: 0px; right: 0px; text-align: center;">
											案件查询
										</h3>
									</div>
								</a>
							</div>
						</li>
						<li style="width: 50%; height: 180px; float: left;">
							<div style="height: 180px;">
								<a href="pages/notification.html" target="_blank">
									<div style="background-color: #FCB665; background-repeat: no-repeat; background-size: cover; width: 100%; height: 180px; position: relative;">
										<h3 style="color: white; padding: 16px; background-color: rgba(0,0,0,.6); position: absolute; bottom: 0px; left: 0px; right: 0px; text-align: center;">
											最新资讯
										</h3>
									</div>
								</a>
							</div>
						</li>
						<li style="width: 50%; height: 180px; float: left;">
							<div style="height: 180px;">
								<a href="pages/filling.html" target="_blank">
									<div style="background-color: #68E3A6; background-repeat: no-repeat; background-size: cover; width: 100%; height: 180px; position: relative;">
										<h3 style="color: white; padding: 16px; background-color: rgba(0,0,0,.6); position: absolute; bottom: 0px; left: 0px; right: 0px; text-align: center;">
											网上立案
										</h3>
									</div>
								</a>
							</div>
						</li>
						<li style="width: 50%; height: 180px; float: left;">
							<div style="height: 180px;">
								<a target="_blank" style="color: white">
									<div style="background-color: #738FFE; background-repeat: no-repeat; background-size: cover; width: 100%; height: 180px; position: relative;">
										<span style="font-size: large; position: absolute; top:90px; left: 0px; right: 0px;">更多尽情期待</span>
									</div>
								</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
			
			<div style="height: 360px; width: 1096px; margin-top: 32px;">
				<div style="position: relative; width: 30%; height: 100%; background-image: url(img/img_banner_01.png); background-repeat: no-repeat; background-size: cover; float: left;">
					<h2 style="color: white; padding: 25px; background-color: rgba(0,0,0,.6); position: absolute; bottom: 0px; left: 0px; right: 0px; text-align: center;">
						律师模块
					</h2>
				</div>
				<div style="width: 70%; height: 100%; background: white; float: left;">
					<ul style="list-style: none;">
						<li style="width: 50%; height: 180px; float: left;">
							<div style="height: 180px;">
								<a href="pages/delegation/writ.html" target="_blank">
									<div style="background-color: #FF5555; background-repeat: no-repeat; background-size: cover; width: 100%; height: 180px; position: relative;">
										<h3 style="color: white; padding: 16px; background-color: rgba(0,0,0,.6); position: absolute; bottom: 0px; left: 0px; right: 0px; text-align: center;">
											文书起草
										</h3>
									</div>
								</a>
							</div>
						</li>
						<li style="width: 50%; height: 180px; float: left;">
							<div style="height: 180px;">
								<a href="pages/delegation/delegate.html" target="_blank">
									<div style="background-color: #FCB665; background-repeat: no-repeat; background-size: cover; width: 100%; height: 180px; position: relative;">
										<!--<img class="works_img" height="140px" width="100%" src="img/head03.jpg">-->
										<h3 style="color: white; padding: 16px; background-color: rgba(0,0,0,.6); position: absolute; bottom: 0px; left: 0px; right: 0px; text-align: center;">
											案件代理
										</h3>
									</div>
								</a>
							</div>
						</li>
						<li style="width: 50%; height: 180px; float: left;">
							<div style="height: 180px;">
								<a href="pages/lawyer/search.html" target="_blank">
									<div style="background-color: #68E3A6; background-repeat: no-repeat; background-size: cover; width: 100%; height: 180px; position: relative;">
										<h3 style="color: white; padding: 16px; background-color: rgba(0,0,0,.6); position: absolute; bottom: 0px; left: 0px; right: 0px; text-align: center;">
											查找律师
										</h3>
									</div>
								</a>
							</div>
						</li>
						<li style="width: 50%; height: 180px; float: left;">
							<div style="height: 180px;">
								<a target="_blank" style="color: white">
									<div style="background-color: #4DBFF2; background-repeat: no-repeat; background-size: cover; width: 100%; height: 180px; position: relative;">
										<span style="font-size: large; position: absolute; top:90px; left: 0px; right: 0px;">更多尽情期待</span>
									</div>
								</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
			
			<div style="height: 360px; width: 1096px; margin-top: 32px;">
				<div style="position: relative; width: 30%; height: 100%; background-image: url(img/bg01.png); background-repeat: no-repeat; background-size: cover; float: left;">
					<h2 style="color: white; padding: 25px; background-color: rgba(0,0,0,.6); position: absolute; bottom: 0px; left: 0px; right: 0px; text-align: center;">
						便民功能
					</h2>
				</div>
				<div style="width: 70%; height: 100%; background: white; float: left;">
					<ul style="list-style: none;">
						<li style="width: 50%; height: 180px; float: left;">
							<div style="height: 180px;">
								<a href="pages/convenient/guide.html" target="_blank">
									<div style="background-color: #FF5555; background-repeat: no-repeat; background-size: cover; width: 100%; height: 180px; position: relative;">
										<h3 style="color: white; padding: 16px; background-color: rgba(0,0,0,.6); position: absolute; bottom: 0px; left: 0px; right: 0px; text-align: center;">
											案例样式
										</h3>
									</div>
								</a>
							</div>
						</li>
						<li style="width: 50%; height: 180px; float: left;">
							<div style="height: 180px;">
								<a href="#">
									<div style="background-color: #FCB665; background-repeat: no-repeat; background-size: cover; width: 100%; height: 180px; position: relative;">
										<h3 style="color: white; padding: 16px; background-color: rgba(0,0,0,.6); position: absolute; bottom: 0px; left: 0px; right: 0px; text-align: center;">
											在线沟通
										</h3>
									</div>
								</a>
							</div>
						</li>
						<li style="width: 50%; height: 180px; float: left;">
							<div style="height: 180px;">
								<a href="#">
									<div style="background-color: #68E3A6; background-repeat: no-repeat; background-size: cover; width: 100%; height: 180px; position: relative;">
										<h3 style="color: white; padding: 16px; background-color: rgba(0,0,0,.6); position: absolute; bottom: 0px; left: 0px; right: 0px; text-align: center;">
											邮件联系
										</h3>
									</div>
								</a>
							</div>
						</li>
						<li style="width: 50%; height: 180px; float: left;">
							<div style="height: 180px;">
								<a target="_blank" style="color: white">
									<div style="background-color: #738FFE; background-repeat: no-repeat; background-size: cover; width: 100%; height: 180px; position: relative;">
										<span style="font-size: large; position: absolute; top:90px; left: 0px; right: 0px;">更多尽情期待</span>
									</div>
								</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
		<!-- <!-- JQuery文件,务必在bootstrap.min.js 之前引入 -->
	<!-- <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script> -->

	<!-- Bootstrap3的 JavaScript文件
	<script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
 -->
	<!-- 响应弹出左侧侧边栏
	<script type="text/javascript">
		$(document).ready(function() {
			$('[data-toggle="offcanvas"]').click(function() {
				$('.row-offcanvas').toggleClass('active')
			});
		});
	</script> --> -->
	</body>
</html>
