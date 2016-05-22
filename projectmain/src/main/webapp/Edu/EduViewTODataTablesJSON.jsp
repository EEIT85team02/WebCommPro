<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
<title>Edu_Page</title>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
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
				<hr>
					<table id="EduTable" class="display" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="col-md-1 col-xs-1">代號</th>
								<th class="col-md-3 col-xs-3">名稱</th>
								<th class="col-md-3 col-xs-3">地址</th>
								<th class="col-md-3 col-xs-3">電話</th>
								<th class="col-md-2 col-xs-2">連絡人</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						<tfoot>
							<tr>
								<th>代號</th>
								<th>名稱</th>
								<th>地址</th>
								<th>電話</th>
								<th>連絡人</th>
							</tr>
						</tfoot>
					</table>

					<!------------------點選新增教育中心表單區塊內容----------------------------- -->
					<button id="buttonAdd">新增</button>
					<button id="buttonUpdate">編輯</button>
					<button id="buttonDelete">刪除</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 設定新增FORM表單區塊dialog -->
	<div id="dialog-insertForm" title="建立教育中心資料">
		<p class="validateTips"></p>
		<form name="EduInsertForm">
			<fieldset>
				<label for="edu_name">中心名稱</label> 
				<input type="text" name="edu_name" id="edu_name" class="text ui-widget-content ui-corner-all"> 
				<label for="edu_add">中心地址</label> 
				<input type="text" name="edu_add" id="edu_add" class="text ui-widget-content ui-corner-all">
				<label for="edu_tel">中心電話</label> 
				<input type="text" name="edu_tel" id="edu_tel" class="text ui-widget-content ui-corner-all">
				<label for="edu_contact">聯絡人</label> 
				<input type="text" name="edu_contact" id="edu_contact" class="text ui-widget-content ui-corner-all"> 
				<input type="hidden" name="action" value="addEdu">
				<input type="submit" tabindex="-1" style="position: absolute; top: -1000px">
			</fieldset>
		</form>
	</div>
	<!-- 設定修改FORM表單區塊dialog -->
	<div id="dialog-updateForm" title="修改教育中心資料">
		<p class="validateTips"></p>
		<form name="EduUpdateForm" action="updateEdu">
			<fieldset>
				<label for="edu_id">中心代號</label> 
				<input type="text" name="edu_id" id="uedu_id" readOnly class="text ui-widget-content ui-corner-all">
				<label for="edu_name">中心名稱</label> 
				<input type="text" name="edu_name" id="uedu_name" class="text ui-widget-content ui-corner-all"> 
				<label for="edu_add">中心地址</label> 
				<input type="text" name="edu_add" id="uedu_add" class="text ui-widget-content ui-corner-all">
				<label for="edu_tel">中心電話</label> 
				<input type="text" name="edu_tel" id="uedu_tel" class="text ui-widget-content ui-corner-all">
				<label for="edu_contact">聯絡人</label> 
				<input type="text" name="edu_contact" id="uedu_contact" class="text ui-widget-content ui-corner-all"> 
				<input type="hidden" name="action" value="updateEdu">
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
			var table = $('#EduTable').DataTable( {
				 	"ajax": {
			            "url": "EduToJSONInitTableServlet",
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
		    	  "bJQueryUI":false,
		    	  "bProcessing": true,
		    	  "sPaginationType":"full_numbers",
		    	  
		    	} );
			//定義table資料來源json，與畫面顯示------>結束
			 
			
			
		    //新增dialog區塊變數宣告
			var form,EduInsertForm,EduUpdateForm,
			 	edu_id = $( "#edu_id" ),
		      	edu_name = $( "#edu_name" ),
		      	edu_add = $( "#edu_add" ),
		      	edu_tel = $( "#edu_tel" ),
		      	edu_contact = $( "#edu_contact" );
			
				uedu_id = $('#uedu_id'),
			  	uedu_name = $('#uedu_name'),
			  	uedu_add = $('#uedu_add'),
			  	uedu_tel = $('#uedu_tel'),
			  	uedu_contact = $('#uedu_contact');
				
				deleteOrUpdateValue = null;//檢查是否有選取資料行
				
		      	allFields = $( [] ).add( edu_id ).add( edu_name ).add( edu_add ).add( edu_tel ).add( edu_contact );
		      	uallFields = $( [] ).add( uedu_id ).add( uedu_name ).add( uedu_add ).add( uedu_tel ).add( uedu_contact );
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
			    function insertEduFormToCreateTable() {
			      var valid = true;
			      allFields.removeClass( "ui-state-error" );
				  valid = valid && checkLength( edu_name, "名稱", 1, 30 );
			      valid = valid && checkLength( edu_add, "地址", 1, 30 );
			      valid = valid && checkLength( edu_tel, "電話", 7, 15 );
			      valid = valid && checkLength( edu_contact, "聯絡人", 1, 10 );
			      valid = valid && checkRegexp( edu_tel, /^([0-9])+$/, "電話欄位只允許輸入數字 : 0-9" );
			 		if ( valid ) {
			 			var Insertdatas = $('form[name="EduInsertForm"]').serialize();
			 			$.post('EduServletJSON.do',Insertdatas,function(data){
			 				console.log(data);
			 				if(data=="資料新增失敗"){
			 					$('.validateTips').css('color','red').text("新增錯誤");
			 				}
			 				else if(data=="資料新增成功"){
			 					table.ajax.reload();//重新載入data tables的資料
			 					allFields.val("");//將新增form表單內容清空
						 		$('.validateTips').text("");////將新增form表單驗證區塊內容清空
						 		deleteOrUpdateValue = null;
				 				EduInsertForm.dialog( "close" );//將新增form表單關閉
				 				//取回資料庫資料並建立table內容結束
			 				}
			 			});
			 		}
			      return valid;
			    }
			  //設定表單寬度視窗資料開始
			    EduInsertForm = $( "#dialog-insertForm" ).dialog({
			      autoOpen: false,
			      height: 500,
			      width: 400,
			      modal: true,
			      buttons: {
			        "send": insertEduFormToCreateTable,
			        Cancel: function() {
			        	EduInsertForm.dialog( "close" );
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
			  	form = EduInsertForm.find( "form" ).on( "submit", function( event ) {
			      event.preventDefault();
			      insertEduFormToCreateTable();
			    });
			 	//綁定click事件使用者新增icon，開啟dialog 表單EduInsertForm
			    $( "#buttonAdd" ).button().on( "click", function() {
			    	EduInsertForm.dialog( "open" );
			    });//diolog程式部分結束
			
			
			
			    
			    
			    
				//點選要刪除或編輯的那行，按刪除或編輯鍵即可，先將選擇的[行]資料儲存
				$('#EduTable tbody').on( 'click', 'tr', function () {
					deleteOrUpdateValue = $(this).find('td:eq(0)').text(); 
					edu_idUpdateValue = $(this).find('td:eq(0)'); 
					edu_nameUpdateValue = $(this).find('td:eq(1)');
					edu_addUpdateValue = $(this).find('td:eq(2)');
					edu_telUpdateValue = $(this).find('td:eq(3)');
					edu_contactUpdateValue = $(this).find('td:eq(4)');
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
				EduUpdateForm = $( "#dialog-updateForm" ).dialog({
			      autoOpen: false,
			      height: 650,
			      width: 400,
			      modal: true,
			      buttons: {
				        "send": updateEduFormToCreateTable,
				        Cancel: function() {
				        	EduUpdateForm.dialog( "close" );
				        }
				      },
			      close: function() {
			        form[ 0 ].reset();
			        uallFields.removeClass( "ui-state-error" );
			      }
			    });
			    
			  	//設定表單寬度視窗資料結束
			  	form = EduUpdateForm.find( "form" ).on( "submit", function( event ) {
			      event.preventDefault();
			      updateEduFormToCreateTable();
			    });

			  //綁定click事件使用者編輯icon，開啟dialog 表單EduUpdateForm
			 	$('#buttonUpdate').click( function () {
			    	if(deleteOrUpdateValue==null){
			    		console.log(deleteOrUpdateValue);
			    		alert("請先選取要編輯的資料");
			    	}else{
			    		uedu_id.val(edu_idUpdateValue.text());
		    			uedu_name.val(edu_nameUpdateValue.text());
		    			uedu_add.val(edu_addUpdateValue.text());
		    			uedu_tel.val(edu_telUpdateValue.text());
		    			uedu_contact.val(edu_contactUpdateValue.text());
		    			EduUpdateForm.dialog( "open" );
			    	}
			    } );
			    //點選修改鍵，所執行的方法
			    function updateEduFormToCreateTable() {
				      var valid = true;
				      uallFields.removeClass( "ui-state-error" );
					  valid = valid && checkLength( uedu_name, "名稱", 1, 30 );
				      valid = valid && checkLength( uedu_add, "地址", 1, 30 );
				      valid = valid && checkLength( uedu_tel, "電話", 7, 15 );
				      valid = valid && checkLength( uedu_contact, "聯絡人", 1, 10 );
				      valid = valid && checkRegexp( uedu_tel, /^([0-9])+$/, "電話欄位只允許輸入數字 : 0-9" );
				 		if ( valid ) {
				 			var Updatedatas = $('form[name="EduUpdateForm"]').serialize();
				 			$.get('EduServletJSON.do',Updatedatas,function(data){
				 				if(data=="資料更新失敗"){
				 					 $('.validateTips').css('color','red').text("更新錯誤");
				 				}
				 				else if(data=="資料更新成功"){
				 					console.log(edu_idUpdateValue.text());
				 					console.log(edu_nameUpdateValue.text());
				 					console.log(edu_addUpdateValue.text());
				 					console.log(edu_telUpdateValue.text());
				 					console.log(edu_contactUpdateValue.text());
				 					
				 					console.log(uedu_id.val());
				 					console.log(uedu_name.val());
				 					console.log(uedu_add.val());
				 					console.log(uedu_tel.val());
				 					console.log(uedu_contact.val());
				 					
				 					edu_idUpdateValue.text(uedu_id.val());
				 					edu_nameUpdateValue.text(uedu_name.val());
				 					edu_addUpdateValue.text(uedu_add.val());
				 					edu_telUpdateValue.text(uedu_tel.val());
				 					edu_contactUpdateValue.text(uedu_contact.val());
//	 			 					
							 		$('.validateTips').text("");////將更新form表單驗證區塊內容清空
					 				EduUpdateForm.dialog( "close" );
				 				}
				 			});
				 		}
				      return valid;
				    }
			  	
			    
    			//diolog程式部分以下(刪除)
				//設定刪除確認表單寬度視窗資料開始
			    EduDeleteConfirm =$( "#dialog-deleteForm" ).dialog({
			        autoOpen: false,
			        height: 200,
			        width: 240,
			        modal: true,
			        buttons: {
			          "確認": deleteEduFormToCreateTable ,
			          "放棄": function() {
			            $( this ).dialog( "close" );
			            $('#dialog-deleteForm p').text('是否要刪除此筆資料?');
			          }
			        }
			    });
			 	
			    //點選刪除鍵，所執行的方法
				function deleteEduFormToCreateTable(){
				$.get('EduServletJSON.do',{"edu_id":deleteOrUpdateValue,"action":"deleteEdu"},function(data){
					if(data=="資料刪除成功"){
						console.log(deleteOrUpdateValue);
						console.log(data);
						table.row('.selected').remove().draw( false );//刪除畫面上class為selected的那行
						EduDeleteConfirm.dialog( "close" );
					}else if (data=="資料刪除失敗"){
						$('#dialog-deleteForm p').text('資料刪除失敗，資料使用中');
					}
				});
				
		    	}
			   
		
			 
			    $('#buttonDelete').click( function () {
			    	
			    	if(deleteOrUpdateValue==null){
			    		alert("請先選取要刪除的資料");
			    	}else{
			    		EduDeleteConfirm.dialog( "open" );
			    	}
			    } );
			    
	} );//load函數結束
	</script>
</body>
</html>






