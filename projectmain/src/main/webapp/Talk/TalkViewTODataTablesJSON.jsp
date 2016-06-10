<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
<title>Talk_Page</title>
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
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="author" content="">
<style>
.ui-widget-overlay.custom-overlay
{
    background-color: black;
    background-image: none;
    opacity: 0.6;
    z-index: 1040;    
}
.Main_Content {
	margin-top: 100px;
}
#buttonDelete{
	color: red;
}
#buttonUpdate{
	color: green;
}
input.text{ 
	padding: .4em; 
} 
fieldset{
	padding: 0;
	border: 0;
	margin-top: 25px;
}

h1 {
	font-size: 1.2em;
	margin: .6em 0;
}

 
.ui-dialog, .ui-state-error {
	padding: .3em;
}

.labelTitle{
	float:left;
	width:100px;
	padding-right:3px;
}
.divForm{
margin: 20px;

}


</style>
</head>
<body>
	<!-- 引入top.jsp標頭檔 巡覽列部分-->
	<jsp:include page="/top/top.jsp" />
	<!-------------中間內容畫面開始------------>
	<!-- 固定巡覽列位置，建立div使區塊下移 (starter-template)-->
	<div class="container-fluid">
		<div class="Main_Content">
			<div class="row">
				<div class="col-md-12">
				<hr>
					<table id="TalkTable" class="display" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="col-md-1 col-xs-1">訊息代號</th>
								<th class="col-md-2 col-xs-2">留言主題</th>
								<th class="col-md-1 col-xs-1">訪客姓名</th>
								<th class="col-md-1 col-xs-1">#</th>
								<th class="col-md-3 col-xs-3">留言內容</th>
								<th class="col-md-2 col-xs-2">回復內容</th>
								<th class="col-md-2 col-xs-2">留言時間</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<!------------------點選表單區塊內容----------------------------- -->
					<button id="buttonUpdate" class="ui-button ui-corner-all ui-widget">回覆留言</button>
					<button id="buttonDelete" class="ui-button ui-corner-all ui-widget">刪除(可多選)</button>
					<button id="buttonAll" class="ui-button ui-corner-all ui-widget">全部選取</button>
					<button id="buttonRe" class="ui-button ui-corner-all ui-widget">取消全選</button>
					<button id="buttonSel" class="ui-button ui-corner-all ui-widget">選取筆數查詢</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 設定修改FORM表單區塊dialog -->
	<div id="dialog-updateForm" title="回覆留言">
		<form name="TalkUpdateForm">
			<fieldset>
				<div class="divForm">	
					<label for="talkId" class="labelTitle">訊息代號:</label> 
					<input type="text" name="talkId" size="20" id="utalkId" readOnly >
				</div>
					
				<div class="divForm">
					<label for="retalkContent" class="labelTitle">回覆留言:</label> 
					<input type="text" name="retalkContent" size="20" id="uretalkContent" autocomplete="off"> 
				</div>
				<input type="hidden" name="action" value="updateTalk">
				<input type="submit" tabindex="-1" style="position: absolute; top: -1000px">
			</fieldset>
		</form>
	</div>
	<!-- 設定刪除確認表單區塊dialog -->
	<div id="dialog-deleteForm" title="刪除確認">
		<p>是否要刪除資料?</p>
	</div>
	<script>
		$(function() {
			//定義table資料來源json，與畫面顯示------>開始
			var table = $('#TalkTable').DataTable( {
				 	"ajax": {
			            "url": "/projectmain/Talk/TalkToJSONInitTableServlet",
			        },
			     	"oLanguage": {
					"sProcessing":"資料正處理中...",
					"sLengthMenu": "顯示 _MENU_ 筆記錄",
				    "sZeroRecords": "無符合資料",
				    "sInfo": "目前記錄：_START_ 至 _END_, 總筆數：_TOTAL_",
				    "sInfoEmpty":"顯示第 0 至 0 項結果，共 0 項",
                    "sInfoFiltered":"(從 _MAX_ 項結果過濾)",
                    "sSearch":"搜索:",
                    "oPaginate":{"sFirst":"首頁",
                              "sPrevious":"上頁",
                              "sNext":"下頁",
                              "sLast":"尾頁"}
			 },
		    	  "bJQueryUI":true,
		    	  "bProcessing": true,
		    	  "sPaginationType":"full_numbers",
		    	} );
			//定義table資料來源json，與畫面顯示------>結束
			//新增dialog區塊變數宣告
			var form,TalkUpdateForm,
			 	
				utalkId = $('#utalkId'),
			  	uretalkContent = $('#uretalkContent');
			  	
				//點選tr資料，更換class類別,若被選取則更新為未選取，反之選取
				$('#TalkTable tbody').on( 'click', 'tr', function () {
					$(this).toggleClass('selected');
				    });
				TalkUpdateForm = $( "#dialog-updateForm" ).dialog({
			      autoOpen: false,
			      height: 400,
			      width: 500,
			      modal: true,
			      open: function() {
			          $('.ui-widget-overlay').addClass('custom-overlay');
			      },
			      close: function() {
			          $('.ui-widget-overlay').removeClass('custom-overlay');
			      },
			      buttons: {
				        "send": updateTalkFormToCreateTable,
				        Cancel: function() {
				        	TalkUpdateForm.dialog( "close" );
				        }
				      },
			      close: function() {
			        form[ 0 ].reset();
			      }
			    });
			    //設定表單寬度視窗資料結束
			  	form = TalkUpdateForm.find( "form" ).on( "submit", function( event ) {
			      event.preventDefault();
			      updateTalkFormToCreateTable();
			    });
				//table.rows('.selected').data().length->指的是，有幾筆列資料，套用得Class為selected
			 	$('#buttonUpdate').click( function () {
			 		if(table.rows('.selected').data().length == 0){
						Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
	 			    	{
	 			    		msg: "請選取一筆要進行編輯的資料"
	 			    	});
			    	}else if(table.rows('.selected').data().length > 1){
						Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
	 			    	{
	 			    		msg: "[編輯]功能僅能選取一筆資料。"
	 			    	});
			    	}else if(table.rows('.selected').data().length == 1){
			    		ClickUpdateValue = $('tr.selected').find('td:eq(0)').text();
				 		$.getJSON('TalkServletJSON.do', {"action":"getoneTalk","talkId":ClickUpdateValue}, function(datas) {
							console.log(datas);
							$.each(datas, function(i, Talks) {
								var talkId = Talks.talkId;
		 						var retalkContent = Talks.retalkContent;
								utalkId.val(talkId);
								uretalkContent.val(retalkContent);
							});
						});
				 		TalkUpdateForm.dialog( "open" );
			    	}
			 	} );
			    //點選修改鍵，所執行的方法
			    function updateTalkFormToCreateTable() {
				     var Updatedatas = $('form[name="TalkUpdateForm"]').serialize();
				 	
				 	$.get('TalkServletJSON.do',Updatedatas,function(data){
				 		console.log(data);
				 		if(data=="資料更新失敗"){
				 			alert("aaaa");
				 		}
				 		else if(data=="資料更新成功"){
				 			table.ajax.reload();//重新載入data tables的資料 ?? 須改為直接抓取原更新表單的值回填回去表格
				 			TalkUpdateForm.dialog( "close" );
				 		}
				 	});
				 		
				 	sel=[];
				}
			  	//diolog程式部分以下(刪除)
				//設定刪除確認表單寬度視窗資料開始
			    TalkDeleteConfirm =$( "#dialog-deleteForm" ).dialog({
			        autoOpen: false,
			        height: 200,
			        width: 240,
			        modal: true,
			        open: function() {
				          $('.ui-widget-overlay').addClass('custom-overlay');
				      },
				      close: function() {
				          $('.ui-widget-overlay').removeClass('custom-overlay');
				      },
			        buttons: {
			          "確認": deleteTalkFormToCreateTable ,
			          "放棄": function() {
			        	sel=[];
			            $( this ).dialog( "close" );
			            $('#dialog-deleteForm p').text('是否要刪除資料?');
			          }
			        }
			    });
			 	//點選刪除鍵，所執行的方法
				function deleteTalkFormToCreateTable(){
			 	$.get('TalkServletJSON.do',{"talkId":selJSON,"action":"deleteTalkMulti"},function(data){
					if(data=="資料刪除成功"){
						//table.row('tbody > tr.selected').remove().draw( false );//刪除畫面上class為selected的那行
						table.ajax.reload();//重新載入data tables的資料 ?? 須改為直接抓取原更新表單的值回填回去表格
						TalkDeleteConfirm.dialog( "close" );
					}else if (data=="資料刪除失敗"){
						$('#dialog-deleteForm p').text('資料刪除失敗，資料使用中');
					}
				});
			 	sel=[];
				}
			 	var sel=[];
				$('#buttonDelete').click( function () {
			    	if(table.rows('.selected').data().length==0){
			   			Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
	 			    	{
	 			    		msg: "請先選取要刪除的資料"
	 			    	});
			    	}else if(table.rows('.selected').data().length>=1){
			    		var trSelLength = $('tbody > tr.selected');
							Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
	 			    		{
	 			    			msg: "共選取"+table.rows('.selected').data().length+"筆資料。"
	 			    		});
			    		for(var i=0,max=trSelLength.length;i<max;i++){
			    			var	obj = $('tbody > tr.selected:eq('+i+')').find('td:eq(0)').text();
			    			sel.push(obj);//將obj資料加到sel陣列
			    		}
			    		console.log("sel====="+sel);
			    		selJSON =JSON.stringify(sel);//將JSON轉成字串
			    		console.log("selJSON-----"+selJSON);
			    		TalkDeleteConfirm.dialog( "open" );
			    	}
			    });
				//icon全部選取
				$('#buttonAll').click(function(){
					$('tbody > tr').addClass('selected');
				})
				//icon取消全選
				$('#buttonRe').click(function(){
					$('tbody > tr').removeClass('selected');
				})
				//icon查詢選取筆數
				 $('#buttonSel').click( function () {
					 Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
	 			    {
	 			    	msg: table.rows('.selected').data().length +' 筆資料被選取'
	 			    });
				});
				
				
				
				
				
				
			} );//load函數結束
	</script>
</body>
</html>






