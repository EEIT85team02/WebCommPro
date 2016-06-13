<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
<title>Employee_Page</title>
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
					<table id="EmployeeTable" class="display" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="col-md-1.5 col-xs-1.5">員工代號</th>
								<th class="col-md-2 col-xs-2">員工名稱</th>
								<th class="col-md-2.5 col-xs-2.5">Email</th>
								<th class="col-md-2.5 col-xs-2.5">部門</th>
								<th class="col-md-1.5 col-xs-1.5">權限代號</th>
								<th class="col-md-2 col-xs-2">權限名稱</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						<tfoot>
							<tr>
								<th>員工代號</th>
								<th>員工名稱</th>
								<th>Email</th>
								<th>部門</th>
								<th>權限代號</th>
								<th>權限名稱</th>
							</tr>
						</tfoot>
					</table>

					<!------------------點選新增員工表單區塊內容----------------------------- -->
					<button id="buttonAdd" class="ui-button ui-corner-all ui-widget">新增</button>
					<button id="buttonUpdate" class="ui-button ui-corner-all ui-widget">編輯</button>
					<button id="buttonDelete" class="ui-button ui-corner-all ui-widget">刪除</button>
<!-- 					<button id="buttonAll">全部選取</button> -->
<!-- 					<button id="buttonRe">取消全選</button> -->
<!-- 					<button id="buttonSel">選取筆數查詢</button> -->
				</div>
			</div>
		</div>
	</div>
	<!-- 設定新增FORM表單區塊dialog -->
	<div id="dialog-insertForm" title="建立員工權限資料">
		<p class="validateTips"></p>
		<form name="EmpInsertForm">
			<fieldset>
				<br>
				<label for="emp_id">員工代號</label> 
				<input type="text" name="emp_id" id="emp_id" class="text ui-widget-content ui-corner-all" placeholder="請輸入員工代號" autocomplete="off" required="required"> 
				<div id="div1"></div>
				<label for="emp_name">員工名稱</label> 
				<input type="text" name="emp_name" id="emp_name" class="text ui-widget-content ui-corner-all" readOnly autocomplete="off">
				<label for="emp_mail">Email</label> 
				<input type="text" name="emp_mail" id="emp_mail" class="text ui-widget-content ui-corner-all" readOnly autocomplete="off">
				<label for="dep_name">部門</label> 
				<input type="text" name="dep_name" id="dep_name" class="text ui-widget-content ui-corner-all" readOnly autocomplete="off"> 
				<label for="sl_id">權限</label> 
				<select id="selectSl_id" name='sl_id'>
			   	</select>
				<input type="hidden" name="action" value="updateEmp">
				<input type="submit" tabindex="-1" style="position: absolute; top: -1000px">
			</fieldset>
		</form>
	</div>
	<!-- 設定修改FORM表單區塊dialog -->
	<div id="dialog-updateForm" title="修改員工權限資料">
		<p class="validateTips"></p>
		<form name="EmpUpdateForm" action="updateEmp">
			<fieldset>
				<label for="emp_id">員工代號</label> 
				<input type="text" name="emp_id" id="uemp_id" class="text ui-widget-content ui-corner-all" readOnly> 
				<label for="emp_name">員工名稱</label> 
				<input type="text" name="emp_name" id="uemp_name" class="text ui-widget-content ui-corner-all" readOnly autocomplete="off">
				<label for="emp_mail">Email</label> 
				<input type="text" name="emp_mail" id="uemp_mail" class="text ui-widget-content ui-corner-all" readOnly autocomplete="off">
				<label for="dep_name">部門</label> 
				<input type="text" name="dep_name" id="udep_name" class="text ui-widget-content ui-corner-all" readOnly autocomplete="off"> 
				<label for="sl_id">權限</label> 
				<select id="uselectSl_id" name='sl_id'>
			   	</select>
				<input type="hidden" name="action" value="updateEmp">
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
			var table = $('#EmployeeTable').DataTable( {
				 	"ajax": {
			            "url": "EmployeeToJSONInitTableServlet",
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
			var form,EmpInsertForm,EmpUpdateForm,
				emp_id = $( "#emp_id" ),
				emp_name = $( "#emp_name" ),
				emp_mail = $( "#emp_mail" ),
				dep_name = $( "#dep_name" ),
		      	sl_id = $('#selectSl_id'),
		      	uemp_id = $('#uemp_id'),
			  	uemp_name = $('#uemp_name'),
			  	uemp_mail = $('#uemp_mail'),
			  	udep_name = $('#udep_name'),
			  	usl_id = $('#uselectSl_id');
			  	
			  	deleteOrUpdateValue = null;
				allFields = $( [] ).add( emp_id ).add( emp_name ).add( emp_mail ).add( dep_name ).add( sl_id );
		      	uallFields = $( [] ).add( uemp_id ).add( uemp_name ).add( uemp_mail ).add( udep_name ).add( usl_id );
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
			    function insertEmpFormToCreateTable() {
			      var valid = true;
			      allFields.removeClass( "ui-state-error" );
			      valid = valid && checkLength( sl_id, "權限代號/名稱", 1, 30 );
			      valid = valid && checkLength( emp_id, "員工代號", 1, 10 );
				  valid = valid && checkLength( emp_name, "員工名稱", 1, 20 );
			      valid = valid && checkLength( emp_mail, "Email", 1, 30 );
			      valid = valid && checkLength( dep_name, "部門", 1, 30 );
			     if ( valid ) {
			  		  	var Insertdatas = $('form[name="EmpInsertForm"]').serialize();
			 			$.post('EmployeeServletJSON.do',Insertdatas,function(data){
			 				if(data=="資料更新失敗"){
			 					$('.validateTips').css('color','red').text("新增錯誤");
			 				}
			 				else if(data=="資料更新成功"){
			 					table.ajax.reload();//重新載入data tables的資料
			 					allFields.val("");//將新增form表單內容清空
						 		$('.validateTips').text("");////將新增form表單驗證區塊內容清空
						 		deleteOrUpdateValue = null;
				 				EmpInsertForm.dialog( "close" );//將新增form表單關閉
				 				//取回資料庫資料並建立table內容結束
			 				}
			 			});
			 		}
			      return valid;
			    }
			  //設定表單寬度視窗資料開始
			    EmpInsertForm = $( "#dialog-insertForm" ).dialog({
			      autoOpen: false,
			      height: 550,
			      width: 400,
			      modal: true,
			      open: function() {
			          $('.ui-widget-overlay').addClass('custom-overlay');
			      },
			      close: function() {
			          $('.ui-widget-overlay').removeClass('custom-overlay');
			      },
			      buttons: {
			        "send": insertEmpFormToCreateTable,
			        Cancel: function() {
			        	EmpInsertForm.dialog( "close" );
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
			  	form = EmpInsertForm.find( "form" ).on( "submit", function( event ) {
			      event.preventDefault();
			      insertEmpFormToCreateTable();
			    });
			 	//綁定click事件使用者新增icon，開啟dialog 表單ClassInsertForm
			    $( "#buttonAdd" ).button().on( "click", function() {
			    	//呼叫ServletJSON取回下拉選單資料--新增表單
			    	$.getJSON('Sign_listServletJSON.do', {"action":"getALLSl"}, function(datas) {
						console.log("aaaa"+datas);
						$.each(datas, function(i, sls) {
							sl_id.append( 
						 		"<option value="+ sls.sl_id +">" + sls.sl_name + "</option>");
						});
					});
			    EmpInsertForm.dialog( "open" );
			    });//diolog程式部分結束
			
			    //點選要刪除或編輯的那行，按刪除或編輯鍵即可，先將選擇的[行]資料儲存
				$('#EmployeeTable tbody').on( 'click', 'tr', function () {
					deleteOrUpdateValue = $(this).find('td:eq(0)').text(); 
					emp_idUpdateValue = $(this).find('td:eq(0)'); 
					emp_nameUpdateValue = $(this).find('td:eq(1)');
					emp_mailUpdateValue = $(this).find('td:eq(2)');
					dep_nameUpdateValue = $(this).find('td:eq(3)');
					sl_idUpdateValue = $(this).find('td:eq(4)');
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
				  EmpUpdateForm = $( "#dialog-updateForm" ).dialog({
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
				        "send": updateEmpFormToCreateTable,
				        Cancel: function() {
				        	EmpUpdateForm.dialog( "close" );
				        }
				      },
			      	close: function() {
			        	form[ 0 ].reset();
			        	uallFields.removeClass( "ui-state-error" );
			      	}
			      });
			    
			  	//設定表單寬度視窗資料結束
			  	form = EmpUpdateForm.find( "form" ).on( "submit", function( event ) {
			      event.preventDefault();
			      updateEmpFormToCreateTable();
			    });
			  
			    //綁定click事件使用者編輯icon，開啟dialog 表單EmployeeUpdateForm
			 	$('#buttonUpdate').click( function () {
		    	if(deleteOrUpdateValue==null){
// 		    		alert("請先選取要編輯的資料");
		    		Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
 			    			{
 			    			msg: "請先選取要編輯的資料"
 			    			});
		    	}else{
		    		uemp_id.val(emp_idUpdateValue.text());
	    			uemp_name.val(emp_nameUpdateValue.text());
	    			uemp_mail.val(emp_mailUpdateValue.text());
	    			udep_name.val(dep_nameUpdateValue.text());
	    			usl_id.val(sl_idUpdateValue.text());
	    			EmpUpdateForm.dialog( "open" );
		    	}
		    } );
		    //點選修改鍵，所執行的方法
		    function updateEmpFormToCreateTable() {
			      var valid = true;
			      uallFields.removeClass( "ui-state-error" );
				  valid = valid && checkLength( usl_id, "權限代號/名稱", 1, 30 );
				  console.log(valid);
			      valid = valid && checkLength( uemp_id, "員工代號", 1, 10 );
			      console.log(valid);
				  valid = valid && checkLength( uemp_name, "員工名稱", 1, 20 );
				  console.log(valid);
			      valid = valid && checkLength( uemp_mail, "Email", 1, 30 );
			      console.log(valid);
			      valid = valid && checkLength( udep_name, "部門", 1, 30 );
			      console.log(valid);
			      
			 		if ( valid ) {
			 		console.log(valid);
			 			var Updatedatas = $('form[name="EmpUpdateForm"]').serialize();
			 			console.log(Updatedatas);
			 			$.get('EmployeeServletJSON.do',Updatedatas,function(data){
			 				if(data=="資料更新失敗"){
			 					 $('.validateTips').css('color','red').text("更新錯誤");
			 				}
			 				else if(data=="資料更新成功"){
			 					
			 					table.ajax.reload();//重新載入data tables的資料
			 					uallFields.val("");//將修改form表單內容清空
						 		$('.validateTips').text("");////將新增form表單驗證區塊內容清空
				 				EmpUpdateForm.dialog( "close" );//將修改form表單關閉
				 				//取回資料庫資料並建立table內容結束
			 				
			 				}
			 			});
			 		}
			      return valid;
			    }
			    
			  	//diolog程式部分以下(刪除)
				//設定刪除確認表單寬度視窗資料開始
			    EmpDeleteConfirm =$( "#dialog-deleteForm" ).dialog({
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
			          "確認": deleteEmpFormToCreateTable ,
			          "放棄": function() {
			            $( this ).dialog( "close" );
			            $('#dialog-deleteForm p').text('是否要刪除此筆資料?');
			          }
			        }
			    });
			    
			    $('#buttonDelete').click( function () {
		    	
		    		if(deleteOrUpdateValue==null){
		    		console.log(deleteOrUpdateValue)
							    	
// 		    			alert("請先選取要刪除的資料");
		    		Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
 			    			{
 			    			msg: "請先選取要刪除的資料"
 			    			});
		    		}else{
		    			EmpDeleteConfirm.dialog( "open" );
		    		}
		    	} );
		    	//點選刪除鍵，所執行的方法
				function deleteEmpFormToCreateTable() {
					$.get('EmployeeServletJSON.do',{"emp_id":deleteOrUpdateValue,
												 	"emp_name":emp_nameUpdateValue.text(),
												 	"emp_mail":emp_mailUpdateValue.text(),
												 	"dep_name":dep_nameUpdateValue.text(),
												 	"sl_id":sl_idUpdateValue.text(),
												 	"action":"updateEmpdel"},function(data){
				    	console.log(emp_nameUpdateValue)
						if(data=="資料刪除成功"){
							console.log("111111");
							table.row('.selected').remove().draw( false );//刪除畫面上class為selected的那行
							EmpDeleteConfirm.dialog( "close" );
						}else if (data=="資料刪除失敗"){
							$('#dialog-deleteForm p').text('資料刪除失敗，資料使用中');
						}
					});
				}	
		    	
			    
			 	
			    //點選刪除鍵，所執行的方法
// 				function deleteEmpFormToCreateTable(){
// 				$.get('EmployeeServletJSON.do',{"emp_id":selJSON,"action":"deleteClassMulti"},function(data){
// 					if(data=="資料刪除成功"){
// 						//table.row('.selected').remove().draw( false );//刪除畫面上class為selected的那行
// 						table.ajax.reload();//重新載入data tables的資料 ?? 須改為直接抓取原更新表單的值回填回去表格
// 						ClassDeleteConfirm.dialog( "close" );
// 					}else if (data=="資料刪除失敗"){
// 						$('#dialog-deleteForm p').text('資料刪除失敗，資料使用中');
// 					}
// 				});
// 				sel=[];
// 		    	}
// 				var sel=[];
// 			   $('#buttonDelete').click( function () {
// 			    	if(table.rows('.selected').data().length==0){
// 			    		alert("請先選取要刪除的資料");
// 			    	}else if(table.rows('.selected').data().length>=1){
// 			    		var trSelLength = $('tbody > tr.selected');//tr被SELECT到的長度
// 			    		alert("共選取"+table.rows('.selected').data().length+"筆資料。");
// 			    		for(var i=0,max=trSelLength.length;i<max;i++){
// 			    			var	obj = $('tbody > tr.selected:eq('+i+')').find('td:eq(0)').text();
// 			    			sel.push(obj);//將obj資料加到sel陣列
// 			    		}
// 			    		console.log("sel====="+sel);
// 			    		selJSON =JSON.stringify(sel);//將JSON轉成字串
// 			    		console.log("selJSON-----"+selJSON);
// 			    		EmpDeleteConfirm.dialog( "open" );
// 			    	}
// 			    });

				
			    
			  //呼叫ServletJSON取回下拉選單資料--編輯表單
			    $.getJSON('Sign_listServletJSON.do', {"action":"getALLSl"}, function(datas) {
					console.log("datas:"+datas);
					$.each(datas, function(i, sls) {
						usl_id.append( 
					 			"<option value="+ sls.sl_id +">"+sls.sl_name+"</option>" 
			       			);

					});
				});//取回資料庫資料並建立內容結束  
				
				
			  //icon全部選取
// 				$('#buttonAll').click(function(){
// 					$('tbody > tr').addClass('selected');
// 				})
// 				//icon取消全選
// 				$('#buttonRe').click(function(){
// 					$('tbody > tr').removeClass('selected');
// 				})
// 				//icon查詢選取筆數
// 				 $('#buttonSel').click( function () {
// 				        alert( table.rows('.selected').data().length +' 筆資料被選取' );
// 				});
	
	 });//load函數結束
	</script>
	
		<!-- 員工編號關鍵字 -->
	<script>
	
	var show;
	window.addEventListener("load", init, false);
	var txt = document.getElementById("emp_id");
	function init() {
		txt.addEventListener("keyup", getData, false);
		show = document.getElementById("div1");
	}
	function getData() {
		if(txt.value==''){
			if (show.childNodes.length > 0) {
				show.removeChild(show.childNodes[0]);
				}
			return;
		}
		var xhrEmpId = new XMLHttpRequest();
		
		if (xhrEmpId != null) {
			xhrEmpId.addEventListener("readystatechange", function(){
				if (xhrEmpId.readyState == 4) {
	                if (xhrEmpId.status == 200) {
	                    var name = xhrEmpId.responseText;
	                    var datas = JSON.parse(name);  
						show.style.display = "block";
						if (show.childNodes.length > 0) {
							show.removeChild(show.childNodes[0]);
							}
						var eleDiv = document.createElement("div");
						eleDiv.className = "list-group";
						for (var j = 0, max = datas.length; j < max; j++) {
						var txtBtn = document.createTextNode(datas[j]);
						var eleBtn = document.createElement("button");
						eleBtn.className = "list-group-item";
						eleBtn.setAttribute("type", "button");
						eleBtn.appendChild(txtBtn);

						eleBtn.addEventListener("click", function() {
						document.EmpInsertForm.emp_id.value = this.firstChild.nodeValue;
						
						var id = txt.value;
						console.log(id);
						
						$.getJSON('EmployeeList',{'emp_id':id},function(datas){
							$.each(datas,function(i,emp){
								
								document.EmpInsertForm.emp_name.value = emp.emp_name;
								document.EmpInsertForm.emp_mail.value = emp.emp_mail;
								document.EmpInsertForm.dep_name.value = emp.dep_name;
								
							})
						})
						
						
						
						show.style.display = "none";
						}, false)
						eleDiv.appendChild(eleBtn);
					}
					show.appendChild(eleDiv);	
				}
	            else {
	                alert(xhrEmpId.status + ":" + xhrEmpId.statusText);
	            }
	          }
	        });
			
			xhrEmpId.open("get", "Sign_listAuto?keyword="+txt.value); 
			xhrEmpId.send();
			
			}
	    }
	
	</script>
	
</body>
</html>






