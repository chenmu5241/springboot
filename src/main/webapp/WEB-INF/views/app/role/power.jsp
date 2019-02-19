<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../util/tlds.jsp"%>
	<style type="text/css">
		.ztree li span.button.icon01_ico_docu{margin-right:2px; background: url(${ctx}/static/js/zTree/css/zTreeStyle/img/diy/12.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
	</style>
<div class="row">
	<div class="col-xs-12" id="content">
		<!-- PAGE CONTENT BEGINS -->
		<div style=" ">
			<ul id="treeDemo" class="ztree"></ul>
		</div>
		<div class="col-xs-12">
			<div class="space-20"></div>
			<button id="btn_submit" onclick="submit()" class="btn btn-app btn-info no-border" type="button"> <i class="ace-icon fa fa-check"></i>确认
			</button> <a href="javascript:history.go(-1)" class="btn btn-app btn-danger no-border" data-dismiss="modal" style="margin-left: 0px;"> <i class="ace-icon fa fa-times"></i> 取消
			</a>
		</div>
	</div>
	<!-- /.col -->
</div>
<!-- /.row -->
<script type="text/javascript">
	appendBreadcrumb("#role/toList", "权限管理");
	
	function submit(){
		bootbox.confirm("确定要修改吗?",function(r){
			if(r){
				var ids = [];
				var nodes = treeObj.getCheckedNodes(true);
				for(var i=0; i<nodes.length; i++){
					ids.push(nodes[i].id);
				}
				$.ajax({
					type : "post",
					cache : false,
					async : true,
					dataType : "json",
					url : "${ctx}/role/addPowers",
					data : {id:'<%=request.getParameter("id")%>',powerIds:ids.join(",")},
					async:false,
					success : function(result) {
						if (result.success) {
							bootbox.alert("保存成功",function(){
								location.href = "#role/toList";
							})
						} else {
							bootbox.alert(result.message);
						}
					}
				})		
			}
		});
	}
	
	var setting = {
		view:{
			//fontCss : {"font-size":30}
		},
		check : {
			enable : true,
			chkStyle : "checkbox",
			chkboxType:  { "Y" : "p", "N" : "ps" }
		},
		data : {
			key : {
				title : "name",
				url: "#"
			},
			simpleData : {
				idKey : "id",
				pIdKey : "parentId",
				enable : true
			}
		},
		callback : {
			onClick : function(e, treeId, treeNode) {
			},
			onCheck : function(e, treeId, treeNode) {
			}
		}
	};

	var scripts = ["${ctx}/static/js/zTree/js/jquery.ztree.core.js",
			"${ctx}/static/js/zTree/js/jquery.ztree.excheck.js",
			"${ctx}/static/js/zTree/js/jquery.ztree.exhide.js" ,
			"${ctx}/static/js/treeUtil.js" ]
	var treeObj;
	$('.page-content-area').ace_ajax('loadScripts', scripts, function() {
		loadData('${ctx}/power/selectAll',{}, function(data) {
			treeObj = $.fn.zTree.init($("#treeDemo"), setting, data);
			treeObj.expandAll(true);
		});
		//选中已有的权限
		loadData('${ctx}/power/loadDataByRoleId',{id:'<%=request.getParameter("id")%>'}, function(data) {
			for(var i=0; i<data.length; i++){
				var node = treeObj.getNodeByParam("id", data[i].id, null);
				treeObj.checkNode(node,true);
			}
/*  				var nodes =  treeObj.transformToArray(treeObj.getNodes());
				for(var i=0; i<nodes.length; i++){
					if(nodes[i].isParent==false){
						treeObj.updateNode(nodes[i]);
					}
				}  */
				treeObj.expandAll(true);
		});
		
	});
</script>
