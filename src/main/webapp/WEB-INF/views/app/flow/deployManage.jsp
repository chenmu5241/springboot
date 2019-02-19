<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../util/tlds.jsp"%>
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal" role="form" id="searchForm" onsubmit="return false;">
			<!-- #section:elements.form -->
			<div class="form-group col-sm-4">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1">流程名称</label>
				<div class="col-sm-9">
					<input type="text" id="processDefinitionName" name="processDefinitionName" placeholder="流程名称" class="col-xs-10 ">
				</div>
			</div>
			<div class="col-sm-4">
				<button class="btn  btn-primary btn-sm"  onclick="bt1.search('#searchForm')" type="submit">
					<i class="ui-icon ace-icon fa fa-search center bigger-110 "></i>查询
				</button>
			</div>
			<div class="clearfix"></div>
		</form>
		<div clas="col-xs-12">
		<a class="btn  btn-success btn-sm" type="button" href="#flow/toDeployAdd">
					<i class="ui-icon ace-icon fa fa-plus center bigger-110 "></i>增加
				</a>
				<button class="btn btn-sm btn-danger" type="button"  onclick="deleteCheckedData()">
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
							<th data-checkbox="true" ></th>
							<th data-field='state' data-align="center" data-width="20" data-formatter="createIndex">序号</th>
							<th data-field="id"  data-align="center" >流程id</th>
							<th data-field="key"  data-align="center" >流程key</th>
							<th data-field="name"  data-align="center" >流程名称</th>
							<th data-field="version"  data-align="center" >版本</th>
							<th data-field="id" data-align="center"   data-formatter='viewXml'>xml文件</th>
							<th data-field="id" data-align="center"   data-formatter='viewImg'>流程图</th>
							<th data-field="deploymentId" data-align="center"  data-width="80"  data-formatter="operateFormatter">操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script>
	function viewXml(value, row, index){
		var html ='<a class="blue tooltip-info"   href="#flow/toFindXml?pdid='+value+'"  title="查看xml"><i class="ace-icon fa fa-cog bigger-130"></i></a>' ;
		return [html];
	}
	
	function viewImg(value, row, index){
		var html ='<a class="blue tooltip-info" href="#flow/toFindImage?pdid='+value+'"   title="查看流程图"><i class="ace-icon fa fa-cog bigger-130"></i></a>' ;
		return [html];
	}
	function operateFormatter(value, row, index) {
		var html = "";
			html +=  '<a class="red" href="javascript:void(0)" onclick="bt1.remove(\'${ctx}/flow/deleteDeployment\',\''+value+'\')" title="删除"><i class="ace-icon fa fa-trash-o bigger-130"></i>' + '</a>' ;
		return [ html ];
	}
	

	
	function deleteCheckedData(){
		var rows = $("#table").bootstrapTable("getSelections");
		var ids = [];
		for(var i=0; i<rows.length; i++){
			if(rows[i].id==1){
				continue;
			}
			ids.push(rows[i].deploymentId);
		}
		bt1.remove('${ctx}/flow/deleteDeployment',ids);
	}
	
	var bt1 = bootStrapTable.initTable("#table", '${ctx}/flow/getDeployList');//id正序查询
	var scripts = [ null, null ]
	$('.page-content-area').ace_ajax('loadScripts', scripts, function() {
	});
</script>
