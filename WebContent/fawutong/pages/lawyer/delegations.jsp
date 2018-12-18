<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    	<title>在线接单</title>
    	<script type="text/javascript" src="../js/getNextStr.js"></script>
		<link rel="stylesheet" href="../css/bootstrap.min.css">
		<link href="../../css/bootstrap.css" rel="stylesheet" />
		<script src="../js/LibJs/jquery.min.js"></script>
		<script src="../js/LibJs/bootstrap.js"></script>
		
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
			.cell_space{
				background: #c14b35;
				height: 10%;
			}
		</style>
	</head>
	<body style="background: #F0F0F0;" >
		<jsp:include page="../nomal_nav.jsp"/>

		<div class="container-fluid" style=" padding: 36px 100px 0px 100px;">
			
			<h3 style="border-left: solid 4px #FF5555; padding-left: 8px; margin-top: 16px; margin-bottom: 16px; line-height: 150%; ">
				欢迎律师用户！<br/>在线接单
			</h3>
			
			
			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid">
						<div id="cell">
						
							
							<c:forEach items="${delegates }" var="deleg">
							<c:if test="${deleg.dstatus=='待受理' }">
							<div class="span4 nomal" style="border-radius: 15px; float: right; width: 45%; margin-right: 32px; margin-bottom: 32px; box-shadow: #A0A0A0 0 0 8px;">
								<div onclick="" class="media" align="center">
									<h4 class="media-heading" style="font-weight: bold; margin-bottom: 8px;">
										业务类型：${deleg.dbizType }
									</h4>
									<div class="media-body" align="left">
										
										<h4>当&nbsp;事&nbsp;人&nbsp;：${deleg.dnickname }</h4>
										<h4>案件类型：${deleg.dcaseType }</h4>
										<h4>详细描述：${deleg.ddescription }</h4>
										<c:if test="${deleg.ddeadline != '无' }">
											<h4>交付日期：${deleg.ddeadline }</h4>
										</c:if>
										<h4>基础金额：<span style="color: #FF5555; font-weight: bold;">￥${deleg.dprice }</span></h4>
										
									</div>
									<form action="doDelegate.html" style="">
										<input type="hidden" name="did" value="${deleg.did }"/>
										<input type="hidden" name="dsendtime" value="${deleg.dsendtime }"/>
										<input type="hidden" name="oprice" value="${deleg.dprice }"/>
										<input type="submit" value="我要代理" style="padding: 6px 12px; background: #FF5555; color: white; border: 0px; border-radius: 4px;"/>
									</form>
								</div>
							</div>
							</c:if>
							</c:forEach>
						</div>

						<script type="text/javascript">

						</script>
					</div>
				</div>
			</div>
		</div>
		
	<jsp:include page="../../footer.jsp"/>
</body>
</html>