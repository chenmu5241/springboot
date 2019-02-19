<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../util/tlds.jsp"%>
<html>

<head>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name=Generator content="Microsoft Word 12 (filtered)">
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:宋体;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:微软雅黑;
	panose-1:2 11 5 3 2 2 4 2 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
@font-face
	{font-family:simsun;
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Microsoft Yahei";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"\@微软雅黑";
	panose-1:2 11 5 3 2 2 4 2 2 4;}
@font-face
	{font-family:"\@宋体";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:0cm;
	layout-grid-mode:char;
	font-size:11.0pt;
	font-family:"Tahoma","sans-serif";}
h2
	{mso-style-link:"标题 2 Char";
	margin-right:0cm;
	margin-left:0cm;
	font-size:18.0pt;
	font-family:宋体;
	font-weight:bold;}
p.MsoHeader, li.MsoHeader, div.MsoHeader
	{mso-style-link:"页眉 Char";
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:0cm;
	text-align:center;
	layout-grid-mode:char;
	border:none;
	padding:0cm;
	font-size:9.0pt;
	font-family:"Tahoma","sans-serif";}
p.MsoFooter, li.MsoFooter, div.MsoFooter
	{mso-style-link:"页脚 Char";
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:0cm;
	layout-grid-mode:char;
	font-size:9.0pt;
	font-family:"Tahoma","sans-serif";}
p.MsoDocumentMap, li.MsoDocumentMap, div.MsoDocumentMap
	{mso-style-link:"文档结构图 Char";
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:0cm;
	layout-grid-mode:char;
	font-size:9.0pt;
	font-family:宋体;}
p
	{margin-right:0cm;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:宋体;}
code
	{font-family:宋体;}
