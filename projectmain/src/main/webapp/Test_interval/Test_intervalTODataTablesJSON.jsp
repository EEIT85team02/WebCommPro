<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
<title>Test_interval Page</title>
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" >
<link href="${pageContext.request.contextPath}/css/maincontentdiv.css" rel="stylesheet" type="text/css" >
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.0-rc.2/themes/smoothness/jquery-ui.css">
<link href="../css/lobibox.min.css" rel="stylesheet">
<script src="../js/lobibox.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="author" content="">
<style>
.Main_Content {
	margin-top: 100px;
}
#buttonAdd{
	color: blue;
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

.allValid {
	border: 1px solid transparent;
	padding: 0.3em;
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
					<table id="Test_intervalTable" class="display" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="col-md-2 col-xs-2">時段代號</th>
								<th class="col-md-2 col-xs-2">班級代號</th>
								<th class="col-md-2 col-xs-2">班級名稱</th>
								<th class="col-md-3 col-xs-3">開始日期</th>
								<th class="col-md-3 col-xs-3">結束日期</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						<tfoot>
							<tr>
								<th>時段代號</th>
								<th>班級代號</th>
								<th>班級名稱</th>
								<th>開始日期</th>
								<th>結束日期</th>
							</tr>
						</tfoot>
					</table>

					<!------------------點選新增班級表單區塊內容----------------------------- -->
					<button id="buttonAdd" class="ui-button ui-corner-all ui-widget">新增</button>
					<button id="buttonUpdate" class="ui-button ui-corner-all ui-widget">編輯</button>
					<button id="buttonDelete" class="ui-button ui-corner-all ui-widget">刪除</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 設定新增FORM表單區塊dialog -->
	<div id="dialog-insertForm" title="建立班級考試資料">
		<p class="allValid"></p>
		<form name="TiInsertForm">
			<fieldset>
				<div class="divForm">
					<label for="class_id" class="labelTitle">班級名稱:</label> 
					<select id="selectClass_id"  name='class_id'>
				   	</select>
				   	<span id="spanclass_id"></span><br>
			   	</div>
			   	
			   	
			   	<div class="divForm">
			   	<label for="test_startdate" class="labelTitle">開始日期:</label> 
				<input type="date" name="test_startdate" size="20" id="test_startdate" placeholder="請輸入考試開始日期" autocomplete="off" >
				<span id="spantest_startdate"></span><br>
				</div>
				
				<div class="divForm">
				<label for="test_enddate" class="labelTitle">結束日期:</label> 
				<input type="date" name="test_enddate" size="20" id="test_enddate" placeholder="請輸入考試結束日期" autocomplete="off" >
				<span id="spantest_enddate"></span><br>
				</div>
				
				
				<input type="hidden" name="action" value="addTi">
				<input type="submit" tabindex="-1" style="position: absolute; top: -1000px">
			
			
			</fieldset>
		</form>
	</div>
	<!-- 設定修改FORM表單區塊dialog -->
	<div id="dialog-updateForm" title="修改班級考試資料">
		<p class="allValid"></p>
		<form name="TiUpdateForm">
			<fieldset>
			<div class="divForm">
				<label for="test_interval_id" class="labelTitle">代號:</label> 
				<input type="text" name="test_interval_id" size="20" id="utest_interval_id" placeholder="請輸入班級考試日期代號" autocomplete="off" readOnly> 
				<br>
				</div>
				
				
				<div class="divForm">
				<label for="class_id" class="labelTitle">班級代號:</label> 
				<input type="text" name="class_id" size="20" id="uclass_id" placeholder="請輸入班級代號" autocomplete="off" readOnly> 
				<br>
				</div>
				
				
				<div class="divForm">
				<label for="class_name" class="labelTitle">班級名稱:</label> 
				<input type="text" name="class_name" size="20" id="uclass_name" placeholder="請輸入班級名稱" autocomplete="off" readOnly> 
				<br>
				</div>
				
				
				<div class="divForm">
				<label for="test_startdate" class="labelTitle">開始日期:</label> 
				<input type="date" name="test_startdate" size="20" id="utest_startdate" placeholder="請輸入考試開始日期" autocomplete="off">
				<span id="spanutest_startdate"></span><br>
				</div>
				
				<div class="divForm">
				<label for="test_enddate" class="labelTitle">結束日期:</label> 
				<input type="date" name="test_enddate" size="20" id="utest_enddate" class="text ui-widget-content ui-corner-all" placeholder="請輸入考試結束日期" autocomplete="off">
				<span id="spanutest_enddate"></span><br>
				</div>
				
				
				
				<input type="hidden" name="action" value="updateTi">
				<input type="submit" tabindex="-1" style="position: absolute; top: -1000px">
			</fieldset>
		</form>
	</div>
	<!-- 設定刪除確認表單區塊dialog -->
	<div id="dialog-deleteForm" title="刪除確認">
		<p>是否要刪除此筆資料?</p>
	</div>
	<script>
		$(function() {
			//定義table資料來源json，與畫面顯示------>開始
			var table = $('#Test_intervalTable').DataTable( {
				 	"ajax": {
			            "url": "Test_intervalToJSONInitTableServlet",
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
			var form,TiInsertForm,TiUpdateForm,
				class_id = $( "#selectClass_id" ),
				test_startdate = $( "#test_startdate" ),
				test_enddate = $( "#test_enddate" ),
				
				
				utest_interval_id = $( "#utest_interval_id" ),
				uclass_id = $( "#uclass_id" ),
				uclass_name = $( "#uclass_name" ),
				utest_startdate = $( "#utest_startdate" ),
				utest_enddate = $( "#utest_enddate" ),
				
			  	deleteOrUpdateValue = null,//檢查是否有選取資料行
			  	
			  	spanclass_id = $('#spanclass_id'),
			  	spantest_startdate = $('#spantest_startdate'),
			  	spantest_enddate = $('#spantest_enddate'),
			  	
			  	spanutest_startdate = $('#spanutest_startdate'),
			  	spanutest_enddate = $('#spanutest_enddate');
			  	
			  	var flag = null;
			  	var checkclass_id=null;
			  	var checktest_startdate=null;
			  	var checktest_enddate=null;
				
			  	var checkutest_startdate=null;
			  	var checkutest_enddate=null;
			  	
			  	allSpan = $( [] ).add( spanclass_id ).add( spantest_startdate ).add( spantest_enddate );
				uallSpan = $( [] ).add( spanutest_startdate ).add( spanutest_enddate );
				
			  	
			  	
		      	allFields = $( [] ).add( class_id ).add( test_startdate ).add( test_enddate );
		      	uallFields = $( [] ).add( utest_interval_id ).add( uclass_id ).add( utest_startdate ).add( utest_enddate ).add( uclass_name );
		    	allValid =$('.allValid');
		      	
		      
			  //點選新增鍵，所執行的方法
			    function insertTiFormToCreateTable() {
			      if ( checkInsertForm()  ) {
			  		  	var Insertdatas = $('form[name="TiInsertForm"]').serialize();
			 			$.post('Test_intervalServletJSON.do',Insertdatas,function(data){
			 				console.log(data);
			 				if(data=="資料新增失敗"){
			 					allValid.css('color','red').text("此班級代號已建立資料");
			 				}
			 				else if(data=="資料新增成功"){
			 					table.ajax.reload();//重新載入data tables的資料
			 					allFields.removeClass( "ui-state-error" );
			 					allFields.val("");//將新增form表單內容清空
			 					allValid.text("");////將新增form表單驗證區塊內容清空
			 					allSpan.text("");//將新增FROM表單的span內容清空
						 		
			 					deleteOrUpdateValue = null;
						 		TiInsertForm.dialog( "close" );//將新增form表單關閉
				 				//取回資料庫資料並建立table內容結束
			 				}
			 			});
			 		}
			    }
			  //設定表單寬度視窗資料開始
			    TiInsertForm = $( "#dialog-insertForm" ).dialog({
			      autoOpen: false,
			      height: 550,
			      width: 700,
			      modal: true,
			      buttons: {
			        "send": insertTiFormToCreateTable,
			        Cancel: function() {
			        	TiInsertForm.dialog( "close" );
			        }
			      },
			      close: function() {
			        form[ 0 ].reset();
			        allFields.removeClass( "ui-state-error" );
 					allFields.val("");//將新增form表單內容清空
 					allValid.text("");////將新增form表單驗證區塊內容清空
 					allSpan.text("");//將新增FROM表單的span內容清空
			      }
			    });
			  	//設定表單寬度視窗資料結束
			  	form = TiInsertForm.find( "form" ).on( "submit", function( event ) {
			      event.preventDefault();
			      insertTiFormToCreateTable();
			    });
			 	//綁定click事件使用者新增icon，開啟dialog 表單TiInsertForm
			    $( "#buttonAdd" ).button().on( "click", function() {
			    	class_id.empty();//清除select下的option
			    	$.getJSON('ClassServletJSON.do', {"action":"getALLClass"}, function(datas) {
						//console.log(datas);
						$.each(datas, function(i, Clas) {
							class_id.append( 
						 		"<option value="+ Clas.class_id +">" + Clas.class_name + "</option>");
						});
					});
			    	TiInsertForm.dialog( "open" );
			    });//diolog程式部分結束
			
				//點選要刪除或編輯的那行，按刪除或編輯鍵即可，先將選取的[行]資料儲存成變數
				$('#Test_intervalTable tbody').on( 'click', 'tr', function () {
					deleteOrUpdateValue = $(this).find('td:eq(0)').text(); 
					class_idUpdateIndex = $(this).find('td:eq(1)').text();
					
					test_interval_idUpdateValue = $(this).find('td:eq(0)'); 
					class_idUpdateValue = $(this).find('td:eq(1)'); 
					class_nameUpdateValue = $(this).find('td:eq(2)'); 
					test_startdateUpdateValue = $(this).find('td:eq(3)'); 
					test_enddateUpdateValue = $(this).find('td:eq(4)'); 
					console.log(deleteOrUpdateValue);
					
						if ( $(this).hasClass('selected') ) {
				            $(this).removeClass('selected');
				        }
				        else {
				            table.$('tr.selected').removeClass('selected');
				            $(this).addClass('selected');
				        }
				    } );
			
			 
			    
			    //diolog程式部分以下(更新)
				//設定表單寬度視窗資料開始
				  TiUpdateForm = $( "#dialog-updateForm" ).dialog({
			      autoOpen: false,
			      height: 650,
			      width: 700,
			      modal: true,
			      buttons: {
				        "send": updateTiFormToCreateTable,
				        Cancel: function() {
				        	TiUpdateForm.dialog( "close" );
				        }
				      },
			      close: function() {
			        form[ 0 ].reset();
			        uallFields.removeClass( "ui-state-error" );
					uallFields.val("");//將更新form表單內容清空
					allValid.text("");//將更新form表單驗證區塊內容清空
					uallSpan.text("");//將更新FROM表單的span內容清空
			      }
			    });
			    
			  	//設定表單寬度視窗資料結束
			  	form = TiUpdateForm.find( "form" ).on( "submit", function( event ) {
			      event.preventDefault();
			      updateTiFormToCreateTable();
			    });

			  //綁定click事件使用者編輯icon，開啟dialog 表單TiUpdateForm
			 	$('#buttonUpdate').click( function () {
			 		
			    	if(deleteOrUpdateValue==null){
			    		console.log(deleteOrUpdateValue);
// 			    		alert("請先選取要編輯的資料");
			   Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
	 			    			{
	 			    			msg: "請先選取要編輯的資料"
	 			    			});
			    	}else{
			    		$.getJSON('Test_intervalServletJSON.do', {"action":"getoneTi","test_interval_id":deleteOrUpdateValue}, function(datas) {
							
							$.each(datas, function(i, tis) {
								utest_interval_id.val(tis.test_interval_id);
								uclass_id.val(tis.class_id);
								uclass_name.val(tis.class_name);
								utest_startdate.val(tis.test_startdate);
								utest_enddate.val(tis.test_enddate);
							});
						});
						TiUpdateForm.dialog( "open" );
		    			
			    	}
			    } );
			    //點選修改鍵，所執行的方法
			    function updateTiFormToCreateTable() {
				     if ( checkUpdateForm() ) {
				 			var Updatedatas = $('form[name="TiUpdateForm"]').serialize();
				 			console.log(Updatedatas);
				 			$.post('Test_intervalServletJSON.do',Updatedatas,function(data){
				 				if(data=="資料更新失敗"){
				 					 $('.validateTips').css('color','red').text("更新錯誤");
				 				}
				 				else if(data=="資料更新成功"){
				 					
				 					$.getJSON('Test_intervalServletJSON.do', {"action":"getoneTi","test_interval_id":deleteOrUpdateValue}, function(datas) {
				 			    		$.each(datas,function(i,tis){
				 			    			test_interval_idUpdateValue.text(tis.test_interval_id);
				 							class_idUpdateValue.text(tis.class_id);
				 							class_nameUpdateValue.text(tis.class_name);
				 							test_startdateUpdateValue.text(tis.test_startdate);
				 							test_enddateUpdateValue.text(tis.test_enddate); 
				 			    		})
				 			    	})
				 			    	uallFields.removeClass( "ui-state-error" );
 									uallFields.val("");//將更新form表單內容清空
 									allValid.text("");//將更新form表單驗證區塊內容清空
 									uallSpan.text("");//將更新FROM表單的span內容清空
 			 						TiUpdateForm.dialog( "close" );
				 				}
				 			});
				 		}
				    }
			  	//diolog程式部分以下(刪除)
				//設定刪除確認表單寬度視窗資料開始
			    TiDeleteConfirm =$( "#dialog-deleteForm" ).dialog({
			        autoOpen: false,
			        height: 200,
			        width: 240,
			        modal: true,
			        buttons: {
			          "確認": deleteTiFormToCreateTable ,
			          "放棄": function() {
			            $( this ).dialog( "close" );
			            $('#dialog-deleteForm p').text('是否要刪除此筆資料?');
			          }
			        }
			    });
			 	//點選刪除鍵，所執行的方法
				function deleteTiFormToCreateTable(){
					$.get('Test_intervalServletJSON.do',{"test_interval_id":deleteOrUpdateValue,"class_id":class_idUpdateIndex,"action":"deleteTi"},function(data){
						if(data=="資料刪除成功"){
							table.row('.selected').remove().draw( false );//刪除畫面上class為selected的那行
							TiDeleteConfirm.dialog( "close" );
						}else if (data=="資料刪除失敗"){
							$('#dialog-deleteForm p').text('資料刪除失敗，資料使用中');
						}
				    });
				}
			   	$('#buttonDelete').click( function () {
			    	
			    	if(deleteOrUpdateValue==null){
// 			    		alert("請先選取要刪除的資料");
			   Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
	 			    			{
	 			    			msg: "請先選取要刪除的資料"
	 			    			});
			    	}else{
			    		TiDeleteConfirm.dialog( "open" );
			    	}
			    } );
			  //新增表格欄位判斷
			  //class_id欄位驗證(滑鼠離開後檢查)AJAX查詢登打的代號是否已存在資料庫中
			    class_id.blur(function(){
			    	var class_idVal=class_id.val();
			    	$.get('Test_intervalServletJSON.do',{'class_id':class_idVal,"action":"checkTiClassId"},function(data){
			    		console.log(data);
						if(data=="代號已存在"){
							spanclass_id.html("<img src='../img/error.png' style='width:16px'/>此班級代號已存在或欄位格式不符").css('color','red');
							flag=false;
						}else if(data=="代號不存在"){
							spanclass_id.html("<img src='../img/correct.png' style='width:16px'/>");
							flag=true;
						}
					})
				});
			  
			    function fcheckclass_id(){
					checkclass_id=false;
					if (flag){
						spanclass_id.html("<img src='../img/correct.png' style='width:16px'/>");
						checkclass_id=true;
					}else {
						spanclass_id.html("<img src='../img/error.png' style='width:16px'/>此班級代號已存在系統").css('color','red');
						checkclass_id=false;
					}
				}
			   
			    
			  //ckecktest_starthour欄位滑鼠離開後的判斷驗證
				test_startdate.blur(fchecktest_startdate);
				function fchecktest_startdate(){
					checktest_startdate=false;
					var test_startdateVal=test_startdate.val();
					var test_enddateVal=test_enddate.val();
					var startdateObj=new Date(test_startdateVal).getTime();
					var enddateObj=new Date(test_enddateVal).getTime();
					console.log("startdateObj===="+startdateObj);
					console.log("enddateObj===="+enddateObj);
					
					if(test_startdateVal==""){
						spantest_startdate.html("<img src='../img/error.png' style='width:16px'/>開始日期不可為空白").css('color','red');
					}else if(startdateObj > enddateObj){
						spantest_startdate.html("<img src='../img/error.png' style='width:16px'/>開始日期不可大於結束日期").css('color','red');
					}else{
						spantest_startdate.html("<img src='../img/correct.png' style='width:16px'/>");
						checktest_startdate=true;
					}
				}
				
				 //ckecktest_starthour欄位滑鼠離開後的判斷驗證
				test_enddate.blur(fchecktest_enddate);
				function fchecktest_enddate(){
					checktest_enddate=false;
					var test_enddateVal=test_enddate.val();
					var test_startdateVal=test_startdate.val();
					
					var startdateObj=new Date(test_startdateVal).getTime();
					var enddateObj=new Date(test_enddateVal).getTime();
					console.log("startdateObj===="+startdateObj);
					console.log("enddateObj===="+enddateObj);
					if(test_enddateVal==""){
						spantest_enddate.html("<img src='../img/error.png' style='width:16px'/>結束日期不可為空白").css('color','red');
					}else if(enddateObj < startdateObj){
						spantest_enddate.html("<img src='../img/error.png' style='width:16px'/>結束日期不可小於開始日期").css('color','red');
					}else{
						spantest_enddate.html("<img src='../img/correct.png' style='width:16px'/>");
						checktest_enddate=true;
					}
				}
				
				function checkInsertForm(){
					fcheckclass_id();
					fchecktest_startdate();
					fchecktest_enddate();
					console.log(checkclass_id);
					console.log(checktest_startdate);
					console.log(checktest_enddate);
					if(checkclass_id && checktest_startdate && checktest_enddate){
// 						alert("資料皆正確，送出中");
         Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
	 			    			{
	 			    			msg: "資料皆正確，送出中"
	 			    			});
						return true;
					}
					else {
// 						alert("資料錯誤，請檢查欄位長度格式是否正確");
          Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
	 			    			{
	 			    			msg: "資料錯誤，請檢查欄位長度格式是否正確"
	 			    			});
						return false;
					} 
				}
				
				
				//修改表格欄位判斷
				//ckecktest_starthour欄位滑鼠離開後的判斷驗證
				utest_startdate.blur(fcheckutest_startdate);
				function fcheckutest_startdate(){
					checkutest_startdate=false;
					var utest_startdateVal=utest_startdate.val();
					var utest_enddateVal=utest_enddate.val();
					
					var ustartdateObj=new Date(utest_startdateVal).getTime();
					var uenddateObj=new Date(utest_enddateVal).getTime();
					console.log("ustartdateObj===="+ustartdateObj);
					console.log("uenddateObj===="+uenddateObj);
					
					if(utest_startdateVal==""){
						spanutest_startdate.html("<img src='../img/error.png' style='width:16px'/>開始日期不可為空白").css('color','red');
					}else if(ustartdateObj > uenddateObj ){
						spanutest_startdate.html("<img src='../img/error.png' style='width:16px'/>開始日期不可大於結束日期").css('color','red');
					}else{
						spanutest_startdate.html("<img src='../img/correct.png' style='width:16px'/>");
						checkutest_startdate=true;
					}
				}
				
				 //ckecktest_starthour欄位滑鼠離開後的判斷驗證
				utest_enddate.blur(fcheckutest_enddate);
				function fcheckutest_enddate(){
					checkutest_enddate=false;
					var utest_enddateVal=utest_enddate.val();
					var utest_startdateVal=utest_startdate.val();
					
					var ustartdateObj=new Date(utest_startdateVal).getTime();
					var uenddateObj=new Date(utest_enddateVal).getTime();
					console.log("ustartdateObj===="+ustartdateObj);
					console.log("uenddateObj===="+uenddateObj);
					
					
					if(utest_enddateVal==""){
						spanutest_enddate.html("<img src='../img/error.png' style='width:16px'/>開始日期不可為空白").css('color','red');
					}else if(uenddateObj < ustartdateObj){
						spanutest_enddate.html("<img src='../img/error.png' style='width:16px'/>結束日期不可小於開始日期").css('color','red');
					}else{
						spanutest_enddate.html("<img src='../img/correct.png' style='width:16px'/>");
						checkutest_enddate=true;
					}
				}
				
				function checkUpdateForm(){
					fcheckutest_startdate();
					fcheckutest_enddate();
					console.log(checkutest_startdate);
					console.log(checkutest_enddate);
					if(checkutest_startdate && checkutest_enddate){
// 						alert("資料皆正確，送出中");
       Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
	 			    			{
	 			    			msg: "資料皆正確，送出中"
	 			    			});
						return true;
					}
					else {
// 						alert("資料錯誤，請檢查欄位長度格式是否正確");
		Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
	 			    			{
	 			    			msg: "資料錯誤，請檢查欄位長度格式是否正確"
	 			    			});
						return false;
					} 
				}
			  
			  
			  
			  
			     
			  
	} );//load函數結束
	</script>
</body>
</html>






