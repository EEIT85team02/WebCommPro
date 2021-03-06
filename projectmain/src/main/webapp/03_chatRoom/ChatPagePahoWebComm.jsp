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
	<jsp:include page="/references/head_resources_cssB.jsp" />
	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>聊天室</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/supersized.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/supersized.shutter.css" type="text/css" media="screen" />

<!-- 		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script> -->
<!-- 		<script type="text/javascript" src="../js/jquery.easing.min.js"></script> -->
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/supersized.3.2.7.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/theme/supersized.shutter.min.js"></script>
		<script type="text/javascript">
			
			jQuery(function($){
				
				$.supersized({
				
					// Functionality
					slideshow               :   1,			// Slideshow on/off
					autoplay				:	1,			// Slideshow starts playing automatically
					start_slide             :   0,			// Start slide (0 is random)
					stop_loop				:	0,			// Pauses slideshow on last slide
					random					: 	0,			// Randomize slide order (Ignores start slide)
					slide_interval          :   3000,		// Length between transitions
					transition              :   1, 			// 0-None, 1-Fade, 2-Slide Top, 3-Slide Right, 4-Slide Bottom, 5-Slide Left, 6-Carousel Right, 7-Carousel Left
					transition_speed		:	1000,		// Speed of transition
					new_window				:	1,			// Image links open in new window/tab
					pause_hover             :   0,			// Pause slideshow on hover
					keyboard_nav            :   1,			// Keyboard navigation on/off
					performance				:	1,			// 0-Normal, 1-Hybrid speed/quality, 2-Optimizes image quality, 3-Optimizes transition speed // (Only works for Firefox/IE, not Webkit)
					image_protect			:	1,			// Disables image dragging and right click with Javascript
															   
					// Size & Position						   
					min_width		        :   0,			// Min width allowed (in pixels)
					min_height		        :   0,			// Min height allowed (in pixels)
					vertical_center         :   1,			// Vertically center background
					horizontal_center       :   1,			// Horizontally center background
					fit_always				:	0,			// Image will never exceed browser width or height (Ignores min. dimensions)
					fit_portrait         	:   1,			// Portrait images will not exceed browser height
					fit_landscape			:   0,			// Landscape images will not exceed browser width
															   
					// Components							
					slide_links				:	'blank',	// Individual links for each slide (Options: false, 'num', 'name', 'blank')
					thumb_links				:	1,			// Individual thumb links for each slide
					thumbnail_navigation    :   0,			// Thumbnail navigation
					slides 					:  	[			// Slideshow Images
					       					   	 		{image : '../img/background.jpg', title : 'Image Credit: Maria Kazvan', thumb : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/kazvan-1.jpg'},
														{image : '../img/background2.jpg', title : 'Image Credit: Maria Kazvan', thumb : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/kazvan-2.jpg'},  
														{image : '../img/background3.jpg', title : 'Image Credit: Maria Kazvan', thumb : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/kazvan-3.jpg'},
														{image : '../img/background3.jpg', title : 'Image Credit: Colin Wojno', thumb : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/wojno-1.jpg'},
														{image : '../img/background4.jpg', title : 'Image Credit: Colin Wojno', thumb : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/wojno-2.jpg'},
														{image : '../img/background5.jpg', title : 'Image Credit: Colin Wojno', thumb : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/wojno-3.jpg'},
														{image : '../img/background6.jpg', title : 'Image Credit: Colin Wojno', thumb : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/wojno-3.jpg'}
												],
												
					// Theme Options			   
					progress_bar			:	1,			// Timer for each slide							
					mouse_scrub				:	0
					
				});
		    });
		    
		</script>
<!-- bootstrap巡覽列要用 -->
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap-theme.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/bootstrap/bootstrap.min.js"></script>

<!-- 匯入LikeHangoutChat資源 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/LikeHangoutChat/css/LikeHangoutChat.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/LikeHangoutChat/js/LikeHangoutChat.js"></script>


<style>

.navbar-inverse {
    background-image: linear-gradient(to bottom,#E4C00D 0,rgba(249, 68, 27, 0.97) 100%);
}

#ptitle{
	text-align:center;
	font-size:50px;
	font-weight: bold;
	font-family:"Microsoft JhengHei";
	color:#008888;
}
body {
    font-family: "Microsoft JhengHei","Lato","Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 20px;
    line-height: 1.42857143;
    color: #4d6384;
    background-color: #ffffff;
    font-weight: bold;
}


</style>
</head>
	<!-- 匯入js -->
	<jsp:include page="/references/head_resources_js.jsp" />
	
	
<body>
<div class="container">
	<!-- 匯入功能表列 -->
	<jsp:include page="/top/ExamierTop.jsp" />

      <div class="starter-template">
        <p id="ptitle">聊天室</p>
<!--         <p class="lead">目前聊天室仍為測試階段, 工作人員正盡力趕修中. <br> 使用過程中可能發生連線不穩定或異常斷線的情況,敬請見諒! </p> -->

<div class="stuList"></div>


<!--   按鈕 -->
<!-- <input checked data-toggle="toggle" type="checkbox"> -->
<!-- <input checked data-toggle="toggle" type="checkbox"> -->
<!-- <input checked data-toggle="toggle" type="checkbox"> -->
<!-- <input checked data-toggle="toggle" type="checkbox"> -->
<!-- <input checked data-toggle="toggle" type="checkbox"> -->



</div>
<!--  <div class="btn-group"> -->
<!--   <button type="button" class="btn btn-primary">Apple</button> -->
<!--   <button type="button" class="btn btn-primary">Samsung</button> -->
<!--   <div class="btn-group"> -->
<!--     <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"> -->
<!--     Sony <span class="caret"></span></button> -->
<!--     <ul class="dropdown-menu" role="menu"> -->
<!--       <li><a href="#">Tablet</a></li> -->
<!--       <li><a href="#">Smartphone</a></li> -->
<!--     </ul> -->
<!--   </div> -->
<!-- </div> -->
<!-- 連線需要的資訊 設定 -->
<!-- <div> -->
<!--   <form class="form-horizontal" role="form"> -->
<!--     <div class="form-group"> -->
<!--       <label class="col-sm-2 control-label">考生姓名</label> -->
<!--       <div class="col-sm-10"> -->
<!--         <input class="form-control" id="focusedInput" type="text" value="請輸入考生姓名"> -->
<!--       </div> -->
<!--     </div> -->
<!-- </form>  -->

<!-- 連線按鈕 -->
<!--  <div class="form-group">         -->
<!--       <div class="col-sm-offset-2 col-sm-10"> -->
<!--         <button type="submit" class="btn btn-default" onclick="setStudentChannel();" >Connect</button> -->
<!--       </div> -->
<!--     </div> -->

<!-- 聊天訊息框 -->
    <div class="row chat-window col-xs-5 col-md-3" id="chat_window_1" style="margin-left:10px;">
        <div class="col-xs-12 col-md-12">
        	<div class="panel panel-default">
				<!-- 標題框框 -->
                <div class="panel-heading top-bar">
                    <div class="col-md-8 col-xs-8">
<!--                         <h3 class="panel-title"><span class="glyphicon glyphicon-comment"></span> Chat - Miguel</h3> -->
                        <h3 class="panel-title"><span class="glyphicon glyphicon-comment"></span></h3>
                    </div>
                    <div class="col-md-4 col-xs-4" style="text-align: right;">
						<!-- 小視窗 -->
							<!-- 初始設為關閉 -->
                        <a href="#"><span id="minim_chat_window" class="glyphicon icon_minim panel-collapsed glyphicon-plus"></span></a>
                        <a href="#"><span class="glyphicon glyphicon-remove icon_close" data-id="chat_window_1"></span></a>
                    </div>
                </div>
                <div style="display: none;" class="panel-body msg_container_base" id="insertMessage">
					
					
<!--   </form> -->
<!-- 				<某個對話> -->
<!-- 寫一支創造Html標籤 同時又可以塞入內容的函式 -->


				
				</div>
				<div id="footPosition"></div>
 <div class="panel-footer">
                    <div class="input-group">
                        <input id="btn-input" type="text" class="form-control input-sm chat_input" placeholder="Write your message here..." />
                        <span class="input-group-btn">
                        <button class="btn btn-primary btn-sm" id="btn-chat" onclick="publish_message();">Send</button>
                        </span>
                    </div>
                </div>
    		</div>
	    </div>
    </div>
    <div class="btn-group dropup">
        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
            <span class="glyphicon glyphicon-cog"></span>
            <span class="sr-only">Toggle Dropdown</span>
        </button>
        <ul class="dropdown-menu" role="menu">
            <li><a href="#" id="new_chat"><span class="glyphicon glyphicon-plus"></span> Novo</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-list"></span> Ver outras</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-remove"></span> Fechar Tudo</a></li>
            <li class="divider"></li>
            <li><a href="#"><span class="glyphicon glyphicon-eye-close"></span> Invisivel</a></li>
        </ul>
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

<!-- MQTT專用 -->
<script src="../LikeHangoutChat/js/mqttws31.js"></script>
<script type="text/javascript">
	
	
	
		/*
		 * Paho
		 */
		 
		 
		 
// 考生自己訂閱自己的專屬頻道  考官可以依照心情點選要連接的頻道		 
// const TOPIC = "tw/admin/";// 目前先寫死 只為admin考生服務
 var studentName="";// 當作頻道在用
  TOPIC = "tw/"+studentName+"/";// 目前先寫死 只為admin考生服務
	// 應該可以用TOPIC控制談話的對象以及時機
	// 考官可以決定是否要打開TOPIC、或者切換不同TOPIC
	
	
	
	// 發送的頻道
	var qosSend = 0;
	// 訂閱的頻道
	var qosGet = 0;

	var client = false;

	//	取出姓名 (from session)
	var userNamejsp = "${sessionScope.userId}";	
	
	
	
	// Options (for Paho client Object)
 	var options = {
	//  useSSL: true,
      timeout: 10,

			
	  // 成功	另一種寫法 		{onSuccess:onConnect}
      onSuccess: 
      	function () {
	        console.log("mqtt connected");
	        console.log("TOPIC : "+TOPIC);
      		onConnect();
      },
      
	  // 使用者資訊      
      userName: "Student"+userNamejsp,
      password: "password",
      
      // 失敗
      onFailure: function (message) {
        console.log("Connection failed: " + message.errorMessage);
      }
      
    };

	
	
	function disConnect(unTopic){
		console.log("準備取消訂閱\n"+unTopic);
		client.unsubscribe(unTopic+ "#");
    	console.log("取消訂閱");
    	TOPIC = "tw/"+""+"/";
    	
    	
	};
	
// 用戶端成功連接 broker 時...
function onConnect() {
    console.log("onConnect then subscribe topic");
    // 確認連接後，才能訂閱主題
	// 訂閱		另一種寫法		  client.subscribe('tw/rocksaying/', {qos: 0});
    client.subscribe(TOPIC + "#",{qos:qosGet});
}

// 收到訊息時...
function onMessageArrived(message) {
		// 1.沒有串接 也沒有頻道名稱
//     document.getElementById("mqtt_monitor").innerHTML = message.payloadString;
		// 2.沒有串接 有頻道名稱
//     document.getElementById("messages").innerHTML = "<br>"+userNamejsp+message.qos+":" +message.payloadString;
		// 3.加入發言者自己的名字
//     document.getElementById("messages").innerHTML += "<br>"+userNamejsp+message.qos+":" +message.payloadString;
		
		// 4.去掉自己名字 應換成發言者的名字
		// 只取:前面即 發話來源名字
		var nameWithContent = message.payloadString;
		
		var messageArray = nameWithContent.trim().split(":");
		// 發話者名字
		var messageSource = messageArray[0];
		console.log("發話者\n"+messageSource);
		console.log("自己\n"+userNamejsp);
		// 發話內容
		var messageSourceContent = messageArray[1];
		console.log("發話內容\n"+messageSourceContent);
// 		isMyselfMessage = messageSource==userNamejsp?console.log('from myself'):console.log('from other');
		
		// 此發話者是否是自己?
		var isMyselfMessage="";
		isMyselfMessage = messageSource.trim()==userNamejsp.trim()?"1":"0";
		console.log("是否是自己的訊息?\n"+isMyselfMessage);




		// ●外部函數		
		// 如果是別人的通知才需要通知提醒
		if(isMyselfMessage=="0"){
			// 增加提醒標記
			addBadge("notificationStr", "unreadNumber");	// 先寫死
		}
		
		
		
		
		// ●外部函數		
		// 製造HTML標籤 
		//	@messageSourceContent	發言內容
		//	@isMyselfMessage		是否是自己的發言
		if(isMyselfMessage=="0"){// 如果是別人送來的訊息 則要附上名稱 (仿照Line)
			var messageWithElement = createHTMLElement(messageSource+messageSourceContent,isMyselfMessage);
// 			var messageWithElement = createHTMLElement(userNamejsp+messageSourceContent,isMyselfMessage);
		}else{
			var messageWithElement = createHTMLElement(messageSourceContent,isMyselfMessage);
		}
		// 訊息框元素 
		var chatWindow_Q = $("#insertMessage");
// 		$("#insertMessage").append(messageWithElement);

		// 插入訊息內容
		chatWindow_Q.append(messageWithElement);
		
		// jQuery1.6之後支援 scrollHeight屬性	請參考: http://stackoverflow.com/questions/10503606/scroll-to-bottom-of-div-on-page-load-jquery
		console.log(chatWindow_Q.prop("scrollHeight"));
		// 將訊息框的位置調整到最底端 (顯示最新訊息) 
		chatWindow_Q.scrollTop(chatWindow_Q.prop("scrollHeight"));
		
		
//     document.getElementById("messages").innerHTML += "<br>" + message.payloadString;
};

// 發佈訊息...
function publish_message() {
	console.log("發送的TOPIC\n"+TOPIC);
	// 取得待發訊息
	var readyToSend = $("#btn-input").val();
	// 清空訊息欄位
	$("#btn-input").val("");
	
	// console.log("readyToSend"+ readyToSend);

	// 內容  + 名字
    var payload = userNamejsp + " : " +readyToSend;
	// console.log("payload"+payload);
	// var payload = userNamejsp + " : " +document.getElementById("txt").value;
	
	// Paho 定義的 Message 物件
    var message = new Paho.MQTT.Message(payload);
	// console.log("message"+message)
	
	// 發佈到指定Topic
    message.destinationName = TOPIC;
    // 希望能使用qos來控制談話的品質
    message.qos = qosSend;
	// message.destinationName = TOPIC + "text";
    
	// 發佈
    client.send(message);
};

// 初始化...
function init() {
	// Paho 定義的 client 物件
    client = new Paho.MQTT.Client("ws://iot.eclipse.org/ws", userNamejsp);
	
    // 建立 MQTT 用戶端實體. 你必須正確寫上你設置的埠號.
	// client = new Paho.MQTT.Client("ws://localhost:11883/", "myClientId");

    
    // 指定收到訊息時的處理動作
    client.onMessageArrived = onMessageArrived;

    // 連接 MQTT broker
    client.connect(options);
	// client.connect();
	// client.connect({onSuccess:onConnect});
};



// 當window onload 時 初始化
window.addEventListener('load', init, false);
// $(document).ready(sendMessageStuList("${sessionScope.userId}"));
// 按下enter也發送訊息		
$("#btn-input").keydown(function(e) {
                if (e.keyCode == 13) {
                console.log("keydown")
                    publish_message();
                }
            });


	</script>
<!-- 	 </div> -->
	 </div>
	 
    </div><!-- /.container -->


   <!-- 匯入js -->
	<jsp:include page="/references/foot_resources_js.jsp" />

	
</body>
</html>
