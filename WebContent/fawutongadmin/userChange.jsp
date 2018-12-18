<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cn.edu.neusoft.fawutong.domain.Users" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="m" tagdir="/WEB-INF/tags"%>
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
			<div class="panel-heading text-center" style="background:#52A5FE; color:#FFFFFF;">修改用户信息
			</div>
			<form role="form" method="POST" action="userEdit.html" enctype="multipart/form-data">
				<input type="hidden" name="uid" id="uid" value="${user.uid }" />
				<input type="hidden" name="upassword" id="upassword" value="${user.upassword }" />
				<div class="panel-body">
					<div class="form-group">
							<label for="foodname">昵称</label>
							<input type="text" class="form-control" name="uname" id="uname" value="${user.uname }"/>
						</div>
						<div class="form-group">
							<label for="img">用户头像</label>
							<input type="file" id="img" name="imgFile"/>
		                    <p class="help-block">请选择上传的用户头像</p>
		                    <img style="width:150px;height:120px;" class="img-rounded" alt="Bootstrap Image Preview" src="${pageContext.request.contextPath }/${user.limage }" />
						</div>
						<div class="form-group">
							<label for="feature">手机号</label>
							<input type="number" class="form-control" name="uphone" id="uphone" required="required" value="${user.uphone }"/>
						</div>
						<div class="form-group">
							<label for="material">邮箱</label>
							<input type="email" class="form-control" name="uemail" id="uemail" required="required" value="${user.uemail }"/>
						</div>
						<div class="form-group">
							<label for="type">是否是律师</label>
							<select class="form-control" name="lisLaw" id="lisLaw" value="">
								<c:if test = "${user.lisLaw == '是'}">
									<option value="否">否</option>
		                        	<option value="是" selected>是</option>
								</c:if>
								<c:if test = "${user.lisLaw != '是'}">
									<option value="否" selected>否</option>
		                        	<option value="是">是</option>
								</c:if>
		                    </select>
						</div>
						<div class="form-group">
							<label for="">真实姓名</label>
							<input type="text" class="form-control" name="lname" id="lname" required="required" value="${user.lname }"/>
							<p class="help-block"></p>
						</div>
						<div class="form-group">
							<label for="">个人简介</label>
							<input type="text" class="form-control" name="lresume" id="lresume"  value="${user.lresume }"/>
							<p class="help-block"></p>
						</div>
						<div class="form-group">
							<label for="">所在城市</label>
							<input type="text" class="form-control" name="lcity" id="lcity" value="${user.lcity }"/>
							<p class="help-block"></p>
						</div>
						<div class="form-group">
							<label for="">律师事务所</label>
							<input type="text" class="form-control" name="loffice" id="loffice" value="${user.loffice }"/>
							<p class="help-block"></p>
						</div>
						<div class="form-group">
							<label for="">审核状态</label>
							<select class="form-control" name="lstatus" id="lstatus" value="">
							<m:myIf var="items" str="${user.lstatus }" />
								<option value="通过" ${items[0]}>通过</option>
		                        <option value="审核中" ${items[1]}>审核中</option>
		                        <option value="未通过" ${items[2]}>未通过</option>
		                    </select>
							<p class="help-block"></p>
						</div> 
						<div class="form-group">
							<label for="">点击热度</label>
							<input type="number" class="form-control" name="lisHot" id="lisHot" value="${user.lisHot }"/>
							<p class="help-block"></p>
						</div>
					</div>
					<div class="panel-footer text-center">
						<button type="submit" class="btn btn-warning" style="background:#52A5FE; border-color:#52A5FE;">确认修改</button>&nbsp;&nbsp;
						<a role="button" class="btn btn-default" href="users.html">放弃返回</a>
				</div>
			</form>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div><!--ending 2th row-->
	</div><!--ending container-->
	<script>
	
		$(document).ready(
			function() {
				var lisLaw = $("#lisLaw").val();
				if (lisLaw == '是') {
					$('#lresume').attr('required','required');
					$('#lcity').attr('required','required');
					$('#loffice').attr('required','required');
				}
			}	
		);
	
		$(document).on('change','#lisLaw',function(){
			var lisLaw = $('#lisLaw').val();
			if (lisLaw == '是') {
				$('#lresume').attr('required','required');
				$('#lcity').attr('required','required');
				$('#loffice').attr('required','required');
			}else{
				$('#lresume').removettr('required');	
				$('#lcity').removettr('required');
				$('#loffice').removettr('required');
			}
		})
	
	</script>
</body>
</html>