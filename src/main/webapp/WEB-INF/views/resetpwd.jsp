<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="./util/tlds.jsp"%>
<div class="row">
	<div class="col-xs-12" id="content">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal" role="form"  id="form" method="post" >
			<input type="hidden" name="id" value="">
			<!-- #section:elements.form -->
			<div class="form-group col-xs-12">
				<label class="col-sm-1 control-label no-padding-right" for="form-field-1">新密码</label>
				<div class="col-sm-5">
					<input type="text"  placeholder="新密码" name="password" value="" data-rule="密码: required;password;" class="col-xs-8" />
				</div>
			</div>
			<div class="form-group col-xs-12">
				<label class="col-sm-1 control-label no-padding-right" for="form-field-1">确认密码</label>
				<div class="col-sm-5">
					<input type="text"  placeholder="新密码" name="againPwd" value=""  data-rule="确认密码: required;match(password);"  class="col-xs-8" />
				</div>
			</div>
			<div class="col-xs-12">
			<div class="space-20"></div>	
				<a id="btn_submit" onclick="submit()" class="btn btn-sm btn-info no-border" type="button"> <i class="ace-icon fa fa-check"></i>确认</a> 
				<a href="javascript:history.back()" class="btn btn-sm btn-danger no-border" data-dismiss="modal" style="margin-left: 0px;"> 
				<i class="ace-icon fa fa-times"></i> 取消
				</a>
			</div>
		</form>
	</div>
	<!-- /.col -->
</div>
<!-- /.row -->
<script>
appendBreadcrumb("#account/index","修改密码");

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
				url : '${ctx}/account/resetpwd',
				data : $("form").serialize(),
				success : function(result) {
					console.log(JSON.stringify(result))
					if (result.success) {
						bootbox.alert("密码修改成功",function(){
							history.back();
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
