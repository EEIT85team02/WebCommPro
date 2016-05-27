/**
 * 
 */


	// --UPDATEDB 【寫入資料庫】
	function updateDB(event){
	// -- 【確認】有變更 故應寫回資料庫
		var url = "/Hibernate01/Calendar2DBServlet_jQuery";
		// 將event壓成json String格式
		var str = JSON.stringify(event);	//	●●●請參考:http://stackoverflow.com/questions/11491938/issues-with-date-when-using-json-stringify-and-json-parse
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