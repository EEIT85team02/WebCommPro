<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
<title>Class_Page</title>
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
					<button id="buttonAll">全部選取</button>
					<button id="buttonRe">取消全選</button>
					<button id="buttonSel">選取筆數查詢</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 設定新增FORM表單區塊dialog -->
	<div id="dialog-insertForm" title="建立班級資料">
		<p class="allValid"></p>
		<form name="ClassInsertForm">
			<fieldset>
				<div class="divForm">
					<label for="edu_id" class="labelTitle">中心名稱:</label> 
					<select id="selectEdu_id" name='edu_id'>
				   	</select>
				</div>
				
				<div class="divForm">
					<label for="class_id" class="labelTitle">班級代號:</label> 
					<input type="text" name="class_id" id="class_id" size="20"  placeholder="班級代號(最大長度10碼)" autofocus autocomplete="off" required="required"> 
					<span id="spanclass_id"></span><br>
				</div>
				
				<div class="divForm">
					<label for="class_name" class="labelTitle">班級名稱:</label> 
					<input type="text" name="class_name" id="class_name" size="20"  placeholder="班級名稱(最大長度30碼)" autocomplete="off">
					<span id="spanclass_name"></span><br>
				</div>
				
				<div class="divForm">
					<label for="class_contact" class="labelTitle">聯絡人:</label> 
					<input type="text" name="class_contact" id="class_contact" size="20"  placeholder="班級聯絡人(最大長度10碼)" autocomplete="off">
					<span id="spanclass_contact"></span><br>
				</div>
				
				<div class="divForm">
					<label for="class_teach" class="labelTitle">班級導師:</label> 
					<input type="text" name="class_teach" id="class_teach" size="20"  placeholder="班級導師(最大長度10碼)" autocomplete="off"> 
					<span id="spanclass_teach"></span><br>
				</div>
				
				
				<input type="hidden" name="action" value="addClass">
				<input type="submit" tabindex="-1" style="position: absolute; top: -1000px">
			</fieldset>
		</form>
	</div>
	<!-- 設定修改FORM表單區塊dialog -->
	<div id="dialog-updateForm" title="修改班級資料">
		<p class="allValid"></p>
		<form name="ClassUpdateForm" action="updateClass">
			<fieldset>
				<div class="divForm">
					<label for="edu_id" class="labelTitle">中心名稱:</label> 
					<select id="uselectEdu_id" name='edu_id'>
				   	</select>
				</div>
				
				<div class="divForm">
					<label for="class_id" class="labelTitle">班級代號:</label> 
					<input type="text" name="class_id" id="uclass_id" size="20"  readOnly> 
					<span id="spanuclass_id"></span><br>
				</div>
				
				<div class="divForm">
					<label for="class_name" class="labelTitle">班級名稱:</label> 
					<input type="text" name="class_name" id="uclass_name" size="20"  autocomplete="off">
					<span id="spanuclass_name"></span><br>
				</div>
				
				<div class="divForm">
					<label for="class_contact" class="labelTitle">聯絡人:</label> 
					<input type="text" name="class_contact" id="uclass_contact" size="20"  autocomplete="off">
					<span id="spanuclass_contact"></span><br>
				</div>
				
				<div class="divForm">
					<label for="class_teach" class="labelTitle">班級導師:</label> 
					<input type="text" name="class_teach" id="uclass_teach" size="20"  autocomplete="off"> 
					<span id="spanuclass_teach"></span><br>
				</div>
				
				
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
		    	  "bJQueryUI":true,
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
			  	
			  	spanclass_id =$('#spanclass_id'),
				spanclass_name =$('#spanclass_name'),
				spanclass_contact =$('#spanclass_contact'),
				spanclass_teach =$('#spanclass_teach'),
			  	
				spanuclass_id =$('#spanuclass_id'),
				spanuclass_name =$('#spanuclass_name'),
				spanuclass_contact =$('#spanuclass_contact'),
				spanuclass_teach =$('#spanuclass_teach');
			
			
				var checkclass_id=null;
			 	var checkclass_name=null;
				var checkclass_contact=null;
				var checkclass_teach=null;
			
			 	var checkuclass_name=null;
			 	var checkuclass_contact=null;
			 	var checkuclass_teach=null;
			
			
				allSpan = $( [] ).add( spanclass_id ).add( spanclass_name ).add( spanclass_contact ).add( spanclass_teach );
				uallSpan = $( [] ).add( spanuclass_id ).add( spanuclass_name ).add( spanuclass_contact ).add( spanuclass_teach );
				
				allFields = $( [] ).add( class_id ).add( class_name ).add( class_contact ).add( class_teach ).add( edu_id );
		      	uallFields = $( [] ).add( uclass_id ).add( uclass_name ).add( uclass_contact ).add( uclass_teach ).add( uedu_id );
		      	allValid =$('.allValid');
				//點選新增鍵，所執行的方法
			    function insertClassFormToCreateTable() {
					console.log(checkInsertForm());
			      if ( checkInsertForm() ) {
			  		  	var Insertdatas = $('form[name="ClassInsertForm"]').serialize();
			  		  	console.log(Insertdatas);
			 			$.post('ClassServletJSON.do',Insertdatas,function(data){
			 				if(data=="資料新增失敗"){
			 					allValid.css('color','red').text("新增錯誤");
			 				}
			 				else if(data=="資料新增成功"){
			 					table.ajax.reload();//重新載入data tables的資料
						 		allFields.removeClass( "ui-state-error" );
			 					allFields.val("");//將新增form表單內容清空
			 					allValid.text("");////將新增form表單驗證區塊內容清空
			 					allSpan.text("");//將新增FROM表單的span內容清空
				 				ClassInsertForm.dialog( "close" );//將新增form表單關閉
				 				//取回資料庫資料並建立table內容結束
			 				}
			 			});
			 		}
			    }
			  //設定表單寬度視窗資料開始
			    ClassInsertForm = $( "#dialog-insertForm" ).dialog({
			      autoOpen: false,
			      height: 550,
			      width: 800,
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
 					allValid.text("");////將新增form表單驗證區塊內容清空
 					allSpan.text("");//將新增FROM表單的span內容清空
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
			
			    //點選tr資料，更換class類別,若被選取則更新為未選取，反之選取
				$('#ClassTable tbody').on( 'click', 'tr', function () {
					$(this).toggleClass('selected');
				    } );
			
			 	//diolog程式部分以下(更新)
				//設定表單寬度視窗資料開始
				  ClassUpdateForm = $( "#dialog-updateForm" ).dialog({
			      autoOpen: false,
			      height: 650,
			      width: 700,
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
 					uallFields.val("");//將新增form表單內容清空
 					allValid.text("");////將新增form表單驗證區塊內容清空
 					uallSpan.text("");//將新增FROM表單的span內容清空
			      }
			    });
			    
			  	//設定表單寬度視窗資料結束
			  	form = ClassUpdateForm.find( "form" ).on( "submit", function( event ) {
			      event.preventDefault();
			      updateClassFormToCreateTable();
			    });
			  //綁定click事件使用者編輯icon，開啟dialog 表單ClassUpdateForm(判斷資料是否多選-僅能選取一筆!!)
			  //綁定click事件使用者編輯icon，開啟dialog 表單ClassUpdateForm
			 	$('#buttonUpdate').click( function () {
			 		
			 		if(table.rows('.selected').data().length == 0){
			    		alert("請選取一筆要進行編輯的資料");
			    	}else if(table.rows('.selected').data().length > 1){
			    		alert("[編輯]功能僅能選取一筆資料。");
			    	}else if(table.rows('.selected').data().length == 1){
			    		ClickUpdateValue = $('tr.selected').find('td:eq(0)').text();//抓到選到的class為selected的教育中心代號
				 		console.log(ClickUpdateValue);
				 		$.getJSON('ClassServletJSON.do', {"action":"getoneClass","class_id":ClickUpdateValue}, function(datas) {
							console.log(datas);
							//將抓到的教育中心代號，發送request請資料庫傳回該筆資料JSON
							$.each(datas, function(i, Clas) {
								uclass_id.val(Clas.class_id);
							  	uclass_name.val(Clas.class_name),
							  	uclass_contact.val(Clas.class_contact),
							  	uclass_teach.val(Clas.class_teach),
							  	uedu_id.val(Clas.edu_id);
							});
						});
				 		ClassUpdateForm.dialog( "open" );
			    	}
			 	} );
			    //點選修改鍵，所執行的方法
			    function updateClassFormToCreateTable() {
				     	if ( checkUpdateForm() ) {
				 			var Updatedatas = $('form[name="ClassUpdateForm"]').serialize();
				 			$.get('ClassServletJSON.do',Updatedatas,function(data){
				 				console.log(data);
				 				if(data=="資料更新失敗"){
				 					 $('.validateTips').css('color','red').text("更新錯誤");
				 				}
				 				else if(data=="資料更新成功"){
				 					table.ajax.reload();//重新載入data tables的資料 ?? 須改為直接抓取原更新表單的值回填回去表格
				 					ClassUpdateForm.dialog( "close" );
				 				}
				 			});
				 		}
				      sel=[];
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
				$.get('ClassServletJSON.do',{"class_id":selJSON,"action":"deleteClassMulti"},function(data){
					if(data=="資料刪除成功"){
						//table.row('.selected').remove().draw( false );//刪除畫面上class為selected的那行
						table.ajax.reload();//重新載入data tables的資料 ?? 須改為直接抓取原更新表單的值回填回去表格
						ClassDeleteConfirm.dialog( "close" );
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
			    		ClassDeleteConfirm.dialog( "open" );
			    	}
			    });
			    
			  //呼叫ServletJSON取回下拉選單資料--編輯表單
			    $.getJSON('EduServletJSON.do', {"action":"getALLEdu"}, function(datas) {
					console.log("datas:"+datas);
					$.each(datas, function(i, Edus) {
						uedu_id.append( 
					 			"<option value="+ Edus.edu_id +">"+Edus.edu_name+"</option>" 
			       			);

					});
				});//取回資料庫資料並建立內容結束  
			   
			  
				
				
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
				
			  
			  
			  
				//新增表格欄位判斷
				//ckeckclass_name欄位驗證(滑鼠離開後檢查)AJAX查詢登打的代號是否已存在資料庫中
			    class_id.blur(fcheckclass_id);
			    function fcheckclass_id() {
			    	checkclass_id=true;
			    	var class_idVal=class_id.val();
			    	var class_idValLength = class_idVal.length;
			    	
			    	$.get('ClassServletJSON.do',{'class_id':class_idVal,"action":"checkClassId"},function(data){
			    		console.log(data);
						if(data=="代號已存在"){
							console.log("aaaaa");
							spanclass_id.html("<img src='../img/error.png' style='width:16px'/>此班級代號已存在").css('color','red');
							checkclass_id=false;
						}else {
							console.log("ddddddd");
						    spanclass_id.html("<img src='../img/correct.png' style='width:16px'/>");
						    checkclass_id=true;
						    	
				    	}
						
						
					})
				}
				
				
			    
			    

			  //ckeckclass_name欄位滑鼠離開後的判斷驗證
				class_name.blur(fcheckclass_name);
				function fcheckclass_name(){
					checkclass_name=false;
					var class_nameVal=class_name.val();
					var class_nameValLength = class_nameVal.length;
					if(class_nameVal==""){
						spanclass_name.html("<img src='../img/error.png' style='width:16px'/>班級名稱不可為空白").css('color','red');
					}else if(class_nameValLength>30)
						spanclass_name.html("<img src='../img/error.png' style='width:16px'/>班級名稱欄位長度不可大於30碼").css('color','red');
					else{
						spanclass_name.html("<img src='../img/correct.png' style='width:16px'/>");
						checkclass_name=true;
					}
				}
				
				 //ckeckclass_contact欄位滑鼠離開後的判斷驗證
				class_contact.blur(fcheckclass_contact);
				function fcheckclass_contact(){
					checkclass_contact=false;
					var class_contactVal=class_contact.val();
					var class_contactValLength = class_contactVal.length;
					if(class_contactVal==""){
						spanclass_contact.html("<img src='../img/error.png' style='width:16px'/>聯絡人不可為空白").css('color','red');
					}else if(class_contactValLength>10)
						spanclass_contact.html("<img src='../img/error.png' style='width:16px'/>聯絡人欄位長度不可大於10碼").css('color','red');
					else{
						spanclass_contact.html("<img src='../img/correct.png' style='width:16px'/>");
						checkclass_contact=true;
					}
				}
			  
				 //ckeckclass_teach欄位滑鼠離開後的判斷驗證
				class_teach.blur(fcheckclass_teach);
				function fcheckclass_teach(){
					checkclass_teach=false;
					var class_teachVal=class_teach.val();
					var class_teachValLength = class_teachVal.length;
					if(class_teachVal==""){
						spanclass_teach.html("<img src='../img/error.png' style='width:16px'/>班級導師不可為空白").css('color','red');
					}else if(class_teachValLength>10)
						spanclass_teach.html("<img src='../img/error.png' style='width:16px'/>班級導師欄位長度不可大於10碼").css('color','red');
					else{
						spanclass_teach.html("<img src='../img/correct.png' style='width:16px'/>");
						checkclass_teach=true;
					}
				}
				
				//送出新增表單全部判斷
				function checkInsertForm(){
					fcheckclass_id();
					fcheckclass_name();
					fcheckclass_contact();
					fcheckclass_teach();
					console.log(checkclass_id);
					console.log(checkclass_name);
					console.log(checkclass_contact);
					console.log(checkclass_teach);
					if(checkclass_id && checkclass_name && checkclass_contact && checkclass_teach){
						alert("資料皆正確，送出中");
						return true;
					}
					else {
						alert("資料錯誤，請檢查欄位長度格式是否正確");
						return false;
					} 
						
				}
			  
			  	//修改表格欄位判斷
				//ckeckuclass_name欄位滑鼠離開後的判斷驗證
				uclass_name.blur(fcheckuclass_name);
				function fcheckuclass_name(){
					checkuclass_name=false;
					var uclass_nameVal=uclass_name.val();
					var uclass_nameValLength = uclass_nameVal.length;
					if(uclass_nameVal==""){
						spanuclass_name.html("<img src='../img/error.png' style='width:16px'/>班級名稱不可為空白").css('color','red');
					}else if(uclass_nameValLength>30)
						spanuclass_name.html("<img src='../img/error.png' style='width:16px'/>班級名稱欄位長度不可大於30碼").css('color','red');
					else{
						spanuclass_name.html("<img src='../img/correct.png' style='width:16px'/>");
						checkuclass_name=true;
					}
				}
				
				 //ckeckuclass_contact欄位滑鼠離開後的判斷驗證
				uclass_contact.blur(fcheckuclass_contact);
				function fcheckuclass_contact(){
					checkuclass_contact=false;
					var uclass_contactVal=uclass_contact.val();
					var uclass_contactValLength = uclass_contactVal.length;
					if(uclass_contactVal==""){
						spanuclass_contact.html("<img src='../img/error.png' style='width:16px'/>聯絡人不可為空白").css('color','red');
					}else if(uclass_contactValLength>10)
						spanuclass_contact.html("<img src='../img/error.png' style='width:16px'/>聯絡人欄位長度不可大於10碼").css('color','red');
					else{
						spanuclass_contact.html("<img src='../img/correct.png' style='width:16px'/>");
						checkuclass_contact=true;
					}
				}
			  
				 //ckeckuclass_teach欄位滑鼠離開後的判斷驗證
				uclass_teach.blur(fcheckuclass_teach);
				function fcheckuclass_teach(){
					checkuclass_teach=false;
					var uclass_teachVal=uclass_teach.val();
					var uclass_teachValLength = uclass_teachVal.length;
					if(uclass_teachVal==""){
						spanuclass_teach.html("<img src='../img/error.png' style='width:16px'/>班級導師不可為空白").css('color','red');
					}else if(uclass_teachValLength>10)
						spanuclass_teach.html("<img src='../img/error.png' style='width:16px'/>班級導師欄位長度不可大於10碼").css('color','red');
					else{
						spanuclass_teach.html("<img src='../img/correct.png' style='width:16px'/>");
						checkuclass_teach=true;
					}
				}
				
				
				//送出新增表單全部判斷
				function checkUpdateForm(){
					fcheckuclass_name();
					fcheckuclass_contact();
					fcheckuclass_teach();
					console.log(checkuclass_name);
					console.log(checkuclass_contact);
					console.log(checkuclass_teach);
					if( checkuclass_name && checkuclass_contact && checkuclass_teach){
						alert("資料皆正確，送出中");
						return true;
					}
					else {
						alert("資料錯誤，請檢查欄位長度格式是否正確");
						return false;
					} 
						
				}
			  
			 
				
			  
				
				
	} );//load函數結束
	</script>
</body>
</html>
<!--  if(class_idVal==""){ -->
<!-- 									console.log("bbbbbb"); -->
<!-- 									spanclass_id.html("<img src='../img/error.png' style='width:16px'/>班級代號不可為空白").css('color','red'); -->
<!-- 						    		checkclass_id=false; -->
<!-- 						    	}else if(class_idValLength>10){ -->
<!-- 						    		console.log("cccccccc"); -->
<!-- 						    		spanclass_id.html("<img src='../img/error.png' style='width:16px'/>班級代號欄位長度不可大於10碼").css('color','red'); -->
<!-- 						    		checkclass_id=false; -->
<!-- 						    	} -->





