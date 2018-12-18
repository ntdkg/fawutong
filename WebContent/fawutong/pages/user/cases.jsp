<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="app">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    		<title>我的案件</title>
    		<script type="text/javascript" src="../js/getNextStr.js"></script>
		<link rel="stylesheet" href="../css/bootstrap.min.css">
		<link href="../../css/bootstrap.css" rel="stylesheet" />
		<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
		<script src="../js/LibJs/jquery.min.js"></script>
		<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
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

	<jsp:include page="../nomal_nav.jsp"></jsp:include>



		<div style="height:60px; background:#FF5555; left:0; right:0;"><!--占位--></div>

		<div class="container-fluid" style=" padding: 36px 100px 0px 100px;">

			<h3 style="border-left: solid 4px #FF5555; padding-left: 8px; margin-top: 16px; margin-bottom: 16px; ">
				我的案件
			</h3>


			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid">
						<!--
                        	作者：zhouzihan214@nou.com.cn
                        	时间：2016-08-17
                        	描述：需要添加div中id去识别构造单元格
                        -->
						<div id="cell">
							<c:forEach items="${usercases}" var="c" >
							<div class="span4 nomal" id="">
								<div  class="media">
									<a  class="pull-left" ><img src="../../img/img_case_01.png" style="width: 60px; height: 60px;" class="img-rounded" alt='' /></a>
									<div class="media-body">
										<h4 class="media-heading" style="font-weight: bold; margin-bottom: 8px;">
											<!--{{title}}-->
											事件描述:${c.description}
										</h4>
										提交时间:${c.sendtime}<!--{{sendTime}} --><br />
										审核状态:${c.uctype}<!--{{status}}-->
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