/**
 * 參考: http://bootsnipp.com/snippets/featured/like-hangout-chat 
 * 關於bootstrap 的 Panel 可參考:http://www.w3schools.com/bootstrap/bootstrap_panels.asp 
 */


$(document).on('click', '.panel-heading span.icon_minim', function (e) {
    var $this = $(this);
    // 若狀態 不 為 【已潰縮】
    if (!$this.hasClass('panel-collapsed')) {
    	// 遮擋展開【對話框下縮】
        $this.parents('.panel').find('.panel-body').slideUp();
        // 改變狀態為 【已潰縮】
        $this.addClass('panel-collapsed');
        // 改變圖示為【+】
        $this.removeClass('glyphicon-minus').addClass('glyphicon-plus');
    } else {
    	// 遮擋下縮【對話框彈起】
        $this.parents('.panel').find('.panel-body').slideDown();
        // 改變狀態為 【潰縮】
        $this.removeClass('panel-collapsed');
        // 改變圖示為【-】
        $this.removeClass('glyphicon-plus').addClass('glyphicon-minus');
        
        
        // ●●●●●●●●●打開以後 復原標籤列
        recoverPanelTitle();
        
        
        // 先刪除舊的button
//        $("h3.panel-title button").remove();
//    		// 變色【復元】
//    	$(".panel-heading, .top-bar").css({"background-color": "#f5f5f5", "color": "#333"});
        
        
        
    }
});


$(document).on('focus', '.panel-footer input.chat_input', function (e) {
    // ●●●●●●●●●打開以後 復原標籤列
    recoverPanelTitle();
	
    var $this = $(this);
    if ($('#minim_chat_window').hasClass('panel-collapsed')) {
        $this.parents('.panel').find('.panel-body').slideDown();
        $('#minim_chat_window').removeClass('panel-collapsed');
        $('#minim_chat_window').removeClass('glyphicon-plus').addClass('glyphicon-minus');
    }
});


$(document).on('click', '#new_chat', function (e) {
    var size = $( ".chat-window:last-child" ).css("margin-left");
     size_total = parseInt(size) + 400;
    alert(size_total);
    var clone = $( "#chat_window_1" ).clone().appendTo( ".container" );
    clone.css("margin-left", size_total);
});


$(document).on('click', '.icon_close', function (e) {
    //$(this).parent().parent().parent().parent().remove();
    $( "#chat_window_1" ).remove();
});



// ●●●●●●●●●製造  HTML 專門給聊天框框用的函式
function createHTMLElement(messageContent, isMyselfMessage){
//function createHTMLElement(messageContent){
//	var messageInput="fakeMessage";
	var bsase = "";
	var msg = "";
	console.log("isMyselfMessage"+typeof(isMyselfMessage));
	
	// 改變CSS
	// 訊息是自己發的
	if(isMyselfMessage=="1"){
		base = "base_sent";
		msg = "msg_sent";
	// 訊息是別人發的
	} else{
		base = "base_receive";
		msg = "msg_receive"; 
			
	}

	
	// ●●●●●●●●●不清楚為何三元運算不能用
//	bsase = isMyselfMessage =="1"?"base_sent":"base_receive";
//	 msg = isMyselfMessage =="1"?"msg_sent":"msg_receive";
	
	
	// ●●●●●●●●●不小心沒加上 var 結果變成全域變數 害死我...
	var messageInput = messageContent;
	var ele1 = document.createElement("div");
//	var ele1Class = "row msg_container "+base;
	
//	ele1.className = ele1Class;
//	ele1.className = "row msg_container base_sent";
	ele1.className = "row msg_container" + " "+base;
	
 
	var ele2 = document.createElement("div");
	ele2.className = "col-md-10 col-xs-10";
	
	var ele3 = document.createElement("div");
	ele3.className = "messages "+" "+msg;
//	ele3.className = "messages msg_sent";
	
	
	
	var ele4 = document.createElement("div");
	ele4.className = "col-md-2 col-xs-2 avatar";
	
	
	var eleP = document.createElement("p");
	var text = document.createTextNode(messageInput);
	eleP.appendChild(text);
	
	
	ele3.appendChild(eleP);
	
	
	var eleTime = document.createElement("time");
	var nowTime = new Date();
//	eleTime.setAttribute("datetime", "2017-02-14");
	eleTime.setAttribute("datetime", nowTime.toString());
//	eleTime.setAttribute("datetime", new Date().getTime());
//	var textT = document.createTextNode("Timothy51min");
	var textT = document.createTextNode(nowTime.toString());
	eleTime.appendChild(textT);
//	ele2.appendChild(ele3);
//	ele1.appendChild(ele2);
	
	ele3.appendChild(eleTime);
	
	var eleImage = document.createElement("img");
	eleImage.className = "img-responsive";
	ele4.appendChild(eleImage);
		// 訊息是自己發的
	if(isMyselfMessage=="1"){
//		eleImage.setAttribute("src", "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTyyeNFb9UyIHwUuGlqFFuZjXTyGDx80DCdgK65SwqH389Do4SVLQ");			// 待續
		eleImage.setAttribute("src", "/projectmain/LikeHangoutChat/img/student.png");			// 待續
		ele2.appendChild(ele3);
		ele1.appendChild(ele2);
		ele1.appendChild(ele4);
		// 訊息是別人發的
	}else{
//		eleImage.setAttribute("src", "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQRZhELNV1_8yF6K4IusYiAykQijhlT2DUwOJzBsesQmWJzu3ix");			// 待續
		eleImage.setAttribute("src", "/projectmain/LikeHangoutChat/img/student.png");			// 待續
		ele1.appendChild(ele4);
		ele2.appendChild(ele3);
		ele1.appendChild(ele2);
	}
	return ele1;
	
	
	/*
	var ele1 = $(document).createElement("div");
	ele1.className = "row msg_container base_sent";
	
	
	var ele2 = $(document).createElement("div");
	ele2.className = "col-md-10 col-xs-10";
	
	var ele3 = $(document).createElement("div");
	ele3.className = "messages msg_sent";
	
	
	
	var ele4 = $(document).createElement("div");
	ele4.className = "col-md-2 col-xs-2 avatar";
	
	
	var eleP = $(document).createElement("p");
	var text = $(document).createTextNode(messageContent);
	eleP.appendChild(text);
	ele3.appendChild(eleP);
	
	
	
	var eleT = $(document).createElement("time");
	eleT.setAttribute("datetime", new Date().getTime())
	eleT.appendChild("多久以前...待續");
	ele3.appendChile(eleT);
	ele2.appendChild(ele3);
	ele1.appendChild(ele2);
	
	
	var eleImage = $(document).createElement("img");
	eleImage.setAttribute("src", "#");			// 待續
	ele4.appendChild(eleImage);
	ele1.appendChild(ele4);
	console.log(ele1);
	return ele1;
	
	*/
	
	
	
	
	//<div class="row msg_container base_sent">				//ele1
		//<div class="col-md-10 col-xs-10">				//ele2
			//<div class="messages msg_sent">		//ele3
			//	<!-- 內容 -->
	//			<p>that mongodb thing looks good, huh? tiny master db, and huge document store</p>
			//	<!-- 時間 -->
			//	<time datetime="2009-11-13T20:00">Timothy ‧ 51 min</time>
	
			//</div>								//ele3
		//</div>										//ele2
		//<div class="col-md-2 col-xs-2 avatar">		//ele4
			//<img src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg" class=" img-responsive ">
		//</div>
	
	//</div>												//ele1
};





