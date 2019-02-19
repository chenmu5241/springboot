<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../util/tlds.jsp"%>


<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>产品运行分析系统</title>

<meta name="description" content="User login page" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="${ctx}/static/assets/css/bootstrap.css" />
<link rel="stylesheet" href="${ctx}/static/assets/components/font-awesome/css/font-awesome.css" />

<!-- text fonts -->
<link rel="stylesheet" href="${ctx}/static/assets/css/ace-fonts.css" />

<!-- ace styles -->
<link rel="stylesheet" href="${ctx}/static/assets/css/ace.min.css" />

<!--[if lte IE 9]>
    <link rel="stylesheet" href="${ctx}/static/assets/css/ace-part2.css" />
    <![endif]-->
<link rel="stylesheet" href="${ctx}/static/assets/css/ace-rtl.css" />

    
<style>
body {
	font: 12px "Microsoft Yahei", Arial, Helvetica, sans-serif;
}

.login-error-tip {
	font: 12px "Microsoft Yahei", Arial, Helvetica, sans-serif;
}
</style>
</head>
<body class="login-layout light-login ">
	<div class="main-container">
		<div class="main-content">
			<div class="row">
			<form class="form-inline" method="post" onsubmit="return  sub()" data-validator-option="{timely:2, theme:'yellow_top'}">
			<div class="space-8"></div>
			<div class="space-8"></div>
			<div class="space-8"></div>
											<fieldset>
<!-- 												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> 
													<input type="text" class="form-control" placeholder="输入昵称昵称" id="nickname" name="nickname"  value="" data-rule="required;"  style="width: 100%" />
												</span> 
												</label>  -->
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> 
													<input type="text" class="form-control" placeholder="输入要发送内容" id="text"  name="text" value="" data-rule="required;"  style="width: 100%" />
												</span> 
												</label> 
												<div class="clearfix">
													<button onclick="send()"	class="width-100  btn btn-primary">
														<i class="ace-icon fa fa-key"></i> <span	class="bigger-110">发送消息</span>
													</button>
												</div>
												<div class="space-4"></div>
											</fieldset>
						</form>
				<!-- /.col -->
			</div>
			<div class="row" id="message">
			</div>
			<!-- /.row -->
		</div>
		<!-- /.main-content -->
	</div>

<!-- basic scripts -->

</body>
</html>



<script>
document.onkeydown=function(){
    if (event.keyCode == "13") {//keyCode=13是回车键
    	send();
    }
}

var websocket = null;
//${account.username }
     //判断当前浏览器是否支持WebSocket
     if ('WebSocket' in window) {
         websocket = new WebSocket("ws://192.168.1.154:8080/base/websocket?小张");
     }
     else {
         alert('当前浏览器不支持即时聊天功能')
     }
 
     //连接发生错误的回调方法
     websocket.onerror = function () {
         //setMessageInnerHTML("WebSocket连接发生错误");
     };
 
     //连接成功建立的回调方法
     websocket.onopen = function () {
         //setMessageInnerHTML("WebSocket连接成功");
     }
 
     //接收到消息的回调方法
     websocket.onmessage = function (event) {
         setMessageInnerHTML(event.data);
     }
 
     //连接关闭的回调方法
     websocket.onclose = function () {
         //setMessageInnerHTML("WebSocket连接关闭");
     }
 
     //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
     window.onbeforeunload = function () {
         closeWebSocket();
     }
 
     //将消息显示在网页上
     function setMessageInnerHTML(innerHTML) {
         document.getElementById('message').innerHTML += '<div class="col-xs-12 no-padding-right" style="font-size: 20px;"><span>'+innerHTML+'</span> </div>';
     }
 
     //关闭WebSocket连接
     function closeWebSocket() {
         websocket.close();
     }
 
     //发送消息
     function send() {
         var message = document.getElementById('text').value;
         websocket.send(message);
     }
</script>
