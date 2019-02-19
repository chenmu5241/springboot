<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../util/tlds.jsp"%>
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal" role="form" id="searchForm" onsubmit="return false;">
			<!-- #section:elements.form -->
			<div class="form-group col-sm-4">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1">基本url</label>
				<div class="col-sm-9">
					<input type="text" id="form-field-1" name="name" placeholder="角色名称" class="col-xs-10 ">
				</div>
			</div>
			<div class="form-group col-sm-4">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1">类型</label>
				<div class="col-sm-9">
					<input type="text" id="form-field-1" name="description" placeholder="角色描述" class="col-xs-10 ">
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
		<a class="btn  btn-success btn-app" type="button" href="#oauth/toAdd">
					<i class="ui-icon ace-icon fa fa-plus center bigger-110 "></i>增加
				</a>
				<button class="btn btn-app btn-danger" type="button"  onclick="deleteCheckedData()">
					<i class="ui-icon ace-icon fa fa-close center bigger-110 "></i>删除
				</button></div>
	</div>
	<!-- /.col -->
</div>
<div class="row">
	<div class="col-xs-12">
		<table id="table">
			<thead>
				<tr>
							<th data-field='state' data-align="center" data-width="20" data-formatter="createIndex">序号</th>
							<th data-field="oauthType"  data-align="center"  data-sortable="true">类型</th>
							<th data-field="baseUrl"  data-align="center"  data-sortable="true">基本url</th>
							<th data-field="oauthUrl"  data-align="center"   data-sortable="true">授权url</th>
							<th data-field="tokenUrl"  data-align="center"  data-sortable="true">tokenUrl</th>
							<th data-field="clientId"  data-align="center"  data-sortable="true">客户端id</th>
							<th data-field="redirectUri"  data-align="center"  data-sortable="true">授权成功url</th>
							<th data-field="clientSecret"  data-align="center"  data-sortable="true">客户端secret</th>
							<th data-field="id" data-align="center"  data-formatter="operateFormatter">操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script>
	function operateFormatter(value, row, index) {
		var html = "<div style='width:40px;'>";
		html += '<a class="green tooltip-info" name="update_op" href="#oauth/toEdit?id='+value+'" data-rel="tooltip" data-placement="bottom" title="编辑"><i class="ace-icon fa fa-pencil bigger-130"></i></a>'
		html +=  '<a class="red" href="javascript:void(0)" onclick="bt1.remove(\'${ctx}/oauth/delete\','+ value + ')" title="删除"><i class="ace-icon fa fa-trash-o bigger-130"></i>' + '</a>' ;
		html += "</div>"
		return [ html ];
	}
	
	function deleteCheckedData(){
		var accounts = $("#table").bootstrapTable("getSelections");
		var ids = [];
		for(var i=0; i<accounts.length; i++){
			if(accounts[i].id==1){
				continue;
			}
			ids.push(accounts[i].id);
		}
		bt1.remove('${ctx}/role/delete',ids);
	}
	
	var bt1 = bootStrapTable.initTable("#table", '${ctx}/oauth/getList',{
		sortName:"id",
		sortOrder:"asc",
		onLoadSuccess:function(){
			$('[data-uniqueid="1"]').children(":eq(0)").children().remove();
		}
});//id正序查询
	var scripts = [ null, null ]
	$('.page-content-area').ace_ajax('loadScripts', scripts, function() {
	});
</script>
