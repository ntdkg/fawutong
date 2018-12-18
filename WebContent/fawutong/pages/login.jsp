<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>登录</title>
	<meta charset="utf-8">
	<link href="../css/common.css" rel="stylesheet" type="text/css" />
	<link href="../css/regist.css" rel="stylesheet" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
</head>
<body style="font-family: 'microsoft yahei';">

	<div id="navigation" align="center">
			<ul style="text-decoration: none;">
				<li class="webTitle">法务通</li>
				<li><a href="../index.html">首页</a></li>
				<li><a href="#">关于</a></li>
			</ul>
		</div>
		<div style="height:60px; background:#FF5555; left:0; right:0;"><!--占位--></div>
	<div class="main">
		<div class="header" >
			<h1>登 录</h1>
		</div>
		<p>法务通 —— 便民的“互联网+”法律平台</p>
			<form role="form" method="POST" action="userLogin.html">
				<ul style="margin-left: 5%; width: 40%; " class="left-form">
					<img style="width: 100%; border-radius: 15px;" src="../img/bg01.png" />
				</ul>  
       			<%-- <fmt:setLocale value="zh-cn"/>  --%><!--指定区域语言-->
      			<fmt:bundle basename="globalMessages" ><!-- 指定使用basename为globalMessages的资源文件，也即资源文件第一个单词为globalMessages-->
      			<fmt:message key="username" var="username"/>
				<fmt:message key="password" var="password"/>
				<fmt:message key="submit" var="submit"/>
				<fmt:message key="regist" var="regist"/>
				<fmt:message key="forget" var="forget" />
				<ul style="margin-right: 5%; width: 40%;" class="right-form">
					<div>
						<li><input type="text" name="uphone" id="uphone" placeholder="${username }" required/></li>
						<li> <input type="password" name="upassword" id="upassword" placeholder="${password }9~16位" required/></li>
						<a href="#"><h4>${forget}？</h4></a>
						<a href="regist.html" style="float: right;"><h4>${regist }</h4></a>
						<div style="margin-left: 30%;">
							<input type="submit" onClick="changeView()" value="${submit }" >
						</div>
					</div>
					<div class="clear"> </div>
				</ul>
				</fmt:bundle>
				<div class="clear"> </div>
			</form>
			<script type="text/javascript">
				//界面跳转方法
				function changeView() {
					//需要判断是否输入信息
					window.location.href = "../index.html";
				}
			</script>
		</div>
</body>
</html>