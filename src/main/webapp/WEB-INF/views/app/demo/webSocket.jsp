<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../util/tlds.jsp"%>
<div class="row">
	<div class="space-8"></div>
	<fieldset>
		<label class="block clearfix"> <span class="block input-icon input-icon-right"> <input type="text" class="form-control" placeholder="输入要发送内容" id="text" name="text" value="" data-rule="required;" style="width: 100%" />
		</span>
		</label>
		<div class="clearfix">
			<button onclick="send()" class="width-100  btn btn-primary">
				<i class="ace-icon fa fa-key"></i> <span class="bigger-110">发送消息</span>
			</button>
		</div>
		<div class="space-4"></div>
	</fieldset>
	<!-- /.col -->
</div>
<div class="row" id="message">
	<script>
		document.onkeydown = function() {
			if (event.keyCode == "13") {//keyCode=13是回车键
				send();
			}
		}

		var websocket = null;
		//${account.username }
		//判断当前浏览器是否支持WebSocket
		if ('WebSocket' in window) {
			websocket = new WebSocket("ws://192.168.1.154:8080/base/websocket?${account.username }");
		} else {
			alert('当前浏览器不支持即时聊天功能')
		}

		//连接发生错误的回调方法
		websocket.onerror = function() {
			setMessageInnerHTML("WebSocket连接发生错误");
		};

		//连接成功建立的回调方法
		websocket.onopen = function() {
			//setMessageInnerHTML("WebSocket连接成功");
		}

		//接收到消息的回调方法
		websocket.onmessage = function(event) {
			setMessageInnerHTML(event.data);
		}

		//连接关闭的回调方法
		websocket.onclose = function() {
			//setMessageInnerHTML("WebSocket连接关闭");
		}

		//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
		window.onbeforeunload = function() {
			closeWebSocket();
		}

		//将消息显示在网页上
		function setMessageInnerHTML(innerHTML) {
			document.getElementById('message').innerHTML += '<div class="col-xs-12 no-padding-right" style="font-size: 20px;"><span>' + innerHTML + '</span> </div>';
		}

		//关闭WebSocket连接
		function closeWebSocket() {
			websocket.close();
		}

		//发送消息
		function send() {
			var message = document.getElementById('text').value;
			if(websocket.readyState==3){
				alert("链接已经关闭，要重连请刷新页面!");
				return false;
			}
			websocket.send(message);
			document.getElementById('text').value="";
		}
	</script>