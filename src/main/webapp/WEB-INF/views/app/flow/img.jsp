<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../util/tlds.jsp"%>
<div class="row">
	<div class="col-xs-12" id="content">
		<!-- PAGE CONTENT BEGINS -->
			<!-- #section:elements.form -->
			<div class="col-xs-12">
			<img src="${ctx}/flow/findImage?pdid=${pdid}">
			<div class="space-20"></div>	
			</div>
			<div class="right">
				<a href="javascript:history.go(-1)" class="btn btn-grey"> <i class="ace-icon fa fa-arrow-left"></i> 返回</a> 
			</div>
	</div>
	<!-- /.col -->
</div>
<script>
appendBreadcrumb("#flow/deployManage","流程图");
</script>