<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">
<html>
<head>
<title>Edu_Page</title>
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
	<div class="container-fluid">
		<div class="Main_Content">
			<div class="row">
				<div class="col-md-12">
				<hr>
					<table id="EduTable" class="display" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="col-md-1 col-xs-1">代號</th>
								<th class="col-md-3 col-xs-3">中心名稱</th>
								<th class="col-md-3 col-xs-3">中心地址</th>
								<th class="col-md-3 col-xs-3">中心電話</th>
								<th class="col-md-2 col-xs-2">連絡人</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						<tfoot>
							<tr>
								<th>代號</th>
								<th>中心名稱</th>
								<th>中心地址</th>
								<th>中心電話</th>
								<th>連絡人</th>
							</tr>
						</tfoot>
					</table>
					<!------------------點選新增教育中心表單區塊內容----------------------------- -->
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
	<div id="dialog-insertForm" title="建立教育中心資料">
	<p class="allValid"></p>
		<form name="EduInsertForm">
			<fieldset>
				<div class="divForm">
					<label for="edu_name" class="labelTitle">中心名稱:</label> 
					<input type="text" name="edu_name" size="20" id="edu_name" placeholder="中心名稱(最大長度30碼)" autocomplete="off">
					<span id="spanedu_name"></span>
				</div>	
				
				<div class="divForm">
					<label for="edu_add" class="labelTitle">中心地址:</label> 
					<input type="text" name="edu_add" size="20" id="edu_add" placeholder="中心地址(最大長度30碼)" autocomplete="off">
					<span id="spanedu_add"></span>
				</div>
				
				<div class="divForm">
					<label for="edu_tel" class="labelTitle">中心電話:</label> 
					<input type="text" name="edu_tel" size="20" id="edu_tel" placeholder="中心電話(範例:02-29961234)" autocomplete="off">
					<span id="spanedu_tel"></span>
				</div>
				
				<div class="divForm">
					<label for="edu_contact" class="labelTitle">聯絡人:</label> 
					<input type="text" name="edu_contact" size="20" id="edu_contact"  placeholder="聯絡人(最大長度30碼)" autocomplete="off">
					<span id="spanedu_contact"></span>
				</div>
				
				<input type="hidden" name="action" value="addEdu">
				<input type="submit" tabindex="-1" style="position: absolute; top: -1000px">
				
			</fieldset>
		</form>
	</div>
	<!-- 設定修改FORM表單區塊dialog -->
	<div id="dialog-updateForm" title="修改教育中心資料">
	<p class="allValid"></p>
		<form name="EduUpdateForm">
			<fieldset>
				<div class="divForm">	
					<label for="edu_id" class="labelTitle">中心代號:</label> 
					<input type="text" name="edu_id" size="20" id="uedu_id" readOnly style="background-color:	#888888">
					<span id="spanuedu_id"></span>
				</div>
					
				<div class="divForm">
					<label for="edu_name" class="labelTitle">中心名稱:</label> 
					<input type="text" name="edu_name" size="20" id="uedu_name" autocomplete="off"> 
					<span id="spanuedu_name"></span>
				</div>
				
				<div class="divForm">
					<label for="edu_add" class="labelTitle">中心地址:</label> 
					<input type="text" name="edu_add" size="20" id="uedu_add" autocomplete="off">
					<span id="spanuedu_add"></span>
				</div>
				
				<div class="divForm">
					<label for="edu_tel" class="labelTitle">中心電話:</label> 
					<input type="text" name="edu_tel" size="20" id="uedu_tel" autocomplete="off">
					<span id="spanuedu_tel"></span>
				</div>
				
				<div class="divForm">
					<label for="edu_contact" class="labelTitle">聯絡人</label> 
					<input type="text" name="edu_contact" size="20" id="uedu_contact" autocomplete="off"> 
					<span id="spanuedu_contact"></span>
				</div>
				
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
			            "url": "/projectmain/Edu/EduToJSONInitTableServlet",
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
			  	uedu_contact = $('#uedu_contact'),
				
			  	spanedu_name =$('#spanedu_name'),
				spanedu_add =$('#spanedu_add'),
				spanedu_tel =$('#spanedu_tel'),
				spanedu_contact =$('#spanedu_contact'),
				
				spanuedu_id =$('#spanuedu_id'),
				spanuedu_name =$('#spanuedu_name'),
				spanuedu_add =$('#spanuedu_add'),
				spanuedu_tel =$('#spanuedu_tel'),
				spanuedu_contact =$('#spanuedu_contact');
				
				
				var checkedu_name=null;
				var checkedu_add=null;
				var checkedu_tel=null;
				var checkedu_contact=null;
				
				var checkuedu_name=null;
				var checkuedu_add =null;
				var checkuedu_tel=null;
				var checkuedu_contact=null;
				
				
				
				allSpan = $( [] ).add( spanedu_name ).add( spanedu_add ).add( spanedu_tel ).add( spanedu_contact );
				uallSpan = $( [] ).add( spanuedu_name ).add( spanuedu_add ).add( spanuedu_tel ).add( spanuedu_contact );
				allFields = $( [] ).add( edu_id ).add( edu_name ).add( edu_add ).add( edu_tel ).add( edu_contact );
		      	uallFields = $( [] ).add( uedu_id ).add( uedu_name ).add( uedu_add ).add( uedu_tel ).add( uedu_contact );
		      	allValid =$('.allValid');
		      	//點選新增鍵，所執行的方法
			    function insertEduFormToCreateTable() {	      
					if ( checkInsertForm() ) {
			 			var Insertdatas = $('form[name="EduInsertForm"]').serialize();
			 			$.post('EduServletJSON.do',Insertdatas,function(data){
			 				if(data=="資料新增失敗"){
			 					allValid.css('color','red').text("新增錯誤");
			 				}
			 				else if(data=="資料新增成功"){
			 					table.ajax.reload();//重新載入data tables的資料
			 					allFields.removeClass( "ui-state-error" );
			 					allFields.val("");//將新增form表單內容清空
			 					allValid.text("");////將新增form表單驗證區塊內容清空
			 					allSpan.text("");//將新增FROM表單的span內容清空
						 		EduInsertForm.dialog( "close" );//將新增form表單關閉
				 				//取回資料庫資料並建立table內容結束
			 				}
			 			});
			 		}
			     }
			  //設定表單寬度視窗資料開始
			    EduInsertForm = $( "#dialog-insertForm" ).dialog({
			      autoOpen: false,
			      height: 500,
			      width: 700,
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
 					allValid.text("");////將新增form表單驗證區塊內容清空
 					allSpan.text("");//將新增FROM表單的span內容清空
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
				//點選tr資料，更換class類別,若被選取則更新為未選取，反之選取
				$('#EduTable tbody').on( 'click', 'tr', function () {
					$(this).toggleClass('selected');
				    });
				//diolog程式部分以下(更新)
				//設定表單寬度視窗資料開始
				EduUpdateForm = $( "#dialog-updateForm" ).dialog({
			      autoOpen: false,
			      height: 600,
			      width: 700,
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
			        uallFields.val("");//將更新form表單內容清空
 					allValid.text("");////將更新form表單驗證區塊內容清空
 					uallSpan.text("");//將更新FROM表單的span內容清空
			      }
			    });
			    //設定表單寬度視窗資料結束
			  	form = EduUpdateForm.find( "form" ).on( "submit", function( event ) {
			      event.preventDefault();
			      updateEduFormToCreateTable();
			    });
				//綁定click事件使用者編輯icon，開啟dialog 表單EduUpdateForm(判斷資料是否多選-僅能選取一筆!!)
				//table.rows('.selected').data().length->指的是，有幾筆列資料，套用得Class為selected
			 	$('#buttonUpdate').click( function () {
			 		if(table.rows('.selected').data().length == 0){
			    		alert("請選取一筆要進行編輯的資料");
			    	}else if(table.rows('.selected').data().length > 1){
			    		alert("[編輯]功能僅能選取一筆資料。");
			    	}else if(table.rows('.selected').data().length == 1){
			    		ClickUpdateValue = $('tr.selected').find('td:eq(0)').text();//抓到選到的class為selected的教育中心代號
				 		console.log(ClickUpdateValue);
				 		$.getJSON('EduServletJSON.do', {"action":"getoneEdu","edu_id":ClickUpdateValue}, function(datas) {
							console.log(datas);
							//將抓到的教育中心代號，發送request請資料庫傳回該筆資料JSON
							$.each(datas, function(i, Edus) {
								uedu_id.val(Edus.edu_id);
							  	uedu_name.val(Edus.edu_name),
							  	uedu_add.val(Edus.edu_add),
							  	uedu_tel.val(Edus.edu_tel),
							  	uedu_contact.val(Edus.edu_contact);
							});
						});
				 		EduUpdateForm.dialog( "open" );
			    	}
			 	} );
			    //點選修改鍵，所執行的方法
			    function updateEduFormToCreateTable() {
				      if ( checkUpdateForm() ) {
				 			var Updatedatas = $('form[name="EduUpdateForm"]').serialize();
				 			//console.log(Updatedatas);
				 			$.get('EduServletJSON.do',Updatedatas,function(data){
				 				console.log(data);
				 				if(data=="資料更新失敗"){
				 					allValid.css('color','red').text("更新錯誤");
				 				}
				 				else if(data=="資料更新成功"){
				 					table.ajax.reload();//重新載入data tables的資料 ?? 須改為直接抓取原更新表單的值回填回去表格
				 					EduUpdateForm.dialog( "close" );
				 				}
				 			});
				 		}
				 	  sel=[];
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
			        	sel=[];
			            $( this ).dialog( "close" );
			            $('#dialog-deleteForm p').text('是否要刪除資料?');
			          }
			        }
			    });
			 	//點選刪除鍵，所執行的方法
				function deleteEduFormToCreateTable(){
			 	$.get('EduServletJSON.do',{"edu_id":selJSON,"action":"deleteEduMulti"},function(data){
					if(data=="資料刪除成功"){
						//table.row('tbody > tr.selected').remove().draw( false );//刪除畫面上class為selected的那行
						table.ajax.reload();//重新載入data tables的資料 ?? 須改為直接抓取原更新表單的值回填回去表格
						EduDeleteConfirm.dialog( "close" );
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
			    		EduDeleteConfirm.dialog( "open" );
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
				//新增表格欄位判斷
				//ckeckedu_name欄位滑鼠離開後的判斷驗證
				edu_name.blur(fcheckedu_name);
				
				function fcheckedu_name(){
					checkedu_name=false;
					var edu_nameVal=edu_name.val();
					var edu_nameValLength = edu_nameVal.length;
					if(edu_nameVal==""){
						spanedu_name.html("<img src='../img/error.png' style='width:16px'/>中心名稱不可為空白").css('color','red');
					}else if(edu_nameValLength>30)
						spanedu_name.html("<img src='../img/error.png' style='width:16px'/>中心名稱欄位長度不可大於30碼").css('color','red');
					else{
						spanedu_name.html("<img src='../img/correct.png' style='width:16px'/>");
						checkedu_name=true;
					}
				}
				//ckeckedu_add欄位滑鼠離開後的判斷驗證
				edu_add.blur(fcheckedu_add);
				function fcheckedu_add(){
					checkedu_add=false;
					var edu_addVal=edu_add.val();
					var edu_addValLength = edu_addVal.length;
					if(edu_addVal==""){
						spanedu_add.html("<img src='../img/error.png' style='width:16px'/>中心地址不可為空白").css('color','red');
					}else if(edu_addValLength>30)
						spanedu_add.html("<img src='../img/error.png' style='width:16px'/>中心地址欄位長度不可大於30碼").css('color','red');
					else{
						spanedu_add.html("<img src='../img/correct.png' style='width:16px'/>");
						checkedu_add=true;
					}
				}
				//ckeckedu_tel欄位滑鼠離開後的判斷驗證
				edu_tel.blur(fcheckedu_tel);
				function fcheckedu_tel(){
					checkedu_tel=false;
					var edu_telVal=edu_tel.val();
					var edu_telValLength = edu_telVal.length;
					var re = /^[0]{1}[1-9]{1}-[0-9]{7,8}$/;
					if(edu_telVal==""){
						spanedu_tel.html("<img src='../img/error.png' style='width:16px'/>中心電話不可為空白").css('color','red');
					}else if(!re.test(edu_telVal))
						spanedu_tel.html("<img src='../img/error.png' style='width:16px'/>中心電話欄位格式不符").css('color','red');
					else{
						spanedu_tel.html("<img src='../img/correct.png' style='width:16px'/>");
						checkedu_tel=true;
					}
				}
				//ckeckedu_contact欄位滑鼠離開後的判斷驗證
				edu_contact.blur(fcheckedu_contact)
				function fcheckedu_contact(){
					checkedu_contact=false;
					var edu_contactVal=edu_contact.val();
					var edu_contactValLength = edu_contactVal.length;
					if(edu_contactVal==""){
						spanedu_contact.html("<img src='../img/error.png' style='width:16px'/>聯絡人不可為空白").css('color','red');
					}else if(edu_contactValLength>30)
						spanedu_contact.html("<img src='../img/error.png' style='width:16px'/>聯絡人欄位長度不可大於15碼").css('color','red');
					else{
						spanedu_contact.html("<img src='../img/correct.png' style='width:16px'/>");
						checkedu_contact=true;
					}
				}
				//送出新增表單全部判斷
				function checkInsertForm(){
					fcheckedu_name();
					fcheckedu_add();
					fcheckedu_tel();
					fcheckedu_contact();
					console.log(checkedu_name);
					console.log(checkedu_add);
					console.log(checkedu_tel);
					console.log(checkedu_contact);
					
					if(checkedu_name && checkedu_add && checkedu_tel && checkedu_contact){
						alert("資料皆正確，送出中");
						return true;
					}
					else {
						alert("資料錯誤，請檢查欄位長度格式是否正確");
						return false;
					} 
						
				}
				
				//修改表單欄位判斷
				//ckeckuedu_name欄位滑鼠離開後的判斷驗證
				uedu_name.blur(fcheckuedu_name);
				function fcheckuedu_name(){
					checkuedu_name=false;
					var uedu_nameVal=uedu_name.val();
					var uedu_nameValLength = uedu_nameVal.length;
					if(uedu_nameVal==""){
						spanuedu_name.html("<img src='../img/error.png' style='width:16px'/>中心名稱不可為空白").css('color','red');
					}else if(uedu_nameValLength>30)
						spanuedu_name.html("<img src='../img/error.png' style='width:16px'/>中心名稱欄位長度不可大於30碼").css('color','red');
					else{
						spanuedu_name.html("<img src='../img/correct.png' style='width:16px'/>");
						checkuedu_name=true;
					}
				}
				//ckeckedu_add欄位滑鼠離開後的判斷驗證
				uedu_add.blur(fcheckuedu_add);
				function fcheckuedu_add(){
					checkuedu_add=false;
					var uedu_addVal=uedu_add.val();
					var uedu_addValLength = uedu_addVal.length;
					if(uedu_addVal==""){
						spanuedu_add.html("<img src='../img/error.png' style='width:16px'/>中心地址不可為空白").css('color','red');
					}else if(uedu_addValLength>30)
						spanuedu_add.html("<img src='../img/error.png' style='width:16px'/>中心地址欄位長度不可大於30碼").css('color','red');
					else{
						spanuedu_add.html("<img src='../img/correct.png' style='width:16px'/>");
						checkuedu_add=true;
					}
				}
				
				//ckeckedu_tel欄位滑鼠離開後的判斷驗證
				uedu_tel.blur(fcheckuedu_tel);
				function fcheckuedu_tel(){
					checkuedu_tel=false;
					var uedu_telVal=uedu_tel.val();
					var uedu_telValLength = uedu_telVal.length;
					var re = /^[0]{1}[1-9]{1}-[0-9]{7,8}$/;
					if(uedu_telVal==""){
						spanuedu_tel.html("<img src='../img/error.png' style='width:16px'/>中心電話不可為空白").css('color','red');
					}else if(!re.test(uedu_telVal))
						spanuedu_tel.html("<img src='../img/error.png' style='width:16px'/>中心電話欄位格式不符").css('color','red');
					else{
						spanuedu_tel.html("<img src='../img/correct.png' style='width:16px'/>");
						checkuedu_tel=true;
					}
				}
				//ckeckedu_contact欄位滑鼠離開後的判斷驗證
				uedu_contact.blur(fcheckuedu_contact);
				function fcheckuedu_contact(){
					checkuedu_contact=false;
					var uedu_contactVal=uedu_contact.val();
					var uedu_contactValLength = uedu_contactVal.length;
					if(uedu_contactVal==""){
						spanuedu_contact.html("<img src='../img/error.png' style='width:16px'/>聯絡人不可為空白").css('color','red');
					}else if(uedu_contactValLength>30)
						spanuedu_contact.html("<img src='../img/error.png' style='width:16px'/>聯絡人欄位長度不可大於15碼").css('color','red');
					else{
						spanuedu_contact.html("<img src='../img/correct.png' style='width:16px'/>");
						checkuedu_contact=true;
					}
				}
				//送出更新表單全部判斷
				
				function checkUpdateForm(){
					fcheckuedu_name();
					fcheckuedu_add();
					fcheckuedu_tel();
					fcheckuedu_contact();
					console.log(checkuedu_name);
					console.log(checkuedu_add);
					console.log(checkuedu_tel);
					console.log(checkuedu_contact);
					if(checkuedu_name && checkuedu_add && checkuedu_tel && checkuedu_contact){
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






