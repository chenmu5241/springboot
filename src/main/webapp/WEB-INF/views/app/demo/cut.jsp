<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../util/tlds.jsp"%>
<script type="text/javascript" src="${ctx }/static/js/html2canvas.min.js"></script>
<div class="row" id="hello">
	<div id="capture">
		<h4 style="color: #000;">Hello world!</h4>
		<img alt="" src="${ctx }/static/images/1.jpg"> 你好a
	</div>
	<a class="btn btn-app btn-primary no-border" onclick="createCaptrue()">截图</a>
</div>


<script>
	function createCaptrue() {
		html2canvas(document.body,{scale:3,width:window.width,height:window.height}).then(function(canvas) {
			var pageData = canvas.toDataURL('image/jpeg', 1.0);
			//window.location=(pageData.replace("image/jpeg", "image/octet-stream"));
			saveFile(pageData.replace("image/jpeg", "image/octet-stream"), new Date().getTime() + ".png");
		});
	}

	/**
	 * 在本地进行文件保存
	 * @param  {String} data     要保存到本地的图片数据
	 * @param  {String} filename 文件名
	 */
	var saveFile = function(data, filename) {
		var save_link = document.createElementNS('http://www.w3.org/1999/xhtml', 'a');
		save_link.href = data;
		save_link.download = filename;

		var event = document.createEvent('MouseEvents');
		event.initMouseEvent('click', true, false, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
		save_link.dispatchEvent(event);
	}
</script>
