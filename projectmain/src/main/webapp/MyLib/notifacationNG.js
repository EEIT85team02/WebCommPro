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
				'editable':false
//				'editable':false,
//				'id': 0
			};
			// 執行
			$('#calendar').fullCalendar('renderEvent', newOtherEvent, true);
		break;
		}
	}
	
	
	
	

	
	
	
	
