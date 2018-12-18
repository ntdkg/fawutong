<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cn.edu.neusoft.fawutong.domain.Users" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="m" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>申请律师</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="../../js/jquery-1.11.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../../css/common.css" type="text/css">
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../../fawutongadmin/css/datepicker3.css" rel="stylesheet">
<link href="../../../fawutongadmin/css/bootstrap-table.css" rel="stylesheet">
<link href="../../../fawutongadmin/css/styles.css" rel="stylesheet">
<link href="../../../fawutongadmin/css/wxcss.css" rel="stylesheet" />
<script type="text/javascript" src="http://validform.rjboy.cn/wp-content/themes/validform/js/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="http://validform.rjboy.cn/Validform/v5.1/Validform_v5.1_min.js"></script>
</head>

<script type="text/javascript">
$(document).ready(function ()
		{
			$("#addForm").Validform();
			$("#updateForm").Validform();
			$('#sendMsgForm').Validform();
		});
</script>
<body style="padding-top:0px;">
	
	<jsp:include page="../nomal_nav.jsp"></jsp:include>
	
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="panel panel-warning" style="border-color:#FFFFFF">
			<div class="panel-heading text-center" style="border-color:#FF5555; background:#FFFFFF; color:#000000;">修改信息
			</div>
			<form role="form" id="addForm" method="POST" action="applyLawyer.html">
				<input type="hidden" name="uid" id="uid" value="${user.uid }" />
				<div class="panel-body">				
					
						<div class="form-group">
							<label for="">真实姓名</label>
							<input type="text" style="color:#212121;" class="form-control" name="lname" id="lname" placeholder="请输入姓名"
							datatype="s2-16" errormsg="请输入规范真实姓名" nullmsg="请输入真实姓名"  required="required" value="${user.lname }"/>
							<p class="help-block"></p>
						</div>
						
						<div class="form-group">
							<label for="">个人简介</label>
							<input type="text" style="color:#212121;" class="form-control" name="lresume" id="lresume"  nullmsg="请填写个人简历" required="required" value="${user.lresume }"/>
							<p class="help-block"></p>
						</div>
						<div class="form-group">
							<label for="">所在城市</label>
							<input type="text" style="color:#212121;" class="form-control" name="lcity" id="lcity" nullmsg="请填写所在城市"  required="required" value="${user.lcity }"/>
							<p class="help-block"></p>
						</div>
						<div class="form-group">
							<label for="">律师事务所</label>
							<input type="text" style="color:#212121;" class="form-control" name="loffice" id="loffice" nullmsg="请填写律师事务所"  required="required" value="${user.loffice }"/>
							<p class="help-block"></p>
						</div>
					</div>
					<div class="panel-footer text-center">
						<button type="submit" id="submit-button" class="btn btn-warning" style="background:#FF5555; border-color:#FF5555;">确认申请</button>&nbsp;&nbsp;
						<a role="button" class="btn btn-default" href="../user.html">放弃返回</a>
				</div>
			</form>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div><!--ending 2th row-->
	</div><!--ending container-->
	<!-- <script>
	
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
	
	</script> -->
	<jsp:include page="../../footer.jsp" />
</body>
</html>