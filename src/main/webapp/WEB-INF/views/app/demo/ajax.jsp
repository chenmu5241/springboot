<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../util/tlds.jsp"%>
<div class="row">
	一,本页面代码有两个ajax请求，第一种请求是传递对象，并且除对象之外增加参数，这种做法有诸多限制
		<ul>
				<li>1， contentType:"application/json"必须设置，否则会报错415</li>
				<li>2，controller方法中必须使用@ResponseBody,而且形参中只能有一个	@ResponseBody注解</li>
				<li>3，要自动封装的类上要加注解@JsonIgnoreProperties(ignoreUnknown = true)，意思是非空属性不注入，否则如果有传参跟对象属性对不上就报错</li>
				<li>4，如果想另外传递参数，只能通过url后追加，url?username=</li>
				<li>5，url追加的参数需要编码(后台解码)，否则遇到中文，后台无法解码会出现乱码</li>
				<li><font color="red">综合以上内容，除非只传递一个对象时才考虑用这种方式</font></li>
			</ul>
	二,使用普通传参方式
		<ul>
				<li>1，不需要 contentType:"application/json",相当于使用默认的传参方式contentType:application/x-www-form-urlencoded</li>
				<li>2，传递时controller使用基本类型接受，如果要转成对象使用JSON.parseObject(string,class)转成对象</li>
				<li><font color="red">第二种方法简单通用，任何时候都通用，建议使用</font></li>
			</ul>
</div>
<script>
var sysAccount = {username:"小李子"};
var param = {name:"张小子",sysAccount:sysAccount}
 $.ajax( {
        type : "POST",
        url : "${ctx}/demo/ajaxParam?name="+encodeURI(encodeURI("哈哈")),
        contentType:"application/json",//请求服务器时传递参数的格式
        data :JSON.stringify(param),
        success : function(result) {
        	alert(result)
        },
        error : function(result) {
        }
    }); 
$.ajax( {
        type : "POST",
        url : "${ctx}/demo/ajaxParam1",
        //contentType:"application/json",//简单参数传递不需要设置contentType,相当于contentType:application/x-www-form-urlencoded
        data :{testModelStr:JSON.stringify(param),name:"哈哈",sysAccountStr:JSON.stringify(sysAccount)},
        success  : function(result) {
        	alert(result)
        },
        error : function(result) {
        }
    });
</script>
