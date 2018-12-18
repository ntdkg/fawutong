<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cn.edu.neusoft.fawutong.domain.News" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>修改案件</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-1.11.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/bootstrap-table.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<link href="css/wxcss.css" rel="stylesheet" />

</head>

<body>

	<jsp:include page="admin_Nav.jsp"/>

	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="panel panel-warning" style="border-color:#52A5FE">
			<div class="panel-heading text-center" style="background:#52A5FE; color:#FFFFFF;">修改资讯信息
			</div>
			<form role="form" method="POST" action="newsEdit.html" enctype="multipart/form-data">
				<input type="hidden" name="nid" id="nid" value="${news.nid }" />
				<div class="panel-body">
					<div class="form-group">
							<label for="">标题</label>
							<input type="text" class="form-control" name="ntitle" id="ntitle" required="required" value="${news.ntitle }"/>
						</div>
						<div class="form-group">
							<label for="img">资讯图像</label>
							<input type="file" id="img" name="imgFile"/>
		                    <p class="help-block">请选择上传的图像</p>
		                    <img style="width:150px;height:120px;" class="img-rounded" alt="Bootstrap Image Preview" src="${pageContext.request.contextPath }/${news.nimg }" />
						</div>
						<div class="form-group">
							<label for="">来源</label>
							<input type="text" class="form-control" name="nsource" id="nsource" required="required" value="${news.nsource }"/>
						</div>
						<div class="form-group">
							<label for="">概述</label>
							<textarea class="form-control" rows="3" name="ncontext" id="ncontext" required="required">${news.ncontext }</textarea>
						</div>
						<div class="form-group">
							<label for="">发布日期</label>
							<input type="text" class="form-control" name="ndate" id="ndate" required="required" value="${news.ndate }"/>
							<p class="help-block">格式:2016-12-01 12:01</p>
						</div>
						<div class="form-group">
							<label for="type">类型</label>
							<select class="form-control" name="ntype" id="ntype" value="">
								<c:if test = "${news.ntype == '资讯'}">
									<option value="资讯" selected>资讯</option>
		                        	<option value="案例" >案例</option>
								</c:if>
								<c:if test = "${news.ntype != '资讯'}">
									<option value="资讯" >资讯</option>
		                        	<option value="案例" selected>案例</option>
								</c:if>
		                    </select>
						</div>
						<div class="form-group">
							<label for="">是否火热</label>
							<input type="text" class="form-control" name="nisHot" id="nisHot" required="required" value="${news.nisHot }"/>
						</div>
						<!-- <div class="form-group">
							<label for="price">建议详情ID</label>
							<input type="number" class="form-control" name="price" id="price" required="required" value=""/>
							<p class="help-block"></p>
						</div> -->
					</div>
					<div class="panel-footer text-center">
						<button type="submit" class="btn btn-warning" style="background:#52A5FE; border-color:#52A5FE;">确认修改</button>&nbsp;&nbsp;
						<a role="button" class="btn btn-default" href="news.html">放弃返回</a>
				</div>
			</form>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div><!--ending 2th row-->
	</div><!--ending container-->
</body>
</html>