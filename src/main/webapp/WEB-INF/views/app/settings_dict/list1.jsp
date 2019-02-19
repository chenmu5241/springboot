<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../util/tlds.jsp"%>
	<style type="text/css">
		.ztree li span.button.icon01_ico_docu{margin-right:2px; background: url(${ctx}/static/js/zTree/css/zTreeStyle/img/diy/12.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
	</style>
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal" role="form" id="searchForm">
			<!-- #section:elements.form -->
			<div class="form-group col-sm-4">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1">字典名称</label>
				<div class="col-sm-9">
					<input type="text" id="name" name="name" placeholder="字典名称" class="col-xs-10 ">
				</div>
			</div>
			<div class="col-sm-4">
				<button class="btn  btn-primary btn-app" onclick="seachNodes('#name')" type="button">
					<i class="ui-icon ace-icon fa fa-search center bigger-110 "></i>查询
				</button>
			</div>
			<div class="clearfix"></div>
		</form>
		
		<div clas="col-xs-12">
			<a class="btn  btn-success btn-app" type="button" href="#settingsDict/toAdd">
					<i class="ui-icon ace-icon fa fa-plus center bigger-110 "></i>增加
				</a>
				<button class="btn btn-app btn-info" type="button"  onclick="expand(this)">
					<i class="ui-icon ace-icon fa fa-minus center bigger-110 "></i>折叠
				</button>
		</div>
	</div>
	<!-- /.col -->
</div>
<div class="row">
	<div class="col-xs-12">
		<div style="height: 300px; margin-top:20px; overflow: auto; width: 300px; margin-left: 20px;">
			<ul id="treeDemo" class="ztree"></ul>
		</div>
	</div>
</div>
<script>
	var setting = {
		view : {
			showIcon : true,
			addDiyDom : addDiyDom
		},
		check : {
			enable : false
		},
		data : {
			key : {
				title : "value"
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
	//查询树
	function seachNodes(selector) {
		filterTreeNods(treeObj, selector, "#treeDemo", setting);
	}

	//展开折叠
	function expand(btn) {
		if ($(btn).children("i").hasClass("fa-plus")) {
			$(btn)
					.html(
							'<i class="ui-icon ace-icon fa fa-minus center bigger-110 "></i>折叠');
			treeObj.expandAll(true);
		} else {
			$(btn)
					.html(
							'<i class="ui-icon ace-icon fa fa-plus center bigger-110 "></i>展开');
			treeObj.expandAll(false);
		}
	}
	//添加按钮
	function addDiyDom(treeId, treeNode) {
		var aObj = $("#" + treeNode.tId + "_a");
		var html = ""
		if (treeNode.readonly != 1) {
			var html = '<a class="green tooltip-info" name="update_op" href="#settingsDict/toEdit?id='
					+ treeNode.id
					+ '" data-rel="tooltip" data-placement="bottom" title="编辑"><i class="ace-icon fa fa-pencil bigger-130"></i></a>'
			html += '<a class="red" href="javascript:void(0)" onclick="remove('
					+ treeNode.id
					+ ')" title="删除"><i class="ace-icon fa fa-trash-o bigger-130"></i>'
					+ '</a>';
		}
		aObj.append(html);
	};

	function remove(id) {
		var ids = [];
		var node = treeObj.getNodeByParam("id", id, null);
		ids.push(node.id);
		if (node.children && node.children.length > 0) {
			bootbox.confirm("删除父节点将同时删除子节点，确定要删除吗？", function(r) {
				if (r) {
					for (var i = 0; i < node.children.length; i++) {
						ids.push(node.children[i].id);
					}
					deleteByIds(ids);
				}
			});
		} else {
			bootbox.confirm("删除父节点将同时删除子节点，确定要删除吗？", function(r) {
				if (r) {
					deleteByIds(ids);
				}
			});
		}
	}

	var deleteByIds = function(ids) {
		$.ajax({
			type : "post",
			cache : false,
			async : true,
			dataType : "json",
			url : "${ctx}/settingsDict/delete",
			data : {
				ids : ids.join(",")
			},
			success : function(data) {
				if (data.success) {
					loadData('${ctx}/settingsDict/getList', {}, function(data) {
						treeObj = $.fn.zTree.init($("#treeDemo"), setting, data);
						treeObj.expandAll(true);
					});
				} else {
					bootbox.alert(data.message);
				}
			}
		})
	}

	var scripts = [ "${ctx}/static/js/zTree/js/jquery.ztree.core.js",
			"${ctx}/static/js/zTree/js/jquery.ztree.excheck.js",
			"${ctx}/static/js/zTree/js/jquery.ztree.exhide.js" ]

	$('.page-content-area').ace_ajax('loadScripts', scripts, function() {
		loadData('${ctx}/settingsDict/getList', {}, function(data) {
			treeObj = $.fn.zTree.init($("#treeDemo"), setting, data);
			var nodes =  treeObj.transformToArray(treeObj.getNodes());
			for(var i=0; i<nodes.length; i++){
				if(nodes[i].isParent==false){
					nodes[i].iconSkin="icon01";
					treeObj.updateNode(nodes[i]);
				}
			}
			treeObj.expandAll(true);
		});
	});
</script>
