<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isErrorPage="true"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<title></title>
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<!-- #section:pages/error -->
		<div class="error-container">
			<div class="well">
				<h1 class="grey lighter smaller">
					<span class="blue bigger-125"> <i class="ace-icon fa fa-sitemap"></i> 401
					</span>无权操作
				</h1>
				<div class="space"></div>
				<div class="center">
					<a href="javascript:history.go(-1)" class="btn btn-grey"> <i class="ace-icon fa fa-arrow-left"></i> 返回
					</a> <a href="${ctx}" class="btn btn-primary"> <i class="ace-icon fa fa-tachometer"></i> 回首页
					</a>
				</div>
			</div>
		</div>
		<!-- /section:pages/error -->
		<!-- PAGE CONTENT ENDS -->
	</div>
	<!-- /.col -->
</div>
<!-- /.row -->
<!-- page specific plugin scripts -->
<script type="text/javascript">
	var scripts = [ null, null ]
	$('.page-content-area').ace_ajax('loadScripts', scripts, function() {
	});
</script>