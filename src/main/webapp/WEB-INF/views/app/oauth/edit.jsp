<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../util/tlds.jsp"%>
<div class="row">
	<div class="col-xs-12" id="contentb">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal" role="form"  id="form" method="post" action="hhah">
			<input type="hidden" name="id"  v-model="id">
			<!-- #section:elements.form -->
			<div class="form-group col-xs-6">
				<label class="col-sm-2 control-label no-padding-right" for="form-field-1">类型<span class="red">*</span></label>
				<div class="col-sm-10">
					<input type="text"  placeholder="类型标志如：baidu,qq,weixin..." name="oauthType" v-model="oauthType" data-rule="required;"  class="col-xs-8" />
				</div>
			</div>
			<div class="form-group col-xs-6">
				<label class="col-sm-2 control-label no-padding-right" for="form-field-1">基本url<span class="red">*</span></label>
				<div class="col-sm-10">
					<input type="text"  placeholder="基本url" name="baseUrl" v-model="baseUrl" data-rule="required;"  class="col-xs-8" />
				</div>
			</div>
			<div class="form-group col-xs-6">
				<label class="col-sm-2 control-label no-padding-right" for="form-field-1">授权url<span class="red">*</span></label>
				<div class="col-sm-10">
					<input type="text"  placeholder="授权url" name="oauthUrl" v-model="oauthUrl" data-rule="required;"  class="col-xs-8" />
				</div>
			</div>
			<div class="form-group col-xs-6">
				<label class="col-sm-2 control-label no-padding-right" for="form-field-1">tokenUrl<span class="red">*</span></label>
				<div class="col-sm-10">
					<input type="text"  placeholder="tokenUrl" name="tokenUrl" v-model="tokenUrl" data-rule="required;"  class="col-xs-8" />
				</div>
			</div>
			<div class="form-group col-xs-6">
				<label class="col-sm-2 control-label no-padding-right" for="form-field-1">客户端id<span class="red">*</span></label>
				<div class="col-sm-10">
					<input type="text"  placeholder="tokenUrl" name="clientId" v-model="clientId" data-rule="required;"  class="col-xs-8" />
				</div>
			</div>
			<div class="form-group col-xs-6">
				<label class="col-sm-2 control-label no-padding-right" for="form-field-1">授权成功url<span class="red">*</span></label>
				<div class="col-sm-10">
					<input type="text"  placeholder="授权成功url" name="redirectUri" v-model="redirectUri" data-rule="required;"  class="col-xs-8" />
				</div>
			</div>
			<div class="form-group col-xs-6">
				<label class="col-sm-2 control-label no-padding-right" for="form-field-1">客户端secret<span class="red">*</span></label>
				<div class="col-sm-10">
					<input type="text"  placeholder="客户端secret" name="clientSecret" v-model="clientSecret" data-rule="required;"  class="col-xs-8" />
				</div>
			</div>
			<div class="col-xs-12">
			<div class="space-20"></div>	
				<a id="btn_submit" onclick="submit()" class="btn btn-app btn-info no-border" type="button"> <i class="ace-icon fa fa-check"></i>确认</a> 
				<a href="javascript:history.go(-1)" class="btn btn-app btn-danger no-border" data-dismiss="modal" style="margin-left: 0px;"> 
				<i class="ace-icon fa fa-times"></i> 取消
				</a>
			</div>
 </script>
	</div>
	<!-- /.col -->
</div>
<!-- /.row -->
<script>
appendBreadcrumb("#","编辑");

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
				url : '${ctx}/oauth/update',
				data : $("form").serialize(),
				success : function(result) {
					if (result.success) {
						bootbox.alert("修改成功",function(r){
								location.href = "#oauth/toList";
						});
					} else {
						bootbox.alert(result.message);
					}
				}
			})
		}
	})
}

var myVue ;
	var scripts = [null, null ]
	$('.page-content-area').ace_ajax('loadScripts', scripts, function() {
		loadData('${ctx}/oauth/loadData',{id:'<%=request.getParameter("id")%>'}, function(data) {
			myVue = new Vue({el : '#contentb',data : data})
		});
	});
</script>
