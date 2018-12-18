<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cn.edu.neusoft.fawutong.domain.Case" import="java.util.*"%>
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

	<jsp:include page="admin_Nav.jsp" />
	
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="panel panel-warning" style="border-color:#52A5FE">
			<div class="panel-heading text-center" style="background:#52A5FE; color:#FFFFFF;">修改案件
			</div>
			<form role="form" method="POST" action="caseEdit.html">
				<input type="hidden" name="cid" id="cid" value="${ca.cid }" />
				<div class="panel-body">
					<div class="form-group">
							<label for="">案件来源</label>
							<input type="text" class="form-control" name="ctitle" id="ctitle" required="required" value="${ca.ctitle }"/>
						</div>
						<div class="form-group">
							<label for="">用户ID</label>
							<input type="number" class="form-control" name="uid" id="uid" required="required" value="${ca.uid }"/>
						</div>
						<div class="form-group">
							<label for="">类型</label>
							<input type="text" class="form-control" name="ctype" id="ctype" required="required" value="${ca.ctype }"/>
						</div>
						<div class="form-group">
							<label for="">立案日期</label>
							<input type="text" class="form-control" name="cdate" id="cdate" required="required" value="${ca.cdate }"/>
							<p class="help-block">格式：2016-10-01 12:01</p>
						</div>
						<div class="form-group">
							<label for="">审理日期</label>
							<input type="text" class="form-control" name="ctrialdate" id="ctrialdate" required="required" value="${ca.ctrialdate }"/>
							<p class="help-block">格式：2016-10-01 12:01</p>
						</div>
						<div class="form-group">
							<label for="">审判长</label>
							<input type="text" class="form-control" name="cpresidingjudge" id="cpresidingjudge" required="required" value="${ca.cpresidingjudge }"/>
							<p class="help-block"></p>
						</div>
						<div class="form-group">
							<label for="comment">概述</label>
							<textarea class="form-control" rows="10" name="cgeneral" id="cgeneral" required="required">${ca.cgeneral }</textarea>
							<p class="help-block"></p>
						</div>
					</div>
					<div class="panel-footer text-center">
						<button type="submit" class="btn btn-warning" style="background:#52A5FE; border-color:#52A5FE;">确认修改</button>&nbsp;&nbsp;
						<a role="button" class="btn btn-default" href="case.html">放弃返回</a>
				</div>
			</form>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div><!--ending 2th row-->
	</div><!--ending container-->
</body>
</html>