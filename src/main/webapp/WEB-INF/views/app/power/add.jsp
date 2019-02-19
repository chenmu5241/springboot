<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../util/tlds.jsp"%>
<div class="row">
	<div class="col-xs-12" id="content">
		<!-- PAGE CONTENT BEGINS -->
		
		<form class="form-horizontal" role="form"  id="form" method="post" action="">
			<input type="hidden" name="id" value="">
			<!-- #section:elements.form -->
			<div class="form-group col-xs-6">
				<label class="col-sm-2 control-label no-padding-right" for="form-field-1">权限名称<span class="red">*</span></label>
				<div class="col-sm-10">
					<input type="text"  placeholder="权限名称" name="name" value=""   data-rule="required;remote[${ctx}/power/checkPower]"   class="col-xs-8" />
				</div>
			</div>
			<div class="form-group col-xs-6">
				<label class="col-sm-2 control-label no-padding-right" for="form-field-1">权限标识<span class="red">*</span></label>
				<div class="col-sm-10">
					<input type="text" name="flag"  placeholder="权限标识"  data-rule="required;remote[${ctx}/power/checkPower]"   class="col-xs-8" />
				</div>
			</div>
			<div class="form-group col-xs-6">
				<label class="col-sm-2 control-label no-padding-right" for="form-field-1">选择上级</label>
				<div class="col-sm-10">
					<select name="parentId"  class="col-xs-8"  style="padding:0">
						<option value="-1">请选择</option>
							<c:forEach items="${powers }" var="power">
								<option value="${power.id }"  layer="${power.layer }">${power.name }</option>
							</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group col-xs-6">
				<label class="col-sm-2 control-label no-padding-right" for="form-field-1">是否菜单</label>
				<div class="col-sm-10">
					<select name="isShow"  class="col-xs-8"  style="padding:0">
							<option value="0">否</option>
							<option value="1">是</option>
					</select>
				</div>
			</div>
			<div class="form-group col-xs-6">
				<label class="col-sm-2 control-label no-padding-right" for="form-field-1">图标</label>
				<div class="col-sm-10">
					<input type="text" name="icon"  placeholder="图标"  value="${power.icon }"  class="col-xs-8" />
				</div>
			</div>
			<div class="form-group col-xs-6">
				<label class="col-sm-2 control-label no-padding-right" for="form-field-1">权限url</label>
				<div class="col-sm-10">
					<input type="text" name="url"  placeholder="权限url"  value="${power.url }"  class="col-xs-8" />
				</div>
			</div>
<%-- 			<div class="form-group col-xs-6">
				<label class="col-sm-2 control-label no-padding-right" for="form-field-1">排序</label>
				<div class="col-sm-10">
					<input type="text" name="sort"  placeholder="排序"  value="${power.sort }"  class="col-xs-8" />
				</div>
			</div> --%>
			<div class="col-xs-12">
			<div class="space-20"></div>	
				<a id="btn_submit" onclick="submit()" class="btn btn-app btn-info no-border" type="button"> <i class="ace-icon fa fa-check"></i>确认</a> 
				<a href="#power/toList" class="btn btn-app btn-danger no-border" data-dismiss="modal" style="margin-left: 0px;"> 
				<i class="ace-icon fa fa-times"></i> 取消
				</a>
			</div>
		</form>
	</div>
	<!-- /.col -->
</div>
<!-- /.row -->
<script>
appendBreadcrumb("#power/toList","新增");

if('<%=request.getParameter("parentId") %>' != "null"){
	$("[name='parentId']").val('<%=request.getParameter("parentId") %>');
}

function submit(){
	var layer = $('[name="parentId"]').children(":checked").attr("layer");
	if(layer==3 && $('[name="isShow"]').val()==1){
		bootbox.alert("菜单最多允许三级，请重新选择上级菜单!");
		return false;
	}
	
	if(!$("form").isValid()){
		return;
	}
	
	bootbox.confirm("增加后权限名称和标识无法修改,确定要增加吗?",function(f){
		if(f){
			$.ajax({
				type : "post",
				cache : false,
				async : true,
				dataType : "json",
				url : '${ctx}/power/insert',
				data : $("form").serialize(),
				success : function(result) {
					if (result.success) {
						bootbox.alert("添加成功",function(){
							location.href = "#power/toList";
						});
					} else {
						bootbox.alert(result.message);
					}
				}
			})
		}
	})
}

	var scripts = [ null, null ]
	$('.page-content-area').ace_ajax('loadScripts', scripts, function() {
		
	});
</script>
