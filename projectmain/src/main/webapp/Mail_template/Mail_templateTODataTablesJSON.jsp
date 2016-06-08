<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
<title>Mail_template_Page</title>
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="author" content="">
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
					<table id="Mail_templateTable" class="display" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="col-md-1 col-xs-1">代號</th>
								<th class="col-md-2 col-xs-2">名稱</th>
								<th class="col-md-4 col-xs-4">內容</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						<tfoot>
							<tr>
								<th>代號</th>
								<th>名稱</th>
								<th>內容</th>
							</tr>
						</tfoot>
					</table>

					<!------------------點選新增Email樣版表單區塊內容----------------------------- -->
					<button id="buttonAdd" class="ui-button ui-corner-all ui-widget">新增</button>
					<button id="buttonUpdate" class="ui-button ui-corner-all ui-widget">編輯</button>
					<button id="buttonDelete" class="ui-button ui-corner-all ui-widget">刪除</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 設定新增FORM表單區塊dialog -->
	<div id="dialog-insertForm" title="建立Email樣版資料">
		<p class="validateTips"></p>
		<form name="MailInsertForm">
			<fieldset>
				<label for="mail_name">樣版名稱</label> 
				<input type="text" name="mail_name" id="mail_name" class="text ui-widget-content ui-corner-all"> 
				<label for="mail_text">樣版內容</label> 
				<textarea name="mail_text" id="mail_text" class="form-control" rows="20"></textarea> 
				<input type="hidden" name="action" value="addMail">
				<input type="submit" tabindex="-1" style="position: absolute; top: -1000px">
			</fieldset>
		</form>
	</div>
	<!-- 設定修改FORM表單區塊dialog -->
	<div id="dialog-updateForm" title="修改Email樣版資料">
		<p class="validateTips"></p>
		<form name="MailUpdateForm" action="updateMail">
			<fieldset>
				<label for="mail_id">樣版代號</label> 
				<input type="text" name="mail_id" id="umail_id" readOnly class="text ui-widget-content ui-corner-all">
				<label for="mail_name">樣版名稱</label> 
				<input type="text" name="mail_name" id="umail_name" class="text ui-widget-content ui-corner-all"> 
				<label for="mail_text">樣版內容</label> 
				<textarea name="mail_text" id="umail_text" class="form-control" rows="20""></textarea>
				<input type="hidden" name="action" value="updateMail">
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
			var table = $('#Mail_templateTable').DataTable( {
				 	"ajax": {
			            "url": "MailToJSONInitTableServlet",
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
			var form,MailInsertForm,MailUpdateForm,
			 	mail_id = $( "#mail_id" ),
		      	mail_name = $( "#mail_name" ),
		      	mail_text = $( "#mail_text" ),
			
				umail_id = $('#umail_id'),
			  	umail_name = $('#umail_name'),
			  	umail_text = $('#umail_text'),
				
				deleteOrUpdateValue = null;//檢查是否有選取資料行
				
		      	allFields = $( [] ).add( mail_id ).add( mail_name ).add( mail_text );
		      	uallFields = $( [] ).add( umail_id ).add( umail_name ).add( umail_text );
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
			    function insertMailFormToCreateTable() {
			      var valid = true;
			      allFields.removeClass( "ui-state-error" );
				  valid = valid && checkLength( mail_name, "名稱", 1, 30 );
			      valid = valid && checkLength( mail_text, "內容", 1, 250 );
			 		if ( valid ) {
			 			var Insertdatas = $('form[name="MailInsertForm"]').serialize();
			 			$.post('MailServletJSON.do',Insertdatas,function(data){
			 				console.log(data);
			 				if(data=="資料新增失敗"){
			 					$('.validateTips').css('color','red').text("新增錯誤");
			 				}
			 				else if(data=="資料新增成功"){
			 					table.ajax.reload();//重新載入data tables的資料
			 					allFields.val("");//將新增form表單內容清空
						 		$('.validateTips').text("");////將新增form表單驗證區塊內容清空
						 		deleteOrUpdateValue = null;
				 				MailInsertForm.dialog( "close" );//將新增form表單關閉
				 				//取回資料庫資料並建立table內容結束
			 				}
			 			});
			 		}
			      return valid;
			    }
			  //設定表單寬度視窗資料開始
			    MailInsertForm = $( "#dialog-insertForm" ).dialog({
			      autoOpen: false,
			      height: 500,
			      width: 400,
			      modal: true,
			      open: function() {
			          $('.ui-widget-overlay').addClass('custom-overlay');
			      },
			      close: function() {
			          $('.ui-widget-overlay').removeClass('custom-overlay');
			      },
			      buttons: {
			        "send": insertMailFormToCreateTable,
			        Cancel: function() {
			        	MailInsertForm.dialog( "close" );
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
			  	form = MailInsertForm.find( "form" ).on( "submit", function( event ) {
			      event.preventDefault();
			      insertMailFormToCreateTable();
			    });
			 	//綁定click事件使用者新增icon，開啟dialog 表單EduInsertForm
			    $( "#buttonAdd" ).button().on( "click", function() {
			    	MailInsertForm.dialog( "open" );
			    });//diolog程式部分結束
			
			
			
			    
			    
			    
				//點選要刪除或編輯的那行，按刪除或編輯鍵即可，先將選擇的[行]資料儲存
				$('#Mail_templateTable tbody').on( 'click', 'tr', function () {
					deleteOrUpdateValue = $(this).find('td:eq(0)').text(); 
					mail_idUpdateValue = $(this).find('td:eq(0)'); 
					mail_nameUpdateValue = $(this).find('td:eq(1)');
					mail_textUpdateValue = $(this).find('td:eq(2)');
					console.log(deleteOrUpdateValue);
						if ( $(this).hasClass('selected') ) {
				            $(this).removeClass('selected');
				            deleteOrUpdateValue=null;
				        }
				        else {
				            table.$('tr.selected').removeClass('selected');
				            $(this).addClass('selected');
				        }
				    } );
			
			 
			    
			    //diolog程式部分以下(更新)
				//設定表單寬度視窗資料開始
				MailUpdateForm = $( "#dialog-updateForm" ).dialog({
			      autoOpen: false,
			      height: 650,
			      width: 400,
			      modal: true,
			      open: function() {
			          $('.ui-widget-overlay').addClass('custom-overlay');
			      },
			      close: function() {
			          $('.ui-widget-overlay').removeClass('custom-overlay');
			      },
			      buttons: {
				        "send": updateMailFormToCreateTable,
				        Cancel: function() {
				        	MailUpdateForm.dialog( "close" );
				        }
				      },
			      close: function() {
			        form[ 0 ].reset();
			        uallFields.removeClass( "ui-state-error" );
			      }
			    });
			    
			  	//設定表單寬度視窗資料結束
			  	form = MailUpdateForm.find( "form" ).on( "submit", function( event ) {
			      event.preventDefault();
			      updateMailFormToCreateTable();
			    });

			  //綁定click事件使用者編輯icon，開啟dialog 表單Sign_listUpdateForm
			 	$('#buttonUpdate').click( function () {
			    	if(deleteOrUpdateValue==null){
			    		console.log(deleteOrUpdateValue);
// 			    		alert("請先選取要編輯的資料");
			    Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
	 			    			{
	 			    			msg: "請先選取要編輯的資料"
	 			    			});
			    	}else{
			    		umail_id.val(mail_idUpdateValue.text());
		    			umail_name.val(mail_nameUpdateValue.text());
		    			umail_text.val(mail_textUpdateValue.text());
		    			MailUpdateForm.dialog( "open" );
			    	}
			    } );
			    //點選修改鍵，所執行的方法
			    function updateMailFormToCreateTable() {
				      var valid = true;
				      uallFields.removeClass( "ui-state-error" );
					  valid = valid && checkLength( umail_name, "名稱", 1, 30 );
				      valid = valid && checkLength( umail_text, "內容", 1, 250 );
				 		if ( valid ) {
				 			var Updatedatas = $('form[name="MailUpdateForm"]').serialize();
				 			$.get('MailServletJSON.do',Updatedatas,function(data){
				 				if(data=="資料更新失敗"){
				 					 $('.validateTips').css('color','red').text("更新錯誤");
				 				}
				 				else if(data=="資料更新成功"){
				 					
				 					mail_idUpdateValue.text(umail_id.val());
				 					mail_nameUpdateValue.text(umail_name.val());
				 					mail_textUpdateValue.text(umail_text.val());
//	 			 					
							 		$('.validateTips').text("");////將更新form表單驗證區塊內容清空
							 		MailUpdateForm.dialog( "close" );
				 				}
				 			});
				 		}
				      return valid;
				    }
			  	
			    
    			//diolog程式部分以下(刪除)
				//設定刪除確認表單寬度視窗資料開始
			    MailDeleteConfirm =$( "#dialog-deleteForm" ).dialog({
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
			          "確認": deleteMailFormToCreateTable ,
			          "放棄": function() {
			            $( this ).dialog( "close" );
			            $('#dialog-deleteForm p').text('是否要刪除此筆資料?');
			          }
			        }
			    });
			 	
			    //點選刪除鍵，所執行的方法
				function deleteMailFormToCreateTable(){
				$.get('MailServletJSON.do',{"mail_id":deleteOrUpdateValue,"action":"deleteMail"},function(data){
					if(data=="資料刪除成功"){
						console.log(deleteOrUpdateValue);
						console.log(data);
						table.row('.selected').remove().draw( false );//刪除畫面上class為selected的那行
						MailDeleteConfirm.dialog( "close" );
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
			    		MailDeleteConfirm.dialog( "open" );
			    	}
			    } );
			    
	} );//load函數結束
	</script>
</body>
</html>






