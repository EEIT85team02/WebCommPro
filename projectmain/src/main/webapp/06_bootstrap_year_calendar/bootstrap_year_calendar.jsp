<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<c:if test="${empty LoginOK}">
		<c:set var="target" value="${pageContext.request.servletPath}"
 			scope="session" />
		<c:redirect url="/01_login/LoginBegin.jsp" />
	</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>

	<!-- 匯入共用css -->
	<jsp:include page="/references/head_resources_css.jsp" />

	<!-- 聊天框專用js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/LikeHangoutChat/js/LikeHangoutChat.js"></script>
	
	<!-- 聊天框專用css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/LikeHangoutChat/css/LikeHangoutChat.css"/>
	
	
	<!-- 匯入bootstrap_year_calendar專用 -->
	<jsp:include page="/references/bootstrap_year_calendar.jsp" />
	
		<title>bootstrap_year_calendar.jsp</title>
		<script>
		/*!
		 * jQuery.parseJSON() extension (supports ISO & Asp.net date conversion)
		 *
		 * Version 1.0 (13 Jan 2011)
		 *
		 * Copyright (c) 2011 Robert Koritnik
		 * Licensed under the terms of the MIT license
		 * http://www.opensource.org/licenses/mit-license.php
		 */
		(function ($) {
		 
		    // JSON RegExp
		    var rvalidchars = /^[\],:{}\s]*$/;
		    var rvalidescape = /\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g;
		    var rvalidtokens = /"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g;
		    var rvalidbraces = /(?:^|:|,)(?:\s*\[)+/g;
		    var dateISO = /\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(?:[.,]\d+)?Z/i;
		    var dateNet = /\/Date\((\d+)(?:-\d+)?\)\//i;
		 
		    // replacer RegExp
		    var replaceISO = /"(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2})(?:[.,](\d+))?Z"/i;
		    var replaceNet = /"\\\/Date\((\d+)(?:-\d+)?\)\\\/"/i;
		 
		    // determine JSON native support
		    var nativeJSON = (window.JSON && window.JSON.parse) ? true : false;
		    var extendedJSON = nativeJSON && window.JSON.parse('{"x":9}', function(k,v){return "Y";}) === "Y";
		 
		    var jsonDateConverter = function(key, value) {
		        if (typeof(value) === "string")
		        {
		            if (dateISO.test(value))
		            {
		                return new Date(value);
		            }
		            if (dateNet.test(value))
		            {
		                return new Date(parseInt(dateNet.exec(value)[1], 10));
		            }
		        }
		        return value;
		    };
		 
		    $.extend({
		        parseJSON: function(data, convertDates) {
		            /// <summary>Takes a well-formed JSON string and returns the resulting JavaScript object.</summary>
		            /// <param name="data" type="String">The JSON string to parse.</param>
		            /// <param name="convertDates" optional="true" type="Boolean">Set to true when you want ISO/Asp.net dates to be auto-converted to dates.</param>
		 
		            if (typeof data !== "string" || !data) {
		                return null;
		            }
		 
		            // Make sure leading/trailing whitespace is removed (IE can't handle it)
		            data = $.trim(data);
		 
		            // Make sure the incoming data is actual JSON
		            // Logic borrowed from http://json.org/json2.js
		            if (rvalidchars.test(data
		                .replace(rvalidescape, "@")
		                .replace(rvalidtokens, "]")
		                .replace(rvalidbraces, "")))
		            {
		                // Try to use the native JSON parser
		                if (extendedJSON || (nativeJSON && convertDates !== true))
		                {
		                    return window.JSON.parse(data, convertDates === true ? jsonDateConverter : undefined);
		                }
		                else
		                {
		                    data = convertDates === true ?
		                        data.replace(replaceISO, "new Date(parseInt('$1',10),parseInt('$2',10)-1,parseInt('$3',10),parseInt('$4',10),parseInt('$5',10),parseInt('$6',10),(function(s){return parseInt(s,10)||0;})('$7'))")
		                            .replace(replaceNet, "new Date($1)") :
		                        data;
		                    return (new Function("return " + data))();
		                }
		            } else
		            {
		                $.error("Invalid JSON: " + data);
		            }
		        }
		    });
		})(jQuery);
		
		
		</script>
	</head>
	<!-- 匯入js -->
	<jsp:include page="/references/head_resources_js.jsp" />
<body>
	<div class="container">
	<!-- 匯入功能表列 -->
	<jsp:include page="/references/navigatorB.jsp" />
		<div class="starter-template">
	
	<div id="calendar" class="calendar" data-provide="calendar" ></div>
		<!-- 開始畫出日曆 -->
			<script>
			
$(document).ready(function(){

var theRequest = $.ajax({
    "url": '/projectmain/CalendarAllFromDBServlet',
    "type": 'GET',
   	"dataType": 'json',
   	"success": function(data){
   		var tet01 = $.parseJSON(theRequest.responseText, true)
   		console.log(tet01);
   		iniCalendar(tet01);
  }
})
			});

			


function iniCalendar(dataSourceStr){
	var currentYear = new Date().getFullYear();
	$('.calendar').calendar({
// 		 	style:'background',
// 	        enableContextMenu: true,
	        enableRangeSelection: true,
// 	        contextMenuItems:[
// 	            {
// 	                text: 'Update',
// 	                click: editEvent
// 	            },
// 	            {
// 	                text: 'Delete',
// 	                click: deleteEvent
// 	            }
// 	        ],
	        selectRange: function(e) {
// 	            editEvent({ startDate: e.startDate, endDate: e.endDate });
console.log("CLICK!");
	        },
	        mouseOnDay: function(e) {
	            if(e.events.length > 0) {
	                var content = '';
                
	                for(var i in e.events) {
	                    content += '<div class="event-tooltip-content">'
	                                    + '<div class="event-name" style="color:' + e.events[i].color + '">' + e.events[i].name + '</div>'
	                                    + '<div class="event-location">' + e.events[i].location + '</div>'
	                                + '</div>';
	                }
            
	                $(e.element).popover({ 
	                    trigger: 'manual',
	                    container: 'body',
	                    html:true,
	                    content: content
	                });
                
	                $(e.element).popover('show');
	            }
	        },
	        mouseOutDay: function(e) {
	            if(e.events.length > 0) {
	                $(e.element).popover('hide');
	            }
	        },
	        dayContextMenu: function(e) {
	            $(e.element).popover('hide');
	        },
			dataSource: dataSourceStr
	});
}	
// 記得我有修改過官方js檔【把英文改成中文】
function getDataSourceFromDB(){
	$.getJSON("/projectmain/CalendarAllFromDBServlet",{},function(data){
	var strT = 	$.parseJSON(data, true);
		return strT; 
	});
};
			</script>
	
	
	
	
			
		</div>
    </div>
    <!-- /.container -->

   <!-- 匯入js -->
	<jsp:include page="/references/foot_resources_js.jsp" />

</body>
</html>

