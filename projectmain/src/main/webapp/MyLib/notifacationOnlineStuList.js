/**
 * 1.
 * 2. 推播考生名單 (上線)
 */


// 推播日曆事件
/*
	function bookingNotification(pushAeventObject, styleNo){
		switch (styleNo){
		case 0:
			// 執行
			$('#calendar').fullCalendar('renderEvent', {
		    	"start": "Jun 2, 2016 12:00:00 AM",
		    	"allDay": true,
				"rendering":'background',
				"backgroundColor":'purple',	    
		    	"title": "重要事項000",
		    	"orderId": 0,
		    	"id": null,
		    	"overlap": false,
		    	"droppable": false,
//		    	"defaultTimedEventDuration" : '01:00:00',
		    	"end": "Jun 3, 2016 12:00:00 AM",
		    	"color": "black"
		  	},true);
		break;
			
		case 1:
			// 使用Obj操作的寫法
			// 做一個切換rendering的按鈕 
			// 1. 設為背景: true
			// 2. 設為token: false
			var isBackgroundRender = false;
			// rendering必須加上allDay屬性
			pushAeventObject.allDay = true;
			// rendering屬性為background
			pushAeventObject.rendering = isBackgroundRender?'background':'';
			pushAeventObject.backgroundColor = 'black';
			pushAeventObject.title = '已定位';
			pushAeventObject.borderColor = 'black';
			pushAeventObject.textColor = 'yellow';
			pushAeventObject.editable = false;
			pushAeventObject.overlap = false;
			pushAeventObject.id = 0;
			// 執行
			$('#calendar').fullCalendar('renderEvent', pushAeventObject,true);
		break;
			
			
		case 2:
			// 使用CSS的寫法
			var newOtherEvent = {
				'start': pushAeventObject.start,
//				'allDay': true,
//				"overlap": false,
//				'rendering': 'background',
				'backgroundColor':'silver',
				'end': pushAeventObject.end,
				'title':'已定位',
				'textColor':'white',
				'borderColor':'black',
				'editable':false,
				'overlap':true
//				'id': 0
			};
			// 執行
			$('#calendar').fullCalendar('renderEvent', newOtherEvent, true);
		break;
		
	case 3:
		pushAeventObject.editable = false;
		pushAeventObject.color = "black";
		
		// 使用CSS的寫法
		var newOtherEvent = pushAeventObject;
		// 執行
		$('#calendar').fullCalendar('renderEvent', newOtherEvent, true);
		break;
	}
	}
	
	*/
	
	

	
	
	
// 	●●●●●●●●. WebSocket================
	var wsStuList = new WebSocket("ws://" + document.location.host + "/projectmain/chat.do");
	// ●●.註冊【建立連線】事件
	wsStuList.onopen = function(){
			console.log('0000-->StuList--建立連線成功');
			/**
			 * 為了要刷新考生在線清單
			 */
			sendMessageStuList("");
		}
	
	
	// ●●.註冊【接收訊息】事件
	wsStuList.onmessage = function(data) {
		console.log("2222-->StuList--接收訊息\n"+data);
		// 接到後切成array
		var studentList = data.data.trim().trim("[").trim("]").split(",");
		createToggleCheckbox(studentList);
	}

	// ●●.註冊【發送訊息】事件
	function sendMessageStuList(data) {
		console.log("1111-->StuList--發送訊息\n"+data);
		//將輸入內容送到websocket物件
		wsStuList.send(data);//websocket自己的方法
	}


	// ●●.註冊【切斷連線】事件
	function closeSocketStuList() {
		console.log("0000-->StuList--關閉連線\n");
		
		wsStuList.close();
	}
	
	function excludeStuList(){
//		wsStuList.send("CLOSEmicky");
	}
	
	
	
	
	function createToggleCheckbox(studentList){
		var stuList = $(".stuList .toggle");
		console.log(stuList);
		if(stuList!=null){
			// 清空
			stuList.remove();
		}
		console.log(studentList);
		$.each(studentList,function(i,data){
			// 因為名單中有""的人 要去除
			if(data.length>0){	
				var eleToggle = $("<input>").attr("type","checkbox").attr("value",data);
				// 填充
				$(".stuList").append(eleToggle);
				// 利用 api 轉換成bootstrap 的toggle按鈕 
				// 請參考:http://www.bootstraptoggle.com/
				eleToggle.bootstrapToggle({
//					on:"啟動",
					// 利用考生名稱作為按鈕資訊
					on:data+" 顯示",
					off:data+" 不顯示"
				});
				eleToggle.change(function(){
//					alert("按鈕改變");
//					alert($(this).attr("value"));
//					TOPIC = $(this).attr("value")
					
					 var isChecked = $(this).prop("checked");
					 console.log(isChecked);
					 if(isChecked){
						 //設定為該對象

						 setStudentChannel($(this).attr("value"));
						 $("#btn-input").val("OPEN");
						 publish_message();
					 }else{
						 //設定為自己
						 $("#btn-input").val("CLOSE");
						 publish_message();
						 closeStudentChannel($(this).attr("value"));
					 }
				});
			}
		});
	}
	
	
	
	
