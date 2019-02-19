<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../util/tlds.jsp"%>
<div class="row">
	<div class="col-xs-12" id="contentc">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal" role="form"  id="form" method="post" action="hhah">
			<input type="hidden" name="id" v-model="id">
			<!-- #section:elements.form -->
			<div class="form-group col-xs-6">
				<label class="col-sm-2 control-label no-padding-right" for="form-field-1">账号<span class="red">*</span></label>
				<div class="col-sm-10">
					<input type="text"  placeholder="名称" readonly="true"  name="username"  v-model="username" data-rule="required"  class="col-xs-8" />
				</div>
			</div>
			<div class="form-group col-xs-6">
				<label class="col-sm-2 control-label no-padding-right" for="form-field-1">密码</label>
				<div class="col-sm-10">
					<input type="text" name="password"  placeholder="密码"  class="col-xs-8" />
				</div>
			</div>
			<div class="form-group col-xs-6">
				<label class="col-sm-2 control-label no-padding-right" for="form-field-1">选择角色<span class="red">*</span></label>
				<div class="col-sm-10">
					<select name="roleids"  class="col-xs-8"  v-model="roleId" style="padding:0" data-rule="角色:required">
						<option value="">请选择</option>
						<c:forEach items="${sysRoles }" var="role">
							<option value="${role.id }">${role.name }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="col-xs-12">
			<div class="space-20"></div>	
				<a id="btn_submit" onclick="submit()" class="btn btn-app btn-info no-border" type="button"> <i class="ace-icon fa fa-check"></i>确认</a> 
				<a href="javascript:history.go(-1)" class="btn btn-app btn-danger no-border" data-dismiss="modal" style="margin-left: 0px;"> 
				<i class="ace-icon fa fa-times"></i> 取消
				</a>
			</div>
		</form>
	</div>
	<!-- /.col -->
</div>
<!-- /.row -->
<script>
appendBreadcrumb("#account/toList","编辑");

function submit(){
	if(!$("form").isValid()){
		return;
	}
	bootbox.confirm("确定要修改吗?",function(f){
		if(f){
			$.ajax({
				type : "post",
				cache : false,
				async : true,
				dataType : "json",
				url : '${ctx}/account/update',
				data : $("form").serialize(),
				success : function(result) {
					if (result.success) {
						bootbox.alert("修改成功",function(r){
								location.href = "#account/toList";
						});
					} else {
						bootbox.alert(result.message);
					}
				}
			})
		}
	})
}
	var scripts = [null ]
	$('.page-content-area').ace_ajax('loadScripts', scripts, function() {
		loadData('${ctx}/account/loadData',{id:'<%=request.getParameter("id")%>'}, function(data) {
 				if(data.roles.length >0){
					data.roleId = data.roles[0].id;
				}else{
					data.roleId = "";
				} 
				var myVue = new Vue({
					el : '#contentc',
					data : data
				})
				
				//var roles = data.roles;
				//事件在此处绑定
/* 				for(var i=0; i<roles.length; i++){
					$('[name="roleids"]').val(roles[i].id);
				} */
				
		});
	}); 
</script>
