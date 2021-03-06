<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- <div class="container"> -->
	<!-- 匯入功能表列 -->
<!--       <div class="starter-template"> -->
<!--         <h1>MQTT Paho聊天室實作</h1> -->
<!--         <p class="lead">目前聊天室仍為測試階段, 工作人員正盡力趕修中. <br> 使用過程中可能發生連線不穩定或異常斷線的情況,敬請見諒! </p> -->

<div id="chatSection" style="display:none">
 <div class = "chat-windowOut" style="z-index:10">
    <div class="row chat-window col-xs-8 col-sm-5 col-md-3 col-lg-3" id="chat_window_1" style="margin-left:10px;">
<!--     <div class="row chat-window col-xs-3 col-sm-3 col-md-3 col-lg-3" id="chat_window_1" style="margin-left:10px;"> -->
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        	<div class="panel panel-default">
				<!-- 標題框框 -->
                <div class="panel-heading top-bar">
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
<!--                         <h3 class="panel-title"><span class="glyphicon glyphicon-comment"></span> Chat - Miguel</h3> -->
                        <h3 class="panel-title"><span class="glyphicon glyphicon-comment"></span></h3>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" >
<!--                     <div class="col-md-4 col-xs-4" style="text-align: right;"> -->
						<!-- 小視窗 -->
							<!-- 初始設為關閉 -->
                        <a href="#"><span id="minim_chat_window" class="glyphicon icon_minim panel-collapsed glyphicon-plus"></span></a>
                        <a href="#"><span class="glyphicon glyphicon-remove icon_close" data-id="chat_window_1"></span></a>
                    </div>
                </div>
                <div style="display: none;" class="panel-body msg_container_base" id="insertMessage">
					
					
<!-- 				<某個對話> -->
<!-- 寫一支創造Html標籤 同時又可以塞入內容的函式 -->


				
				</div>
				<div id="footPosition"></div>
 <div class="panel-footer">
                    <div class="input-group">
                        <input id="btn-input" type="text" class="form-control input-sm chat_input" placeholder="請輸入訊息..." />
                        <span class="input-group-btn">
                        <button class="btn btn-primary btn-sm" id="btn-chat" onclick="publish_message();">送出</button>
                        </span>
                    </div>
                </div>
    		</div>
	    </div>
    </div>
<!--     <div class="btn-group dropup"> -->
<!--         <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"> -->
<!--             <span class="glyphicon glyphicon-cog"></span> -->
<!--             <span class="sr-only">Toggle Dropdown</span> -->
<!--         </button> -->
<!--         <ul class="dropdown-menu" role="menu"> -->
<!--             <li><a href="#" id="new_chat"><span class="glyphicon glyphicon-plus"></span> Novo</a></li> -->
<!--             <li><a href="#"><span class="glyphicon glyphicon-list"></span> Ver outras</a></li> -->
<!--             <li><a href="#"><span class="glyphicon glyphicon-remove"></span> Fechar Tudo</a></li> -->
<!--             <li class="divider"></li> -->
<!--             <li><a href="#"><span class="glyphicon glyphicon-eye-close"></span> Invisivel</a></li> -->
<!--         </ul> -->
<!--     </div> -->
    </div>
</div>

<!-- MQTT專用 -->
<!-- <script src="../mqttws31.js"></script> -->
<script type="text/javascript">
	
	
	
		/*
		 * Paho
		 */
// 		 var topicTemp = "tw/"+"${sessionScope.userId}/";


// 考生自己訂閱自己的專屬頻道  考官可以依照心情點選要連接的頻道
const TOPIC = "tw/"+"${sessionScope.userId}/";
// const TOPIC = "tw/${sessionScope.userId}";
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

	
	
	
	
// 用戶端成功連接 broker 時...
function onConnect() {
    console.log("onConnect then subscribe topic");
    // 確認連接後，才能訂閱主題
	// 訂閱		另一種寫法		  client.subscribe('tw/rocksaying/', {qos: 0});
    console.log(TOPIC);
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

		console.log("typeof(messageSourceContent)===="+typeof(messageSourceContent));
		console.log("messageSourceContent.length===="+messageSourceContent.length);
		if(messageSourceContent.trim()==="OPEN"){
			console.log("messageSourceContent===OPEN");			
// 			$("#chatSection").attr("style","display").text  = '';
			$("#chatSection").show();
		}
		if(messageSourceContent.trim()==="CLOSE"){
			console.log("messageSourceContent===CLOSE");			
// 			$("#chatSection").attr("style","display").text  = 'none';
			$("#chatSection").hide();
		}
			
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
		
// 按下enter也發送訊息		
$("#btn-input").keydown(function(e) {
                if (e.keyCode == 13) {
                console.log("keydown")
                    publish_message();
                }
            });


	</script>
<!-- 	 </div> -->
<!-- 	 </div> -->
	 
<!--     </div>/.container -->


   
