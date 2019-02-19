<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../util/tlds.jsp"%>
<div class="row">
	<div class="col-xs-12" id="contentc">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal" role="form" onsubmit="return false">
			<input type="hidden" name="id" v-model="id">
			<!-- #section:elements.form -->
			<div class="form-group col-xs-6">
				<label class="col-sm-2 control-label no-padding-right" for="form-field-1">配置名称<span class="red">*</span></label>
				<div class="col-sm-10">
					<input type="text" readonly="readonly"  placeholder="配置名称" name="keyName"  v-model="keyName" data-rule="required;"  class="col-xs-8" />
				</div>
			</div>
			<div class="form-group col-xs-6">
				<label class="col-sm-2 control-label no-padding-right" for="form-field-1">配置值<span class="red">*</span></label>
				<div class="col-sm-10">
					<input type="text" name="keyValue" v-model="keyValue"  placeholder="配置值" data-rule="required"  class="col-xs-8" />
				</div>
			</div>
			<div class="form-group col-xs-6">
				<label class="col-sm-2 control-label no-padding-right" for="form-field-1">是否只读</label>
				<div class="col-sm-10">
					<select name="rwValue"  class="col-xs-8" v-model=rwValue  style="padding:0">
						<option value="10" >只读</option>
						<option value="11">读写</option>
					</select>
				</div>
			</div>
			<div class="form-group col-xs-6">
				<label class="col-sm-2 control-label no-padding-right" for="form-field-1">配置描述</label>
				<div class="col-sm-10">
					<input type="text" name="description" v-model="description" placeholder="配置描述"  class="col-xs-8" />
				</div>
			</div>
			<div class="col-xs-12">
			<div class="space-20"></div>	
				<button onclick="submitForm()" id="btn_submit"  class="btn btn-app btn-info no-border" type="submit"> <i class="ace-icon fa fa-check"></i>确认</button> 
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
appendBreadcrumb("#settingsConfig/toList","编辑");

function submitForm(){
	if(!$("form").isValid()){
		return false;
	}
	bootbox.confirm("确定要修改吗?",function(f){
		if(f){
			$.ajax({
				type : "post",
				cache : false,
				async : true,
				dataType : "json",
				url : '${ctx}/settingsConfig/update',
				data : $("form").serialize(),
				success : function(result) {
					if (result.success) {
						bootbox.alert("修改成功",function(r){
								location.href = "#settingsConfig/toList";
						});
					} else {
						bootbox.alert(result.message);
					}
				}
			})
		}
	})
}
	var scripts = [null]
	$('.page-content-area').ace_ajax('loadScripts', scripts, function() {
		loadData('${ctx}/settingsConfig/loadData',{id:'<%=request.getParameter("id")%>'}, function(data) {
				var myVue = new Vue({
					el : '#contentc',
					data : data
				})
		});
	}); 
</script>
