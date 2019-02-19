<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../util/tlds.jsp"%>
<div class="row" id="app">
	<span v-text="data.message"></span><br> <input v-model="data.message"><br>
	<button onclick="changeText()">改成大家好</button>
</div>
<script>
	var result = {
		data : {
			message : "hello vue!"
		},
		success : true,
		mssage : "查询成功"
	}

	var myVue = new Vue({
		el : '#app',
		data : result
	})

	result.data.message = "你好";

	function changeText() {
		result.data.message = "大家好";
	}
</script>
