<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../util/tlds.jsp"%>
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal" role="form" id="searchForm" onsubmit="return false;">
			<!-- #section:elements.form -->
			<div class="form-group col-sm-4">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1">字典名称</label>
				<div class="col-sm-9">
					<input type="text" id="name" name="name" placeholder="字典名称" class="col-xs-10 ">
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
		
		<div class="col-sm-4">
							<a class="btn  btn-success btn-app" type="button" href="#settingsDict/toAdd">
					<i class="ui-icon ace-icon fa fa-plus center bigger-110 "></i>增加
				</a>
 				<button class="btn btn-app btn-info" type="button"  onclick="expand(this)">
					<i class="ui-icon ace-icon fa fa-plus center bigger-110 "></i><span>展开</span>
				</button>
			</div>
			<div class="clearfix"></div>
	<!-- /.col -->
</div>
<div class="row">
	<div class="col-xs-12">
		<table id="table">
			<thead>
				<tr>
							<th data-field="id"  data-align="center" data-width="20"   data-formatter="togleFormat">层级</th>
							<!-- <th data-field='state' data-align="center" data-width="20" data-formatter="createIndex">序号</th> -->
							<th data-field="name"  data-align="center"  data-sortable="true">字典名称</th>
							<th data-field="value"  data-align="center"  data-sortable="true">字典值</th>
							<th data-field="description"  data-align="center"  data-sortable="true">字典描述</th>
							<th data-field="updateTime" data-align="center"  data-sortable="true"  data-formatter='bootStrapTable.formatDate'>创建日期</th>
							<th data-field="id" data-align="center"  data-width="80"  data-formatter="operateFormatter">操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script>
function detailFormatter(index, row) {
    var html = [];
    $.each(row, function (key, value) {
        html.push('<p><b>' + key + ':</b> ' + value + '</p>');
    });
    return html.join('');
}

	function operateFormatter(value, row, index) {
		var html = "";
		if(row.readonly !=1){
			html += '<a class="green tooltip-info" name="update_op" href="#settingsDict/toEdit?id='+row.id+'" data-rel="tooltip" data-placement="bottom" title="编辑"><i class="ace-icon fa fa-pencil bigger-130"></i></a>'
		}
		return [ html ];
	}
	function togleFormat(value, row, index){
		var html =  '<a class="blue togglebtn" href="javascript:void(0)" onclick="togle(this,'+value+')" title=""><i class="ace-icon fa fa-plus bigger-130"></i>' + '</a>' ;
		return [ html ];
	}
	
 	function togle(btn,id){
		if($(btn).children("i").hasClass("fa-plus")){
			loadData('${ctx}/settingsDict/loadChildren', {parentId:id}, function(data) {
				itemAllAttr(data);
				var html  = "";
				for(var i=0; i<data.length; i++){
					if(data[i].readonly != 1){
						html += '<tr class="data-item row_2" parentId="'+id+'"><td align="center" ></td><td align="center">'+data[i].name+'</td><td align="center">'+data[i].value+'</td><td align="center">'+data[i].description+'</td><td align="center">'+dateUtil.dateToStr(dateUtil.longToDate(data[i].updateTime),"yyyy-MM-dd")+'</td><td><div class="action-buttons">'+
						 '<a class="green tooltip-info" name="update_op" href="#settingsDict/toEdit?id='+data[i].id+'" data-rel="tooltip" data-placement="bottom" title="编辑"><i class="ace-icon fa fa-pencil bigger-130"></i></a>'+
						'<a class="red" href="javascript:void(0)" onclick="bt1.remove(\'${ctx}/settingsDict/delete\','+ data[i].id + ')" title="删除"><i class="ace-icon fa fa-trash-o bigger-130"></i></a></div></td></tr>'
					}else{
						html += '<tr class="data-item row_2" parentId="'+id+'"><td align="center" ></td><td align="center">'+data[i].name+'</td><td align="center">'+data[i].value+'</td><td align="center">'+data[i].description+'</td><td align="center">'+dateUtil.dateToStr(dateUtil.longToDate(data[i].updateTime),"yyyy-MM-dd")+'</td><td><div class="action-buttons">'+
						'</div></td></tr>'
					}
				}
				$(btn).parent().parent().after(html);
				$(btn).children("i").removeClass("fa-plus");
				$(btn).children("i").addClass("fa-minus");
			},false);
		}else{
			$(btn).children("i").removeClass("fa-minus");
			$(btn).children("i").addClass("fa-plus");
			$("tr[parentId="+id+"]").remove();
		}
	} 
 	
 	function expand(btn){
 		if($(btn).children(":eq(0)").hasClass("fa-minus")){//减号
 			$(btn).children(":eq(0)").removeClass("fa-minus");
 			$(btn).children(":eq(0)").addClass("fa-plus");
 			$(btn).children(":eq(1)").text("展开");
 			$(".togglebtn").children().removeClass("fa-plus");
 			$(".togglebtn").children().addClass("fa-minus");
 		}else{
 			$(btn).children(":eq(0)").removeClass("fa-plus");
 			$(btn).children(":eq(0)").addClass("fa-minus");
 			$(btn).children(":eq(1)").text("折叠");
 			$(".togglebtn").children().removeClass("fa-minus");
 			$(".togglebtn").children().addClass("fa-plus");
 		}
 		$(".togglebtn").trigger("click");//触发click事件
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
		
		if(ids.length==0){
			bootbox.alert("请先选择一条要删除的数据！");
			return;
		}
		bt1.remove('${ctx}/role/delete',ids);
	}
	
	var bt1 = bootStrapTable.initTable("#table", '${ctx}/settingsDict/getList',{
		sortName:"sort",
		sortOrder:"asc"
});//id正序查询
	var scripts = [ null, null ]
	$('.page-content-area').ace_ajax('loadScripts', scripts, function() {
	});
</script>
