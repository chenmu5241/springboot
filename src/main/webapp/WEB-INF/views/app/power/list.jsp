<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../util/tlds.jsp"%>
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal" role="form" id="searchForm" onsubmit="return false;">
			<!-- #section:elements.form -->
 			<div class="form-group col-sm-4">
				<label class="col-sm-3 control-label no-padding-right" for="name">权限类别</label>
				<div class="col-sm-9">
					<select class="col-xs-10" name="isShow">
						<option value="">全部</option>
						<option value="1">菜单</option>
					</select>
				</div>
			</div>
			<div class="col-sm-4">
				<button class="btn  btn-primary btn-app" onclick="bt1.search('#searchForm')" type="button">
					<i class="ui-icon ace-icon fa fa-search center bigger-110 "></i>查询
				</button>
			</div>
			<div class="clearfix"></div>
		</form>
		<div clas="col-xs-12">
			<a class="btn  btn-success btn-app" type="button" href="#power/toAdd"> <i class="ui-icon ace-icon fa fa-plus center bigger-110 "></i>增加
			</a>
		</div>
	</div>
	<!-- /.col -->
</div>
<div class="row">
	<div class="col-xs-12">
		<table id="table">
			<thead>
				<tr>
					<!-- <th data-field='layer' data-align="center" data-formatter="formatLayer">层级</th> -->
					<th data-field="name" data-align="left" data-formatter="formatName">权限名称</th>
					<th data-field="flag" data-align="center" >权限标识</th>
					<th data-field="url" data-align="center"  data-formatter="urlFormat">权限url</th>
					<th data-field="isShow" data-align="center" data-formatter="isMenu">是否菜单</th>
					<!-- <th data-field="sort" data-align="center">排序</th> -->
					<th data-field="updateTime" data-align="center"  data-formatter='bootStrapTable.formatDate'>创建日期</th>
					<th data-field="id" data-align="center" data-width="80" data-formatter="operateFormatter">操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script>
	//层级渲染
	function formatLayer(value, row, index) {
		var html = "";
		html += '<a class="blue" href="javascript:void(0)" onclick="togleChildren(this,\''+row.layerCode+'\')" title=""><i class="ace-icon fa fa-minus"></i>' + '</a>';
		return [ html ];
	}
	//设置隐藏显示树子类
	function togleChildren(a, layerCode){
		if($(a).children().hasClass("fa-minus")){
			if($("tr[layercode^='"+layerCode+"_']").length>0){
				$(a).children().removeClass("fa-minus");
				$(a).children().addClass("fa-plus");
			}
			$("tr[layercode^='"+layerCode+"_']").hide();
			$("tr[layercode^='"+layerCode+"_']").each(function(){
				$(this).children(":eq(0)").find("i").removeClass("fa-minus");
				$(this).children(":eq(0)").find("i").addClass("fa-plus");
			})
		}else{
			if($("tr[layercode^='"+layerCode+"_']").length>0){
				$(a).children().addClass("fa-minus");
				$(a).children().removeClass("fa-plus"); 
			}
			$("tr[layercode^='"+layerCode+"_']").show();
			$("tr[layercode^='"+layerCode+"_']").each(function(){
				$(this).children(":eq(0)").find("i").removeClass("fa-plus");
				$(this).children(":eq(0)").find("i").addClass("fa-minus");
			})
		}
	}
	
	//显示树层次
	function formatName(value, row, index) {
		var html = "";
		for (var i = 1; i < row.layer; i++) {
			html += "　　";
		}
		html += '<a class="blue" href="javascript:void(0)" onclick="togleChildren(this,\''+row.layerCode+'\')" title=""><i class="ace-icon fa fa-minus"></i>' + '</a>';
		html += value;
		return html;
	}
	//格式化url字段
	function urlFormat(value, row, index) {
		var html = "<span title='"+value+"'>";
		if (value.length > 40) {
			html += value.substring(0, 40) + "...";
		} else {
			html += value;
		}
		html += "</span>";
		return [ html ];
	}
	//是否菜单
	function isMenu(value, row, index) {
		if (value == 1) {
			value = "是"
		} else {
			value = "否"
		}
		return [ value ];
	}
	//按钮
	function operateFormatter(value, row, index) {
		var html = "";
		html += '<a class="green tooltip-info" name="update_op" href="#power/toEdit?id=' + value + '" data-rel="tooltip" data-placement="bottom" title="编辑"><i class="ace-icon fa fa-pencil bigger-130"></i></a>'
		html += '<a class="green" href="#power/toAdd?parentId='+value+'"  title="增加"><i class="ace-icon fa fa-plus bigger-130"></i>' + '</a>';
		html += '<a class="red" href="javascript:void(0)" onclick="deleteOne('+ value + ')" title="删除"><i class="ace-icon fa fa-trash-o bigger-130"></i>' + '</a>';
		return [ html ];
	}
	
	function deleteOne(id){
		var layercode = $("[data-uniqueid="+id+"]").attr("layercode");
		if($("[layercode^='"+layercode+"_']").length>0){
			bootbox.alert("请先删除子节点！");
			return;
		}
		bootbox.confirm("确定要删除吗",function(flag){
			if(flag){
				$.ajax({
					type : "post",
					cache : false,
					async : true,
					dataType : "json",
					url : '${ctx}/power/delete',
					data : {ids:id},
					success : function(result) {
						if (result.success) {
							$("#table").bootstrapTable("refresh");
						} else {
							bootbox.alert(result.message);
						}
					}
				})
			}
		})
	}

	
	var otherOption = {
			pagination:false,
			rowAttributes:function(row,index){
			    return {
			            'layer':row.layer,
			            'layercode':row.layerCode
			        }
			}
		}
	var bt1 = bootStrapTable.initTable("#table", '${ctx}/power/getList', otherOption);
	var scripts = [ null, null ]
	$('.page-content-area').ace_ajax('loadScripts', scripts, function() {
	});
</script>
