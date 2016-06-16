<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


	<!-- 匯入共用css -->
	<jsp:include page="/references/head_resources_css.jsp" />

	<!-- 聊天框專用js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/LikeHangoutChat/js/LikeHangoutChat.js"></script>
	
	<!-- 聊天框專用css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/LikeHangoutChat/css/LikeHangoutChat.css"/>
	
	
	<!-- 匯入fullcalendar專用 -->
	<jsp:include page="/references/fullcalendar.jsp" />
	
		<title>fullcalendar_jQuery.jsp</title>
	</head>
	<!-- 匯入js -->
	<jsp:include page="/references/head_resources_js.jsp" />
<body>
	<div class="container">
	<!-- 匯入功能表列 -->
	<jsp:include page="/references/navigator.jsp" />
		<div class="starter-template">
		<!-- 開始畫出日曆 -->
			<script>
// 			var ws = new WebSocket("ws://" + document.location.host + "//Hibernate01/booking.do");
				$(document).ready(function(){
							// 只要按下是登出 就要通知考官
						var logoutButton = $("a:contains('登出')");
					console.log("logoutButton"+logoutButton);
					
					logoutButton.on("click",function(){
						sendMessageStuList("CLOSE:${sessionScope.userId}");
					});
					
						sendMessageStuList("ONLINE:${sessionScope.userId}");	// 0.上線通知
// 						iniWebsocket();			// 0.ws物件●
						createExternalEvents();	// 1.外部事件●
						iniFullcalendar();		// 2.自己已定●
												// 3.限制條件
						$('#calendar').fullCalendar('addEventSource', '/projectmain/CalendarConstrainFromDBServlet');
												// 4.別人已定	    									
						$('#calendar').fullCalendar('addEventSource', '/projectmain/CalendarOthersFromDBServlet');
						// 	$('#calendar').fullCalendar('renderEvent');
   				});
			</script>
	
			<div id="wrap"> 
				<!-- 	外部事件框 -->
				<div id="external-events">
					<h4>Draggable Events</h4>
						<p>
						</p>
				</div>
<!-- 			    	匯入聊天對話框 -->
	<jsp:include page="/references/chatPahoStudent.jsp" />
				<div id='calendar' class="fc fc-ltr fc-unthemed" ></div>
			
			</div>
		</div>
    </div>
    <!-- /.container -->

   <!-- 匯入js -->
	<jsp:include page="/references/foot_resources_js.jsp" />

</body>
</html>

