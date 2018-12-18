<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Lumino - Forms</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">

<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->

</head>

<body>
	<jsp:include page="admin_Nav.jsp" />
	<jsp:include page="admin_left.jsp" />
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">信息上传</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">信息上传</h1>
			</div>
		</div><!--/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">信息上传</div>
					<div class="panel-body">
					<div class="col-md-2"></div>
						<div class="col-md-8">
							<form role="form" action="addNews.html" enctype="multipart/form-data" method="POST">
								<div class="form-group">
									<label>标题</label>
									<input class="form-control" placeholder="标题" name="ntitle">
								</div>
																
								<div class="form-group">
									<label>来源</label>
									<input type="text" class="form-control" name="nsource">
								</div>
																
								<div class="form-group">
									<label>图片上传</label>
									<input type="file" id="img" name="imgFile"/>
									<p class="help-block"></p>
								</div>
								
								<div class="form-group">
									<label>文本信息</label>
									<textarea class="form-control" rows="3" name="ncontext"></textarea>
								</div>
								
								<label>额外信息</label>
								<div class="form-group has-success">
									<input class="form-control" placeholder="案件是否新颖" name="nisHot" />
								</div>
								<div class="form-group has-warning">
									<input class="form-control" placeholder="是否置顶">
								</div>
								<div class="form-group has-error">
									<input class="form-control" placeholder="是否放入轮播图">
								</div>
							
							<div class="col-md-6">
								<div class="form-group">
									<label>上传类型</label>
									<div class="radio">
										<label>
											<input type="radio" name="ntype" id="optionsRadios1" value="案例" checked>案例
										</label>
									</div>
									<div class="radio">
										<label>
											<input type="radio" name="ntype" id="optionsRadios2" value="资讯">资讯
										</label>
									</div>
									<!-- <div class="radio">
										<label>
											<input type="radio" name="ntype" id="optionsRadios3" value="律师信息">律师信息
										</label>
									</div>
									<div class="radio">
										<label>
											<input type="radio" name="ntype" id="optionsRadios3" value="指南">指南
										</label>
									</div> -->
								</div>
								<button type="submit" class="btn btn-primary">上传信息</button>
								<button type="reset" class="btn btn-default">清空</button>
							</div>
						</form>
						</div>
					</div>
				</div>
			</div><!-- /.col-->
		</div><!-- /.row -->
		
	</div><!--/.main-->

	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script>
		!function ($) {
			$(document).on("click","ul.nav li.parent > a > span.icon", function(){		  
				$(this).find('em:first').toggleClass("glyphicon-minus");	  
			}); 
			$(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
		}(window.jQuery);

		$(window).on('resize', function () {
		  if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function () {
		  if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
		})
	</script>	
</body>

</html>
