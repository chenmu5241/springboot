<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.activiti.engine.repository.ProcessDefinition,java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<ProcessDefinition> processDefinitions = (List<ProcessDefinition>)request.getAttribute("processDefinition");
%>
<html>
<head>
<title>部署管理</title>
<base href="<%=basePath%>">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script src="<%=basePath%>js\common\jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" >
 $(function(){
	 //分页处理起始位置
	 var firstResult = '<%=request.getParameter("firstResult")%>' == "null" ? 0 : '<%=request.getParameter("firstResult")%>' ;
	 var maxResults = '<%=request.getParameter("maxResults")%>' == "null" ? 0 : '<%=request.getParameter("maxResults")%>' ;
	 $("").val(firstResult);
	 
 })
</script>
</head>
<body>
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">

		</table>
		<hr>
		<br/>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
		    <td height="30">
		   <table width="100%" border="0" cellspacing="0" cellpadding="0">
		      <tr>
		        <td height="24" bgcolor="gray"><table width="100%" border="0" cellspacing="0" cellpadding="0">
		          <tr>
		            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
		              <tr>
		                <td width="94%" valign="bottom"><span class="STYLE1">流程定义信息列表</span></td>
		              </tr>
		            </table></td>
		            <td><div align="right"><span class="STYLE1">
		              </span></div></td>
		          </tr>
		        </table></td>
		      </tr>
		    </table></td>
		  </tr>
		  <tr></tr>
		  <tr>
		    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" onmouseover="changeto()"  onmouseout="changeback()">
		      <tr>
		        <td width="12%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">ID</span></div></td>
		        <td width="18%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">流程名称</span></div></td>
		        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">版本</span></div></td>
		        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">流程图</span></div></td>
		        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">xml文件</span></div></td>
		        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">操作</span></div></td>
		      </tr>
		 	 <c:forEach var="processDefinition" items="${processDefinitionList}" varStatus="status"   step="1">  
			     	<tr>
				        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center">${processDefinition.id}</div></td>
				        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${processDefinition.name}</div></td>
				        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${processDefinition.version}</div></td>
				        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><a href="flow/findImage.do?pdid=${processDefinition.id}" target="blank">查看</a></div></td>
				        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><a href="flow/findXml.do?pdid=${processDefinition.id}" target="blank">查看</a></div></td>
				        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><a href="flow/deleteDeployment.do?id=${processDefinition.deploymentId}">删除</a></div></td>
				    </tr>   
			</c:forEach> 
		    </table></td>
		  </tr>
	</table>
	<%-- 	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
		    <td height="30">
		   <table width="100%" border="0" cellspacing="0" cellpadding="0">
		      <tr>
		        <td height="24" bgcolor="gray"><table width="100%" border="0" cellspacing="0" cellpadding="0">
		          <tr>
		            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
		              <tr>
		                <td width="94%" valign="bottom"><span class="STYLE1">流程定义信息列表</span></td>
		              </tr>
		            </table></td>
		            <td><div align="right"><span class="STYLE1">
		              </span></div></td>
		          </tr>
		        </table></td>
		      </tr>
		    </table></td>
		  </tr>
		  <tr></tr>
		  <tr>
		    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" onmouseover="changeto()"  onmouseout="changeback()">
		      <tr>
		        <td width="12%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">ID</span></div></td>
		        <td width="18%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">部署名称</span></div></td>
		        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">部署时间</span></div></td>
		        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">流程图</span></div></td>
		        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">xml文件</span></div></td>
		        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">操作</span></div></td>
		      </tr>
		 	 <c:forEach var="deployment" items="${deploymentList}" varStatus="status"   step="1">  
			     	<tr>
				        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center">${deployment.id}</td>
				        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${deployment.name}</div></td>
				        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${deployment.deploymentTime.toLocaleString()}</div></td>
				        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><a href="flow/findImage.do?id=${deployment.id}" target="blank">查看</a></div></td>
				        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><a href="flow/findXml.do?id=${deployment.id}" target="blank">查看</a></div></td>
				        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><a href="flow/deleteDeployment.do?id=${deployment.id}">删除</a></div></td>
					 	</div></td>
				    </tr>   
			</c:forEach> 
		    </table></td>
		  </tr>
	</table> --%>
	<hr>
	<br/>
	<!-- 发布流程 -->
	<form action="workflowAction_newdeploy.action" enctype="multipart/form-data" method="POST">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
		    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
		      <tr>
		        <td height="24" bgcolor="gray"><table width="100%" border="0" cellspacing="0" cellpadding="0">
		          <tr>
		            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
		              <tr>
		                <td width="94%" valign="bottom"><span class="STYLE1">部署流程定义</span></td>
		              </tr>
		            </table></td>
		            <td><div align="right"><span class="STYLE1">
		              </span></div></td>
		          </tr>
		        </table></td>
		      </tr>
		    </table></td>
		  </tr>
	</table>
	</form>
	<form action="flow/deployment.do" enctype="multipart/form-data" method="post">
		<table>
			  <tr>
		    <td>
		    	<div align="left" class="STYLE21">
		    		<input type="hidden" name="firstResult" id="firstResult" value="${firstResult }">
		    		<input type="hidden" name="maxResults" id="maxResults" value="${maxResults }">
					流程文件：<input type="file" name="file">
					<!-- <input type="file" name="filename" style="display:none" onchange="this.form.$filename.value=this.value" /><input type="text" name="$filename" /> <input type="button" value="选择" onclick="this.form.filename.click()" /> -->
		    	<br/>
					<input type="submit" value="上传流程" class="button_ok"/>
				</div>
		    </td>
		  </tr>
		  </table>
	</form>
</body>
</html>