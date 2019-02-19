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
					<div class="login-container">
						<div class="center">
							<h1>
							<span class="green" id="id-text2">首次登陆绑定账号</span>
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
										<form class="form-inline" method="post" action="${ctx}/oauth/login" onsubmit="return  sub()" data-validator-option="{timely:2, theme:'yellow_top'}">
											<input type="hidden" name="oauthType"  value="${oauthType }">
											<input type="hidden" name="oauthUid"  value="${oauthUid }">
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> 
													<input type="text" class="form-control" placeholder="用户名" name="username" id="username" value="" data-rule="required" style="width: 100%" /><i class="ace-icon fa fa-user"></i>
												</span> 
												</label> 
												<label class="block clearfix"> 
													<span	class="block input-icon input-icon-right">
													<input	type="password" class="form-control" id="password"  data-rule="密码:required;"  value=""	name="password"	maxlength="25" style="width: 100%"	placeholder="密码" /><i	class="ace-icon fa fa-lock"></i>
												</span>
												</label> 
												<label class="block clearfix"> 
													<input type="checkbox"	 name="rememberMe"   checked="checked">记住我
												</label>
												<div class="clearfix">
													<button type="submit" 	class="width-100  btn btn-primary">
														<i class="ace-icon fa fa-key"></i> <span	class="bigger-110">绑定并登录</span>
													</button>
												</div>
												<div class="space-4"></div>
												<div class="clearfix center">
													<a type="submit" 	href="${ctx }/login">
														已有账号直接登录
													</a>
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
		window.jQuery || document.write("<script src='${basePath}static/assets/js/jquery1x.js'>"+"<"+"/script>");
	</script>
	<![endif]-->
<!-- basic scripts -->
<script type="text/javascript">
	if('ontouchstart' in document.documentElement) document.write("<script src='${basePath}static/assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
</script>
<script src="${ctx}/static/js/nice-validator/jquery.validator.min.js"></script>
<script src="${ctx}/static/js/nice-validator/local/zh-CN.js"></script>
<script src="${ctx}/static/js/jquery.base64.js"></script>
<script type="text/javascript">
//示例代码


if(location.hash){
	location.href = "${ctx}"
}

function updateCode(){
	document.getElementById("randomcode_img").src = '${ctx}/getCode?'+new Date();
}

function sub(){
	$("form").isValid(
		function(){
			return true
		}
	)
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