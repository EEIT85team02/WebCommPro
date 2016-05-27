<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
<title>Class_Page</title>

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
					<table id="ClassTable" class="display" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="col-md-1 col-xs-2">班級代號</th>
								<th class="col-md-3 col-xs-3">班級名稱</th>
								<th class="col-md-2 col-xs-2">聯絡人</th>
								<th class="col-md-2 col-xs-2">班級導師</th>
								<th class="col-md-1 col-xs-1">中心代號</th>
								<th class="col-md-2 col-xs-2">中心名稱</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						<tfoot>
							<tr>
								<th>班級代號</th>
								<th>班級名稱</th>
								<th>聯絡人</th>
								<th>班級導師</th>
								<th>中心代號</th>
								<th>中心名稱</th>
							</tr>
						</tfoot>
					</table>

					<!------------------點選新增班級表單區塊內容----------------------------- -->
					<button id="buttonAdd">新增</button>
					<button id="buttonUpdate">編輯</button>
					<button id="buttonDelete">刪除</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 設定新增FORM表單區塊dialog -->
	<div id="dialog-insertForm" title="建立班級資料">
		<p class="validateTips"></p>
		<form name="ClassInsertForm">
			<fieldset>
				<label for="edu_id">中心名稱</label> 
				<select id="selectEdu_id" name='edu_id'>
			   		
				</select>
				<br>
				<label for="class_id">班級代號</label> 
				<input type="text" name="class_id" id="class_id" class="text ui-widget-content ui-corner-all" placeholder="請輸入班級代號" autocomplete="off" required="required"> 
				<span id="idspan"></span><br>
				<label for="class_name">班級名稱</label> 
				<input type="text" name="class_name" id="class_name" class="text ui-widget-content ui-corner-all" placeholder="請輸入班級名稱" autocomplete="off">
				<label for="class_contact">聯絡人</label> 
				<input type="text" name="class_contact" id="class_contact" class="text ui-widget-content ui-corner-all" placeholder="請輸入班級聯絡人" autocomplete="off">
				<label for="class_teach">班級導師</label> 
				<input type="text" name="class_teach" id="class_teach" class="text ui-widget-content ui-corner-all" placeholder="請輸入班級導師" autocomplete="off"> 
				<input type="hidden" name="action" value="addClass">
				<input type="submit" tabindex="-1" style="position: absolute; top: -1000px">
			</fieldset>
		</form>
	</div>
	<!-- 設定修改FORM表單區塊dialog -->
	<div id="dialog-updateForm" title="修改班級資料">
		<p class="validateTips"></p>
		<form name="ClassUpdateForm" action="updateClass">
			<fieldset>
				<label for="edu_id">中心名稱</label> 
				<select id="uselectEdu_id" name='edu_id'>
			   		
			   	</select>
				<br>
				
				<label for="class_id">班級代號</label> 
				<input type="text" name="class_id" id="uclass_id" class="text ui-widget-content ui-corner-all" readOnly> 
				<label for="class_name">班級名稱</label> 
				<input type="text" name="class_name" id="uclass_name" class="text ui-widget-content ui-corner-all" autocomplete="off">
				<label for="class_contact">聯絡人</label> 
				<input type="text" name="class_contact" id="uclass_contact" class="text ui-widget-content ui-corner-all" autocomplete="off">
				<label for="class_teach">班級導師</label> 
				<input type="text" name="class_teach" id="uclass_teach" class="text ui-widget-content ui-corner-all" autocomplete="off"> 
				<input type="hidden" name="action" value="updateClass">
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
			var table = $('#ClassTable').DataTable( {
				 	"ajax": {
			            "url": "ClassToJSONInitTableServlet",
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
			var form,ClassInsertForm,ClassUpdateForm,
				class_id = $( "#class_id" ),
				class_name = $( "#class_name" ),
				class_contact = $( "#class_contact" ),
				class_teach = $( "#class_teach" ),
		      	edu_id = $('#selectEdu_id'),
		      	
				uclass_id = $('#uclass_id'),
			  	uclass_name = $('#uclass_name'),
			  	uclass_contact = $('#uclass_contact'),
			  	uclass_teach = $('#uclass_teach'),
			  	uedu_id = $('#uselectEdu_id'),
			  	
			  	idspan = $('#idspan'),
				deleteOrUpdateValue = null;//檢查是否有選取資料行
				
		      	allFields = $( [] ).add( class_id ).add( class_name ).add( class_contact ).add( class_teach ).add( edu_id );
		      	uallFields = $( [] ).add( uclass_id ).add( uclass_name ).add( uclass_contact ).add( uclass_teach ).add( uedu_id );
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
			    function insertClassFormToCreateTable() {
			      var valid = true;
			      allFields.removeClass( "ui-state-error" );
			      valid = valid && checkLength( edu_id, "中心代號/名稱", 1, 30 );
			      valid = valid && checkLength( class_id, "班級代號", 1, 10 );
				  valid = valid && checkLength( class_name, "班級名稱", 1, 30 );
			      valid = valid && checkLength( class_contact, "聯絡人", 1, 10 );
			      valid = valid && checkLength( class_teach, "班級導師", 1, 10 );
			      
			      //驗證資料class_id是否存在系統 col->$('#欄位ID')欄位資料
			      console.log("valid:"+valid);
				     
// 				      $.get('ClassServletJSON.do',{'class_id':class_id.val(),"action":"checkClassId"},function(data){
// 				    	  console.log("data:"+data);
// 							if(data == "代號已存在"){
// 								console.log("data1:"+data);
// 								idspan.text("此班級代號已存在系統").css('color','red');
// 								valid = false;
// 							}else if(data == "代號不存在"){
// 								console.log("data2:"+data);
// 								valid = true;
// 								idspan.text("");
// 							}
// 						})
					console.log("valid1:"+valid);
			      
			  	  if ( valid ) {
			  		  	var Insertdatas = $('form[name="ClassInsertForm"]').serialize();
			 			$.post('ClassServletJSON.do',Insertdatas,function(data){
			 				console.log(data);
			 				if(data=="資料新增失敗"){
			 					$('.validateTips').css('color','red').text("新增錯誤");
			 				}
			 				else if(data=="資料新增成功"){
			 					table.ajax.reload();//重新載入data tables的資料
			 					allFields.val("");//將新增form表單內容清空
						 		$('.validateTips').text("");////將新增form表單驗證區塊內容清空
						 		idspan.text("");
						 		deleteOrUpdateValue = null;
				 				ClassInsertForm.dialog( "close" );//將新增form表單關閉
				 				//取回資料庫資料並建立table內容結束
			 				}
			 			});
			 		}
			      return valid;
			    }
			  //設定表單寬度視窗資料開始
			    ClassInsertForm = $( "#dialog-insertForm" ).dialog({
			      autoOpen: false,
			      height: 550,
			      width: 400,
			      modal: true,
			      buttons: {
			        "send": insertClassFormToCreateTable,
			        Cancel: function() {
			        	ClassInsertForm.dialog( "close" );
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
			  	form = ClassInsertForm.find( "form" ).on( "submit", function( event ) {
			      event.preventDefault();
			      insertClassFormToCreateTable();
			    });
			 	//綁定click事件使用者新增icon，開啟dialog 表單ClassInsertForm
			    $( "#buttonAdd" ).button().on( "click", function() {
			    	//呼叫ServletJSON取回下拉選單資料--新增表單
			    	$.getJSON('EduServletJSON.do', {"action":"getALLEdu"}, function(datas) {
						//console.log(datas);
						$.each(datas, function(i, Edus) {
							edu_id.append( 
						 		"<option value="+ Edus.edu_id +">" + Edus.edu_name + "</option>");
						});
					});
			    ClassInsertForm.dialog( "open" );
			    });//diolog程式部分結束
			
				//點選要刪除或編輯的那行，按刪除或編輯鍵即可，先將選取的[行]資料儲存成變數
				$('#ClassTable tbody').on( 'click', 'tr', function () {
					deleteOrUpdateValue = $(this).find('td:eq(0)').text(); 
					class_idUpdateValue = $(this).find('td:eq(0)'); 
					class_nameUpdateValue = $(this).find('td:eq(1)');
					class_contactUpdateValue = $(this).find('td:eq(2)');
					class_teachUpdateValue = $(this).find('td:eq(3)');
					edu_idUpdateValue = $(this).find('td:eq(4)');
					edu_nameUpdateValue = $(this).find('td:eq(5)');
					console.log(edu_idUpdateValue.text());
					console.log(edu_nameUpdateValue.text());
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
				  ClassUpdateForm = $( "#dialog-updateForm" ).dialog({
			      autoOpen: false,
			      height: 650,
			      width: 400,
			      modal: true,
			      buttons: {
				        "send": updateClassFormToCreateTable,
				        Cancel: function() {
				        	ClassUpdateForm.dialog( "close" );
				        }
				      },
			      close: function() {
			        form[ 0 ].reset();
			        uallFields.removeClass( "ui-state-error" );
			      }
			    });
			    
			  	//設定表單寬度視窗資料結束
			  	form = ClassUpdateForm.find( "form" ).on( "submit", function( event ) {
			      event.preventDefault();
			      updateClassFormToCreateTable();
			    });

			  //綁定click事件使用者編輯icon，開啟dialog 表單ClassUpdateForm
			 	$('#buttonUpdate').click( function () {
			 		
			    	if(deleteOrUpdateValue==null){
			    		console.log(deleteOrUpdateValue);
			    		alert("請先選取要編輯的資料");
			    	}else{
			    		//表單開啟，自動載入edu_id下拉選單資料
			  			//記錄選取的行資料，將其資料放入FORM表單中
						console.log("uedu_id.val():"+uedu_id.val());
						console.log("uedu_id.text():"+uedu_id.text());
						uedu_id.val(edu_idUpdateValue.text());
			    		uclass_id.val(class_idUpdateValue.text());
		    			uclass_name.val(class_nameUpdateValue.text());
		    			uclass_contact.val(class_contactUpdateValue.text());
		    			uclass_teach.val(class_teachUpdateValue.text());
		    			
		    			ClassUpdateForm.dialog( "open" );
		    			
			    	}
			    } );
			    //點選修改鍵，所執行的方法
			    function updateClassFormToCreateTable() {
				      var valid = true;
				      uallFields.removeClass( "ui-state-error" );
				      valid = valid && checkLength( uedu_id, "中心代號/名稱", 1, 30 );
					  valid = valid && checkLength( uclass_name, "班級名稱", 1, 30 );
				      valid = valid && checkLength( uclass_contact, "聯絡人", 1, 10 );
				      valid = valid && checkLength( uclass_teach, "班級導師", 1, 10 );
				      
				 		if ( valid ) {
				 			var Updatedatas = $('form[name="ClassUpdateForm"]').serialize();
				 			console.log(Updatedatas);
				 			$.post('ClassServletJSON.do',Updatedatas,function(data){
				 				if(data=="資料更新失敗"){
				 					 $('.validateTips').css('color','red').text("更新錯誤");
				 				}
				 				else if(data=="資料更新成功"){
				 					console.log(data);
				 					updateValue = uclass_id.val();
				 					$.getJSON('ClassServletJSON.do', {"action":"getoneClass","class_id":updateValue}, function(datas) {
				 			    		$.each(datas,function(i,Clas){
				 			    			edu_idUpdateValue.text(	Clas.edu_id);
				 			    			edu_nameUpdateValue.text(Clas.edu_name);
						 					class_idUpdateValue.text(Clas.class_id);
						 					class_nameUpdateValue.text(Clas.class_name);
						 					class_contactUpdateValue.text(Clas.class_contact);
						 					class_teachUpdateValue.text(Clas.class_teach);
				 			    		})
				 			    	})
 			 						$('.validateTips').text("");////將更新form表單驗證區塊內容清空
							 		ClassUpdateForm.dialog( "close" );
				 				}
				 			});
				 		}
				      return valid;
				    }
			  	
			    
    			//diolog程式部分以下(刪除)
				//設定刪除確認表單寬度視窗資料開始
			    ClassDeleteConfirm =$( "#dialog-deleteForm" ).dialog({
			        autoOpen: false,
			        height: 200,
			        width: 240,
			        modal: true,
			        buttons: {
			          "確認": deleteClassFormToCreateTable ,
			          "放棄": function() {
			            $( this ).dialog( "close" );
			            $('#dialog-deleteForm p').text('是否要刪除此筆資料?');
			          }
			        }
			    });
			 	
			    //點選刪除鍵，所執行的方法
				function deleteClassFormToCreateTable(){
				$.get('ClassServletJSON.do',{"class_id":deleteOrUpdateValue,"action":"deleteClass"},function(data){
					if(data=="資料刪除成功"){
						console.log(deleteOrUpdateValue);
						console.log(data);
						table.row('.selected').remove().draw( false );//刪除畫面上class為selected的那行
						ClassDeleteConfirm.dialog( "close" );
					}else if (data=="資料刪除失敗"){
						$('#dialog-deleteForm p').text('資料刪除失敗，資料使用中');
					}
				});
				
		    	}
			   
		
			 
			    $('#buttonDelete').click( function () {
			    	
			    	if(deleteOrUpdateValue==null){
			    		alert("請先選取要刪除的資料");
			    	}else{
			    		ClassDeleteConfirm.dialog( "open" );
			    	}
			    } );
			    
			  //呼叫ServletJSON取回下拉選單資料--編輯表單
			    $.getJSON('EduServletJSON.do', {"action":"getALLEdu"}, function(datas) {
					console.log("datas:"+datas);
					$.each(datas, function(i, Edus) {
						uedu_id.append( 
					 			"<option value="+ Edus.edu_id +">"+Edus.edu_name+"</option>" 
			       			);

					});
				});//取回資料庫資料並建立內容結束  
			   
			   //class_id欄位驗證(滑鼠離開後檢查)AJAX查詢登打的代號是否已存在資料庫中
			    class_id.blur(function() {
					$.get('ClassServletJSON.do',{'class_id':class_id.val(),"action":"checkClassId"},function(data){
						if(data=="代號已存在"){
							idspan.text("此班級代號已存在系統").css('color','red');
						}else {
							idspan.text("");
						}
					})
				});
			  
				
				
	} );//load函數結束
	</script>
</body>
</html>






