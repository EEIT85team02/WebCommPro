<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty LoginOK}">
	<c:set var="target" value="${pageContext.request.servletPath}"
		scope="session" />
	<c:redirect url="/01_login/LoginBegin.jsp" />
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 匯入css -->
	<jsp:include page="/references/head_resources_css.jsp" />
	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WebSocket聊天室</title>
<style type="text/css">
input#txt {
	width: 410px
}

#message {
	width: 400px;
}

#message-container {
	border: 1px solid #CCCCCC;
	border-right-color: #999999;
	border-bottom-color: #999999;
	height: 170px;
	overflow-y: scroll;
	padding: 5px;
	width: 100%;
}

#console p {
	padding: 0;
	margin: 0;
}
</style>
</head>
	<!-- 匯入js -->
	<jsp:include page="/references/head_resources_js.jsp" />
	
	
<body>
<div class="container">
	<!-- 匯入功能表列 -->
	<jsp:include page="/references/navigator.jsp" />

      <div class="starter-template">
        <h1>WobSocket聊天室實作</h1>
        <p class="lead">目前聊天室仍為測試階段, 工作人員正盡力趕修中. <br> 使用過程中可能發生連線不穩定或異常斷線的情況,敬請見諒! </p>

	<!-- 聊天元件 -->
	<div class="noscript"><h2 style="color: #ff0000">聊天室實作</h2></div>
	<input type="text" id="txt">
	<input type="button" id="btn" value="Send" onclick="sendMessage();">
	<input type="button" id="btnClose" value="Close"
		onclick="closeSocket();"><br>
	<div id="message-container">
		<div id="messages"></div>
	</div>
	<c:forEach var='name' items='${pageContext.session.attributeNames}'>
		<%-- <c:if test="${name}=='userId'">
</c:if>
${name}
${name}<br>
--%>
<c:if test="${name}=='userId'">
	${userId}
</c:if>
	</c:forEach>

	<script type="text/javascript">
		var ws = new WebSocket("ws://" + document.location.host + "//projectmain/chat.do");
		//按下enter
		ws.onopen = function(){
			document.getElementById('txt').onkeydown = function(e) {
                if (e.keyCode == 13) {
                    sendMessage();
                }
            };
		}
		
		//收訊息
		ws.onmessage = function(e) {
			//訊息Pool
			var messages = document.getElementById('messages');
			//插入新訊息(來自於event 從websocket的onmessage)
			messages.innerHTML += e.data;
		}

		//發言
		function sendMessage() {
			//取得輸入內容
			var txt = document.getElementById('txt');
			//將輸入內容送到websocket物件
			ws.send(txt.value);//websocket自己的方法
			//清空
			document.getElementById('txt').value='';
		}

		//離開
		function closeSocket() {
			ws.close();
		}
	</script>
	 </div>
    </div><!-- /.container -->


   <!-- 匯入js -->
	<jsp:include page="/references/foot_resources_js.jsp" />

	
</body>
</html>