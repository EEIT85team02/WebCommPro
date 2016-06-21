/**
 * 
 */
function iniFullcalendar(){
//	 	$('#drop-remove').attr("checked",true);
		
		// page is now ready, initialize the calendar...
	    $('#calendar').fullCalendar({
			// ●●
			header : {
				left : 'prev,next today',
				center : 'title'
//	 			right : 'month,agendaWeek,agendaDay'
			},
			dragOpacity: {
		        month: 0.2,
		        'default': 0.5
		    },
		    views:{
		    	  month: { 
//	            	  titleFormat: 'YYYY, MM, DD'
		    	  }
		    },
	    	theme: true,
//	 		allDayDefault:true,
	     	editable: false,	// 似乎已資料庫為準
			droppable : true,	// this allows things to be dropped onto the calendar
	    	selectable: false,
//	    	businessHours: true,// display business hours
			// --1-5 or 1-7 【days】
			weekends:false,
			weekNumbers: false,
			// --6 or 4-6 【weeks】
			fixedWeekCount: true,
	    	selectHelper:true,
	    	eventLimit: 3,
	    	displayEventTime: true,
	    	
//	     	hiddenDays: [ 2, 4 ],// 把2,4給遮起來
//	 		contentHeight: 400,
//			aspectRatio: 0.9,		 //	寬/高
//	 		height: "auto",
//	 		height: 600,
	    	// asking servlet 
	        events: "/projectmain/CalendarFromDBServlet",
	     
	        /*
	        // ●●. 註冊【事件被拖放】事件
	        eventDrop: function(event, delta, revertFunc) {
				var events = listAllevents();	// 呼叫外部函數 列出所有events
				var isRepeat = isEventRepeat(event, events);	//呼叫外部函數 判斷是否同一天有同樣時段重複
				
				if(!isRepeat){
	        		alert("偵測到您正在變更事件\n"+"事件代碼\t"+event.id+"\n事件名稱\t"+event.title + "\n改變為\t" + event.start.format()+"\n結束時間為"+event.end.format());
//	         		alert("偵測到您正在變更事件\n"+"事件代碼\t"+event.id+"\n事件名稱\t"+event.title + "\n改變為\t" + event.start.format());
	        			if (!confirm("是否保存本次變更?")) {
	        		    	revertFunc();
	    		    	} else{
	    		    		updateDB(event);
	    		    	}
				}else{
					revertFunc();
				}
			},
	        */
			
			// ●●. 註冊拖放事件【專給外部事件使用!!!!!!!!!!】
			drop : function(date,jsEvent,ui,resourceId) {
//	 		drop : function(event) {
				/*			
				if ($('#drop-remove').is(':checked')) {
					$(this).remove();
				}
				*/
						
				
//	 			var events = listAllevents();	// 呼叫外部函數 列出所有events
//	 			var isRepeat = isEventRepeat(event, events);	//呼叫外部函數 判斷是否同一天有同樣時段重複
//	 			var isRepeat = isEventRepeatV2(date, events);	//呼叫外部函數 判斷是否同一天有同樣時段重複
				
//	 			if(!isRepeat){
//	         		alert("偵測到您正在變更事件\n"+"事件代碼\t"+event.id+"\n事件名稱\t"+event.title + "\n改變為\t" + event.start.format()+"\n結束時間為"+event.end.format());
//	         		alert("偵測到您正在變更事件\n"+"事件代碼\t"+event.id+"\n事件名稱\t"+event.title + "\n改變為\t" + event.start.format());
//	         			if (!confirm("是否保存本次變更?")) {
//	         		    	revertFunc();
//	     		    	} else{
							//寫死版本先
//	     		    		var event = {"id":"1","title":"java","start":"2016-06-06T14:00:00","end":"2016-06-06T15:00:00","color":"#3a87ad","editable":1,"overlap":1,"orderId":5};
	    		    		
//	     		    		updateDB(event);
//	     		    		updateDB(this);
//	     		    	}
//	 			}else{
//	 				revertFunc();
//	 			}
			
				
				
					$(this).remove();
					// 丟下去那天
					//
//	 			console.log(jsEvent);
//	 			console.log(ui);
//	 			console.log(resourceId);
			},
			eventReceive: function(event){
				// ●●●●●●●外部函式:
				// 因為該物件裡面有無窮循環的問題 所以要準備跳脫 
				// 文件請參考: http://stackoverflow.com/questions/11616630/json-stringify-avoid-typeerror-converting-circular-structure-to-json
				// 實作請參考: http://jsfiddle.net/mH6cJ/38/
				var escapedEvent = dealWithCyclic(event);
//	 			var str = JSON.stringify(event);	//	●●●請參考:http://stackoverflow.com/questions/11491938/issues-with-date-when-using-json-stringify-and-json-parse
				// ●●●●●●●外部函式:
				// 將處理過後的event jason 送到外部函式
	    		updateDB(escapedEvent);
//console.log("escapedEvent.editable\n"+escapedEvent.editable);
			},
			// ●●. 註冊【點擊日期】事件
//			dayClick : function() {
//					alert('a day has been clicked!');
//				},
			
			// --●●.註冊【點擊事件標頭】事件
//			eventClick: function(event, element) {
//					
//				// -- 官方的【可以用在google calendar上】
//				//if (event.url) {
//					//window.open(event.url);
//					//return false;
//				//}
//				//event.title = "CLICKED!";
//				
//				var eventOldName = event.title;
//				var eventUpdateName = prompt('請輸入事件名稱: ',event.title);
//	 		    event.title = eventUpdateName==null?eventOldName:eventUpdateName; // 誤刪事件名稱時復原   
//				if(!(event.title==eventOldName)){ // 若真有修改 才進出資料庫
//	 		   	  updateDB(event);
//	 		   	}
////	 		        $('#calendar').fullCalendar('updateEvent', event);
//			    	// 還沒有想到要寫的
////	 		        $('#calendar').fullCalendar('renderEvent', event);
//				}
//	 			addEventSource : "/Hibernate01/CalendarConstrainFromDBServlet",
//	 			addEventSource : "/Hibernate01/CalendarOthersFromDBServlet"
		    })
	   
	}

	// --UPDATEDB 【寫入資料庫】
	function updateDB(event){
	// -- 【確認】有變更 故應寫回資料庫
		var url = "/projectmain/Calendar2DBServlet_jQuery";
		console.log(event);
		// 將event壓成json String格式
		var str = event;	//	●●●請參考:http://stackoverflow.com/questions/11491938/issues-with-date-when-using-json-stringify-and-json-parse
//		var str = JSON.stringify(event);	//	●●●請參考:http://stackoverflow.com/questions/11491938/issues-with-date-when-using-json-stringify-and-json-parse
		console.log("●str\n:"+str);
	// 這樣寫法不通的原因是 接資料的servlet沒有解析event裡面的資料
	$.post(url,str,
			function(data){
				alert("成功寫入");	
				// 傳送事件的資料●●●●●●●●
				sendMessage(str);
			});
	}
	
	
	// 列出calendar上所有事件
	function listAllevents(){
    	var array = new Array();
    	array = $('#calendar').fullCalendar('clientEvents');
		return array;
		
		
	}
	
	
	// 判斷同一時段中是否有事件重複 (依據start的日期時間來決定)
	function isEventRepeat(triggerEvent, eventsArray){
		var isRepeat = false;
		var destination = triggerEvent.start._d;
		var count=0;			
		for(var i =0;i<eventsArray.length;i++){
			var allevents = eventsArray[i].start._d;
//     		console.log(events[i]);
//				console.log("=========================================");
//				console.log(allevents);
//				console.log(destination);
    	    if((allevents+"") == (destination+"") ){
			count++;// 很爛的寫法 找到兩個才算數 (自己除外)
			console.log(count);            		
        	}
		}
//				console.log(count);            		
            		if(count>=2){
            			isRepeat|=true;
            		}
		
		return isRepeat;
	}
	
	function createExternalEvents(){
		
//		var url = "/projectmain/getTokenFromDBServlet";
		var url = "/projectmain/CalendarEventTokensFromDBServlet";
		// 將event壓成json String格式
//		var str = event;	//	●●●請參考:http://stackoverflow.com/questions/11491938/issues-with-date-when-using-json-stringify-and-json-parse
//		var str = JSON.stringify(event);	//	●●●請參考:http://stackoverflow.com/questions/11491938/issues-with-date-when-using-json-stringify-and-json-parse
	// 這樣寫法不通的原因是 接資料的servlet沒有解析event裡面的資料
		
		
		// 1.外部事件標籤
		var myExternalEvents = $("#external-events > h4");
		// 2.取出資料
		$.getJSON(url,{},
				// 3.回呼
			function(data){
			$.each(data,function(){
				// 加入time 屬性到json中  
//				$(this).attr("time", "09:00");
				// 加入duration 屬性到json中  
				$(this).attr("duration","01:00");
				// 製作HTML標籤
				var divEle = $('<div></div>').addClass("fc-event ui-draggable ui-draggable-handle").text(this.title).css({"margin-bottom":"0.5em", "text-align":"center"});
				// 加入event (來自servlet)
				divEle.data('event',this);
				// 定義拖曳事件
				divEle.draggable({
					zIndex: 999,
					revert: true,      // will cause the event to go back to its
					revertDuration: 0,  //  original position after the drag
				})
				// 加入標籤
				myExternalEvents.append(divEle);
			})
		});
		
		/*	
		 * 
		 * 原本的版本
				var count =5;
			$('#external-events .fc-event').each(function(){
				// store data so the calendar knows to render an event upon drop
				
				$(this).data('event', {
					title: $.trim($(this).text()), // use the element's text as the event title
					stick: true, // maintain when user navigates (see docs on the renderEvent method)
					// which event's id equals constrian could be drop.
					constraint:"1",
					color:"#3a87ad",
					id:"1",
					allDay:false,
//		 			start:"11:00",
//		 			end:"11:30",
					time:"09:00",
					duration:"01:00",
					editable:1,
					overlap:1,
					orderId:count
					
//		 			droppable : true,	// this allows things to be dropped onto the calendar
				});

				// make the event draggable using jQuery UI
				$(this).draggable({
					zIndex: 999,
					revert: true,      // will cause the event to go back to its
					revertDuration: 0  //  original position after the drag
				});
				
				
				count++;
			});
		*/
	}
		
		
	