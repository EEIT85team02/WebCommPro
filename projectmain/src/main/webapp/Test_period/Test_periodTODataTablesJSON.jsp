<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
<title>Test_period_Page</title>

<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" >
<link href="${pageContext.request.contextPath}/css/maincontentdiv.css" rel="stylesheet" type="text/css" >
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
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


label, input {
	display: block;
}

input.text {
	margin-bottom: 12px;
	width: 95%;
	padding: .4em;
}

fieldset {
	padding: 0;
	border: 0;
	margin-top: 25px;
}

h1 {
	font-size: 1.2em;
	margin: .6em 0;
}

.ui-dialog .ui-state-error {
	padding: .3em;
}

.validateTips {
	border: 1px solid transparent;
	padding: 0.3em;
}

</style>
</head>
<body>
	<!-- 引入top.jsp標頭檔 巡覽列部分-->
	<jsp:include page="/top/top.jsp" />
	<!-------------中間內容畫面開始------------>
	<!-- 固定巡覽列位置，建立div使區塊下移 (starter-template)-->
	<div class="container">
		<div class="Main_Content">
			<div class="row">
				<div class="col-md-12">
				<h1>考試時段區間設定(步驟一)</h1>
				<hr>
				<!--***************Test_period table 設定************************-->
					<table id="Test_periodTable" class="display" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="col-md-2 col-xs-2">時段代號</th>
								<th class="col-md-5 col-xs-5">時段開始時間</th>
								<th class="col-md-5 col-xs-5">時段開始時間</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						<tfoot>
							<tr>
								<th>時段代號</th>
								<th>時段開始時間</th>
								<th>時段結束時間</th>
							</tr>
						</tfoot>
					</table>

					<!------------------點選新增時段設定表單區塊內容----------------------------- -->
					<button id="buttonAll">全部選取</button>
					<button id="buttonRe">取消全選</button>
					<button id="buttonSel">選取筆數查詢</button>
					<button id="buttonNext">下一步</button>
				</div>
			</div>
		</div>
	</div>
	<!--***************Test_interval table 設定************************-->
	
	<div class="container">
		<div class="Main_Content">
			<div class="row">
				<div class="col-md-12">
				<h1>班級考試日期區間設定(步驟二)</h1>
				<hr>
					<table id="Test_intervalTable" class="display" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="col-md-2 col-xs-2">時段代號</th>
								<th class="col-md-5 col-xs-5">時段開始時間</th>
								<th class="col-md-5 col-xs-5">時段開始時間</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						<tfoot>
							<tr>
								<th>時段代號</th>
								<th>時段開始時間</th>
								<th>時段結束時間</th>
							</tr>
						</tfoot>
					</table>

					<!------------------點選新增時段設定表單區塊內容----------------------------- -->
					<button id="buttonAdd">新增</button>
					<button id="buttonUpdate">編輯</button>
					<button id="buttonDelete">刪除</button>
					<button id="buttonAll">全部選取</button>
					<button id="buttonRe">取消全選</button>
					<button id="buttonSel">選取筆數查詢</button>
					<button id="buttonNext">下一步</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 設定新增FORM表單區塊dialog -->
	<div id="dialog-insertForm" title="建立時段設定資料">
		<p class="validateTips"></p>
		<form name="TpInsertForm">
			<fieldset>
				<label for="test_starthour">時段開始時間</label> 
				<input type="text" name="test_starthour" id="test_starthour" class="text ui-widget-content ui-corner-all">
				<label for="test_endhour">時段結束時間</label> 
				<input type="text" name="test_endhour" id="test_endhour" class="text ui-widget-content ui-corner-all">
				<input type="hidden" name="action" value="addTp">
				<input type="submit" tabindex="-1" style="position: absolute; top: -1000px">
			</fieldset>
		</form>
	</div>
	<!-- 設定修改FORM表單區塊dialog -->
	<div id="dialog-updateForm" title="修改時段設定資料">
		<p class="validateTips"></p>
		<form name="TpUpdateForm">
			<fieldset>
				<label for="test_hour_id">時段代號</label> 
				<input type="text" name="test_hour_id" id="utest_hour_id" readOnly class="text ui-widget-content ui-corner-all">
				<label for="test_starthour">時段開始時間</label> 
				<input type="text" name="test_starthour" id="utest_starthour" class="text ui-widget-content ui-corner-all"> 
				<label for="test_endhour">時段結束時間</label> 
				<input type="text" name="test_endhour" id="utest_endhour" class="text ui-widget-content ui-corner-all"> 
				<input type="hidden" name="action" value="updateTp">
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
			var table = $('#Test_periodTable').DataTable( {
				 	"ajax": {
			            "url": "Test_periodToJSONInitTableServlet",
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
			var form,TpInsertForm,TpUpdateForm,
			 	test_starthour = $('#test_starthour'),
			 	test_endhour = $('#test_endhour'),
			  	utest_hour_id = $('#utest_hour_id'),
			 	utest_starthour = $('#utest_starthour'),
			  	utest_endhour = $('#utest_endhour'),
				allFields = $( [] ).add( test_starthour ).add( test_endhour );
		      	uallFields = $( [] ).add( utest_hour_id ).add( utest_starthour ).add( utest_endhour );
		      	tips = $( ".validateTips" );
		      //在驗證顯示區塊新增class t->傳入的一段文字
			    function updateTips( t ) {
			      tips
			        .text( t )
			        .css('color','red')
			        .addClass( "ui-state-highlight" );
			      setTimeout(function() {
			        tips.removeClass( "ui-state-highlight", 1500 );
			      }, 500 );
			    }
			 //驗證資料長度是否符合規則o->$('#欄位ID')欄位資料、n->欄位名稱、min->最短長度、max->最長長度
			    function checkLength( o, n, min, max ) {
			      if ( o.val().length > max || o.val().length < min ) {
			        o.addClass( "ui-state-error" );
			        updateTips( "欄位 " + n + ":長度必須於 " +
			          min + " 到 " + max + "之間" );
			        return false;
			      } else {
			        return true;
			      }
			    }
			 //驗證表單資料是否符合規則 o->$('#欄位ID')、規則式、n->SHOW一段文字
			    function checkRegexp( o, regexp, n ) {
			      if ( !( regexp.test( o.val() ) ) ) {
			        o.addClass( "ui-state-error" );
			        updateTips( n );
			        return false;
			      } else {
			        return true;
			      }
			    }
			  //點選新增鍵，所執行的方法
			    function insertTpFormToCreateTable() {
			      var valid = true;
			      allFields.removeClass( "ui-state-error" );
			      valid = valid && checkLength( test_starthour, "開始時間", 1, 10 );
			      valid = valid && checkLength( test_endhour, "結束時間", 1, 10 );
			      valid = valid && checkRegexp( test_starthour, /^([0-1][0-9]|2[0-3])\:[0-5][0-9]\:[0-5][0-9]$/, "開始時間格式須為hh:mm:ss" );
			      valid = valid && checkRegexp( test_endhour, /^([0-1][0-9]|2[0-3])\:[0-5][0-9]\:[0-5][0-9]$/, "結束時間格式須為hh:mm:ss" );
			      if ( valid ) {
			 			var Insertdatas = $('form[name="TpInsertForm"]').serialize();
			 			$.post('Test_periodServletJSON.do',Insertdatas,function(data){
			 				console.log(data);
			 				if(data=="資料新增失敗"){
			 					$('.validateTips').css('color','red').text("新增錯誤");
			 				}
			 				else if(data=="資料新增成功"){
			 					table.ajax.reload();//重新載入data tables的資料
			 					allFields.val("");//將新增form表單內容清空
						 		$('.validateTips').text("");////將新增form表單驗證區塊內容清空
				 				TpInsertForm.dialog( "close" );//將新增form表單關閉
				 				//取回資料庫資料並建立table內容結束
			 				}
			 			});
			 		}
			      return valid;
			    }
			  //設定表單寬度視窗資料開始
			    TpInsertForm = $( "#dialog-insertForm" ).dialog({
			      autoOpen: false,
			      height: 500,
			      width: 400,
			      modal: true,
			      buttons: {
			        "send": insertTpFormToCreateTable,
			        Cancel: function() {
			        	TpInsertForm.dialog( "close" );
			        }
			      },
			      close: function() {
			        form[ 0 ].reset();
			        allFields.removeClass( "ui-state-error" );
			       	allFields.val("");//將新增form表單內容清空
		 			$('.validateTips').text("");////將新增form表單驗證區塊內容清空
			      }
			    });
			  	//設定表單寬度視窗資料結束
			  	form = TpInsertForm.find( "form" ).on( "submit", function( event ) {
			      event.preventDefault();
			      insertTpFormToCreateTable();
			    });
			 	//綁定click事件使用者新增icon，開啟dialog 表單EduInsertForm
			    $( "#buttonAdd" ).button().on( "click", function() {
			    	TpInsertForm.dialog( "open" );
			    });//diolog程式部分結束
			
			
				//點選tr資料，更換class類別,若被選取則更新為未選取，反之選取
				$('#Test_periodTable tbody').on( 'click', 'tr', function () {
					$(this).toggleClass('selected');
				    } );
			
			 
			    
			    //diolog程式部分以下(更新)
				//設定表單寬度視窗資料開始
				TpUpdateForm = $( "#dialog-updateForm" ).dialog({
			      autoOpen: false,
			      height: 650,
			      width: 400,
			      modal: true,
			      buttons: {
				        "send": updateTpFormToCreateTable,
				        Cancel: function() {
				        	TpUpdateForm.dialog( "close" );
				        }
				      },
			      close: function() {
			        form[ 0 ].reset();
			        uallFields.removeClass( "ui-state-error" );
			      }
			    });
			    
			  	//設定表單寬度視窗資料結束
			  	form = TpUpdateForm.find( "form" ).on( "submit", function( event ) {
			      event.preventDefault();
			      updateTpFormToCreateTable();
			    });

			  //綁定click事件使用者編輯icon，開啟dialog 表單ClassUpdateForm(判斷資料是否多選-僅能選取一筆!!)
				  //綁定click事件使用者編輯icon，開啟dialog 表單ClassUpdateForm
				 	$('#buttonUpdate').click( function () {
				 		
				 		if(table.rows('.selected').data().length == 0){
				    		alert("請選取一筆要進行編輯的資料");
				    	}else if(table.rows('.selected').data().length > 1){
				    		alert("[編輯]功能僅能選取一筆資料。");
				    	}else if(table.rows('.selected').data().length == 1){
				    		ClickUpdateValue = $('tr.selected').find('td:eq(0)').text();//抓到選到的TP為selected的時段代號
					 		console.log(ClickUpdateValue);
					 		$.getJSON('Test_periodServletJSON.do', {"action":"getoneTp","test_hour_id":ClickUpdateValue}, function(datas) {
								console.log(datas);
								//將抓到的教育中心代號，發送request請資料庫傳回該筆資料JSON
								$.each(datas, function(i, TPs) {
									utest_hour_id.val(TPs.test_hour_id);
								  	utest_starthour.val(TPs.test_starthour);
								  	utest_endhour.val(TPs.test_endhour);
								  	
								});
							});
					 		TpUpdateForm.dialog( "open" );
				    	}
				 	} );
			    //點選修改鍵，所執行的方法
			    function updateTpFormToCreateTable() {
				      var valid = true;
				      uallFields.removeClass( "ui-state-error" );
					  valid = valid && checkLength( utest_hour_id, "代號", 1, 10 );
				      valid = valid && checkLength( utest_starthour, "開始時間", 1, 10 );
				      valid = valid && checkLength( utest_endhour, "結束時間", 1, 10 );
				      valid = valid && checkRegexp( utest_starthour, /^([0-1][0-9]|2[0-3])\:[0-5][0-9]\:[0-5][0-9]$/, "開始時間格式須為hh:mm:ss" );
				      valid = valid && checkRegexp( utest_endhour, /^([0-1][0-9]|2[0-3])\:[0-5][0-9]\:[0-5][0-9]$/, "結束時間格式須為hh:mm:ss" );
				      if ( valid ) {
				 			var Updatedatas = $('form[name="TpUpdateForm"]').serialize();
				 			$.get('Test_periodServletJSON.do',Updatedatas,function(data){
				 				console.log(data);
				 				if(data=="資料更新失敗"){
				 					 $('.validateTips').css('color','red').text("更新錯誤");
				 				}
				 				else if(data=="資料更新成功"){
				 					table.ajax.reload();//重新載入data tables的資料 ?? 須改為直接抓取原更新表單的值回填回去表格
				 					TpUpdateForm.dialog( "close" );
				 				}
				 			});
				 		}
				      sel=[];
				      return valid;
				    }
			  	
			    
    			//diolog程式部分以下(刪除)
				//設定刪除確認表單寬度視窗資料開始
			    TpDeleteConfirm =$( "#dialog-deleteForm" ).dialog({
			        autoOpen: false,
			        height: 200,
			        width: 240,
			        modal: true,
			        buttons: {
			          "確認": deleteTpFormToCreateTable ,
			          "放棄": function() {
			            $( this ).dialog( "close" );
			            $('#dialog-deleteForm p').text('是否要刪除此筆資料?');
			          }
			        }
			    });
			 	
			    //點選刪除鍵，所執行的方法
			    function deleteTpFormToCreateTable(){
					$.get('Test_periodServletJSON.do',{"test_hour_id":selJSON,"action":"deleteTpMulti"},function(data){
						if(data=="資料刪除成功"){
							//table.row('.selected').remove().draw( false );//刪除畫面上class為selected的那行
							table.ajax.reload();//重新載入data tables的資料 ?? 須改為直接抓取原更新表單的值回填回去表格
							TpDeleteConfirm.dialog( "close" );
						}else if (data=="資料刪除失敗"){
							$('#dialog-deleteForm p').text('資料刪除失敗，資料使用中');
						}
					});
					sel=[];
			    	}
			   
		
			 
				var sel=[];
				   $('#buttonDelete').click( function () {
				    	if(table.rows('.selected').data().length==0){
				    		alert("請先選取要刪除的資料");
				    	}else if(table.rows('.selected').data().length>=1){
				    		var trSelLength = $('tbody > tr.selected');//tr被SELECT到的長度
				    		alert("共選取"+table.rows('.selected').data().length+"筆資料。");
				    		for(var i=0,max=trSelLength.length;i<max;i++){
				    			var	obj = $('tbody > tr.selected:eq('+i+')').find('td:eq(0)').text();
				    			sel.push(obj);//將obj資料加到sel陣列
				    		}
				    		console.log("sel====="+sel);
				    		selJSON =JSON.stringify(sel);//將JSON轉成字串
				    		console.log("selJSON-----"+selJSON);
				    		TpDeleteConfirm.dialog( "open" );
				    	}
				    });
				   
				   //icon全部選取
					$('#buttonAll').click(function(){
						$('#Test_periodTable tbody > tr').addClass('selected');
					})
					//icon取消全選
					$('#buttonRe').click(function(){
						$('#Test_periodTable tbody > tr').removeClass('selected');
					})
					//icon查詢選取筆數
					 $('#buttonSel').click( function () {
					        alert( table.rows('.selected').data().length +' 筆資料被選取' );
					});
				   
				   $('#buttonNext').click(function(){
					 //定義table資料來源json，與畫面顯示------>開始
						var table = $('#Test_intervalTable').DataTable( {
							 	"ajax": {
						            "url": "Test_periodToJSONInitTableServlet",
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
				   })		    
			    
	} );//load函數結束
	</script>
</body>
</html>






