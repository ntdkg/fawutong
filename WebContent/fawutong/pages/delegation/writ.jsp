<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<title>业务代理</title>
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link href="../../css/bootstrap.css" rel="stylesheet" />
	<script src="../js/LibJs/jquery.min.js"></script>
	<script src="../js/LibJs/bootstrap.js"></script>

	<link rel="stylesheet" href="../../css/common.css" />

	<style type="text/css">
		a {
			color: #080808;
		}
		
		a:hover {
			color: #080808;
		}
		
		.titleOfStyle {
			align-content: center;
		}
		
		.searchOfStyle {
			padding: 6px 10px;
			border-radius: 40px;
			border: none;
			width: 100%;
		}
		
		.nomal {
			background: #FFFFFF;
			padding: 16px;
		}
		
		.nomal:hover {
			background: #FAFAFA;
		}
		
		.cell_space {
			background: #c14b35;
			height: 10%;
		}
	</style>
</head>

<body style="background: #F7F7F7;">
	<jsp:include page="../nomal_nav.jsp"/>

	<div class="container-fluid" style=" padding: 36px 100px 0px 100px;">

		<button onclick="self.location='delegate.html'" style="width: 130px; border-bottom: solid 2px #FF5555; border-top: solid 2px #C0C0C0; border-left: solid 2px #C0C0C0; border-right: solid 2px #A0A0A0; border-radius: 15px 15px 0 0; padding: 8px; background: #FAFAFA; margin-right: 10px;">
			<h4>案件代理</h4>
		</button>

		<button style="width: 130px; border-bottom: solid 2px #FFFFFF; border-top: solid 2px #FF5555; border-left: solid 2px #FF5555; border-right: solid 2px #FF5555; border-radius: 15px 15px 0 0; padding: 8px; background: #FFFFFF;">
			<h4>文书起草</h4>
		</button>

		<div class="row" align="middle" style="border: solid 2px #FF5555; border-radius: 6px; padding: 32px; margin-top: -2px; background: #FFFFFF;">

			<img src="../../img/img_banner_01.png" width="250px" style="float: right; margin: 16px 48px 16px 40px; border-radius: 8px;" />

			<form action="writSubmit.html" method="post" style="border: none; margin-bottom: 16px; margin-top: 16px;">
				
				<input type="hidden" name="uid" value="${sessionScope.user.uid}"/>
				<input type="hidden" name="dprice" value="25.0"/>
				<input type="hidden" name="dbizType" value="文书起草"/>
				<input type="hidden" name="dstatus" value="待受理"/>
				
				<table border="1" style="border: none; " rules="none">
					<tr>
						<td style="padding: 0 12px; text-align: right;">姓名：</td>
						<td style="padding: 12px 0;"><input class="form-control" name="dnickname" type="text" placeholder="请填写" style="width: 250px; margin-right: 8px;" value="${sessionScope.user.uname }"/></td>
					</tr>

					<tr>
						<td style="padding: 0 12px; text-align: right;">案件类型：</td>
						<td style="padding: 12px 0;">
							<select name="dcaseType" style="width: 250px; padding: 5px; border-radius: 4px; border-color: #CCCCCC;">
								<option value="">请选择</option>
								<option value="1">家庭婚姻</option>
								<option value="2">财务纠纷</option>
								<option value="3">劳动纠纷</option>
								<option value="4">交通事故</option>
								<option value="5">其他</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<td style="padding: 0 12px; text-align: right;">交付时间：</td>
						<td style="padding: 12px 0;"><input name="ddeadline" type="datetime-local" class="form-control" style="width: 250px; padding: 12px; border-radius: 4px; border-color: #CCCCCC;" /></td>
					</tr>

					<tr>
						<td style="padding: 0 12px; text-align: right;">详细描述：</td>
						<td style="padding: 12px 0;"><textarea type="text" name="ddescription" style="height: 150px; width: 250px; padding: 12px; border-radius: 4px; border-color: #CCCCCC;"></textarea></td>
					</tr>
					
					<tr>
						<td style="padding: 0 12px; text-align: right;">基础费用：</td>
						<td style="padding: 12px 0; color: #FF5555; font-weight: bold; font-size: larger;">25.0元</td>
					</tr>
					
					<tr>
						<td style="padding: 0 12px;"></td>
						<td style="padding: 12px 0;">
							<input type="submit" class="btn" value="发布代写" style="background: #FF5555; color: white; padding: 12px 32px 12px 32px;" >
						</td>
					</tr>
				</table>
			</form>
		
		</div>
			
			
	</div>
		
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>