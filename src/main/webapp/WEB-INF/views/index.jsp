<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="./util/tlds.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>电信产品分析</title>

		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!--[if !IE]> -->
		<!-- <link rel="stylesheet" href="${ctx}/static/assets/css/pace.css" />
		<script data-pace-options='{ "ajax": true, "document": true, "eventLag": false, "elements": false }' src="${ctx}/static/assets/components/PACE/pace.js"></script> -->

		<!-- <![endif]-->

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="${ctx}/static/assets/css/bootstrap.css" />
		<link rel="stylesheet" href="${ctx}/static/js/zTree/css/zTreeStyle/zTreeStyle.css" />
		<link rel="stylesheet" href="${ctx}/static/assets/components/font-awesome/css/font-awesome.css" />

		<!-- text fonts -->
		<link rel="stylesheet" href="${ctx}/static/assets/css/ace-fonts.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="${ctx}/static/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="${ctx}/static/assets/css/ace-part2.css" class="ace-main-stylesheet" />
		<![endif]-->
		<link rel="stylesheet" href="${ctx}/static/assets/css/ace-skins.css" />
		<link rel="stylesheet" href="${ctx}/static/assets/css/ace-rtl.css" />
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="${ctx }/static/assets/components/bootstrap-table/bootstrap-table.css">
		<link rel="stylesheet" href="${ctx }/static/assets/css/weui.min.css">
		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="${ctx}/static/assets/css/ace-ie.css" />
		<![endif]-->
		<link rel="stylesheet" href="${ctx}/static/js/tagsinput/bootstrap-tagsinput.css" />
		<link rel="stylesheet" href="${ctx}/static/js/datetimepicker/bootstrap-datepicker3.css" />
		<link rel="stylesheet" href="${ctx}/static/js/daterangepicker/daterangepicker.min.css" />
		<link href="${ctx}/static/js/fileinput/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
		<link href="${ctx}/static/js/multiselect/bootstrap-multiselect.css" media="all" rel="stylesheet" type="text/css" />
		<link href='${ctx}/static/js/fullcalendar/fullcalendar.css' rel='stylesheet' />
		<link href='${ctx}/static/js/fullcalendar/fullcalendar.print.css' rel='stylesheet' media='print' />
		
		<!-- ace settings handler -->
		<script src="${ctx}/static/assets/js/ace-extra.js"></script>

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="${ctx}/static/assets/components/html5shiv/dist/html5shiv.min.js"></script>
		<script src="${ctx}/static/assets/components/respond/dest/respond.min.js"></script>
		<![endif]-->
		
				<!-- basic scripts -->

		<!--[if !IE]> -->
		<script src="${ctx}/static/assets/components/jquery/dist/jquery.min.js"></script>
		<!-- <![endif]-->

		<!--[if IE]>
<script src="${ctx}/static/assets/components/jquery.1x/dist/jquery.js"></script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='${ctx}/static/assets/components/_mod/jquery.mobile.custom/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>
		<script src="${ctx}/static/assets/components/bootstrap/dist/js/bootstrap.js"></script>

		<!-- ace scripts -->
		<script src="${ctx}/static/assets/js/src/elements.scroller.js"></script>
		<script src="${ctx}/static/assets/js/src/elements.colorpicker.js"></script>
		<script src="${ctx}/static/assets/js/src/elements.fileinput.js"></script>
		<script src="${ctx}/static/assets/js/src/elements.typeahead.js"></script>
		<script src="${ctx}/static/assets/js/src/elements.wysiwyg.js"></script>
		<script src="${ctx}/static/assets/js/src/elements.spinner.js"></script>
		<script src="${ctx}/static/assets/js/src/elements.treeview.js"></script>
		<script src="${ctx}/static/assets/js/src/elements.wizard.js"></script>
		<script src="${ctx}/static/assets/js/src/elements.aside.js"></script>
		<script src="${ctx}/static/assets/js/src/ace.js"></script>
		<script src="${ctx}/static/assets/js/src/ace.basics.js"></script>
		<script src="${ctx}/static/assets/js/src/ace.scrolltop.js"></script>
		<script src="${ctx}/static/assets/js/src/ace.ajax-content.js"></script>
		<script src="${ctx}/static/assets/js/src/ace.touch-drag.js"></script>
		<script src="${ctx}/static/assets/js/src/ace.sidebar.js"></script>
		<script src="${ctx}/static/assets/js/src/ace.sidebar-scroll-1.js"></script>
		<script src="${ctx}/static/assets/js/src/ace.submenu-hover.js"></script>
		<script src="${ctx}/static/assets/js/src/ace.widget-box.js"></script>
		<script src="${ctx}/static/assets/js/src/ace.settings.js"></script>
		<script src="${ctx}/static/assets/js/src/ace.settings-rtl.js"></script>
		<script src="${ctx}/static/assets/js/src/ace.settings-skin.js"></script>
		<script src="${ctx}/static/assets/js/src/ace.widget-on-reload.js"></script>
		<script src="${ctx}/static/assets/js/src/ace.searchbox-autocomplete.js"></script>
		<script src="${ctx }/static/assets/components/bootbox.js/bootbox.min.js" ></script>
		<script src="${ctx }/static/assets/components/bootstrap-table/bootstrap-table.js" ></script>
		<script src="${ctx }/static/assets/components/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
		<script src="${ctx}/static/js/nice-validator/jquery.validator.min.js?local=zh-CN"></script>
		<script type="text/javascript" src="${ctx}/static/js/zTree/js/jquery.ztree.core.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/zTree/js/jquery.ztree.excheck.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/zTree/js/jquery.ztree.exhide.js"></script>
		<script src="${ctx}/static/js/dateUtil.js"></script>
		<script src="${ctx}/static/js/common.js"></script>
		<script src="${ctx}/static/js/treeUtil.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/tagsinput/bootstrap-tagsinput.min.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/datetimepicker/bootstrap-datepicker.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/moment/moment.min.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/daterangepicker/daterangepicker.min.js"></script>
		<%--<script type="text/javascript" src="${ctx}/static/js/datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>--%>
		<script type="text/javascript" src="${ctx}/static/js/multiselect/bootstrap-multiselect.js"></script>
		<script src="${ctx}/static/js/fileinput/fileinput.js" type="text/javascript"></script>
		<script src="${ctx}/static/js/fileinput/locales/zh.js" type="text/javascript"></script>
		<script src="${ctx}/static/js/ajaxfileupload.js"></script>
		<script src="${ctx}/static/js/vuejs/vue.min.js"></script>
		<!-- 百度ueditor -->
		<script type="text/javascript" charset="utf-8" src="${ctx}/static/js/ueditor/ueditor.config.js"></script>
	    <script type="text/javascript" charset="utf-8" src="${ctx}/static/js/ueditor/ueditor.all.min.js"> </script>
	    <script type="text/javascript" charset="utf-8" src="${ctx}/static/js/ueditor/lang/zh-cn/zh-cn.js"></script>
	    <!-- fullcalendar -->
	    <script src='${ctx}/static/js/fullcalendar/lib/moment.min.js'></script>
		<script src='${ctx}/static/js/fullcalendar/fullcalendar.js'></script>
		<script src='${ctx}/static/js/fullcalendar/lang/zh-cn.js'></script>
		<!-- mui -->
