<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 	<c:if test="${empty LoginOK}"> --%>
<%-- 		<c:set var="target" value="${pageContext.request.servletPath}" --%>
<%-- 			scope="session" /> --%>
<%-- 		<c:redirect url="/01_login/LoginBegin.jsp" /> --%>
<%-- 	</c:if> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- 匯入css -->
	<jsp:include page="/references/head_resources_css.jsp" />
	<jsp:include page="/references/fullcalendar.jsp" />

<title>Insert title here</title>
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
		// --1.        
    	theme: true,
    	
		// --2.        
        editable: false,
		// --3.        
        events: "/Hibernate01/CalendarFromDBServlet",
        
        // --4. 註冊【事件被拖放】事件
        eventDrop: function(event, delta, revertFunc) {
        	alert("偵測到您正在變更事件\n"+"事件代碼\t"+event.id+"\n事件名稱\t"+event.title + "\n改變為\t" + event.start.format());
        		if (!confirm("是否保存本次變更?")) {
        			// -- 取消
        		    revertFunc();
    		    } else{
    		    	// -- 確認
    		    	updateDB(event);
    		    	}
        },

		// --5. 日曆標頭
		header : {
			left : 'prev,next today',
			center : 'title',
			right : 'month,agendaWeek,agendaDay'
		},
		
		// --6. 可編輯
		editable : true,
		
		// --7. 可拖曳
		droppable : true, // this allows things to be dropped onto the calendar
		
		// --8. 註冊拖放事件【不確定是拖放什麼????】
		drop : function() {
			// is the "remove after drop" checkbox checked?
			if ($('#drop-remove').is(':checked')) {
				// if so, remove the element from the "Draggable Events" list
				$(this).remove();
			}
		},
		
		// --9. 註冊【點擊日期】事件
		dayClick : function() {
// 				alert('a day has been clicked!');
			Lobibox.alert("warning", //AVAILABLE TYPES: "error", "info", "success", "warning"
		    			{
		    			msg: "a day has been clicked!"
		    			});
			},
		
		// --10.註冊【點擊事件標頭】事件
		eventClick: function(event, element) {
				
			// -- 官方的【可以用在google calendar上】
			//if (event.url) {
				//window.open(event.url);
				//return false;
			//}
			//event.title = "CLICKED!";
			
			// -- 自己的
			var eventOldName = event.title;
			var eventUpdateName = prompt('請輸入事件名稱: ',event.title);
 		    event.title = eventUpdateName==null?eventOldName:eventUpdateName;  
	        updateDB(event);
		        
		        $('#calendar').fullCalendar('updateEvent', event);
		    	// 還沒有想到要寫的
			
			}
			
		})
	});

	
	
	
	// --00.其他函數
	
	// --1. UPDATEDB 【寫入資料庫】
	function updateDB(event){
	// -- 【確認】有變更 故應寫回資料庫

	// -- 使用 Ajax 呼叫 Servlet
	// -- 同時傳送以下欄位參數 
	// -- id, studentId, title, start, end, color.
	
		var orderId = event.orderId;
		var id = event.id;
		var title = event.title;
		var start = event.start;
		var end = event.end;
		var color = event.color;
//		var studentVO = event.studentVO;
//		var stuID = event.studentVO.stuID;


		//目前先假裝知道 因為stuID 會在登入後一直存在session裡面!!!
		var stuID = 1;	
	
		
		
		// 印出
		console.log("orderId============="+orderId);
		console.log("id============="+id);
		console.log("title============="+title);
		console.log("start============="+start);
		console.log("end============="+end);
		console.log("color============="+color);
		

		// Ajax 資料庫
		var xhr = new XMLHttpRequest();
		if (xhr != null) {
			xhr.onload = function() {
				if (xhr.status == 200) {
				}
			}
			xhr.open("POST", "/Hibernate01/Calendar2DBServlet",true);
			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
// 			xhr.send("orderId="+orderId+"&id="+id+"&title="+title+"&stuID="+stuID+"&start="+start+"&end="+end+"&color="+color+"&studentVO="+studentVO);
			xhr.send("orderId="+orderId+"&id="+id+"&title="+title+"&stuID="+stuID+"&start="+start+"&end="+end+"&color="+color);
		}
//		console.log("ID= " + event.id);
//		console.log("TITLE= " + event.title);
//		console.log("START_DATE= " + event.start);
//		console.log("END_DATE= " + event.end);

//		console.log($(this).context);
//		console.log(typeof $(this));
//		console.log($(this));
//		console.log($(this).__proto__);
//		console.log(JSON.stringify($(this)));




		// 注意在使用jQuery的post時, 有小小的不同處
		// 傳統使用javascript語法以Ajax技術傳遞參數時 
		// 串接Query-String 可以是String 或是 Number格式
		// 然而在jQuery的語法中, 要先轉成String 才可以傳遞
		// 即便要傳送的東西已經是物件, 也需要先將內容物轉成String 格式
		
		
	 	// jQuery版本 POST		
//	 	$.post(url,{
//	 			orderId:orderId+"",
//	 			id:id+"",
//	 			stuID:stuID+"",
//	 			title:title+"",
//	 			start:start+"",
//	 			end:end+"",
//	 			color:color+""
//	 			},
//	 			function(data){
//	 				console.log("成功寫入");			
				
//	 			});
		
		
		
			// jQuery版本 Ajax		
//		 	$.ajax( "type":"post",
//		 			"url":url,
//		 			"dataType":"json",
//		 			"data":{"orderId":orderId, "id":id, "stuID":stuID, "title":title, "start":start, "end":end,"color":color},
//		 			"success":function(data){
//		 			})

					
					
					// Ajax 資料庫
//		 		var xhr = new XMLHttpRequest();
//		 		if (xhr != null) {
//		 			xhr.onload = function() {
//		 				if (xhr.status == 200) {
//		 				}
//		 			}
//		 			xhr.open("POST", "/Hibernate01/Calendar2DBServlet",true);
//		 			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
//		 			xhr.send("orderId="+orderId+"&id="+id+"&title="+title+"&stuID="+stuID+"&start="+start+"&end="+end+"&color="+color);
//		 		}	
















	}
	
	
	

	
	

</script>


<div id='calendar'></div>
	</div>
    </div>
    
    <!-- /.container -->

   <!-- 匯入js -->
	<jsp:include page="/references/foot_resources_js.jsp" />

</body>
</html>

