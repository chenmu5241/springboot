<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../util/tlds.jsp"%>
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal" role="form" id="searchForm" onsubmit="return false;">
			<!-- #section:elements.form -->
			<div class="form-group col-sm-4">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1">操作人员</label>
				<div class="col-sm-9">
					<input type="text" id="form-field-1" name="username" placeholder="操作人员" class="col-xs-10 ">
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
							<th data-field="username"  data-align="center"  data-sortable="true">操作人员</th>
							<th data-field="title"  data-align="center"  data-sortable="true">抬头</th>
							<th data-field="content"  data-align="center"  data-sortable="true">内容</th>
							<th data-field="exception"  data-align="center"  data-sortable="true">异常</th>
							<th data-field="updateTime" data-align="center"  data-sortable="true"  data-formatter='bootStrapTable.formatDate'>创建日期</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script>
/* 	function operateFormatter(value, row, index) {
		var html = "";
		if(value==1){//超级管理员不给删除
			html += '<a class="green tooltip-info" name="update_op" href="#account/toEdit?id='+value+'" data-rel="tooltip" data-placement="bottom" title="编辑"><i class="ace-icon fa fa-pencil bigger-130"></i></a>'
		}else{
			html += '<a class="green tooltip-info" name="update_op" href="#account/toEdit?id='+value+'" data-rel="tooltip" data-placement="bottom" title="编辑"><i class="ace-icon fa fa-pencil bigger-130"></i></a>'
			html +=  '<a class="red" href="javascript:void(0)" onclick="bt1.remove(\'${ctx}/account/delete\','+ value + ')" title="Remove"><i class="ace-icon fa fa-trash-o bigger-130"></i>' + '</a>' ;
		}
		return [ html ];
	} */
	
	//初始化bootstraptable
	var bt1 = bootStrapTable.initTable("#table", '${ctx}/sysLog/getList');

	var scripts = [ null, null ]
	$('.page-content-area').ace_ajax('loadScripts', scripts, function() {
		
	});
	
</script>
