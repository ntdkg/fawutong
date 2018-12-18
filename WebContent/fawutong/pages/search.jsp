<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>案件查询</title>

	<script type="text/javascript" src="js/data.js" ></script>
	<link rel="stylesheet" href="../css/common.css" type="text/css">
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	
	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="../js/LibJs/bootstrap.js"></script>
	<style type="text/css">
		</style>
	<script type="text/javascript">
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
<body style="background: #F0F0F0; font-family: 'microsoft yahei';" >
	<jsp:include page="nomal_nav.jsp"></jsp:include>

	<div class="container" style="width: 80%; margin-top: 25px;">
		<div class="row">
			<div class="col-md-6">
				<h3 style="font-family:'microsoft yahei'; border-left: solid 4px #FF5555; padding-left: 8px; margin-top: 25px; margin-bottom: 16px; margin-left: 16px; ">
					案件查询
				</h3>
			</div>
			<div class="col-md-6">
				<form class="form-search" style="padding-top: 0px; padding-left: 15%; margin-top: 10px;" action="">
					<input name="years" value="" style="height: 36px; width: 25%; border-radius: 20px; padding: 6px 10px; border: 1px #C0C0C0 solid;" placeholder="2016" class="input-medium search-query" type="number" />
					年(全部)
					<input name="month" value="" style="height: 36px; width: 25%; border-radius: 20px; padding: 6px 10px; border: 1px #C0C0C0 solid;" class="input-medium search-query" placeholder="月份" type="number" />
					月
					<input type="submit" value="查询" class="btn" style="height:36px; background: #FF5555; color: white; border-radius: 20px; padding: 4px 25px;"/> 
				</form>
			</div>
		</div>
	</div>
	
	<div class="container-fluid" style="padding-left: 0px; padding-right: 0px; padding-top: 20px; width: 75%;">
		<div class="row-fluid">
			<div class="span12">
				<div class="row-fluid">
					<div id="cell">
					<c:forEach items="${cases }" var="ca">
						<div class="span4 nomal" id="">
							<a href="#">
								<div onclick="" class="media" style="background: #FFFFFF; padding: 16px;">
									<a class="pull-left" onclick="">
										<img class="img-rounded" src="../img/img_logo_280px.png" style="width: 96px; height: 96px; margin: 10px 10px 10px 10px;" class="media-object" alt='' />
									</a>
									<div class="media-body">
										<h2>${ca.ctitle }</h2>
										<h4 class="media-heading" style="font-weight: bold; margin: 10px 0px;">
											案件类型 ：${ca.ctype}
										</h4>
										案件法院：${ca.cgeneral} <br />
										时间：${ca.cdate}
									</div>
								</div>
							</a>
						</div>
						<br />
						</c:forEach>
					</div>
					<!--  <script type="text/javascript" src="../js/NextViewData.js" ></script>-->
					<script type="text/javascript">

					</script>
				</div>
			</div>
		</div>
	</div>
		
	<jsp:include page="./user/footer.jsp"></jsp:include>
</body>
</html>