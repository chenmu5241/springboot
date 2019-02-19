<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../util/tlds.jsp"%>
<div class="row">
	<div class="col-xs-12" id="content">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal" role="form"  id="form" method="post" action="hhah">
			<input type="hidden" name="id" value="${dict.id }">
			<div class="form-group col-xs-6">
				<label class="col-sm-2 control-label no-padding-right" for="form-field-1">选择上级</label>
				<div class="col-sm-10">
					<select name="parentId"  class="col-xs-8"  style="padding:0">
						<c:forEach items="${settingsDicts }" var="settingsDict">
							<option value="${settingsDict.id }"  <c:if test="${dict.parentId==settingsDict.id }">selected="selected"</c:if>>${settingsDict.name }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<!-- #section:elements.form -->
			<div class="form-group col-xs-6">
				<label class="col-sm-2 control-label no-padding-right" for="form-field-1">字典名称<span class="red">*</span></label>
				<div class="col-sm-10">
					<input type="text"  placeholder="字典名称" name="name" value="${dict.name }" data-rule="required"  class="col-xs-8" />
				</div>
			</div>
			<div class="form-group col-xs-6">
				<label class="col-sm-2 control-label no-padding-right" for="form-field-1">字典值<span class="red">*</span></label>
				<div class="col-sm-10">
					<input type="text" name="value"  placeholder="字典值" value="${dict.value }" data-rule="required"  class="col-xs-8" />
				</div>
			</div>
			<div class="form-group col-xs-6">
				<label class="col-sm-2 control-label no-padding-right" for="form-field-1">排序<span class="red">*</span></label>
				<div class="col-sm-10">
					<input type="text" name="sort"  placeholder="排序"  value="${dict.sort }"  data-rule="required;integer[+0]"  class="col-xs-8" />
				</div>
			</div>
			<div class="form-group col-xs-6">
				<label class="col-sm-2 control-label no-padding-right" for="form-field-1">描述信息</label>
				<div class="col-sm-10">
					<input type="text" name="description"  value="${dict.description }"  placeholder="描述信息"  class="col-xs-8" />
				</div>
			</div>
<%-- 			<div class="form-group col-xs-6">
				<label class="col-sm-2 control-label no-padding-right" for="form-field-1">是否只读</label>
				<div class="col-sm-10">
					<select name="readonly"  class="col-xs-8"  style="padding:0">
						<option value="0"   <c:if test="${dict.readonly==0 }">selected="selected"</c:if>>否</option>
						<option value="1"   <c:if test="${dict.readonly==1 }">selected="selected"</c:if>>是</option>
					</select>
				</div>
			</div> --%>
			<div class="col-xs-12">
			<div class="space-20"></div>	
				<a id="btn_submit" onclick="submit()" class="btn  btn-info no-border" type="button"> <i class="ace-icon fa fa-check"></i>确认</a> 
				<a href="javascript:history.go(-1)" class="btn  btn-danger no-border" data-dismiss="modal" style="margin-left: 0px;"> 
				<i class="ace-icon fa fa-times"></i> 取消
				</a>
			</div>
		</form>
	</div>
	<!-- /.col -->
</div>
<!-- /.row -->
<script>
appendBreadcrumb("#settingsDict/toList","编辑");

function submit(){
	if(!$("form").isValid()){
		return;
	}
	bootbox.confirm("确定要修改吗?",function(r){
		if(r){
			$.ajax({
				type : "post",
				cache : false,
				async : true,
				dataType : "json",
				url : '${ctx}/settingsDict/update',
				data : $("form").serialize(),
				success : function(result) {
					if (result.success) {
						bootbox.alert("修改成功",function(){
							location.href = "#settingsDict/toList";
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
