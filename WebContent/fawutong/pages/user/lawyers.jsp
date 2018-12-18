<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    	<title>我的律师</title>
    	<script type="text/javascript" src="../js/getNextStr.js"></script>
		<link rel="stylesheet" href="../css/bootstrap.min.css">
		<link href="../../css/bootstrap.css" rel="stylesheet" />
		<script src="../js/LibJs/jquery.min.js"></script>
		<script src="../js/LibJs/bootstrap.js"></script>
		
		<link rel="stylesheet" href="../../css/common.css" />

		<style type="text/css">
			a {color: #080808;}
	    	a:hover {color: #080808; text-decoration: none;}
		
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
			}
			.cell_space{
				background: #c14b35;
				height: 10%;
			}
		</style>
	</head>
	<body style="background: #FAFAFA;" >
		<jsp:include page="../nomal_nav.jsp"/>

		<div class="container-fluid" style=" padding: 36px 100px 0px 100px;">
			
			<h3 style="border-left: solid 4px #FF5555; padding-left: 8px; margin-top: 16px; margin-bottom: 16px; ">
				我的律师
			</h3>
			
			
			<div class="row" style="border-radius: 6px; padding: 32px;">
			
				<c:forEach items="${myLawyers }" var="mylawyer">
					<div class="span4 nomal" style="border-radius: 15px; float: left; width: 450px; padding: 26px; margin-right: 32px; margin-bottom: 32px; box-shadow: #B0B0B0 0 0 8px;">
						
						
						<div onclick="" class="media" align="center">
							<form action="doNotCollecte.html" method="post" style="position: relative; right: -180px; top: 0px; ">
								<input type="hidden" name="lid" value="${mylawyer.uid }"/>
								<input type="submit" value="X" style="background: #FF5555; color: white; border-radius: 100%; border: 0px; padding: 8px 14px;"/>
							</form>
							<a href="../lawyer/${mylawyer.uid}.html" target="_blank">
								<img src="${pageContext.request.contextPath}/${mylawyer.limage }" width="128px" height="128px" style="border-radius: 100%; border: solid 1px #C0C0C0;">
								<div class="media-body" align="left">
									
									<h4>律&nbsp;&nbsp;&nbsp;师：${mylawyer.lname }</h4>
									<h4>所在地：${fn:substring(mylawyer.lcity, 0, fn:indexOf(mylawyer.lcity, "市")+1) }</h4>
									<h4>事务所：${mylawyer.loffice }</h4>
									
								</div>
								
							</a>
							
							
						</div>
					</div>
				</c:forEach>
			
			</div>
		</div>
		
<jsp:include page="../../footer.jsp"/>
</body>
</html>