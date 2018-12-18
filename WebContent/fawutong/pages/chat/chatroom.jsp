<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../../css/common.css" rel="stylesheet" />
<link href="../../css/bootstrap.css" rel="stylesheet">
<link href="../../css/style.css" rel="stylesheet" type="text/css" media="all" />

<style type="text/css">
   		
        .white_content { 
            display: block; 
            position: relative; 
            top: 20%; 
            left: 20%; 
            width: 65%; 
            height: 600px; 
            padding: 20px; 
            border: 10px solid #FF5555; 
            background-color: white; 
            z-index:1002; 
            overflow: auto; 
        } 
    </style>

</head>
<body>
	<jsp:include page="../nomal_nav.jsp"/>

	<h3 style="text-align:center;">欢迎进入讨论组</h3>
	<div class="white_content" id="show" style="height:400px;">
        <div id="showChatMessage"> 
        
        </div>
    </div>
    <div style="margin-left:20%; margin-top:10px;">
    	<textarea  id="msg" rows="3" cols="126"></textarea>
    	<br>
    	<button type="submit" onclick="send()" class="btn" style="background: #FF5555; color: white; border-radius: 20px; padding: 8px 25px; margin-right: 8px; margin-top:8px;">发送</button>	
    </div>
	
	<script type="text/javascript" src="../../js/jquery-1.11.1.min.js"></script>
	<script>
	
		var ws = ws = new WebSocket("ws://localhost:8080/fawutongWeb/webSocket");
		
		/*
	     *监听三种状态的变化 。js会回调
	     */
	    ws.onopen = function(message) {
	
	    };
	    ws.onclose = function(message) {
	
	    };
	    ws.onmessage = function(message) {
	    	console.log("毁掉");
	        showMessage(message.data);
	    };
	    //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
		window.onbeforeunload = function() {
	        ws.close();
	    };
	    //关闭连接
	    function closeWebSocket() {
	        ws.close();
	    }
	    //发送消息
	    function send() {
	        var input = document.getElementById("msg");
	        var text = input.value;
	        ws.send(text);
	        input.value = "";
	    }
	    function showMessage(message) {
	        var text = document.createTextNode(message);
	        var br = document.createElement("br")
	        var div = document.getElementById("showChatMessage");
	        div.appendChild(text);
	        div.appendChild(br);
	    }
		
	</script>
	
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>