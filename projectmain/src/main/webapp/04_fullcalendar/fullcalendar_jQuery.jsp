<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 	<c:if test="${empty LoginOK}"> --%>
<%-- 		<c:set var="target" value="${pageContext.request.servletPath}" --%>
<%--  			scope="session" /> --%>
<%-- 		<c:redirect url="/01_login/LoginBegin.jsp" /> --%>
<%-- 	</c:if> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


	<!-- 匯入css -->
	<jsp:include page="/references/head_resources_css.jsp" />
	<jsp:include page="/references/fullcalendar.jsp" />

<title>fullcalendar_jQuery.jsp</title>
<link href="../css/lobibox.min.css" rel="stylesheet">
</head>
	<!-- 匯入js -->
	<jsp:include page="/references/head_resources_js.jsp" />
<body>
<script src="../js/lobibox.min.js"></script>
	<div class="container">
	<!-- 匯入功能表列 -->
	<jsp:include page="/references/navigator.jsp" />
	  <div class="starter-template">

		<!-- 開始畫出日曆 -->
<script>
// ●●●●●●●使用websocket 
var ws = new WebSocket("ws://" + document.location.host + "//projectmain/booking.do");



// ●●.註冊【頁面載入成功】事件
$(document).ready(function(){
	$('#external-events .fc-event').each(function(){

		// store data so the calendar knows to render an event upon drop
		$(this).data('event', {
			title: $.trim($(this).text()), // use the element's text as the event title
			stick: true // maintain when user navigates (see docs on the renderEvent method)
		});

		// make the event draggable using jQuery UI
		$(this).draggable({
			zIndex: 999,
			revert: true,      // will cause the event to go back to its
			revertDuration: 0  //  original position after the drag
		});

	});
    
	
	
	
	// page is now ready, initialize the calendar...
    $('#calendar').fullCalendar({
		// ●●
		header : {
			left : 'prev,next today',
			center : 'title',
			right : 'month,agendaWeek,agendaDay'
		},
    	theme: true,
// 		allDayDefault:true,
//      editable: false,	// 似乎已資料庫為準
		droppable : true,	// this allows things to be dropped onto the calendar
    	selectable:false,
    	businessHours: true,// display business hours
		// --1-5 or 1-7 【days】
		weekends:true,
		weekNumbers: true,
		// --6 or 4-6 【weeks】
		fixedWeekCount: true,
    	selectHelper:true,
//     	hiddenDays: [ 2, 4 ],// 把2,4給遮起來
// 		contentHeight: 400,
		aspectRatio: 0.9,		 //	寬/高
// 		height: 600,
    	// asking servlet 
        events: "/Hibernate01/CalendarFromDBServlet",
     
        // ●●. 註冊【事件被拖放】事件
        eventDrop: function(event, delta, revertFunc) {
			var events = listAllevents();	// 呼叫外部函數 列出所有events
			var isRepeat = isEventRepeat(event, events);	//呼叫外部函數 判斷是否同一天有同樣時段重複
			
			if(!isRepeat){
        		alert("偵測到您正在變更事件\n"+"事件代碼\t"+event.id+"\n事件名稱\t"+event.title + "\n改變為\t" + event.start.format()+"\n結束時間為"+event.end.format());
//         		alert("偵測到您正在變更事件\n"+"事件代碼\t"+event.id+"\n事件名稱\t"+event.title + "\n改變為\t" + event.start.format());
        			if (!confirm("是否保存本次變更?")) {
        		    	revertFunc();
    		    	} else{
    		    		updateDB(event);
    		    	}
			}else{
				revertFunc();
			}
		},
        
		
		// ●●. 註冊拖放事件【不確定是拖放什麼????】
		drop : function() {
			// is the "remove after drop" checkbox checked?
			if ($('#drop-remove').is(':checked')) {
				// if so, remove the element from the "Draggable Events" list
				$(this).remove();
			}
		},
		
		// ●●. 註冊【點擊日期】事件
		dayClick : function() {
// 				alert('a day has been clicked!');
			Lobibox.alert("warning", //AVAILABLE TYPES: "error", "info", "success", "warning"
		    			{
		    			msg: "a day has been clicked!"
		    			});
			},
		
		// --●●.註冊【點擊事件標頭】事件
		eventClick: function(event, element) {
				
			// -- 官方的【可以用在google calendar上】
			//if (event.url) {
				//window.open(event.url);
				//return false;
			//}
			//event.title = "CLICKED!";
			
			var eventOldName = event.title;
			var eventUpdateName = prompt('請輸入事件名稱: ',event.title);
 		    event.title = eventUpdateName==null?eventOldName:eventUpdateName; // 誤刪事件名稱時復原   
			if(!(event.title==eventOldName)){ // 若真有修改 才進出資料庫
 		   	  updateDB(event);
 		   	}
// 		        $('#calendar').fullCalendar('updateEvent', event);
		    	// 還沒有想到要寫的
// 		        $('#calendar').fullCalendar('renderEvent', event);
			}
			
		
	    })
   
	    
	// ●●. 將別人的定位也顯示	    
	$('#calendar').fullCalendar('addEventSource', '/Hibernate01/CalendarOthersFromDBServlet');
 
	$('#calendar').fullCalendar('renderEvent');
	    
   });



// 	●●●●●●●●. WebSocket================

	// ●●.註冊【建立連線】事件
	ws.onopen = function(){
			console.log('建立連線成功');
		}
	
	
	// ●●.註冊【接收訊息】事件
	ws.onmessage = function(data) {
		console.log("2222-->接收訊息\n"+data);
		var pushAevent = data.data;
		// 裁切,"source"後面不需要的字串
		pushAevent = pushAevent.split('\,\"source')[0]+'}';
		var pushAeventObject = JSON.parse(pushAevent);
		
		// ●●●●推播 
		// @arg1: 要推播的事件物件
		// @arg2: 推播風格
		bookingNotification(pushAeventObject,2);
		// 也可以再次呼叫一個servlet
// 		$('#calendar').fullCalendar('addEventSource', '/Hibernate01/CalendarFromDBServlet');

		
	}

	// ●●.註冊【發送訊息】事件
	function sendMessage(data) {
		console.log("1111-->發送訊息\n"+data);
		//將輸入內容送到websocket物件
		ws.send(data);//websocket自己的方法
	}


	// ●●.註冊【切斷連線】事件
	function closeSocket() {
		ws.close();
	}
	
	
	
</script>
			<div id='calendar' style="width:80%"></div>
		</div>
    </div>
    
    <!-- /.container -->

   <!-- 匯入js -->
	<jsp:include page="/references/foot_resources_js.jsp" />

</body>
</html>

