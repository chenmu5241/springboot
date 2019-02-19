<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../util/tlds.jsp"%>
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal" role="form" id="searchForm" onsubmit="return false;">
			<!-- #section:elements.form -->
			<div class="form-group col-sm-4">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1">配置名称</label>
				<div class="col-sm-9">
					<input type="text" id="form-field-1" name="keyName" placeholder="配置名称" class="col-xs-10 ">
				</div>
			</div>
			<div class="col-sm-4">
				<button class="btn  btn-primary btn-app" onclick="bt1.search('#searchForm')" type="submit">
					<i class="ui-icon ace-icon fa fa-search center bigger-110 "></i>查询
				</button>
			</div>
			<div class="clearfix"></div>
		</form>
		<div clas="col-xs-12">
			<a class="btn  btn-success btn-app" type="button" href="#settingsConfig/toAdd"> <i class="ui-icon ace-icon fa fa-plus center bigger-110 "></i>增加
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
					<th data-field='state' data-align="center" data-width="20" data-formatter="createIndex">序号</th>
					<th data-field="keyName" data-align="center" data-sortable="true">配置名称</th>
					<th data-field="keyValue" data-align="center" data-sortable="true">配置值</th>
					<th data-field="rwValue" data-align="center" data-sortable="true" data-formatter="readFormatter">读写</th>
					<th data-field="updateTime" data-align="center" data-sortable="true" data-formatter='bootStrapTable.formatDate'>更新日期</th>
					<th data-field="id" data-align="center" data-width="80" data-formatter="operateFormatter">操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script>
	function operateFormatter(value, row, index) {
		var html = "";
		html += '<a class="green tooltip-info" name="update_op" href="#settingsConfig/toEdit?id=' + value + '" data-rel="tooltip" data-placement="bottom" title="编辑"><i class="ace-icon fa fa-pencil bigger-130"></i></a>'
		html += '<a class="red" href="javascript:void(0)" onclick="bt1.remove(\'${ctx}/settingsConfig/delete\',' + value + ')" title="Remove"><i class="ace-icon fa fa-trash-o bigger-130"></i>' + '</a>';
		return [ html ];
	}
	function readFormatter(value, row, index){
		var text = "";
		if(value.substring(0,1)==1){
			text += "读"
		}
		if(value.substring(1,2)==1){
			text += "写"
		}
		return [text];
	}

	function deleteCheckedData() {
		var settingsConfigs = $("#table").bootstrapTable("getSelections");
		var ids = [];
		for (var i = 0; i < settingsConfigs.length; i++) {
			if (settingsConfigs[i].id == 1) {
				continue;
			}
			ids.push(settingsConfigs[i].id);
		}
		
		if(ids.length==0){
			bootbox.alert("请先选择一条要删除的数据！");
			return;
		}
		bt1.remove('${ctx}/settingsConfig/delete', ids);
	}

	var bt1 = bootStrapTable.initTable("#table", '${ctx}/settingsConfig/getList');
	var scripts = [ null, null ]
	$('.page-content-area').ace_ajax('loadScripts', scripts, function() {
	});
</script>
