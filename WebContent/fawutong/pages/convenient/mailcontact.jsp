<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>邮件联系律师</title>
<link rel="stylesheet" href="../../css/common.css" />
    <link href="../../css/bootstrap.css" rel="stylesheet">
    <script type="text/javascript" src="../../js/jquery-1.11.1.min.js"></script>
    <style type="text/css">
    	a {color: #080808;}
    	a:hover {color: #080808;}
    </style>
    
    <script type="text/javascript">
	    $(document).ready( $(function() {
			for (var i = 0; i <= 13; i++) {
				$("#span"+i).bind("click", {index: i}, clickHandler);
			}
			
			function clickHandler(event) {
				if ($("#span"+event.data.index).text() == "全部") {
					window.location.href = "search.html?keyword=";
				} else {
					window.location.href = "search.html?keyword="+$("#span"+event.data.index).text();
				}
			}
		})
		);
	</script>

</head>
<body>
<h3 style="border-left: solid 4px #FF5555; padding-left: 8px; margin-top: 32px; ">
				律师列表
			</h3>
<!-- 			<form role="form" action="userRegist.html" method="POST"> -->

				<c:forEach items="${lawyers }" var="lawyer">
				
				<div class="row" style="border: solid 2px #DDDDDD; border-radius: 6px; padding: 48px 32px 16px 32px; background-color: #FFFFFF">
					<input type="hidden" name="uid" id="uid" value="${lawyer.uid }" />
					<div class="col-md-6" style="margin-bottom: 40px;">
						<%-- <a href="./${lawyer.uid}.html" target="_blank"> --%>
							<div align="right" class="col-md-4">
								<img height="96px" width="96px" style="border: 1px solid #E0E0E0;" src="${pageContext.request.contextPath}/${lawyer.limage }" class="img-rounded" />
							</div>
							<div align="left" class="col-md-8">
								<ul style="list-style-type:none; font-size: medium;">
									<li>律&nbsp;&nbsp;&nbsp;师：${lawyer.lname }${lawyer.uemail }</li>
									<li>所在地：${fn:substring(lawyer.lcity, 0, fn:indexOf(lawyer.lcity, "市")+1) }</li>
									<li>事务所：${lawyer.loffice }</li>
									<li>评&nbsp;&nbsp;&nbsp;分：
										<c:forEach begin="1" end="${lawyer.lisHot}">★ </c:forEach>
										<c:forEach begin="1" end="${5-lawyer.lisHot}">☆ </c:forEach>
									</li>
									<li><input onclick="javascrtpt:window.location.href='/fawutongWeb/fawutong/pages/convenient/emailView.html?uid=${lawyer.uid}'" type="submit" class="btn" value="发送邀约邮件" style="background: #FF5555; color: white; padding: 12px 32px 12px 32px;" ></li>
								</ul>
							</div>
						<!-- </a> -->
					</div>
					</div>
				</c:forEach>	
</body>
</html>