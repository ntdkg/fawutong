<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="navigation" align="center">
		<ul>
			<li class="webTitle">法务通</li>
			<li>
				<a href="${pageContext.request.contextPath}/fawutong/index.html" style="text-decoration: none;">首页</a>
			</li>
		</ul>
		<div id="navigation_user" target="_blank">
			<a style="text-decoration: none; position:absolute; right:25px;" href="${pageContext.request.contextPath}/fawutong/pages/isLogin.html" >
				<p style="position:absolute; width:100px; right:30px; top:0px;">
					${(empty sessionScope.user.uname)? '请登录' : sessionScope.user.uname}
				</p>
				<img src="${pageContext.request.contextPath}/${(empty sessionScope.user.limage)? '/fawutongImg/upload/head_white_128.png' : sessionScope.user.limage}">
			</a>
			<c:if test = "${sessionScope.user.uname != null && sessionScope.user.uname != ''}">
				<a href="${pageContext.request.contextPath}/fawutong/pages/logout.html" style="text-decoration: none; position:absolute; width:100px; right:-50px; margin-top:23px;">
						<p style="font-size:10px;">
							[退出]
						</p>
					</a>
			</c:if>
	</div>
	</div>
	<div style="height:60px; background:#FF5555; left:0; right:0;">
		<!--占位-->
	</div>