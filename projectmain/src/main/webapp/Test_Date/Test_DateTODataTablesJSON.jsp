<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">
<html>
<head>
<title>考試日期查詢</title>
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" >
<link href="${pageContext.request.contextPath}/css/maincontentdiv.css" rel="stylesheet" type="text/css" >
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.0-rc.2/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
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

.ui-dialog {

}
.ui-state-error {
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
	<div class="container-fluid">
		<div class="Main_Content">
			<div class="row">
				<div class="col-md-12">
				<hr>
					<table id="Test_DateTable" class="display" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th>#</th>
								<th class="col-md-2 col-xs-2">班級代號</th>
								<th class="col-md-2 col-xs-2">班級名稱</th>
								<th class="col-md-2 col-xs-2">考試日期</th>
								<th class="col-md-1 col-xs-1">可報/人</th>
								<th class="col-md-1 col-xs-1">已報/人</th>
								<th class="col-md-2 col-xs-2">開始時間</th>
								<th class="col-md-2 col-xs-2">結束時間</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						<tfoot>
							<tr>
								<th>#</th>
								<th>班級代號</th>
								<th>班級名稱</th>
								<th>考試日期</th>
								<th>可報/人</th>
								<th>已報/人</th>
								<th>開始時間</th>
								<th>結束時間</th>
							</tr>
						</tfoot>
					</table>
					<!------------------點選新增教育中心表單區塊內容----------------------------- -->
					<button id="buttonUpdate">編輯</button>
					<button id="buttonDelete">刪除</button>
					<button id="buttonAll">全部選取</button>
					<button id="buttonRe">取消全選</button>
					<button id="buttonSel">選取筆數查詢</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 設定修改FORM表單區塊dialog -->
	<div id="dialog-updateForm" title="修改教育中心資料">
		<p class="validateTips"></p>
		<form name="TdUpdateForm" action="updateEdu">
			<fieldset>
				<label for="test_date_id">考試日期時段代號(不可修改)</label> 
				<input type="text" name="test_date_id" id="utest_date_id" readOnly class="text ui-widget-content ui-corner-all">
				
				<label for="class_name">班級名稱(不可修改)</label> 
				<input type="text" name="class_name" id="uclass_name" readOnly class="text ui-widget-content ui-corner-all" autocomplete="off">
				
				<input type="hidden" name="class_id" id="uclass_id"  class="text ui-widget-content ui-corner-all" autocomplete="off">
				
				<input type="hidden" name="test_hour_id" id="utest_hour_id"  class="text ui-widget-content ui-corner-all" autocomplete="off">
				
				<label for="test_date">考試日期</label> 
				<input type="date" name="test_date" id="utest_date" class="text ui-widget-content ui-corner-all" autocomplete="off"> 
				
				<label for="test_people">可報名人數</label> 
				<input type="text" name="test_people" id="utest_people" class="text ui-widget-content ui-corner-all" autocomplete="off">
				
				<label for="exam_people">已報名人數(不可修改)</label> 
				<input type="text" name="exam_people" id="uexam_people" readOnly class="text ui-widget-content ui-corner-all" autocomplete="off">
				
				
				<input type="hidden" name="action" value="updateTd">
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
			var table = $('#Test_DateTable').DataTable( {
				 	"ajax": {
			            "url": "/projectmain/Test_Date/Test_DateToJSONInitTableServlet",
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
			var form,TdUpdateForm
				utest_date_id = $('#utest_date_id'),
				uclass_name = $('#uclass_name'),
				utest_date = $('#utest_date'),
				utest_people = $('#utest_people'),
				uexam_people = $('#uexam_people');
				uclass_id = $('#uclass_id');
				utest_hour_id = $('#utest_hour_id');
			
				uallFields = $( [] ).add( utest_date_id ).add( uclass_name ).add( utest_date ).add( utest_people ).add( uexam_people );
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
			 	//點選tr資料，更換class類別,若被選取則更新為未選取，反之選取
				$('#Test_DateTable tbody').on( 'click', 'tr', function () {
					$(this).toggleClass('selected');
				    });
				
			    
			    //diolog程式部分以下(更新)
				//設定表單寬度視窗資料開始
				TdUpdateForm = $( "#dialog-updateForm" ).dialog({
			      autoOpen: false,
			      height: 650,
			      width: 400,
			      modal: true,
			      buttons: {
				        "send": updateTdFormToCreateTable,
				        Cancel: function() {
				        	TdUpdateForm.dialog( "close" );
				        }
				      },
			      close: function() {
			        form[ 0 ].reset();
			        uallFields.removeClass( "ui-state-error" );
			      }
			    });
			    
			  	//設定表單寬度視窗資料結束
			  	form = TdUpdateForm.find( "form" ).on( "submit", function( event ) {
			      event.preventDefault();
			      updateTdFormToCreateTable();
			    });
				//綁定click事件使用者編輯icon，開啟dialog 表單TdUpdateForm(判斷資料是否多選-僅能選取一筆!!)
				//table.rows('.selected').data().length->指的是，有幾筆列資料，套用得Class為selected
			 	$('#buttonUpdate').click( function () {
			 		if(table.rows('.selected').data().length == 0){
			    		alert("請選取一筆要進行編輯的資料");
			    	}else if(table.rows('.selected').data().length > 1){
			    		alert("[編輯]功能僅能選取一筆資料。");
			    	}else if(table.rows('.selected').data().length == 1){
			    		ClickUpdateValue = $('tr.selected').find('td:eq(0)').text();//抓到選到的class為selected的教育中心代號
				 		console.log(ClickUpdateValue);
				 		$.getJSON('Test_DateServletJSON.do', {"action":"getoneTd","test_date_id":ClickUpdateValue}, function(datas) {
							console.log(datas);
							//將抓到的教育中心代號，發送request請資料庫傳回該筆資料JSON
							$.each(datas, function(i, Tds) {
								utest_date_id.val(Tds.test_date_id);
								uclass_name.val(Tds.class_name);
								utest_date.val(Tds.test_date);
								utest_people.val(Tds.test_people);
								uexam_people.val(Tds.exam_people);
								
								uclass_id.val(Tds.class_id);
								utest_hour_id.val(Tds.test_hour_id);
							});
						});
				 		TdUpdateForm.dialog( "open" );
			    	}
			 	} );
			    //點選修改鍵，所執行的方法
			    function updateTdFormToCreateTable() {
				      var valid = true;
				      uallFields.removeClass( "ui-state-error" );
				      valid = valid && checkLength( utest_date, "考試日期", 10, 30 );
					  valid = valid && checkLength( utest_people, "可報名人數", 1, 30 );
				    
				      if ( valid ) {
				 			var Updatedatas = $('form[name="TdUpdateForm"]').serialize();
				 			//console.log(Updatedatas);
				 			$.get('Test_DateServletJSON.do',Updatedatas,function(data){
				 				console.log(data);
				 				if(data=="資料更新失敗"){
				 					 $('.validateTips').css('color','red').text("更新錯誤");
				 				}
				 				else if(data=="資料更新成功"){
				 					table.ajax.reload();//重新載入data tables的資料 ?? 須改為直接抓取原更新表單的值回填回去表格
				 					TdUpdateForm.dialog( "close" );
				 				}
				 			});
				 		}
				 	  sel=[];
				      return valid;
				    }
			  	//diolog程式部分以下(刪除)
				//設定刪除確認表單寬度視窗資料開始
			   TdDeleteConfirm =$( "#dialog-deleteForm" ).dialog({
			        autoOpen: false,
			        height: 200,
			        width: 240,
			        modal: true,
			        buttons: {
			          "確認": deleteTdFormToCreateTable ,
			          "放棄": function() {
			        	sel=[];
			            $( this ).dialog( "close" );
			            $('#dialog-deleteForm p').text('是否要刪除資料?');
			          }
			        }
			    });
			 	//點選刪除鍵，所執行的方法
				function deleteTdFormToCreateTable(){
			 	$.get('Test_DateServletJSON.do',{"test_date_id":selJSON,"action":"deleteTdMulti"},function(data){
					if(data=="資料刪除成功"){
						//table.row('tbody > tr.selected').remove().draw( false );//刪除畫面上class為selected的那行
						table.ajax.reload();//重新載入data tables的資料 ?? 須改為直接抓取原更新表單的值回填回去表格
						TdDeleteConfirm.dialog( "close" );
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
			    		TdDeleteConfirm.dialog( "open" );
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
				        alert( table.rows('.selected').data().length +' 筆資料被選取' );
				});
			} );//load函數結束
	</script>
</body>
</html>





