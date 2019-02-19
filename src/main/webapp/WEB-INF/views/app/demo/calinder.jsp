<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../util/tlds.jsp"%>
<div class="row" >
	<div id="calendar"></div>
</div>
<script>
	$(function(){
		var data= [ {
			  "color" : "red",
			  "start" : "2017-11-28",
			  "end" :"2017-12-10",
			  "title" : "任务:1"
			} ]
		
        //初始化日历
        var calendar = $('#calendar').fullCalendar({
			header: {
				left: 'prev',
				center: 'title',
				right: 'next'
			},
			defaultDate: new Date(),
			editable: true,
			eventLimit: true, 
			dayClick: function(date, jsEvent, view) {
				alert($('#calendar'));
			 },
			 eventClick:function(calEvent, jsEvent, view){
				 alert("点击单个日程")
			 },
		    events: function(start, end, timezone, callback) {
		    	var startDay = dateUtil.dateToStr(new Date(start),"yyyy-MM-dd");
		    	var endDay = dateUtil.dateToStr(new Date(end),"yyyy-MM-dd");
		    	$("#start").val(startDay);
		    	$("#end").val(endDay);
		    	callback(data);
		    	
//下面是异步请求后台数据的办法
/* 		        $.ajax({
		            url: '${ctx}/checkPlan/getCalendarList',
		            dataType: 'JSON',
		            async:false,
		            data: {
		                start: startDay,
		                end: endDay,
		            },
		            success: function(events) {
		                callback(data);
		            }
		        }); */
		    }
		})
	})
</script>
