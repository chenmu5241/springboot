<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../util/tlds.jsp"%>
<div class="row">
	<div class="col-xs-12">
		手机app上才能看到效果
		<img alt="" src="" id="imgid" width="100" height="100">
		<input type="hidden" id="inputId">
	</div>
	<!-- /.col -->
</div>
<script>
paizhao.init("imgid","inputId", function () {
	//拍照成功之后的回调内容
});
</script>
