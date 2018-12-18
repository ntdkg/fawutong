<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="m" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>修改案件代理</title>
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
			<div class="panel-heading text-center" style="background:#52A5FE; color:#FFFFFF;">修改案件代理
			</div>
			<form role="form" method="POST" action="delegateEdit.html" >
				<input type="hidden" name="did" id="did" value="${del.did }" />
				<div class="panel-body">
						<div class="form-group">
							<label for="type">类型</label>
							<select class="form-control" name="dbizType" id="dbizType" value="">
								<c:if test = "${del.dbizType == '文书起草'}">
									<option value="文书起草" selected>文书起草</option>
		                        	<option value="案件代理" >案件代理</option>
								</c:if>
								<c:if test = "${del.dbizType != '文书起草'}">
									<option value="文书起草" >文书起草</option>
		                        	<option value="案件代理" selected>案件代理</option>
								</c:if>
		                    </select>
						</div>
						<div class="form-group">
							<label for="type">案件类型</label>
							<select class="form-control" name="dcaseType" id="dcaseType" value="">
							<m:delegateIF var="items" str="${del.dcaseType }" />
								<option value="其他" ${items[0]}>其他</option>
		                        <option value="家庭婚姻" ${items[1]}>家庭婚姻</option>
		                        <option value="财务纠纷" ${items[2]}>财务纠纷</option>
		                        <option value="劳动纠纷" ${items[3]}>劳动纠纷</option>
		                        <option value="交通事故" ${items[4]}>交通事故</option>
		                    </select>
						</div>
						<div class="form-group">
							<label for="">发起人姓名</label>
							<input type="text" class="form-control" name="dnickname" id="dnickname" required="required" value="${del.dnickname }"/>
						</div>
						<div class="form-group">
							<label for="">代理服务费</label>
							<input type="number" class="form-control" name="dprice" id="dprice" required="required" value="${del.dprice }"/>
							<p class="help-block">单位：元</p>
						</div>
						<div class="form-group">
							<label for="">案件概述</label>
							<textarea class="form-control" rows="3" name="ddescription" id="ddescription" required="required">${del.ddescription }</textarea>
						</div>
						<div class="form-group">
							<label for="">发布日期</label>
							<input type="text" class="form-control" name="dsendtime" id="dsendtime" required="required" value="${del.dsendtime }"/>
							<p class="help-block">格式:2016-12-01 12:01</p>
						</div>
					</div>
					<div class="panel-footer text-center">
						<button type="submit" class="btn btn-warning" style="background:#52A5FE; border-color:#52A5FE;">确认修改</button>&nbsp;&nbsp;
						<a role="button" class="btn btn-default" href="otherTable.html">放弃返回</a>
				</div>
			</form>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div><!--ending 2th row-->
	</div><!--ending container-->
</body>
</html>