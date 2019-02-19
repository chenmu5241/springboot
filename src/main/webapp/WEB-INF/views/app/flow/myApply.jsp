<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@ page import="org.activiti.engine.repository.ProcessDefinition,java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>test</title>
</head>
<body>
		
		<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" >
		      <tr>
		        <td width="12%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">流程名称</span></div></td>
		        <td width="12%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">流程实例id</span></div></td>
		        <td width="12%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">申请时间</span></div></td>
		        <td width="18%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">结束时间</span></div></td>
		      </tr>
				<c:forEach var="historicProcessInstance" items="${historyList}" varStatus="status"   step="1">  
		      		<tr>
				        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${historicProcessInstance.name }</div></td>
				        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${historicProcessInstance.processDefinitionId }</div></td>
				        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center"><fmt:formatDate value="${historicProcessInstance.startTime }"  pattern="yyyy-MM-dd HH:mm:ss"/></div></td>
				        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${historicProcessInstance.endTime }</div></td>
				    </tr> 
			</c:forEach>
		    </table>
</body>
</html>