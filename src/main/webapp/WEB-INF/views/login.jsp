<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="./util/tlds.jsp"%>
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

<!--[if lte IE 9]>
    <link rel="stylesheet" href="${ctx}/static/assets/css/ace-ie.css" />
    <![endif]-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

<!--[if lt IE 9]>
    <script src="${ctx}/static/assets/js/html5shiv.js"></script>
    <script src="${ctx}/static/assets/js/respond.js"></script>
    <![endif]-->
    
<link rel="stylesheet" href="${ctx}/static/js/nice-validator/jquery.validator.css" />
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
				<div class="col-xs-12">
					<div class="login-container pull-right">
						<div class="center">
							<h1>
							<span class="green" id="id-text2">产品运行分析系统</span>
						</h1>
						</div>
						<div class="position-relative">
						<div class="position-relative">
							<div id="login-box"
								class="login-box visible widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header blue lighter bigger">
											<i class="ace-icon fa fa-coffee green"></i> 请输入
										</h4>
										<div class="space-6"></div>
										<span id="liDivErrorMessage0"
											style="color: #f00; margin-bottom: 4px;">${loginErrorMsg}</span>
										<div class="space-6"></div>
										<form class="form-inline" method="post" action="${ctx}/login" onsubmit="return  sub()" data-validator-option="{timely:2, theme:'yellow_top'}">
											<input type="hidden" name="uuid"  value="${uuid }">
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> 
													<input type="text" class="form-control" placeholder="用户名" name="username" id="username" value="" data-rule="用户名:required;"  style="width: 100%" /><i class="ace-icon fa fa-user"></i>
												</span> 
												</label> 
												<label class="block clearfix"> 
													<span	class="block input-icon input-icon-right">
													<input	type="password" class="form-control" id="password"  data-rule="密码:required;"  value=""	name="password"	maxlength="25" style="width: 100%"	placeholder="密码" /><i	class="ace-icon fa fa-lock"></i>
												</span>
												</label> 
												<label class="block clearfix pos-rel"> <input type="text" value="" class="form-control" style="width: 60% !important;" placeholder="验证码" id="randomcode"
															name="randomcode"
														/> <img id="randomcode_img" src="${ctx}/getCode" class="pos-abs" style="top: 0; right: 0;" alt="" width="38%" height="34px" onclick="javascript:updateCode();" />
														</label>
												<label class="block clearfix"> 
													<input type="checkbox"	 name="rememberMe"   checked="checked">记住我
												</label>
												<div class="clearfix">
													<button type="submit" 	class="width-100  btn btn-primary">
														<i class="ace-icon fa fa-key"></i> <span	class="bigger-110">登陆</span>
													</button>
													<input id="btnSign" style="display: none;">
												</div>
												<div class="space-4"></div>
											</fieldset>
										</form>
									</div>
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.login-box -->
						</div>
						<!-- /.position-relative -->
						
												
						<div class="col-xs-12 social ">
							<h5 class="title ">
								<span>其他方式登录</span>
							</h5>
							<!-- <a><i class=" fa fa-weibo"></i></a> -->
							<a  href="${renren }"  class="col-xs-2 bigger-220 green"  title="人人网"><i class=" fa fa-renren"></i></a>
							<a href="${baidu }"  class="col-xs-2 bigger-220" title="百度"><i class=" fa fa-users"></i></a>
							<a href="${weibo }" class="col-xs-2 bigger-220" title="微博"><i class=" fa fa-weibo"></i></a>
							<a href="${weixin }"  class="col-xs-2 bigger-220 green" title="微信"><i class=" fa fa-weixin"></i></a>
							<a href="${qq }"  class="col-xs-2 bigger-220 red" title="腾讯qq"><i class=" fa fa-qq"></i></a>
<%-- 							<a href="${163 }"  class="col-xs-2 bigger-220" title="网易"><i class=" fa  fa-envelope"></i></a> --%>
							<!-- <ul class=" col-xs-10 no-float center-block">
								<li class="col-xs-4 text-center"><a><i class=" fa fa-weibo"></i></a></li>
								<li class="col-xs-4 text-center"><a><i class=" fa fa-weixin"></i></a></li>
								<li class="col-xs-4 text-center"><a><i class=" fa fa-qq"></i></a></li>
							</ul> -->
						</div>
						
						</div>
						
					</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.main-content -->
	</div>
	<!--[if !IE]> -->
	<script type="text/javascript">
		window.jQuery || document.write("<script src='${ctx}/static/assets/components/jquery/dist/jquery.js'>"+"<"+"/script>");
	</script>
	<!-- <![endif]-->

	<!--[if IE]>
	<script type="text/javascript">
		window.jQuery || document.write("<script src='${basePath}static/assets/components/jquery.1x/dist/jquery.min.js'>"+"<"+"/script>");
	</script>
	<![endif]-->
<!-- basic scripts -->
<script type="text/javascript">
	if('ontouchstart' in document.documentElement) document.write("<script src='${basePath}static/assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
</script>
<script src="${ctx}/static/js/nice-validator/jquery.validator.min.js"></script>
<script src="${ctx}/static/js/nice-validator/local/zh-CN.js"></script>
<script src="${ctx}/static/js/jquery.base64.js"></script>
<!-- <script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" data-appid="APPID" data-redirecturi="REDIRECTURI" charset="utf-8"></script> -->
<script type="text/javascript">
//示例代码


if(location.hash){
	location.href = "${ctx}"
}

function updateCode(){
	document.getElementById("randomcode_img").src = '${ctx}/getCode?'+new Date();
}

function sub(){
	if(!$("form").isValid()){
		return false;
	}
	var encodePass =$.base64.btoa($("#password").val());
	$("#password").val(encodePass);
	return true
}

$(function(){
	 var h = $(window).height();
    $(".loginback").css("height",h);
	  var w = $(window).width();
    $(".loginback").css("width",w);
}
)
</script>

</body>
</html>