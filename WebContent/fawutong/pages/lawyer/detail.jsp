<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>律师详情</title>
    <link rel="stylesheet" href="../../css/common.css" />
    <link href="../../css/bootstrap.css" rel="stylesheet">

    <style type="text/css">
   		a {color: #080808;}
    	a:hover {color: #080808;}
    	#user_top { height:430px; left:0px; right:0px; background-image:url(../../img/img_banner_01.png); background-repeat:no-repeat; background-position:top; background-size:cover; opacity:0.95;}
		#user_top img{ width:135px; height:135px; border-radius:100%; margin-top:75px; opacity:1.0; box-shadow:0 0 1px #FFFFFF;}
		#user_top h2{ color:#FFFFFF; padding:10px; text-shadow:0 0 10px #000000;}
		#user_top p{ color:#EEEEEE; text-shadow:0 0 3px #000000;}
		#user_top a{ color:#CCCCCC; position:absolute; top:85px; right:55px; border-bottom:1px dotted #CCCCCC;}
		#user_top a:hover{ color:#FFFFFF;}
    	
    	.black_overlay{ 
            display: none; 
            position: absolute; 
            top: 0%; 
            left: 0%; 
            width: 100%; 
            height: 100%; 
            background-color: black; 
            z-index:1001; 
            -moz-opacity: 0.8; 
            opacity:.80; 
            filter: alpha(opacity=88); 
        } 
        .white_content { 
            display: none; 
            position: absolute; 
            top: 20%; 
            left: 20%; 
            width: 65%; 
            height: 65%; 
            padding: 20px; 
            border: 10px solid #FF5555; 
            background-color: white; 
            z-index:1002; 
            overflow: auto; 
        } 
    </style>
    
    <script type="text/javascript">

	</script>
</head>
<body style="font-family: 'microsoft yahei';">
	
<jsp:include page="../nomal_nav.jsp"/>
		
<div id="user_top" align="center">
	<img src="${pageContext.request.contextPath}/${lawyer.limage }">
	<h2>${lawyer.lname }</h2>
	<p style="margin-bottom: 32px;">${lawyer.loffice }</p>
	<button type="submit" onclick="btnAction('${isCol.src }')" class="btn" style="background: #FCB665; color: white; border-radius: 20px; padding: 8px 25px; margin-right: 8px;">${isCol.title }</button>
	<!-- <button class="btn" style="background: #FF5555; color: white; border-radius: 20px; padding: 8px 25px;">诊断案情</button> -->
</div>
		
	
<div class="container-fluid" style="margin-top: 32px; margin-left: 96px;">
	<div class="row">
		
		<div class="col-md-8">
			
			<h3 style="border-left: solid 4px #FF5555; padding-left: 8px; margin-top: 16px; ">
				律师详情
			</h3>
			
			<div class="row" style="border: solid 2px #DDDDDD; border-radius: 6px; padding: 32px;">
				
				<strong style="font-size: medium;">擅长领域</strong>
				<p class="labels">
					<span class="label label-slected">家庭婚姻</span>
					<span class="label label-slected">公司经营</span>
					<span class="label label-slected">知识产权</span>
				</p>
				<br />
				<strong style="font-size: medium;">律师简介</strong>
				<p style="padding: 8px 0;">
					${lawyer.lresume }
				</p>
				<br />
				<strong style="font-size: medium;">所在地</strong>
				<p style="padding: 8px 0;">
					${lawyer.lcity }
				</p>
				<br />
				
				<strong style="font-size: medium;">事务所</strong>
				<p style="padding: 8px 0;">
					${lawyer.loffice }
				</p>
				<br />
				
				<strong style="font-size: medium;">电&nbsp;&nbsp;&nbsp;话</strong>
				<p style="padding: 8px 0;">
					${lawyer.uphone }
				</p>
				<br />

				<strong style="font-size: medium;">邮&nbsp;&nbsp;&nbsp;箱</strong>
				<p style="padding: 8px 0;">
					${lawyer.uemail }
				</p>
			</div>
			
			
		</div>
		
		
		<jsp:include page="../../hotLawyers.jsp"/>
		
	</div>
	
</div>

<script>
	function btnAction(str) {
		window.location.href = str;
	}
	
</script>

<jsp:include page="../../footer.jsp"></jsp:include>

</body>

</html>