<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>注册</title>
	<meta charset="utf-8">
	<link href="../css/common.css" rel="stylesheet" type="text/css"/>
	<link href="../css/regist.css" rel='stylesheet' type='text/css' />
	<link href="../css/common.css" rel="stylesheet"/>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="../js/jquery-1.11.1.min.js"></script>
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	
	<style type="text/css">
		.form-control {
		  display: block;
		  width: 100%;
		  height: 34px;
		  padding: 6px 12px;
		  font-size: 14px;
		  line-height: 1.42857143;
		  color: #555;
		  background-color: #fff;
		  background-image: none;
		  border: 1px solid #ccc;
		  border-radius: 4px;
		  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
		          box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
		  -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
		       -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
		          transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
		}
					.form-control:focus {
		  border-color: #66afe9;
		  outline: 0;
		  -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
		          box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
		}
		.form-control::-moz-placeholder {
		  color: #999;
		  opacity: 1;
		}
		.form-control:-ms-input-placeholder {
		  color: #999;
		}
		.form-control::-webkit-input-placeholder {
		  color: #999;
		}
		.form-control[disabled],
		.form-control[readonly],
		fieldset[disabled] .form-control {
		  background-color: #eee;
		  opacity: 1;
		}
		.form-control[disabled],
		fieldset[disabled] .form-control {
		  cursor: not-allowed;
		}
		textarea.form-control {
		  height: auto;
		}
	</style>
</head>
<body>
	<div id="navigation" align="center">
			<ul style="text-decoration: none;">
			<li class="webTitle">法务通</li>
			<li><a href="../index.html">首页</a></li>
			<li><a href="#">关于</a></li>
		</ul>
	</div>
	<div style="height:10px; background:#FF5555; left:0; right:0;"><!--占位--></div>
