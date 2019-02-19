<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../util/tlds.jsp"%>
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal" role="form" id="searchForm">
			<!-- #section:elements.form -->
			<div class="form-group col-sm-4">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1">人员姓名</label>
				<div class="col-sm-9">
					<input type="text" id="form-field-1" name="name" placeholder="Username" class="col-xs-10 col-sm-5">
				</div>
			</div>
			<div class="form-group col-sm-4">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1">用户名</label>
				<div class="col-sm-9">
					<input type="text" id="form-field-1" name="account" placeholder="Username" class="col-xs-10 col-sm-5">
				</div>
			</div>
			<div class="col-sm-4">
				<button class="btn  btn-primary" id="select" type="button">
					<i class="ui-icon ace-icon fa fa-search center bigger-110 "></i>查询
				</button>
				<button class="btn  btn-success" type="button" id="m1">
					<i class="ui-icon ace-icon fa fa-plus center bigger-110 "></i>增加
				</button>
				<button class="btn  btn-success" type="button"  onclick="bt1.remove('${ctx}/test/delete')">
					<i class="ui-icon ace-icon fa fa-plus center bigger-110 "></i>删除
				</button>
			</div>
		</form>
	</div>
	<!-- /.col -->
</div>
<div class="row">
	<div class="col-xs-12">
		<table id="table">
			<thead>
				<tr>
							<th data-checkbox="true"></th>
							<th data-field='state'  data-formatter="createIndex">序号</th>
							<th class="center" style="width: 8%;">姓名</th>
							<th class="center" style="width: 8%;">用户名</th>
							<th class="center" style="width: 8%;">所在部门</th>
							<th class="center" style="width: 8%;">工号</th>
							<th class="center" style="width: 8%;">联系电话</th>
							<th class="center" style="width: 8%;">手机号</th>
							<th class="center" style="width: 8%;">邮箱</th>
							<th data-field="id" data-formatter="operateFormatter">操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script>
	//初始化bootstraptable
	var bt1 = bootStrapTable.initTable("#table", '${ctx}/sysUser/sysUserListAjax');
	//格式化操作按钮
	function operateFormatter(value, row, index) {
		var html =  '<a class="remove" href="javascript:void(0)" onclick="bt1.remove(\'${ctx}/test/delete\','+ value + ')" title="Remove"><i class="glyphicon glyphicon-remove"></i>' + '</a>' ;
		return [ html ];
	}

	var scripts = [ null, null ]
	$('.page-content-area').ace_ajax('loadScripts', scripts, function() {
		//查询按钮
		$("#select").on("click", function() {
			bt1.search("#searchForm")
		})
	});
	
</script>
