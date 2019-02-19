<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../util/tlds.jsp"%>
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal" role="form" id="searchForm" onsubmit="return false;">
			<!-- #section:elements.form -->
			<div class="form-group col-sm-4">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1">流程实例</label>
				<div class="col-sm-9">
					<input type="text" name="processInstanceId" placeholder="请输入流程实例id" class="col-xs-10 ">
				</div>
			</div>
			<div class="col-sm-4">
				<button class="btn  btn-primary btn-app" onclick="bt1.search('#searchForm')" type="submit">
					<i class="ui-icon ace-icon fa fa-search center bigger-110 "></i>查询
				</button>
				
			</div>
			<div class="clearfix"></div>
		</form>
	</div>
	<!-- /.col -->
</div>
<div class="row">
	<div class="col-xs-12">
		<table id="table">
			<thead>
				<tr>
							<th data-field='state' data-align="center" data-width="20" data-formatter="createIndex">序号</th>
							<th data-field="id"  data-align="center"  data-sortable="true">id</th>
							<th data-field="name"  data-align="center"  data-sortable="true">名称</th>
							<th data-field="processDefinitionId"  data-align="center"  data-sortable="true">流程定义id</th>
							<th data-field="processInstanceId"  data-align="center"  data-sortable="true">流程实例id</th>
							<th data-field="createTime" data-align="center"  data-sortable="true"  data-formatter='bootStrapTable.formatDate'>创建日期</th>
							<!-- <th data-field="username"  data-align="center"  data-sortable="true">联系手机</th> -->
							<th data-field="id" data-align="center"  data-width="80"  data-formatter="operateFormatter">操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script>
	function operateFormatter(value, row, index) {
		var html = "";
			html += '<a class="blue tooltip-info" name="" target="blank" href="${ctx}/diagram-viewer/index.html?processDefinitionId='+row.processDefinitionId+'&processInstanceId='+row.processInstanceId+'" data-rel="tooltip" data-placement="bottom" title="查看"><i class="ace-icon fa fa-search bigger-130"></i></a>'
			html += '<a class="green tooltip-info" name="update_op" href="#account/toEdit?id='+value+'" data-rel="tooltip" data-placement="bottom" title="编辑"><i class="ace-icon fa fa-pencil bigger-130"></i></a>'
			html +=  '<a class="red" href="javascript:void(0)" onclick="bt1.remove(\'${ctx}/account/delete\','+ value + ')" title="删除"><i class="ace-icon fa fa-trash-o bigger-130"></i>' + '</a>' ;
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
		bt1.remove('${ctx}/account/delete',ids);
	}
	
	var otherOption = {
			sortName:"id",
			sortOrder:"asc",
			method:"get",
			queryParams : function(params) {
				//为了适应activiti请求参数
				params.start = (params.pageNumber-1)*params.pageSize;
				params.size = params.pageSize;
				return params
			},
			onLoadSuccess:function(param){
				//$('[data-uniqueid="1"]').children(":eq(0)").children().remove();
			},
			onPageChange:function(number,size){
			},
			responseHandler : function(r) {
					var result = {};
					result.total = r.total;
					result.rows = r.data;
					for(var i=0; i<result.rows.length;i++){
						result.rows[i].tableSelector="#table";
					}
				return result;
			}
	}
	
	var bt1 = bootStrapTable.initTable("#table", '${ctx}/service/runtime/tasks',otherOption);
	var scripts = [ null, null ]
	$('.page-content-area').ace_ajax('loadScripts', scripts);
	
</script>