<div class="main"style="width:600px;">
	<div class="header" >
		<h1>注册新用户</h1>
	</div>
	<p>法务通 —— 便民的“互联网+”法律平台</p>
		<form role="form" action="userRegist.html" method="POST">
			<ul class="left-form">
				<li>
					<input type="text" placeholder="手机号" name="uphone" id="uphone" required/>
					<a id="phoneRes" class=""></a>
					<div class="clear"> </div>
				</li> 
				<li>
					<input type="text"   placeholder="昵称" name="uname" id="uname" required/>
					<a id="nameRes" class=""> </a>
					<div class="clear"> </div>
				</li> 
				<li>
					<input type="password"   placeholder="密码" name="upassword" id="upassword" required/>
					<a id="pwdRes" class=""> </a>
					<div class="clear"> </div>
				</li> 
				<li>
					<input type="password"   placeholder="确认密码" id="remainpwd" required/>
					<a id="rePwdRes" class=""> </a>
					<div class="clear"> </div>
				</li> 
				<li>
					<input type="email" placeholder="邮箱" name="uemail" id="uemail" required/>
					<a id="emailRes" class=""> </a>
					<div class="clear"> </div>
				</li> 
				<li style="border-width: 0px;"> 
					<select style="border-color: #EBEBEB;" class="form-control" data-toggle="select" name="lisLaw" id="lisLaw">
						<option value="否" style="border-color: #EBEBEB;">普通用户</option>
						<option value="是" style="border-color: #EBEBEB;">律师用户</option>
					</select>
				</li>
				<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i>阅读并接受<a href="#">《法务通平台用户协议》</a></label>
				<br />
				<br />
				<br />
				<p>律师用户注册必须如实填写</p>
				<br />
				<li>
					<input type="text" placeholder="真是姓名" name="lname" id="lname" />
					<a href="#" class=""></a>
					<div class="clear"> </div>
				</li> 
				<li>
					<input type="text" placeholder="身份证号" id="shenfenzheng"/>
					<a href="#" class=""> </a>
					<div class="clear"> </div>
				</li> 
				<li>
					<input type="text" placeholder="个人简介" name="lresume" id="lresume"/>
					<a href="#" class=""> </a>
					<div class="clear"> </div>
				</li>
				<li>
					<input type="text"   placeholder="城市" name="lcity" id="lcity"/>
					<a href="#" class=""> </a>
					<div class="clear"> </div>
				</li>
				<li>
					<input type="text"   placeholder="当前律师事务所" name="loffice" id="loffice"/>
					<a href="#" class=""> </a>
					<div class="clear"> </div>
				</li>
				<input type="submit" id="submit-button" style="margin-left:40%; " value="立即注册">
				
				<div class="clear"> </div>
			</ul>
			<div class="clear"> </div>
		</form>
		<script type="text/javascript">
			$(document).ready(
				function() {
					$("#uphone").on('blur',function(){
						var uphone = $("#uphone").val();
						$("#phoneRes").removeClass();
						if (uphone.length == 11) {
							//进行Ajax请求判断用户是否存在;
							$.post("/smeal/fawutongJson/checkUsers.json","uphone="+uphone,function(res){
								if(res.ret == "1") {
									$("#phoneRes").attr("class", "icon ticker");
								}else{
									$("#phoneRes").attr("class", "icon into");
								}
							})
						}else{
							$("#phoneRes").attr("class", "icon into");
						}
					})
					$("#uname").on('blur',function(){
						var uname = $("#uname").val();
						$("#nameRes").removeClass();
						if (uname.length > 0) {
							$("#nameRes").attr("class", "icon ticker");
						}else{
							$("#nameRes").attr("class", "icon into");
						}
					})
					$("#uemail").on('blur',function(){
						var uemail = $("#uemail").val();
						$("#emailRes").removeClass();
						if (uemail.length > 0) {
							$("#emailRes").attr("class", "icon ticker");
						}else{
							$("#emailRes").attr("class", "icon into");
						}
					})
					
				}
			) 
			
			$(document).on('change','#lisLaw',function(){
				var lisLaw = $('#lisLaw').val();
				if (lisLaw == '是') {
					$('#shenfenzheng').attr('required','required');
					$('#lname').attr('required','required');
					$('#lresume').attr('required','required');
					$('#lcity').attr('required','required');
					$('#loffice').attr('required','required');
				}else{
					$('#lresume').removettr('required');	
					$('#lcity').removettr('required');
					$('#loffice').removettr('required');
					$('#lname').removettr('required');
					$('#shenfenzheng').removettr('required');
				}
			})
			
			function onbtn() {$("#submit-button").removeAttr("disabled");}
			function stopbtn() {$("#submit-button").attr("disabled", true);}
		
			$(document).on('blur','#remainpwd',function(){
				var pwd = $('#upassword').val();
				var repwd = $('#remainpwd').val();
				//移除所有class
				$("#rePwdRes").removeClass();
				if (pwd == repwd && repwd != "" && repwd != null) {
					$("#submit-button").removeAttr("disabled");
					$("#rePwdRes").attr("class", "icon ticker");
				}else{
					$("#submit-button").attr("disabled", true);
					$("#rePwdRes").attr("class", "icon into");
				}
			})
			
			$(document).on('blur','#upassword',function(){
				var pwd = $('#upassword').val();
				var repwd = $('#remainpwd').val();
				if (pwd != "" && pwd != null) {
					if (pwd.length >= 6) {
						$("#pwdRes").attr("class", "icon ticker");
					}else{
						$("#pwdRes").removeClass();
						$("#pwdRes").attr("class", "icon into");
					}
				}else{
					$("#pwdRes").removeClass();
					$("#rePwdRes").removeClass();
				}
				if ( repwd == null || repwd == "" ) {
					return;
				}
				//移除所有class
				$("#rePwdRes").removeClass();
				if (pwd == repwd) {
					$("#submit-button").removeAttr("disabled");
					$("#rePwdRes").attr("class", "icon ticker");
				}else{
					$("#submit-button").attr("disabled", true);
					$("#rePwdRes").attr("class", "icon into");
				}
			})
		</script>
	</div>
</body>
</html>