// ●●●●●●●●●增加通知標籤
function addBadge(notificationStr, unreadNumber){            
	// 如果已經有 就累加數字 不增加按鈕了!
	var isNotified = $("h3.panel-title button");
	
	var unreadNumber = 1;			// 先寫死
	var notificationStr =  "訊息通知";	// 
	var notiLength = $("span.badge").text().trim().length;
//	$("button span:nth-child(2)")
	
	
	
//	console.log("通知數量型別"+typeof($("span.badge").text()));
//	console.log("通知數量內容"+$("span.badge").text().trim());
	
	
	
	// 難道parseInt只能一次?
	var badgeNum = parseInt($("span.badge").text());
	
//	console.log("通知數量型別【轉型】"+typeof(badgeNum));
//	console.log("通知數量內容【轉型】"+badgeNum);
	
	
	/*
	 *	如果是數字 	一開始轉型沒內容 但是型態為number 所以會強制進入 
	 *	然而進入以後卻又強行加一 結果還是非數字
	 *	為了避開第一次抓取的值有問題 所以先抓取字串長度 有問題的長度就是0 
	*/
	if(notiLength!=0){
		// 則累加
		unreadNumber = badgeNum+1;
	}
	
	
	// 先刪除舊的button
	isNotified.remove();


	// 建立span標籤 (通知內容)
	var notiContent = $("<span></span>").addClass("badge").text(""+unreadNumber);
	// 建立button標籤 (通知本體)
	var notiButton  = $("<button></button>").prop("type","button").addClass("btn btn-primary").text(notificationStr).append(notiContent); 

	
	// 塞入空標籤
	$("h3.panel-title").append(notiButton);
	//  $(".panel-heading, .top-bar").append();	
	
	
	// 變色
	changePanelTitle();
	// 變色
//	$(".panel-heading, .top-bar").css({"background-color": "#337ab7", "color": "#FCFCFC"});
//	$(".glyphicon-minus, .icon_close, .glyphicon-plus").css({"color": "#FCFCFC"});

	};


	
	
	
	// ●●●●●●●●●變色標籤列函式
function changePanelTitle(){
	// 變色
	$(".panel-heading, .top-bar").css({"background-color": "#337ab7", "color": "#FCFCFC"});
	$(".glyphicon-minus, .icon_close, .glyphicon-plus").css({"color": "#FCFCFC"});
};	
	

	// ●●●●●●●●●復原標籤列函式
function recoverPanelTitle(){
	
    // 先刪除舊的button
    $("h3.panel-title button").remove();
		// 變色【復元】
	$(".panel-heading, .top-bar").css({"background-color": "#f5f5f5", "color": "#333"});
	$(".glyphicon-minus, .icon_close, .glyphicon-plus").css({"color":"black"})
	
};

// ●●●●●●●●●指定考生函式
function setStudentChannel(subscribeName){
	console.log(TOPIC);
	// 全域變數設為 
//	var subscribeName = $("#focusedInput").val();
	TOPIC = "tw/"+subscribeName+"/";
	console.log(TOPIC);
	// 重新連結
	onConnect();// 但是還沒有把不要訂閱的考生給清掉
}

// ●●●●●●●●●取消訂閱函式
function closeStudentChannel(unSubscribeName){
	var unTopic = "tw/"+unSubscribeName+"/";
	disConnect(unTopic);
};