pre
	{mso-style-link:"HTML 预设格式 Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:宋体;}
span.Char
	{mso-style-name:"页眉 Char";
	mso-style-link:页眉;
	font-family:"Tahoma","sans-serif";}
span.Char0
	{mso-style-name:"页脚 Char";
	mso-style-link:页脚;
	font-family:"Tahoma","sans-serif";}
span.2Char
	{mso-style-name:"标题 2 Char";
	mso-style-link:"标题 2";
	font-family:宋体;
	font-weight:bold;}
span.apple-converted-space
	{mso-style-name:apple-converted-space;}
span.HTMLChar
	{mso-style-name:"HTML 预设格式 Char";
	mso-style-link:"HTML 预设格式";
	font-family:宋体;}
span.tag
	{mso-style-name:tag;}
span.attribute
	{mso-style-name:attribute;}
span.string
	{mso-style-name:string;}
span.data
	{mso-style-name:data;}
span.Char1
	{mso-style-name:"文档结构图 Char";
	mso-style-link:文档结构图;
	font-family:宋体;}
span.comment
	{mso-style-name:comment;}
span.webkit-html-attribute-name
	{mso-style-name:webkit-html-attribute-name;}
span.webkit-html-attribute-value
	{mso-style-name:webkit-html-attribute-value;}
.MsoChpDefault
	{font-size:11.0pt;}
.MsoPapDefault
	{margin-bottom:10.0pt;
	line-height:11.0pt;}
 /* Page Definitions */
 @page WordSection1
	{size:595.3pt 841.9pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
-->
</style>

</head>

<body lang=ZH-CN>

<div class=WordSection1>

<p class=MsoNormal style='line-height:11.0pt'><span style='font-family:"微软雅黑","sans-serif"'>导入</span><span
lang=EN-US>js</span></p>

<p class=MsoNormal style='line-height:11.0pt'><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#4BACC6'>&lt;script
type=<i>&quot;text/javascript&quot;</i> src=<i>&quot;</i>${ctx }<i>/static/js/jqvalidator/jquery.validator.min.js?local=zh-CN&quot;</i>&gt;&lt;/script&gt;</span></p>

<p class=MsoNormal style='line-height:11.0pt'><span style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif"'>例子</span></p>

<p class=MsoNormal style='line-height:11.0pt'><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#7F007F'>data-rule</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:black'>=</span><i><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#2A00FF'>&quot;required;&quot;</span></i></p>

<p class=MsoNormal style='line-height:11.0pt'><i><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif"'>1</span></i><i><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif"'>，默认提示</span></i></p>

<p class=MsoNormal style='line-height:11.0pt'><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif";color:teal'>&lt;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#3F7F7F'>input</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif"'> <span
style='color:#7F007F'>type</span><span style='color:black'>=</span><i><span
style='color:#2A00FF'>&quot;text&quot;</span></i> <span style='color:#7F007F'>name</span><span
style='color:black'>=</span><i><span style='color:#2A00FF'>&quot;name&quot;</span></i>
<span style='color:#7F007F'>data-rule</span><span style='color:black'>=</span><i><span
style='color:#2A00FF'>&quot;required;&quot;</span></i> <span style='color:teal'>/&gt;</span></span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:teal'>提示</span><span
style='font-size:9.0pt;font-family:"微软雅黑","sans-serif";color:#CC3333;
background:white'>此处不能为空</span></p>

<p class=MsoNormal style='line-height:11.0pt'><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial","sans-serif";background:white'>2</span><span
style='font-size:9.0pt;font-family:"微软雅黑","sans-serif";background:white'>，修改默认提示</span></p>

<p class=MsoNormal style='line-height:11.0pt'><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif";color:teal'>&lt;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#3F7F7F'>input</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif"'> <span
style='color:#7F007F'>type</span><span style='color:black'>=</span><i><span
style='color:#2A00FF'>&quot;text&quot;</span></i> <span style='color:#7F007F'>name</span><span
style='color:black'>=</span><i><span style='color:#2A00FF'>&quot;name&quot;</span></i>
<span style='color:#7F007F'>data-rule</span><span style='color:black'>=</span><i><span
style='color:#2A00FF'>&quot;</span></i></span><i><span style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:#2A00FF'>姓名</span></i><i><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#2A00FF'>:required;&quot;</span></i><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif"'> <span
style='color:teal'>/&gt;</span></span><span style='font-size:10.0pt;font-family:
"微软雅黑","sans-serif";color:teal'>提示</span><i><span style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:red'>姓名</span></i><span style='font-size:
9.0pt;font-family:"微软雅黑","sans-serif";color:red;background:white'>不能为空</span></p>

<p class=MsoNormal style='line-height:11.0pt'><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif";color:teal'>3</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:teal'>，修改默认提示</span></p>

<p class=MsoNormal style='line-height:11.0pt'><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif";color:teal'>&lt;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#3F7F7F'>input</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif"'> <span
style='color:#7F007F'>type</span><span style='color:black'>=</span><i><span
style='color:#2A00FF'>&quot;text&quot;</span></i> <span style='color:#7F007F'>name</span><span
style='color:black'>=</span><i><span style='color:#2A00FF'>&quot;name&quot;</span></i>
<span style='color:#7F007F'>data-rule</span><span style='color:black'>=</span><i><span
style='color:#2A00FF'>&quot; required;&quot; </span></i></span><span
class=data><span lang=EN-US style='font-size:9.0pt;font-family:Consolas;
color:#DD1144;background:white'>data-msg-required</span></span><span
lang=EN-US style='font-size:9.0pt;font-family:Consolas;color:#333333;
background:white'>=</span><span class=string><span lang=EN-US style='font-family:
Consolas;color:#888888;background:white'>&quot;</span></span><span
class=string><span style='font-family:"微软雅黑","sans-serif";color:#888888;
background:white'>姓名必须输入</span></span><span class=string><span lang=EN-US
style='font-family:Consolas;color:#888888;background:white'>&quot;</span></span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif"'> <span
style='color:teal'>/&gt;</span></span><span style='font-size:10.0pt;font-family:
"微软雅黑","sans-serif";color:teal'>提示</span><i><span style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:red'>姓名必须输入</span></i></p>

<p class=MsoNormal style='line-height:11.0pt'><i><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif";color:red'>4</span></i><i><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:red'>，密码和重复密码</span></i></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
both;text-autospace:none'><span lang=EN-US style='font-size:10.0pt;font-family:
"Arial","sans-serif";color:black'>&nbsp;&nbsp;&nbsp; </span><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif";color:teal'>&lt;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#3F7F7F'>input</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif"'> <span
style='color:#7F007F'>name</span><span style='color:black'>=</span><i><span
style='color:#2A00FF'>&quot;password&quot;</span></i> <span style='color:#7F007F'>data-rule</span><span
style='color:black'>=</span><i><span style='color:#2A00FF'>&quot;</span></i></span><i><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#2A00FF'>密码</span></i><i><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#2A00FF'>:
required;password;&quot;</span></i><span lang=EN-US style='font-size:10.0pt;
font-family:"Arial","sans-serif";color:teal'>&gt;&lt;</span><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#3F7F7F'>br</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:teal'>&gt;</span></p>

<p class=MsoNormal style='line-height:11.0pt'><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;
</span><span lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";
color:teal'>&lt;</span><span lang=EN-US style='font-size:10.0pt;font-family:
"Arial","sans-serif";color:#3F7F7F'>input</span><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif"'> <span
style='color:#7F007F'>name</span><span style='color:black'>=</span><i><span
style='color:#2A00FF'>&quot;againPwd&quot;</span></i> <span style='color:#7F007F'>data-rule</span><span
style='color:black'>=</span><i><span style='color:#2A00FF'>&quot;</span></i></span><i><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#2A00FF'>确认密码</span></i><i><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#2A00FF'>:
required;match(password);&quot;</span></i><span lang=EN-US style='font-size:
10.0pt;font-family:"Arial","sans-serif";color:teal'>&gt;</span></p>

<p class=MsoNormal style='line-height:11.0pt'><i><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif";color:red'>5,</span></i><i><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:red'>远程调用实例</span></i></p>

<p class=MsoNormal style='line-height:11.0pt'><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif";color:teal'>&lt;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#3F7F7F'>input</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif"'> <span
style='color:#7F007F'>type</span><span style='color:black'>=</span><i><span
style='color:#2A00FF'>&quot;text&quot;</span></i> <span style='color:#7F007F'>name</span><span
style='color:black'>=</span><i><span style='color:#2A00FF'>&quot;oldpwd&quot;</span></i>
<span style='color:#7F007F'>id</span><span style='color:black'>=</span><i><span
style='color:#2A00FF'>&quot;oldpwd&quot;</span></i> <span style='color:#7F007F'>data-rule</span><span
style='color:black'>=</span><i><span style='color:#2A00FF'>&quot;</span></i></span><i><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#2A00FF'>原密码</span></i><i><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#2A00FF'>:required;remote[</span></i><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:black'>${ctx}</span><i><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#2A00FF'>/account/checkOldPwd]&quot;</span></i><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:teal'>/&gt;
</span><span style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:teal'>请求地址</span><i><span lang=EN-US style='font-size:10.0pt;font-family:
"Arial","sans-serif";color:#2A00FF'>account/checkOldPwd?oldpwd=***</span></i></p>

<p class=MsoNormal style='line-height:11.0pt'><i><span style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:#2A00FF'>要求后台返回的数据格式</span></i></p>

<p class=MsoNormal style='line-height:11.0pt'><span
class=apple-converted-space><span lang=EN-US style='font-size:10.5pt;
color:#777777;background:#F9F9F9'>&nbsp;</span></span><span lang=EN-US
style='font-size:10.5pt;color:#777777;background:#F9F9F9'>{&quot;data&quot;:{&quot;ok&quot;:&quot;</span><span
style='font-size:10.5pt;font-family:"微软雅黑","sans-serif";color:#777777;
background:#F9F9F9'>名字很棒</span><span lang=EN-US style='font-size:10.5pt;
color:#777777;background:#F9F9F9'>!&quot;}} =&gt; </span><span
style='font-size:10.5pt;font-family:"微软雅黑","sans-serif";color:#777777;
background:#F9F9F9'>成功，</span></p>

<p class=MsoNormal style='line-height:11.0pt'><span lang=EN-US
style='font-size:10.5pt;color:#777777;background:#F9F9F9'>&nbsp;{&quot;data&quot;:{&quot;error&quot;:&quot;</span><span
style='font-size:10.5pt;font-family:"微软雅黑","sans-serif";color:#777777;
background:#F9F9F9'>错误消息</span><span lang=EN-US style='font-size:10.5pt;
color:#777777;background:#F9F9F9'>&quot;}}=&gt; </span><span style='font-size:
10.5pt;font-family:"微软雅黑","sans-serif";color:#777777;background:#F9F9F9'>失败</span></p>

<p class=MsoNormal style='line-height:11.0pt'><i><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif";color:red'>&nbsp;</span></i></p>

<p class=MsoNormal style='line-height:11.0pt'><i><span style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:red'>判断表单是否验证通过</span></i></p>

<p class=MsoNormal style='line-height:11.0pt'><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif"'>$(&quot;[name='postCode']&quot;).
isValid()</span><span style='font-size:10.0pt;font-family:"微软雅黑","sans-serif"'>；验证表单域是否验证通过</span></p>

<p class=MsoNormal style='line-height:11.0pt'><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif";color:black'>$(</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#2A00FF'>&quot;#form&quot;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:black'>).isValid();</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>验证</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:black'>form</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>表单是否验证通过</span></p>

<p class=MsoNormal style='line-height:11.0pt'><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif";color:teal'>&nbsp;</span></p>

<p class=MsoNormal style='margin-top:6.0pt;margin-right:0cm;margin-bottom:6.0pt;
margin-left:0cm;line-height:200%;layout-grid-mode:both;background:white'><span
style='font-size:10.5pt;line-height:200%;font-family:宋体;color:#333333'>指定需要忽略验证的元素的</span><span
lang=EN-US style='font-size:10.5pt;line-height:200%;color:#333333'>jQuery</span><span
style='font-size:10.5pt;line-height:200%;font-family:宋体;color:#333333'>选择器，</span><span
lang=EN-US style='font-size:10.5pt;line-height:200%;color:#333333'>Example:</span></p>

<table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0 width=739
 style='width:554.25pt;margin-left:48.0pt;background:white;border-collapse:
 collapse;border:none'>
 <tr>
  <td width=30 valign=top style='width:22.5pt;border:solid #CCCCCC 1.0pt;
  border-right:none;padding:3.75pt 0cm 3.75pt 0cm'>
  <p class=MsoNormal align=right style='margin-bottom:0cm;margin-bottom:.0001pt;
  text-align:right;layout-grid-mode:both'><span lang=EN-US style='font-size:
  12.0pt;font-family:宋体;color:#BBBBBB'>123456789101112</span></p>
  </td>
  <td valign=top style='border:solid #CCCCCC 1.0pt;border-left:solid #E5E5E5 1.0pt;
  padding:3.75pt 0cm 3.75pt 0cm'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
  both'><span lang=EN-US style='font-size:12.0pt;font-family:宋体;color:green'>//</span><span
  style='font-size:12.0pt;font-family:宋体;color:green'>任何不可见的元素，都不作验证</span></p>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
  both'><span lang=EN-US style='font-size:12.0pt;font-family:宋体'>$(<span
  style='color:gray'>'form'</span>).validator({</span></p>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
  both'><span lang=EN-US style='font-size:12.0pt;font-family:宋体'>&nbsp;&nbsp;&nbsp;
  ignore: <span style='color:gray'>':hidden'</span></span></p>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
  both'><span lang=EN-US style='font-size:12.0pt;font-family:宋体'>});</span></p>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
  both'><span lang=EN-US style='font-size:12.0pt;font-family:宋体;color:green'>//id</span><span
  style='font-size:12.0pt;font-family:宋体;color:green'>为<span lang=EN-US>tab2</span>下的所有子元素都不作验证</span></p>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
  both'><span lang=EN-US style='font-size:12.0pt;font-family:宋体'>$(<span
  style='color:gray'>'form'</span>).validator({</span></p>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
  both'><span lang=EN-US style='font-size:12.0pt;font-family:宋体'>&nbsp;&nbsp;&nbsp;
  ignore: <span style='color:gray'>'#tab2'</span></span></p>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
  both'><span lang=EN-US style='font-size:12.0pt;font-family:宋体'>});</span></p>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
  both'><span lang=EN-US style='font-size:12.0pt;font-family:宋体;color:green'>//</span><span
  style='font-size:12.0pt;font-family:宋体;color:green'>动态改变要忽略验证的元素</span></p>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
  both'><span lang=EN-US style='font-size:12.0pt;font-family:宋体'>$(<span
  style='color:gray'>'form'</span>).data(<span style='color:gray'>'validator'</span>).options.ignore
  = <span style='color:gray'>'#tab1'</span>;</span></p>
  </td>
 </tr>
</table>

<p class=MsoNormal style='line-height:11.0pt'><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif";color:teal'>&nbsp;</span></p>

<p class=MsoNormal style='line-height:11.0pt'><span style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:teal'>一，自定义常用验证实例</span></p>

<p class=MsoNormal style='line-height:11.0pt'><i><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#2A00FF'>1</span></i><i><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#2A00FF'>，邮政编码格式</span></i></p>

<p class=MsoNormal style='line-height:11.0pt'><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif";color:teal'>&lt;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#3F7F7F'>input</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif"'> <span
style='color:#7F007F'>type</span><span style='color:black'>=</span><i><span
style='color:#2A00FF'>&quot;text&quot;</span></i> <span style='color:#7F007F'>name</span><span
style='color:black'>=</span><i><span style='color:#2A00FF'>&quot;postCode&quot;</span></i>
<span style='color:#7F007F'>data-rule</span><span style='color:black'>=</span><i><span
style='color:#2A00FF'>&quot;required;post&quot;</span></i> <span
style='color:#7F007F'>data-rule-post</span><span style='color:black'>=</span><i><span
style='color:#2A00FF'>&quot;[/^[1-9][0-9]{5}$/, '</span></i></span><i><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#2A00FF'>邮政编码不正确</span></i><i><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#2A00FF'>']&quot;</span></i><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif"'> <span
style='color:teal'>/&gt;</span></span></p>

<p class=MsoNormal style='line-height:11.0pt'><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif";color:teal'>2</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:teal'>，验证手机</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
13.5pt;layout-grid-mode:both;background:white'><span lang=EN-US
style='font-size:9.0pt;font-family:Consolas;color:#333333'>&lt;</span><span
lang=EN-US style='font-size:9.0pt;font-family:Consolas;color:#881280'>input </span><span
lang=EN-US style='font-size:9.0pt;font-family:Consolas;color:teal'>name</span><span
lang=EN-US style='font-size:9.0pt;font-family:Consolas;color:#333333'>=</span><span
lang=EN-US style='font-size:9.0pt;font-family:Consolas;color:#888888'>&quot;mobile&quot;</span><span
lang=EN-US style='font-size:9.0pt;font-family:Consolas;color:#333333'> </span><span
lang=EN-US style='font-size:9.0pt;font-family:Consolas;color:teal'>placeholder</span><span
lang=EN-US style='font-size:9.0pt;font-family:Consolas;color:#333333'>=</span><span
lang=EN-US style='font-size:9.0pt;font-family:Consolas;color:#888888'>&quot;</span><span
style='font-size:9.0pt;font-family:宋体;color:#888888'>手机号</span><span
lang=EN-US style='font-size:9.0pt;font-family:Consolas;color:#888888'>&quot;</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
13.5pt;layout-grid-mode:both;background:white'><span lang=EN-US
style='font-size:9.0pt;font-family:Consolas;color:#333333'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=EN-US style='font-size:9.0pt;font-family:Consolas;color:#DD1144'>&nbsp;data-rule</span><span
lang=EN-US style='font-size:9.0pt;font-family:Consolas;color:#333333'>=</span><span
lang=EN-US style='font-size:9.0pt;font-family:Consolas;color:#888888'>&quot;required;
mobile&quot;</span><span lang=EN-US style='font-size:9.0pt;font-family:Consolas;
color:#333333'> </span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
13.5pt;layout-grid-mode:both;background:white'><span lang=EN-US
style='font-size:9.0pt;font-family:Consolas;color:#333333'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=EN-US style='font-size:9.0pt;font-family:Consolas;color:#DD1144'>&nbsp;data-rule-mobile</span><span
lang=EN-US style='font-size:9.0pt;font-family:Consolas;color:#333333'>=</span><span
lang=EN-US style='font-size:9.0pt;font-family:Consolas;color:#888888'>&quot;[/^1[3458]\d{9}$/,
'</span><span style='font-size:9.0pt;font-family:宋体;color:#888888'>请检查手机号格式</span><span
lang=EN-US style='font-size:9.0pt;font-family:Consolas;color:#888888'>']&quot;&gt;</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
13.5pt;layout-grid-mode:both;background:white'><span lang=EN-US
style='font-size:9.0pt;font-family:Consolas;color:#888888'>3</span><span
style='font-size:9.0pt;font-family:宋体;color:#888888'>，验证邮箱</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
13.5pt;layout-grid-mode:both;background:white'><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif";color:teal'>&lt;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#3F7F7F'>input</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif"'> <span
style='color:#7F007F'>type</span><span style='color:black'>=</span><i><span
style='color:#2A00FF'>&quot;text&quot;</span></i> <span style='color:#7F007F'>name</span><span
style='color:black'>=</span><i><span style='color:#2A00FF'>&quot;email&quot;</span></i>
<span style='color:#7F007F'>data-rule</span><span style='color:black'>=</span><i><span
style='color:#2A00FF'>&quot;required;email&quot;</span></i> <span
style='color:#7F007F'>data-rule-email</span><span style='color:black'>=</span><i><span
style='color:#2A00FF'>&quot;[/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/i,'</span></i></span><i><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#2A00FF'>邮箱格式不正确</span></i><i><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#2A00FF'>']&quot;</span></i><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:teal'>/&gt;</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
13.5pt;layout-grid-mode:both;background:white'><span lang=EN-US
style='font-size:9.0pt;font-family:Consolas;color:#888888'>3</span><span
style='font-size:9.0pt;font-family:宋体;color:#888888'>，验证固定电话</span></p>

<p class=MsoNormal style='line-height:11.0pt'><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif";color:teal'>&lt;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#3F7F7F'>input</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif"'> <span
style='color:#7F007F'>type</span><span style='color:black'>=</span><i><span
style='color:#2A00FF'>&quot;text&quot;</span></i> <span style='color:#7F007F'>name</span><span
style='color:black'>=</span><i><span style='color:#2A00FF'>&quot;tel&quot;</span></i>
<span style='color:#7F007F'>data-rule</span><span style='color:black'>=</span><i><span
style='color:#2A00FF'>&quot;required;</span></i><span style='color:#7F007F'> tel</span><i><span
style='color:#2A00FF'>&quot;</span></i> <span style='color:#7F007F'>data-rule-tel</span><span
style='color:black'>=</span><i><span style='color:#2A00FF'>&quot;[</span></i></span><span
lang=EN-US style='font-size:10.5pt;font-family:"simsun","serif";color:#323E32;
background:#E1E1E1'>/^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/</span><i><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#2A00FF'>,'</span></i><i><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#2A00FF'>固定电话不正确</span></i><i><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#2A00FF'>(021-3333333)']&quot;</span></i><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:teal'>/&gt;</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
13.5pt;layout-grid-mode:both;background:white'><span lang=EN-US
style='font-size:9.0pt;font-family:Consolas;color:#333333'>4,</span><span
style='font-size:9.0pt;font-family:宋体;color:#333333'>验证必须是正整数</span></p>

<p class=MsoNormal style='line-height:11.0pt'><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif";color:teal'>&lt;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#3F7F7F'>input</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif"'> <span
style='color:#7F007F'>type</span><span style='color:black'>=</span><i><span
style='color:#2A00FF'>&quot;text&quot;</span></i> <span style='color:#7F007F'>name</span><span
style='color:black'>=</span><i><span style='color:#2A00FF'>&quot;tel&quot;</span></i>
<span style='color:#7F007F'>data-rule</span><span style='color:black'>=</span><i><span
style='color:#2A00FF'>&quot;required;</span></i><span style='color:#7F007F'> integer</span><i><span
style='color:#2A00FF'>&quot;</span></i> <span style='color:#7F007F'>data-rule-integer</span><span
style='color:black'>=</span><i><span style='color:#2A00FF'>&quot;[</span></i><span
style='color:#2A00FF'>/^[0-9]*[1-9][0-9]*$/<i>,'</i></span></span><i><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#2A00FF'>请输入正整数</span></i><i><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#2A00FF'>’]&quot;</span></i><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:teal'>/&gt;</span></p>

<p class=MsoNormal style='line-height:11.0pt'><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif";color:teal'>4,</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:teal'>验证必须是正数</span></p>

<p class=MsoNormal style='line-height:11.0pt'><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif";color:teal'>&lt;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#3F7F7F'>input</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif"'> <span
style='color:#7F007F'>type</span><span style='color:black'>=</span><i><span
style='color:#2A00FF'>&quot;text&quot;</span></i> <span style='color:#7F007F'>name</span><span
style='color:black'>=</span><i><span style='color:#2A00FF'>&quot;bargainPrice&quot;</span></i>
<span style='color:#7F007F'>data-rule</span><span style='color:black'>=</span><i><span
style='color:#2A00FF'>&quot;num&quot;</span></i> <span style='color:#7F007F'>data-rule-num</span><span
style='color:black'>=</span><i><span style='color:#2A00FF'>&quot;[/^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/]&quot;</span></i>&nbsp;
<span style='color:#7F007F'>checked</span><span style='color:black'>=</span><i><span
style='color:#2A00FF'>&quot;checked&quot;</span></i><span style='color:teal'>&gt;</span></span></p>

<p class=MsoNormal style='line-height:11.0pt'><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif";color:teal'>&nbsp;</span></p>

<p class=MsoNormal style='line-height:11.0pt'><span style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:teal'>自定义消息显示位置</span></p>

<p class=MsoNormal style='line-height:11.0pt'><span
class=webkit-html-attribute-name><span lang=EN-US style='font-size:9.0pt;
font-family:Consolas;color:#222222'>data-target</span></span><span lang=EN-US
style='font-size:9.0pt;font-family:Consolas;color:#222222;background:white'>=&quot;</span><span
class=webkit-html-attribute-value><span lang=EN-US style='font-family:Consolas;
color:#222222'>#lastName</span></span><span lang=EN-US style='font-size:9.0pt;
font-family:Consolas;color:#222222;background:white'>&quot;</span><span
style='font-size:9.0pt;font-family:"微软雅黑","sans-serif";color:#222222;
background:white'>属性，相当于消息显示在</span><span lang=EN-US style='font-size:9.0pt;
font-family:Consolas;color:#222222;background:white'>id=”</span><span
class=webkit-html-attribute-value><span lang=EN-US style='font-family:Consolas;
color:#222222'>lastName</span></span><span lang=EN-US style='font-size:9.0pt;
font-family:Consolas;color:#222222;background:white'>”</span><span
style='font-size:9.0pt;font-family:"微软雅黑","sans-serif";color:#222222;
background:white'>的元素位置</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
both;background:white'><b><span style='font-size:15.0pt;font-family:宋体;
color:#333333'>内置规则（</span></b><b><span lang=EN-US style='font-size:15.0pt;
font-family:"Microsoft Yahei","serif";color:#333333'>rules</span></b><b><span
style='font-size:15.0pt;font-family:宋体;color:#333333'>）</span></b></p>

<p class=MsoNormal style='line-height:18.9pt;layout-grid-mode:both;background:
#F9F9F9'><span style='font-size:10.5pt;font-family:宋体;color:#777777'>公共定义：</span><span
lang=EN-US style='font-size:10.5pt;color:#777777'><br>
1.</span><span lang=EN-US style='font-size:10.5pt;color:#777777'>&nbsp;</span><b><span
style='font-size:10.5pt;font-family:宋体;color:#777777'>数值范围</span></b><span
style='font-size:10.5pt;font-family:宋体;color:#777777'>使用波浪线（</span><span
lang=EN-US style='font-size:10.5pt;color:#777777'>~</span><span
style='font-size:10.5pt;font-family:宋体;color:#777777'>）表示，例如：</span><span
lang=EN-US style='font-size:10.5pt;color:#777777'>6~</span><span
style='font-size:10.5pt;font-family:宋体;color:#777777'>（大于等于</span><span
lang=EN-US style='font-size:10.5pt;color:#777777'>6</span><span
style='font-size:10.5pt;font-family:宋体;color:#777777'>）、</span><span
lang=EN-US style='font-size:10.5pt;color:#777777'>~6</span><span
style='font-size:10.5pt;font-family:宋体;color:#777777'>（小于等于</span><span
lang=EN-US style='font-size:10.5pt;color:#777777'>6</span><span
style='font-size:10.5pt;font-family:宋体;color:#777777'>）、</span><span
lang=EN-US style='font-size:10.5pt;color:#777777'>6~16</span><span
style='font-size:10.5pt;font-family:宋体;color:#777777'>（</span><span lang=EN-US
style='font-size:10.5pt;color:#777777'>6</span><span style='font-size:10.5pt;
font-family:宋体;color:#777777'>到</span><span lang=EN-US style='font-size:10.5pt;
color:#777777'>16</span><span style='font-size:10.5pt;font-family:宋体;
color:#777777'>）</span><span lang=EN-US style='font-size:10.5pt;color:#777777'><br>
2.</span><span lang=EN-US style='font-size:10.5pt;color:#777777'>&nbsp;</span><b><span
style='font-size:10.5pt;font-family:宋体;color:#777777'>大小比较</span></b><span
style='font-size:10.5pt;font-family:宋体;color:#777777'>使用</span><span
lang=EN-US style='font-size:10.5pt;color:#777777'> lt</span><span
style='font-size:10.5pt;font-family:宋体;color:#777777'>（小于）、</span><span
lang=EN-US style='font-size:10.5pt;color:#777777'>lte</span><span
style='font-size:10.5pt;font-family:宋体;color:#777777'>（小于等于）、</span><span
lang=EN-US style='font-size:10.5pt;color:#777777'>gt</span><span
style='font-size:10.5pt;font-family:宋体;color:#777777'>（大于）、</span><span
lang=EN-US style='font-size:10.5pt;color:#777777'>gte</span><span
style='font-size:10.5pt;font-family:宋体;color:#777777'>（大于等于）、</span><span
lang=EN-US style='font-size:10.5pt;color:#777777'>eq</span><span
style='font-size:10.5pt;font-family:宋体;color:#777777'>（等于）表示</span><span
lang=EN-US style='font-size:10.5pt;color:#777777'><br>
3. </span><span style='font-size:10.5pt;font-family:宋体;color:#777777'>如果某个规则可以带参数，参数要使用方括号（</span><span
lang=EN-US style='font-size:10.5pt;color:#777777'>[]</span><span
style='font-size:10.5pt;font-family:宋体;color:#777777'>）或者圆括号（</span><span
lang=EN-US style='font-size:10.5pt;color:#777777'>()</span><span
style='font-size:10.5pt;font-family:宋体;color:#777777'>）括起来，取决于你的习惯</span></p>

<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
 style='background:white;border-collapse:collapse'>
 <thead>
  <tr style='height:22.5pt'>
   <td style='padding:0cm 3.75pt 0cm 3.75pt;height:22.5pt'>
   <p class=MsoNormal align=center style='margin-top:15.0pt;margin-right:0cm;
   margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center;
   layout-grid-mode:both'><b><span style='font-size:9.0pt;font-family:宋体;
   color:#333333'>规则</span></b></p>
   </td>
   <td style='border:solid #DDDDDD 1.0pt;padding:0cm 3.75pt 0cm 3.75pt;
   height:22.5pt'>
   <p class=MsoNormal align=center style='margin-top:15.0pt;margin-right:0cm;
   margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center;
   layout-grid-mode:both'><b><span style='font-size:9.0pt;font-family:宋体;
   color:#333333'>参数</span></b></p>
   </td>
   <td style='border:solid #DDDDDD 1.0pt;border-left:none;padding:0cm 3.75pt 0cm 3.75pt;
   height:22.5pt'>
   <p class=MsoNormal align=center style='margin-top:15.0pt;margin-right:0cm;
   margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center;
   layout-grid-mode:both'><b><span style='font-size:9.0pt;font-family:宋体;
   color:#333333'>描述</span></b></p>
   </td>
   <td style='border:solid #DDDDDD 1.0pt;border-left:none;padding:0cm 3.75pt 0cm 3.75pt;
   height:22.5pt'>
   <p class=MsoNormal align=center style='margin-top:15.0pt;margin-right:0cm;
   margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center;
   layout-grid-mode:both'><b><span style='font-size:9.0pt;font-family:宋体;
   color:#333333'>例子</span></b></p>
   </td>
  </tr>
 </thead>
 <tr>
  <td nowrap style='background:whitesmoke;padding:0cm 3.75pt 0cm 3.75pt'>
  <p class=MsoNormal align=right style='margin-top:15.0pt;margin-right:0cm;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:right;
  layout-grid-mode:both'><b><span lang=EN-US style='font-size:9.0pt;color:#333333'>required</span></b></p>
  </td>
  <td style='border:solid #DDDDDD 1.0pt;border-top:none;padding:6.0pt 6.0pt 6.0pt 6.0pt'></td>
  <td style='border-top:none;border-left:none;border-bottom:solid #DDDDDD 1.0pt;
  border-right:solid #DDDDDD 1.0pt;padding:6.0pt 6.0pt 6.0pt 6.0pt'>
  <p class=MsoNormal style='margin-top:15.0pt;margin-right:0cm;margin-bottom:
  0cm;margin-left:0cm;margin-bottom:.0001pt;layout-grid-mode:both'><span
  style='font-size:9.0pt;font-family:宋体;color:#333333'>必填项</span></p>
  </td>
  <td style='border-top:none;border-left:none;border-bottom:solid #DDDDDD 1.0pt;
  border-right:solid #DDDDDD 1.0pt;padding:6.0pt 6.0pt 6.0pt 6.0pt'>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>required&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  //</span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>不能为空</span></p>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>required(xxx)&nbsp;&nbsp;
  //</span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>满足<span
  lang=EN-US>xxx</span>规则，才验证<span lang=EN-US>required</span></span></p>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>required(not,
  xxx) //</span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>如果值为空，或者<span
  lang=EN-US>xxx</span>也认为是空</span></p>
  </td>
 </tr>
 <tr>
  <td nowrap style='background:whitesmoke;padding:0cm 3.75pt 0cm 3.75pt'>
  <p class=MsoNormal align=right style='margin-bottom:0cm;margin-bottom:.0001pt;
  text-align:right;layout-grid-mode:both'><b><span lang=EN-US style='font-size:
  9.0pt;color:#333333'>integer</span></b></p>
  </td>
  <td style='border:solid #DDDDDD 1.0pt;border-top:none;padding:6.0pt 6.0pt 6.0pt 6.0pt'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
  both'><span style='font-size:9.0pt;font-family:宋体;color:#333333'>可选，标识</span></p>
  </td>
  <td style='border-top:none;border-left:none;border-bottom:solid #DDDDDD 1.0pt;
  border-right:solid #DDDDDD 1.0pt;padding:6.0pt 6.0pt 6.0pt 6.0pt'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
  both'><span style='font-size:9.0pt;font-family:宋体;color:#333333'>整数</span></p>
  </td>
  <td style='border-top:none;border-left:none;border-bottom:solid #DDDDDD 1.0pt;
  border-right:solid #DDDDDD 1.0pt;padding:6.0pt 6.0pt 6.0pt 6.0pt'>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>integer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  //</span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>请输入整数</span></p>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>integer[*]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  //</span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>请输入整数</span></p>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>integer[+]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  //</span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>请输入正整数</span></p>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>integer[+0]&nbsp;&nbsp;&nbsp;&nbsp;
  //</span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>请输入正整数或<span
  lang=EN-US>0</span></span></p>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>integer[-]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  //</span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>请输入负整数</span></p>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>integer[-0]&nbsp;&nbsp;&nbsp;&nbsp;
  //</span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>请输入负整数或<span
  lang=EN-US>0</span></span></p>
  </td>
 </tr>
 <tr>
  <td nowrap style='background:whitesmoke;padding:0cm 3.75pt 0cm 3.75pt'>
  <p class=MsoNormal align=right style='margin-bottom:0cm;margin-bottom:.0001pt;
  text-align:right;layout-grid-mode:both'><b><span lang=EN-US style='font-size:
  9.0pt;color:#333333'>match</span></b></p>
  </td>
  <td style='border:solid #DDDDDD 1.0pt;border-top:none;padding:6.0pt 6.0pt 6.0pt 6.0pt'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
  both'><span style='font-size:9.0pt;font-family:宋体;color:#333333'>可选，标识</span><span
  lang=EN-US style='font-size:9.0pt;color:#333333'><br>
  </span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>必选</span><span
  lang=EN-US style='font-size:9.0pt;color:#333333'>, </span><span
  style='font-size:9.0pt;font-family:宋体;color:#333333'>另一字段名</span></p>
  </td>
  <td style='border-top:none;border-left:none;border-bottom:solid #DDDDDD 1.0pt;
  border-right:solid #DDDDDD 1.0pt;padding:6.0pt 6.0pt 6.0pt 6.0pt'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
  both'><span style='font-size:9.0pt;font-family:宋体;color:#333333'>与另一字段匹配，两种用法：</span><span
  lang=EN-US style='font-size:9.0pt;color:#333333'><br>
  <br>
  match[name];<br>
  </span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>用于验证两个字段的值必须相同</span><span
  lang=EN-US style='font-size:9.0pt;color:#333333'><br>
  <br>
  match[condition, name];<br>
  </span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>用于比较两个字段大小</span></p>
  </td>
  <td style='border-top:none;border-left:none;border-bottom:solid #DDDDDD 1.0pt;
  border-right:solid #DDDDDD 1.0pt;padding:6.0pt 6.0pt 6.0pt 6.0pt'>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>match[password]&nbsp;
  //</span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>与<span
  lang=EN-US>password</span>字段的值匹配</span></p>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>match[lt,
  money]&nbsp; //</span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>小于<span
  lang=EN-US>money</span>字段的值</span></p>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>match[lte,
  money] //</span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>小于等于<span
  lang=EN-US>money</span>字段的值</span></p>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>match[eq,
  money]&nbsp; //</span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>等于<span
  lang=EN-US>money</span>字段的值匹配</span></p>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>match[neq,
  money]&nbsp; //</span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>不能等于<span
  lang=EN-US>money</span>字段的值</span></p>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>match[gte,
  money] //</span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>大于等于<span
  lang=EN-US>money</span>字段的值</span></p>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>match[gt,
  money]&nbsp; //</span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>大于<span
  lang=EN-US>money</span>字段的值</span></p>
  </td>
 </tr>
 <tr>
  <td nowrap style='background:whitesmoke;padding:0cm 3.75pt 0cm 3.75pt'>
  <p class=MsoNormal align=right style='margin-bottom:0cm;margin-bottom:.0001pt;
  text-align:right;layout-grid-mode:both'><b><span lang=EN-US style='font-size:
  9.0pt;color:#333333'>range</span></b></p>
  </td>
  <td style='border:solid #DDDDDD 1.0pt;border-top:none;padding:6.0pt 6.0pt 6.0pt 6.0pt'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
  both'><span style='font-size:9.0pt;font-family:宋体;color:#333333'>必选，范围值</span></p>
  </td>
  <td style='border-top:none;border-left:none;border-bottom:solid #DDDDDD 1.0pt;
  border-right:solid #DDDDDD 1.0pt;padding:6.0pt 6.0pt 6.0pt 6.0pt'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
  both'><span style='font-size:9.0pt;font-family:宋体;color:#333333'>数值范围</span></p>
  </td>
  <td style='border-top:none;border-left:none;border-bottom:solid #DDDDDD 1.0pt;
  border-right:solid #DDDDDD 1.0pt;padding:6.0pt 6.0pt 6.0pt 6.0pt'>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>range[0~99]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  //0</span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>到<span
  lang=EN-US>99</span>的整数</span></p>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>range[~99]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  //</span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>小于或等于<span
  lang=EN-US>99</span>的整数</span></p>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>range[0~] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//</span><span
  style='font-size:9.0pt;font-family:宋体;color:#333333'>大于或等于<span lang=EN-US>0</span>的整数</span></p>
  </td>
 </tr>
 <tr>
  <td nowrap style='background:whitesmoke;padding:0cm 3.75pt 0cm 3.75pt'>
  <p class=MsoNormal align=right style='margin-bottom:0cm;margin-bottom:.0001pt;
  text-align:right;layout-grid-mode:both'><b><span lang=EN-US style='font-size:
  9.0pt;color:#333333'>length</span></b></p>
  </td>
  <td style='border:solid #DDDDDD 1.0pt;border-top:none;padding:6.0pt 6.0pt 6.0pt 6.0pt'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
  both'><span style='font-size:9.0pt;font-family:宋体;color:#333333'>必选，范围值</span><span
  lang=EN-US style='font-size:9.0pt;color:#333333'><br>
  </span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>可选，是否计算真实长度</span></p>
  </td>
  <td style='border-top:none;border-left:none;border-bottom:solid #DDDDDD 1.0pt;
  border-right:solid #DDDDDD 1.0pt;padding:6.0pt 6.0pt 6.0pt 6.0pt'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
  both'><span style='font-size:9.0pt;font-family:宋体;color:#333333'>验证字符长度</span></p>
  </td>
  <td style='border-top:none;border-left:none;border-bottom:solid #DDDDDD 1.0pt;
  border-right:solid #DDDDDD 1.0pt;padding:6.0pt 6.0pt 6.0pt 6.0pt'>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>length[6~16]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  //6-16</span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>个字符</span></p>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>length[6]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  //6</span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>个字符</span></p>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>length[~6]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  //</span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>小于<span
  lang=EN-US>6</span>个字符</span></p>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>length[6~]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  //</span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>大于<span
  lang=EN-US>6</span>个字符</span></p>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>&nbsp;</span></p>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>length[~6,
  true]&nbsp;&nbsp; //</span><span style='font-size:9.0pt;font-family:宋体;
  color:#333333'>小于<span lang=EN-US>6</span>个字符<span lang=EN-US>,</span>全角字符计算双字符</span></p>
  </td>
 </tr>
 <tr>
  <td nowrap style='background:whitesmoke;padding:0cm 3.75pt 0cm 3.75pt'>
  <p class=MsoNormal align=right style='margin-bottom:0cm;margin-bottom:.0001pt;
  text-align:right;layout-grid-mode:both'><b><span lang=EN-US style='font-size:
  9.0pt;color:#333333'>checked</span></b></p>
  </td>
  <td style='border:solid #DDDDDD 1.0pt;border-top:none;padding:6.0pt 6.0pt 6.0pt 6.0pt'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
  both'><span style='font-size:9.0pt;font-family:宋体;color:#333333'>可选，范围值</span></p>
  </td>
  <td style='border-top:none;border-left:none;border-bottom:solid #DDDDDD 1.0pt;
  border-right:solid #DDDDDD 1.0pt;padding:6.0pt 6.0pt 6.0pt 6.0pt'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
  both'><span style='font-size:9.0pt;font-family:宋体;color:#333333'>对于</span><span
  lang=EN-US style='font-size:9.0pt;color:#333333'>checkbox</span><span
  style='font-size:9.0pt;font-family:宋体;color:#333333'>或</span><span
  lang=EN-US style='font-size:9.0pt;color:#333333'>radio<br>
  </span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>必须要选中多少项</span></p>
  </td>
  <td style='border-top:none;border-left:none;border-bottom:solid #DDDDDD 1.0pt;
  border-right:solid #DDDDDD 1.0pt;padding:6.0pt 6.0pt 6.0pt 6.0pt'>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>checked&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//</span><span
  style='font-size:9.0pt;font-family:宋体;color:#333333'>必填，相当于<span lang=EN-US>required</span></span></p>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>checked[3~5]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  //</span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>请选择<span
  lang=EN-US>3</span>到<span lang=EN-US>5</span>项</span></p>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>checked[3]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  //</span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>请选择<span
  lang=EN-US>3</span>项</span></p>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>checked[~5]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  //</span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>请选择少于<span
  lang=EN-US>5</span>项</span></p>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>checked[3~]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  //</span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>请选择大于<span
  lang=EN-US>3</span>项</span></p>
  </td>
 </tr>
 <tr>
  <td nowrap style='background:whitesmoke;padding:0cm 3.75pt 0cm 3.75pt'>
  <p class=MsoNormal align=right style='margin-bottom:0cm;margin-bottom:.0001pt;
  text-align:right;layout-grid-mode:both'><b><span lang=EN-US style='font-size:
  9.0pt;color:#333333'>remote</span></b></p>
  </td>
  <td style='border:solid #DDDDDD 1.0pt;border-top:none;padding:6.0pt 6.0pt 6.0pt 6.0pt'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
  both'><span style='font-size:9.0pt;font-family:宋体;color:#333333'>必选，</span><span
  lang=EN-US style='font-size:9.0pt;color:#333333'>url</span><span
  style='font-size:9.0pt;font-family:宋体;color:#333333'>地址</span><span
  lang=EN-US style='font-size:9.0pt;color:#333333'><br>
  </span><span style='font-size:9.0pt;font-family:宋体;color:#333333'>可选，附带额外的字段</span></p>
  </td>
  <td style='border-top:none;border-left:none;border-bottom:solid #DDDDDD 1.0pt;
  border-right:solid #DDDDDD 1.0pt;padding:6.0pt 6.0pt 6.0pt 6.0pt'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
  both'><span style='font-size:9.0pt;font-family:宋体;color:#333333'>远程验证</span></p>
  </td>
  <td style='border-top:none;border-left:none;border-bottom:solid #DDDDDD 1.0pt;
  border-right:solid #DDDDDD 1.0pt;padding:6.0pt 6.0pt 6.0pt 6.0pt'>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>remote[path/to/server.php]</span></p>
  <p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.75pt;margin-bottom:.0001pt;layout-grid-mode:both'><span
  lang=EN-US style='font-size:9.0pt;font-family:宋体;color:#333333'>remote[path/to/server.php,
  name1, name2, ..]</span></p>
  </td>
 </tr>
</table>

<p class=MsoNormal style='line-height:11.0pt'><span lang=EN-US>Remote</span><span
style='font-family:"微软雅黑","sans-serif"'>传递多个参数的时候</span><span lang=EN-US>remote[url,
param1, param2]</span><span style='font-family:"微软雅黑","sans-serif"'>，<span
style='color:red'>一定要有空格，否则就不对了</span></span></p>

<p class=MsoNormal style='line-height:11.0pt'><span lang=EN-US>&nbsp;</span></p>

<p class=MsoNormal style='line-height:11.0pt'><span lang=EN-US>&nbsp;</span></p>

<p class=MsoNormal style='line-height:11.0pt'><span lang=EN-US>&nbsp;</span></p>

<p class=MsoNormal style='line-height:11.0pt'><span style='font-family:"微软雅黑","sans-serif"'>较复杂的一种自定义验证</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
both;text-autospace:none'><span lang=EN-US style='font-size:10.0pt;font-family:
"Arial","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp; $(</span><span lang=EN-US style='font-size:10.0pt;font-family:
"Arial","sans-serif";color:#2A00FF'>'#editform'</span><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif";color:black'>).validator({</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
both;text-autospace:none'><span lang=EN-US style='font-size:10.0pt;font-family:
"Arial","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rules:
{</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
both;text-autospace:none'><span lang=EN-US style='font-size:10.0pt;font-family:
"Arial","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#3F7F5F'>//</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>自定义一个规则，用来代替</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#3F7F5F'>remote</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>（注意：要把</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#3F7F5F'>$.ajax()</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>返回出来）</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
both;text-autospace:none'><span lang=EN-US style='font-size:10.0pt;font-family:
"Arial","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;myRemote: </span><b><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#7F0055'>function</span></b><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:black'>(element){</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
both;text-autospace:none'><span lang=EN-US style='font-size:10.0pt;font-family:
"Arial","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#7F0055'>return</span></b><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:black'>
$.ajax({</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
both;text-autospace:none'><span lang=EN-US style='font-size:10.0pt;font-family:
"Arial","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;url:
</span><span lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";
color:#2A00FF'>'${ctx}/productCategory/checkCodeIsExistCode'</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:black'>,</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
both;text-autospace:none'><span lang=EN-US style='font-size:10.0pt;font-family:
"Arial","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;type:
</span><span lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";
color:#2A00FF'>'post'</span><span lang=EN-US style='font-size:10.0pt;
font-family:"Arial","sans-serif";color:black'>,</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
both;text-autospace:none'><span lang=EN-US style='font-size:10.0pt;font-family:
"Arial","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data:
$(</span><span lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";
color:#2A00FF'>&quot;#editform&quot;</span><span lang=EN-US style='font-size:
10.0pt;font-family:"Arial","sans-serif";color:black'>).serialize(),</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
both;text-autospace:none'><span lang=EN-US style='font-size:10.0pt;font-family:
"Arial","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dataType:
</span><span lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";
color:#2A00FF'>'json'</span><span lang=EN-US style='font-size:10.0pt;
font-family:"Arial","sans-serif";color:black'>,</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
both;text-autospace:none'><span lang=EN-US style='font-size:10.0pt;font-family:
"Arial","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;success:
</span><b><span lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";
color:#7F0055'>function</span></b><span lang=EN-US style='font-size:10.0pt;
font-family:"Arial","sans-serif";color:black'>(d){</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
both;text-autospace:none'><span lang=EN-US style='font-size:10.0pt;font-family:
"Arial","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;window.console
&amp;&amp; console.log(d);</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
both;text-autospace:none'><span lang=EN-US style='font-size:10.0pt;font-family:
"Arial","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
both;text-autospace:none'><span lang=EN-US style='font-size:10.0pt;font-family:
"Arial","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
both;text-autospace:none'><span lang=EN-US style='font-size:10.0pt;font-family:
"Arial","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
both;text-autospace:none'><span lang=EN-US style='font-size:10.0pt;font-family:
"Arial","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;upper:[/^[A-Z]{3}/,</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#2A00FF'>&quot;</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#2A00FF'>请输入大写字</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>母</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:black'>&quot;]</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
both;text-autospace:none'><span lang=EN-US style='font-size:10.0pt;font-family:
"Arial","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;},</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
both;text-autospace:none'><span lang=EN-US style='font-size:10.0pt;font-family:
"Arial","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;fields:
{</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
both;text-autospace:none'><span lang=EN-US style='font-size:10.0pt;font-family:
"Arial","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:#2A00FF'>'code'</span><span
lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";color:black'>:
</span><span lang=EN-US style='font-size:10.0pt;font-family:"Arial","sans-serif";
color:#2A00FF'>'</span><span style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#2A00FF'>编码</span><span lang=EN-US style='font-size:10.0pt;font-family:
"Arial","sans-serif";color:#2A00FF'>: required; upper;length[3];myRemote;'</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;layout-grid-mode:
both;text-autospace:none'><span lang=EN-US style='font-size:10.0pt;font-family:
"Arial","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;}</span></p>

<p class=MsoNormal style='line-height:11.0pt'><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp; });</span></p>

<p class=MsoNormal style='line-height:11.0pt'><span style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:black'>设置</span><span lang=EN-US
style='font-size:10.0pt;font-family:"Arial","sans-serif";color:black'>input</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>框不用验证</span></p>

<p class=MsoNormal><code><span lang=EN-US style='font-size:12.0pt;font-family:
Consolas;color:#DD1144;background:#F6F6F6'>增加novalidate属性</span></code></p>

</div>

</body>

</html>


