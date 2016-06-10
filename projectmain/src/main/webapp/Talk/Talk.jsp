<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Edu_Page</title>
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" >
<link href="${pageContext.request.contextPath}/css/maincontentdiv.css" rel="stylesheet" type="text/css" >
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.0-rc.2/themes/smoothness/jquery-ui.css">
<link href="../css/lobibox.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
<script src="../js/lobibox.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>留言板</title>
<style>
body{
	font-size:16px;
}
.title{
	width:100px;
	float:left;
}
.divinput{
	margin-top:20px;
}
.divbutton{    
	margin-top:20px;
}
.allpage{
	padding:10px;
	background-color:black;
	height:100%;
}
.page{
	background-color:#DDDDDD;
	border:3px solid red;
	padding:10px;
	margin:0 auto;
}
table {
	width:1200px;
	margin: 10px auto;
	border:3px solid red;
}

table td {
	padding:5px;
}

.tdtitle{
	width:100px;
	border:3px solid white;
}
.tdcontent{
	width:900px;
	border:3px solid black;
}
#openFrom{
	margin-top:10px;
}
</style>

</head>
<body>
<!-- 引入top.jsp標頭檔 巡覽列部分-->
	<jsp:include page="/top/top.jsp" />
<div class="allpage">
	<div class="page" id="content">
		<table>
			<tr>
				<td class="tdtitle">主題:</td>
				<td class="tdcontent">詢問關於面試的注意事項</td>
			</tr>
			<tr>
				<td class="tdtitle">暱稱:</td>
				<td class="tdcontent">小肥狗-於:2016-10-10 10:10:10 100 -時說道</td>
			</tr>
			<tr>
				<td class="tdtitle">留言內容:</td>
				<td class="tdcontent">請問面試時有需要準備什麼事項呢?</td>
			</tr>
			<tr>
				<td class="tdtitle">版主回覆:</td>
				<td class="tdcontent">帶著腦袋即可，當天將有上機測驗</td>
			</tr>
		</table>
		
	
	</div>
	<center><button id="openFrom">我要留言</button></center>
</div>	
	
	
	<!-- 留言板輸入畫面start -->
	<div id="dialog-From"  title="到此一遊">
		<h3>訪客留言版</h3>
		<hr>
		<form name="talk">
			<div class="divinput">
				<label class="title">主題:</label> 
				<input type="text" id="talkTitle" name="talkTitle" size="50">
			</div>
			<div class="divinput">
				<label class="title">暱稱:</label> 
				<input type="text" id="talkName" name="talkName" size="50">
			</div>
			
			<div class="divinput">
				<label class="title">悄悄話:</label> 
				<input type="radio" name="talkChose" value="1" >是
				<input type="radio" name="talkChose" value="0" checked>否
			</div>
			<div class="divinput">
				<label class="title">留言內容:</label> 
				<textarea rows="10" cols="50" name="talkContent" id="talkContent"></textarea>
			</div>
			<div class="divbutton">
				<input type="hidden" name="action" value="addTalk"> 
				<input type="submit" tabindex="-1" style="position: absolute; top: -1000px">
			</div>
		</form>
	</div>
	<!-- 留言板輸入畫面end -->
