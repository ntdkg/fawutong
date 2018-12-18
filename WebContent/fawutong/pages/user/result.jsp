<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>提示</title>
<link rel="stylesheet" href="../../../fawutongadmin/css/bootstrap.min.css">
<script src="../../../fawutongadmin/js/jquery-1.11.1.min.js"></script>
<script src="../../../fawutongadmin/js/bootstrap.min.js"></script>
</head>
<body>
<!--操作结果对话框-->
<div class="modal fade" id="modal-result" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" aria-hidden="true" type="button" data-dismiss="modal">
					×
				</button>
				<span class="modal-title" id="myModalLabel" style="color:#212121;">
					提示信息
				</span>
			</div>
			<div class="modal-body" style="color:#212121;">
					<h3 class="text-warning">${msg }</h3>
			</div>
			<div class="modal-footer">
       			<button type="button" class="btn btn-default" style="color:#FF5555;" data-dismiss="modal"
       			 onclick="javascript:location.replace('${href}')">确定</button>
			</div>
		</div>
	</div>
</div>
<script>
	$('#modal-result').modal();
</script>
</body>
</html>