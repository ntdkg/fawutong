<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<title>我的</title>
	<link rel="stylesheet" href="../css/common.css"/>
	<style type="text/css">
		.img-circle {
			border-radius: 25px;
			position: absolute;
			margin: 30px 60px;
		}
		.row_fluid {
			background-color: white;
			background-repeat: no-repeat;
			background-size: cover;
			height: 198px;
		}	
		.bottom {
			margin-top: 20px;
		}
		.btn {
			padding: 10px;
			width: 380px;
			height: 110px;
			border-radius: 15px;
			background-color: #FFFFFF;
			box-shadow: #cccccc 0px 0px 10px;
			border: none;
			margin-top: 24px;
		}
		.user_info_card {
			border-radius: 5px;
			box-shadow: #cccccc 0px 0px 10px;
		}
		.user_info h3 {
			font-size: large;
			font-weight: 400;
		}
	</style>
	<link href="../css/bootstrap.css" rel="stylesheet">
</head>

<body style="background-color: #EFEFEF; font-family: 'microsoft yahei';">

	<jsp:include page="nomal_nav.jsp"></jsp:include>

	<div style="margin: 0 auto;">
		<div class="row" style="margin: 0 200px;">

			<div class="col-md-12" style="margin-top: 40px;">
				<div class="row_fluid user_info_card">
					<div class="img-circle">
						<img style="width: 96px; height:96px;" src="${pageContext.request.contextPath}/${user.limage }" />
						<a href="user/userChange.html">
							<h4 style="color: #C0C0C0; text-decoration: underline; font-size: small; text-align: center;">更改信息</h4>
						</a>
					</div>

					<div class="user_info" style="color: #404040; margin-left: 200px;">
						<div class="col-md-6" style="margin-top:20px; font-size: small;">
							<h3>
				用&nbsp;&nbsp;&nbsp;&nbsp;户：${user.uname}
				</h3>
							<h3>
				手机号：${user.uphone}
				</h3>
							<h3>
				邮&nbsp;&nbsp;&nbsp;&nbsp;箱：${user.uemail}     
				</h3>
						</div>
						<div class="col-md-6" style="margin-top:20px ;">
							<h3>
				<c:choose>
						<c:when test="${user.lisLaw == '是' }">
							当前状态：${user.lstatus}
						 </c:when>
						<c:otherwise>
							申&nbsp;&nbsp;&nbsp;&nbsp;请：<a href="user/apply.html">申请律师</a>
						</c:otherwise>
				</c:choose>
				
				</h3>
							<h3>
				账号余额：${user.umoney}元
				</h3>
							<h3>
				账号类型：<c:choose>
							<c:when test="${user.lisLaw == '是' }">律师用户</c:when>
							<c:otherwise>普通用户</c:otherwise>
						</c:choose>
							</h3>
						</div>
					</div>
				</div>

				<div>
					<div class="bottom">
						<a href="user/cases.html">
							<button class="btn" type="button" style="float: left;">
							<div style="width:100px; height:40px; line-height: 45px; float: left; color: #888888; font-size: medium;">
								我的案件
							</div>
							<div style=" width:40px; height:40px; margin-right:10px; border:solid 1px; border-color:#DA4F49 ; border-radius:40px;float: right;">
		         				<span style="height:40px; line-height:40px; display:block; color:#888888; text-align:center">
		         					${nums.myCaseNum }
		         				</span>
			    			</div>
						</button>
						</a>

				 <button class="btn" type="button" style="float: right;"><a href="user/lawyers.html">
				<div style="width:100px; height:40px; line-height: 45px; float: left; color: #888888; font-size: medium;"><a href="notification.html">
					我的消息
				</div>
				<!-- <div style=" width:40px; height:40px; margin-right:10px; border:solid 1px; border-color:#DA4F49 ; border-radius:40px;float: right;">
        				<span style="height:40px; line-height:40px; display:block; color:#888888; text-align:center">
        					0
        				</span>
   				</div> -->
				</a>
			</button>  

			<div style="width:50%;padding:0;margin:0;float:left;box-sizing:border-box;">
				<a href="user/lawyers.html">
					<button class="btn" type="button">
			 	<div style="width:100px; height:40px; line-height: 45px; float: left; color: #888888; font-size: medium;">
					我的律师
			 	</div>
				<div style=" width:40px; height:40px; margin-right:10px; border:solid 1px; border-color:#DA4F49 ; border-radius:40px;float: right;">
        				<span style="height:40px; line-height:40px; display:block; color:#888888; text-align:center">
        					${nums.myLawyerNum }
        				</span>
   					</div>
   					</button>
   					</a>
			</div>
			<a href="user/orders.html">
				<button class="btn" type="button" style="float: right;">
			 	<div style="width:100px; height:40px; line-height: 45px; float: left; color: #888888; font-size: medium;">
					我的订单
			 	</div>
				<div style=" width:40px; height:40px; margin-right:10px; border:solid 1px; border-color:#DA4F49 ; border-radius:40px;float: right;">
        				<span style="height:40px; line-height:40px; display:block; color:#888888; text-align:center">
        					${nums.myOrderNum }
        				</span>
   					</div>
   				</button>
			</a>
				</div>
			</div>
		</div>
	</div>
</div>	
<jsp:include page="../footer.jsp" />
</body>
</html>