<script>
$(function(){
	var form,InsertForm;
	
	var talkTitle=$('#talkTitle');
	var talkName=$('#talkName');
	var talkContent=$('#talkContent');
	var allColumm = $( [] ).add( talkTitle ).add( talkName ).add( talkContent );
	
	var talkChose=$('#talkChose');
	var page =$('#content');

  //設定表單寬度視窗資料開始
    InsertForm = $( "#dialog-From" ).dialog({
      autoOpen: false,
      height: 700,
      width: 900,
      modal: true,
      open: function() {
          $('.ui-widget-overlay').addClass('custom-overlay');
      },
      close: function() {
          $('.ui-widget-overlay').removeClass('custom-overlay');
      },
      buttons: {
        "send": insert,
        Cancel: function() {
        	InsertForm.dialog( "close" );
        }
      },
      close: function() {
        form[ 0 ].reset();
      }
    });
  	//設定表單寬度視窗資料結束
  	form = InsertForm.find( "form" ).on( "submit", function( event ) {
      event.preventDefault();
    });
  	
  //綁定click事件使用者新增icon，開啟dialog 表單InsertForm
    $( "#openFrom" ).button().on( "click", function() {
    	InsertForm.dialog( "open" );
    });//diolog程式部分結束
    
  //點選新增鍵，所執行的方法
    function insert() {	      
		var Insertdatas = $('form[name="talk"]').serialize();
 		$.post('TalkServletJSON.do',Insertdatas,function(data){
 			if(data=="資料新增失敗"){
 				Lobibox.alert("error", //AVAILABLE TYPES: "error", "info", "success", "warning"
			    {
			    	msg: "資料新增失敗"
			    });
 			}
 			else if(data=="資料新增成功"){
 				Lobibox.alert("success", //AVAILABLE TYPES: "error", "info", "success", "warning"
		    	{
		    		msg: "資料新增成功"
		    	});
 			    page.empty();
 				$.getJSON('TalkServletJSON.do', {"action":"getALLTalk"}, function(datas) {
 					console.log("datas======="+datas);
 					$.each(datas, function(i, Talks) {
 						var talkChose = Talks.talkChose;
 						var talkTitle = Talks.talkTitle;
 						var talkName = Talks.talkName;
 						var talkDate = Talks.talkDate;
 						var talkContent = Talks.talkContent;
 						var retalkContent = Talks.retalkContent;
 						var val = "悄悄話";
 						if (talkChose == 1){
 							page.append( 
 									"<table>"+
 									"<tr>" +
 									  "<td class='tdtitle'>"+ val +"</td>" +
 							          "<td class='tdcontent'>" + val + "</td>" +
 							          "</tr>"+
 							          "<tr>" +
 							          "<td class='tdtitle'>"+ val +"</td>" +
 							          "<td class='tdcontent'>[" + talkName +"]-於時間(" + talkDate +")時說到"+"</td>" +
 							          "</tr>"+
 							          "<tr>" +
 							          "<td class='tdtitle'>"+ val +"</td>" +
 							          "<td class='tdcontent'>" + val +"</td>" +
 							          "</tr>"+
 							          "<tr>" +
 							          "<td class='tdtitle'>"+ val +"</td>" +
 							          "<td class='tdcontent'>" + val +"</td>" +
 							          "</tr>"+
 							          "</table>");
 						}else if(talkChose == 0){
 							page.append( 
 									"<table>"+
 									"<tr>" +
 									  "<td class='tdtitle'>留言主題:</td>" +
 							          "<td class='tdcontent'>" + talkTitle + "</td>" +
 							          "</tr>"+
 							          "<tr>" +
 							          "<td class='tdtitle'>暱稱:</td>" +
 							          "<td class='tdcontent'>[" + talkName +"]-於時間(" + talkDate +")時說到"+"</td>" +
 							          "</tr>"+
 							          "<tr>" +
 							          "<td class='tdtitle'>留言內容:</td>" +
 							          "<td class='tdcontent'>" + talkContent +"</td>" +
 							          "</tr>"+
 							          "<tr>" +
 							          "<td class='tdtitle'>版主回覆:</td>" +
 							          "<td class='tdcontent'>" + retalkContent +"</td>" +
 							          "</tr>"+
 							          "</table>");
 							
 						}
 						
 						
 					});
 				});

 				InsertForm.dialog( "close" );//將新增form表單關閉
	 			}
 			});
 	} 
    
    
    page.empty();
    //init初始化畫面
	$.getJSON('TalkServletJSON.do', {"action":"getALLTalk"}, function(datas) {
		console.log("datas======="+datas);
		$.each(datas, function(i, Talks) {
			var talkChose = Talks.talkChose;
			var talkTitle = Talks.talkTitle;
			var talkName = Talks.talkName;
			var talkDate = Talks.talkDate;
			var talkContent = Talks.talkContent;
			var retalkContent = Talks.retalkContent;
			var val = "悄悄話";
			if (talkChose == 1){
				page.append( 
						"<table>"+
						"<tr>" +
						  "<td class='tdtitle'>"+ val +"</td>" +
				          "<td class='tdcontent'>" + val + "</td>" +
				          "</tr>"+
				          "<tr>" +
				          "<td class='tdtitle'>"+ val +"</td>" +
				          "<td class='tdcontent'>[" + talkName +"]-於時間(" + talkDate +")時說到"+"</td>" +
				          "</tr>"+
				          "<tr>" +
				          "<td class='tdtitle'>"+ val +"</td>" +
				          "<td class='tdcontent'>" + val +"</td>" +
				          "</tr>"+
				          "<tr>" +
				          "<td class='tdtitle'>"+ val +"</td>" +
				          "<td class='tdcontent'>" + val +"</td>" +
				          "</tr>"+
				          "</table>");
			}else if(talkChose == 0){
				page.append( 
						"<table>"+
						"<tr>" +
						  "<td class='tdtitle'>留言主題:</td>" +
				          "<td class='tdcontent'>" + talkTitle + "</td>" +
				          "</tr>"+
				          "<tr>" +
				          "<td class='tdtitle'>暱稱:</td>" +
				          "<td class='tdcontent'>[" + talkName +"]-於時間(" + talkDate +")時說到"+"</td>" +
				          "</tr>"+
				          "<tr>" +
				          "<td class='tdtitle'>留言內容:</td>" +
				          "<td class='tdcontent'>" + talkContent +"</td>" +
				          "</tr>"+
				          "<tr>" +
				          "<td class='tdtitle'>版主回覆:</td>" +
				          "<td class='tdcontent'>" + retalkContent +"</td>" +
				          "</tr>"+
				          "</table>");
				
			}
			
			
		});
	});

	
})//load();
</script>





</body>
</html>