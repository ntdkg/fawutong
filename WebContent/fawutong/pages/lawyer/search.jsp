<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>查找律师</title>
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
<body style="font-family: 'microsoft yahei'; background-color: #FDFDFD">
	
<jsp:include page="../nomal_nav.jsp"/>
		
	
<div class="container-fluid" style="margin-top: 32px; margin-left: 96px;">
	<div class="row">
		
		<div class="col-md-12" style="margin-bottom: 32px; margin-left: -16px;"> <!--搜索条-->
			<form action="">
	    		<input class="form-control" name="keyword" value="" type="text" placeholder="输入关键词，姓名、城市、事务所 ..." style="width: 280px; float: left; margin-right: 8px;"/>
				<button class="btn" style="background: #FF5555; color: white;" type="submit">搜索律师</button>
			</form>
		</div>
		
		<div class="col-md-8">
			
			<div class="row" style="background-color: #FFFFFF"> <!-- 筛选区域 -->
				<div style="border: solid 2px #DDDDDD; border-radius: 6px; padding: 20px 32px;">
					<h4><strong>筛选</strong></h4>
					<p style="font-size: medium;">地区筛选</p>
					<p class="labels">
						<span id="span0" class="label label-slected">全部</span>
						<span id="span1" class="label label-default">北京</span>
						<span id="span2" class="label label-default">上海</span>
						<span id="span3" class="label label-default">广东</span>
						<span id="span4" class="label label-default">天津</span>
						<span id="span5" class="label label-default">山西</span>
						<span id="span6" class="label label-default">河北</span>
						<span id="span7" class="label label-default">山东</span>
						<span id="span8" class="label label-default">辽宁</span>
						<span id="span9" class="label label-default">湖北</span>
						<span id="span10" class="label label-default">湖南</span>
						<span id="span11" class="label label-default">江西</span>
						<span id="span12" class="label label-default">江苏</span>
						<span id="span13" class="label label-default">广西</span>
					</p>
					<br />
					<p style="font-size: medium;">领域筛选</p>
					<p class="labels">
						<span id="span14" class="label label-slected">全部</span>
						<span id="span15" class="label label-default">交通事故</span>
						<span id="span16" class="label label-default">劳动用工</span>
						<span id="span17" class="label label-default">家庭婚姻</span>
						<span id="span18" class="label label-default">土地房产</span>
						<span id="span19" class="label label-default">医疗纠纷</span>
						<span id="span20" class="label label-default">公司经营</span>
						<span id="span21" class="label label-default">知识产权</span>
					</p>
				</div>
				
			</div>
			
			<h3 style="border-left: solid 4px #FF5555; padding-left: 8px; margin-top: 32px; ">
				律师列表
			</h3>
			
			<div class="row" style="border: solid 2px #DDDDDD; border-radius: 6px; padding: 48px 32px 16px 32px; background-color: #FFFFFF">
				
				<c:forEach items="${lawyers }" var="lawyer">
					<div class="col-md-6" style="margin-bottom: 40px;">
						<a href="./${lawyer.uid}.html" target="_blank">
							<div align="right" class="col-md-4">
								<img height="96px" width="96px" style="border: 1px solid #E0E0E0;" src="${pageContext.request.contextPath}/${lawyer.limage }" class="img-rounded" />
							</div>
							<div align="left" class="col-md-8">
								<ul style="list-style-type:none; font-size: medium;">
									<li>律&nbsp;&nbsp;&nbsp;师：${lawyer.lname }</li>
									<li>所在地：${fn:substring(lawyer.lcity, 0, fn:indexOf(lawyer.lcity, "市")+1) }</li>
									<li>事务所：${lawyer.loffice }</li>
									<li>评&nbsp;&nbsp;&nbsp;分：
										<c:forEach begin="1" end="${lawyer.lisHot}">★ </c:forEach>
										<c:forEach begin="1" end="${5-lawyer.lisHot}">☆ </c:forEach>
									</li>
								</ul>
							</div>
						</a>
					</div>
				</c:forEach>	
					
				
			</div>
			
			<div align="center"> <!--翻页-->
				<ul class="pagination">
					<li>
						<a href="#">上一页</a>
					</li>
					<li>
						<a href="#">1</a>
					</li>
					<li>
						<a href="#">下一页</a>
					</li>
				</ul>
			</div>
		</div>
		
		<jsp:include page="../../hotLawyers.jsp"/>
		
		
	</div>
</div>

<jsp:include page="../../footer.jsp"></jsp:include>

</body>

</html>