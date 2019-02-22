<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="./util/tlds.jsp" %>
<%--欢迎登录${account.username }--%>
欢迎来到home页面<br>
<spring:message code="welcome" ></spring:message>
<script>
	$("#breadcrumb").children(":gt(0)").remove();
</script>