<%-- 		<script src="${ctx }/static/js/mui/js/mui.min.js"></script>
		 <script src="${ctx }/static/js/mui/js/mui.zoom.js"></script>
		<script src="${ctx }/static/js/mui/js/mui.previewimage.js"></script>  --%>
	</head>

	<body class="no-skin">
		<!-- #section:basics/navbar.layout -->
		<jsp:include page="header.jsp"></jsp:include>

		<!-- /section:basics/navbar.layout -->
		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>
			<jsp:include page="sider.jsp"></jsp:include>
			<!-- #section:basics/sidebar -->
			<!-- /section:basics/sidebar -->
			<div class="main-content">
				<div class="main-content-inner">
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>
						<ul class="breadcrumb" id="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#home">主页</a>
							</li>
						</ul><!-- /.breadcrumb -->
					</div>
					<!-- #section:basics/content.breadcrumbs -->
					<div class="page-content">
						<div class="page-content-area" data-ajax-content="true">
						</div>
					</div>
				</div>
			</div>

			<jsp:include page="footer.jsp"></jsp:include>

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->
		
		
<div id="loadingToast" class="weui_loading_toast" style="display: none;">
		<div class="weui_mask_transparent"></div>
		<div class="weui_toast">
			<div class="weui_loading">
				<div class="weui_loading_leaf weui_loading_leaf_0"></div>
				<div class="weui_loading_leaf weui_loading_leaf_1"></div>
				<div class="weui_loading_leaf weui_loading_leaf_2"></div>
				<div class="weui_loading_leaf weui_loading_leaf_3"></div>
				<div class="weui_loading_leaf weui_loading_leaf_4"></div>
				<div class="weui_loading_leaf weui_loading_leaf_5"></div>
				<div class="weui_loading_leaf weui_loading_leaf_6"></div>
				<div class="weui_loading_leaf weui_loading_leaf_7"></div>
				<div class="weui_loading_leaf weui_loading_leaf_8"></div>
				<div class="weui_loading_leaf weui_loading_leaf_9"></div>
				<div class="weui_loading_leaf weui_loading_leaf_10"></div>
				<div class="weui_loading_leaf weui_loading_leaf_11"></div>
			</div>
			<p class="weui_toast_content">加载中......</p>
		</div>
	</div>
		

		<script type="text/javascript">
			bootbox.setLocale("zh_CN");  
			$(".page-content-area").ace_ajax({
				  content_url: function(hash) {
					  var tmp = hash.split(";");
					  if(tmp[0].substring(0,1) =="/"){
						  return  tmp[0].substring(1);
					  }else{
						  return  tmp[0];
					  }
				  },
				  //loading_overlay:"body",//默认null，表示加载到maincontent上
				  default_url: "#home"
			})
			
/* 			$('.dropdown-toggle').on("click",function(){
				$(this).dropdown();
			}) */
			
			//解决图片缩放，导致mui阻挡href事件的bug
/* 			mui('body').on('tap','a',function(){
				    window.top.location.href=this.href;
			}); */
		</script>
	</body>
</html>