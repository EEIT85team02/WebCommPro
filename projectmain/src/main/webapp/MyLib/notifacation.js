/**
 * 1. 推播函數
 * 2. 迭代印出Object或是Array所有東西
 */


// 推播日曆事件
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
	
	
	
	

	
	
	
// 	●●●●●●●●. WebSocket================
	var ws = new WebSocket("ws://" + document.location.host + "//projectmain/booking.do");
	// ●●.註冊【建立連線】事件
	ws.onopen = function(){
		console.log("0000-->notifacation--建立連線成功\n");
		}
	
	
	// ●●.註冊【接收訊息】事件
	ws.onmessage = function(data) {
		console.log("2222-->notifacation--接受訊息\n"+data);
		var pushAevent = data.data;
		// 裁切,"source"後面不需要的字串
//		pushAevent = pushAevent.split('\,\"source')[0]+'}';
		var pushAeventObject = JSON.parse(pushAevent);
//		if(pushAeventObject.id!=2){
			
		
		// ●●●●推播 
		// @arg1: 要推播的事件物件
		// @arg2: 推播風格
//		bookingNotification(pushAeventObject,2);
		bookingNotification(pushAeventObject,3);
		// 也可以再次呼叫一個servlet
// 		$('#calendar').fullCalendar('addEventSource', '/Hibernate01/CalendarFromDBServlet');

//		}
		
	}

	// ●●.註冊【發送訊息】事件
	function sendMessage(data) {
		console.log("1111-->notifacation--傳送訊息\n"+data);
		//將輸入內容送到websocket物件
		ws.send(data);//websocket自己的方法
	}


	// ●●.註冊【切斷連線】事件
	function closeSocket() {
		console.log("0000-->notifacation--關閉連線\n");
		ws.close();
	}
