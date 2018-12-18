<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    	<title>我的订单</title>
		<link rel="stylesheet" href="../../css/bootstrap.min.css">
		<script src="../../js/LibJs/jquery.min.js"></script>
		<script src="../../js/LibJs/bootstrap.js"></script>
		
		<link rel="stylesheet" href="../../css/common.css" />

		<style type="text/css">
			.titleOfStyle {
				align-content: center;
			}
			.searchOfStyle {
				padding:6px 10px;
				border-radius: 40px;
				border:none;
				width: 100%;
			}
			.nomal {
				background: #FFFFFF;
				padding:16px;
			}
			.nomal:hover {
				background: #FAFAFA;
			}
			.cell_space{
				background: #c14b35;
				height: 10%;
			}
		</style>
	</head>
	<body style="background: #F0F0F0;" >
		<jsp:include page="../nomal_nav.jsp"/>

		<div class="container-fluid" style=" padding: 36px 100px 0px 100px;">
			
			<h3 style="border-left: solid 4px #FF5555; padding-left: 8px; margin-top: 16px; margin-bottom: 16px; ">
				我的订单
			</h3>
			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid">
						<div id="cell">
						<c:forEach items="${delegates}" var="del">
							<div class="span4 nomal" id="">
								<div onclick="" class="media" >
									<a  class="pull-left"  onclick="" ><img src="../../img/img_logo_280px.png" style="width: 100px; height: 100px;" class="img-rounded" alt='' /></a>
									<div class="media-body">
										<h4 class="media-heading" style="font-weight: bold; margin-bottom: 8px;">
											<!--{{title}}-->
											概述：${del.ddescription }
										</h4>
										称呼：${del.dnickname } <br />
										类型：${del.dbizType } / ${del.dcaseType } <br />
										时间：${del.dsendtime} <!--{{sendTime}} --><br />
										审核状态：${del.dstatus}<!--{{status}}-->
									</div>
									<c:if test="${del.dstatus == '正在受理'}">
										<div class=" text-center">
											<a role="button" class="btn btn-default" style="margin-top:-80px;margin-right:-70%; width:100px; height:45px;" href="finishDel.html?did=${del.did }">完成订单</a>
										</div>
									</c:if>
									<div class=" text-right">
										<a role="button" class="btn btn-default" style="margin-top:-80px; width:100px; height:45px;" href="cancelDel.html?did=${del.did }">${str }</a>
									</div>
								</div>
							</div>
							<br />
						</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	<jsp:include page="footer.jsp" />

</body>
</html>