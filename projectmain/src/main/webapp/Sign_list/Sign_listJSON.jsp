<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
<title>Sign_list_Page</title>

<link href="${pageContext.request.contextPath}/css/datatables/jquery.dataTables.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/datatables/jquery.dataTables.min.js"></script>

<link href="${pageContext.request.contextPath}/css/jquery-ui.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/css/jquery-ui.structure.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/css/jquery-ui.theme.min.css"
	rel="stylesheet" type="text/css">
 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="author" content="">

<script>
	$(document).ready(function(){
    	$("#Sign_listTable").dataTable();
   	});
</script>
<style>
.Main_Content {
	margin-top: 100px;
	background-color:#BBFFEE;
}
.buttonUpdate{
	color: red;
}
.buttonDelete{
	color: blue;
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
.aaa{

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
					<div class=>
						<table class="table table-hover" id="Sign_listTable">
							<thead>
								<tr>
									<th class="col-md-1 col-xs-1">代號</th>
									<th class="col-md-2 col-xs-2">名字</th>
									<th class="col-md-3 col-xs-3">Email</th>
									<th class="col-md-2 col-xs-2">部門</th>
									<th class="col-md-2 col-xs-2">權限</th>
									<th class="col-md-1 col-xs-1">修改</th>
									<th class="col-md-1 col-xs-1">刪除</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>aaaaa</td>
									<td>aaaaa</td>
									<td>aaaaa</td>
									<td>aaaaa</td>
									<td>aaaaa</td>
									<td>aaaaa</td>
								</tr>
							</tbody>
						</table>
						
						<!------------------點選新增權限設定表單區塊內容----------------------------- -->
							<button id="buttonAdd">新增資料</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 設定新增FORM表單區塊dialog -->
	<div id="dialog-form1" title="建立權限設定資料">
		<p class="validateTips"></p>
		<form name="Sign_listInsertForm" action="updateSl">
			<fieldset>
				<label for="emp_id">員工代號</label> 
				<input type="text" name="emp_id" id="emp_id" class="text ui-widget-content ui-corner-all">
				<div id="div1"></div>
				<label for="emp_name">員工名稱</label> 
				<input type="text" name="emp_name" id="emp_name" readOnly class="text ui-widget-content ui-corner-all"> 
				<label for="emp_mail">Email</label> 
				<input type="text" name="emp_mail" id="emp_mail" readOnly class="text ui-widget-content ui-corner-all"> 
				<label for="dep_name">部門名稱</label> 
				<input type="text"name="dep_name" id="dep_name" readOnly class="text ui-widget-content ui-corner-all">
				<label for="sl_id">權限</label> 
				<select name="sl_id" id="sl_id" class="text ui-widget-content ui-corner-all"></select>
				<input type="hidden"name="action" value="updateSl">
				<!-- Allow form submission with keyboard without duplicating the dialog button -->
				<input type="submit" tabindex="-1"
					style="position: absolute; top: -1000px">
			</fieldset>
		</form>
	</div>
	<!-- 設定修改FORM表單區塊dialog -->
	<div id="dialog-form2" title="修改權限設定資料">
		<p class="validateTips"></p>
		<form name="Sign_listUpdateForm" action="updateSl">
			<fieldset>
				<label for="emp_id">員工代號</label> 
				<input type="text" name="emp_id" id="uemp_id"  readOnly class="text ui-widget-content ui-corner-all">
				<label for="emp_name">員工名稱</label> 
				<input type="text" name="emp_name" id="uemp_name" readOnly class="text ui-widget-content ui-corner-all"> 
				<label for="emp_mail">Email</label> 
				<input type="text" name="emp_mail" id="uemp_mail" readOnly class="text ui-widget-content ui-corner-all"> 
				<label for="dep_name">部門名稱</label> 
				<input type="text"name="dep_name" id="udep_name" readOnly class="text ui-widget-content ui-corner-all">
				<label for="sl_id">權限</label> 
				<input type="text"name="sl_id" id="usl_id" class="text ui-widget-content ui-corner-all">
				<input type="hidden"name="action" value="updateSl">
				<!-- Allow form submission with keyboard without duplicating the dialog button -->
				<input type="submit" tabindex="-1"
					style="position: absolute; top: -1000px">
			</fieldset>
		</form>
	</div>
	<!-- 設定刪除確認表單區塊dialog -->
<div id="dialog-form3" title="刪除確認">
  <p>是否要刪除此筆資料?</p>
</div>



	<script>
		$(function() {
			//載入頁面時，先利用getJSON方法呼叫Sign_listServletJSON.do，取回資料庫資料並建立table內容
			$('#Sign_listTable>tbody>tr').remove();
			$.getJSON('Sign_listServletJSON.do', {"action":"getALLSl"}, function(datas) {
				//console.log(datas);
				$.each(datas, function(i, Sls) {
					//資料載入將頁面塞入欄位內容
					$( "#Sign_listTable>tbody" ).append( 
						"<tr>" +
						  "<td>" + Sls.emp_id + "</td>" +
				          "<td>" + Sls.emp_name + "</td>" +
				          "<td>" + Sls.emp_mail + "</td>" +
				          "<td>" + Sls.dep_name + "</td>" +
				          "<td>" + Sls.sl_id + "</td>" +
				          "<td>" + "<button class='buttonUpdate' value="+Sls.emp_id+"> "+"編輯"+"</button>"+ "</td>" +
				          "<td>" + "<button class='buttonDelete' value="+Sls.emp_id+"> "+"刪除"+"</button>" + "</td>" +
				        "</tr>" );
					//console.log(Sls.emp_id);
				});
			});//取回資料庫資料並建立table內容結束
			
			//---------------diolog程式部分以下(新增)------------------
			 var  form,Sign_listInsertForm,Sign_listUpdateForm,
			  emp_id = $( "#emp_id" ),
		      emp_name = $( "#emp_name" ),
		      emp_mail = $( "#emp_mail" ),
		      dep_name = $( "#dep_name" ),
		      sl_id = $( "#sl_id" ),
		      uemp_id = $('#uemp_id');
			  uemp_name = $('#uemp_name');
			  uemp_mail = $('#uemp_mail');
			  udep_name = $('#udep_name');
			  usl_id = $('#usl_id');
		      allFields = $( [] ).add( emp_id ).add( emp_name ).add( emp_mail ).add( dep_name ).add( sl_id ),
		      uallFields = $( [] ).add( uemp_id ).add( uemp_name ).add( uemp_mail ).add( udep_name ).add( usl_id ),
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
		//驗證表單資料是否錯誤開始
		    function addData() {
		      var valid = true;
		      allFields.removeClass( "ui-state-error" );
			  valid = valid && checkLength( emp_name, "名字", 1, 30 );
		      valid = valid && checkLength( emp_mail, "Email", 1, 30 );
		      valid = valid && checkLength( dep_name, "部門名稱", 1, 30 );
		      valid = valid && checkLength( sl_id, "權限", 1, 2 );
// 		      valid = valid && checkRegexp( edu_tel, /^([0-9])+$/, "電話欄位只允許輸入數字 : 0-9" );
		 		if ( valid ) {
		 			var Insertdatas = $('form[name="Sign_listInsertForm"]').serialize();
		 			$.get('Sign_listServletJSON.do',Insertdatas,function(data){
		 				if(data=="資料新增失敗"){
		 					console.log(data);
		 					 $('.validateTips').css('color','red').text("新增錯誤");
		 				}
		 				else if(data=="資料新增成功"){
		 					$.getJSON('Sign_listServletJSON.do', {"action":"getALLSl"}, function(datas) {
			 					$('#Sign_listTable>tbody>tr').remove();
			 					//datas 為一個JSON物件
			 					$.each(datas, function(i, Sls) {
			 						//資料載入將頁面塞入欄位內容
			 						console.log(Sls.emp_id);
			 						$( "#Sign_listTable>tbody" ).append( 
			 							"<tr>" +
			 							  "<td>" + Sls.emp_id + "</td>" +
			 					          "<td>" + Sls.emp_name + "</td>" +
			 					          "<td>" + Sls.emp_mail + "</td>" +
			 					          "<td>" + Sls.dep_name + "</td>" +
			 					          "<td>" + Sls.sl_id + "</td>" +
			 					          "<td>" + "<button class='buttonUpdate'value="+Sls.emp_id+"> "+"編輯"+"</button>"+ "</td>" +
			 					          "<td>" + "<button class='buttonDelete'value="+Sls.emp_id+"> "+"刪除"+"</button>" + "</td>" +
			 					        "</tr>" );
			 					});
			 					allFields.val("");//將新增form表單內容清空
					 			$('.validateTips').text("");////將新增form表單驗證區塊內容清空
					 			Sign_listInsertForm.dialog( "close" );
			 				});//取回資料庫資料並建立table內容結束
		 				}
		 			});
		 		}
		      return valid;
		    }
		  //驗證表單資料是否錯誤結束
		 //設定表單寬度視窗資料開始
		    Sign_listInsertForm = $( "#dialog-form1" ).dialog({
		      autoOpen: false,
		      height: 500,
		      width: 400,
		      modal: true,
		      buttons: {
		        "send": addData,
		        Cancel: function() {
		        	Sign_listInsertForm.dialog( "close" );
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
		  	form = Sign_listInsertForm.find( "form" ).on( "submit", function( event ) {
		      event.preventDefault();
		      addData();
		    });
		 	//綁定click事件使用者新增icon，開啟dialog 表單Sign_listInsertForm
		    $( "#buttonAdd" ).button().on( "click", function() {
		    	Sign_listInsertForm.dialog( "open" );
		    });//diolog程式部分結束
		    
		    
		   
		    
			//diolog程式部分以下(更新)
			//設定表單寬度視窗資料開始
		    Sign_listUpdateForm = $( "#dialog-form2" ).dialog({
		      autoOpen: false,
		      height: 650,
		      width: 400,
		      modal: true,
		      buttons: {
			        "send": updateData1,
			        Cancel: function() {
			        	Sign_listUpdateForm.dialog( "close" );
			        }
			      },
		      close: function() {
		        form[ 0 ].reset();
		        uallFields.removeClass( "ui-state-error" );
		      }
		    });
		  	//設定表單寬度視窗資料結束
		  	form = Sign_listUpdateForm.find( "form" ).on( "submit", function( event ) {
		      event.preventDefault();
		      updateData1();
		    });
		 	//綁定click事件使用者編輯icon，開啟dialog 表單Sign_listUpdateForm
		    $( "tbody" ).button().on( "click",".buttonUpdate", function() {
		    	updateValue = $(this).val();
		    	updateValueEmp_id = $(this).parent().parent().find('td:eq(0)');
		    	updateValueEmp_name = $(this).parent().parent().find('td:eq(1)');
		    	updateValueEmp_mail = $(this).parent().parent().find('td:eq(2)');
		    	updateValueDep_name = $(this).parent().parent().find('td:eq(3)');
		    	updateValueSl_id = $(this).parent().parent().find('td:eq(4)');
		    	console.log(updateValueEmp_id.text());
		    	console.log(updateValueEmp_name.text());
		    	console.log(updateValueEmp_mail.text());
		    	console.log(updateValueDep_name.text());
 		    	console.log(updateValueSl_id.text());
		    	
		    	//console.log(updateValue);
		    	$.getJSON('Sign_listServletJSON.do', {"action":"getoneSl","emp_id":updateValue}, function(datas) {
		    		$.each(datas,function(i,Sls){
		    			uemp_id.val(Sls.emp_id);
		    			uemp_name.val(Sls.emp_name);
		    			uemp_mail.val(Sls.emp_mail);
		    			udep_name.val(Sls.dep_name);
		    			usl_id.val(Sls.sl_id);
		    		})
		    	})
		    	Sign_listUpdateForm.dialog( "open" );
		    });
		 	
		    function updateData1() {
			      var valid = true;
			      uallFields.removeClass( "ui-state-error" );
				  valid = valid && checkLength( uemp_name, "名字", 1, 30 );
			      valid = valid && checkLength( uemp_mail, "Email", 1, 30 );
			      valid = valid && checkLength( udep_name, "部門名稱", 1, 30 );
			      valid = valid && checkLength( usl_id, "權限", 1, 2 );
// 			      valid = valid && checkRegexp( uedu_tel, /^([0-9])+$/, "電話欄位只允許輸入數字 : 0-9" );
			 		if ( valid ) {
			 			var Updatedatas = $('form[name="Sign_listUpdateForm"]').serialize();
			 			$.get('Sign_listServletJSON.do',Updatedatas,function(data){
			 				if(data=="資料更新失敗"){
			 					//console.log(data);
			 					 $('.validateTips').css('color','red').text("更新錯誤");
			 				}
			 				else if(data=="資料更新成功"){
// 			 					$.getJSON('Sign_listServletJSON.do', {"action":"getALLSl"}, function(datas) {
				 					//$('#Sign_listTable>tbody>tr').remove();
// 				 					$.each(datas, function(i, Sls) {
				 						//資料載入將頁面塞入欄位內容
				 						//console.log(Sls);Sls.emp_id/Sls.emp_name/Sls.emp_mail/Sls.dep_name/Sls.sl_id
// 				 						$( "#Sign_listTable>tbody" ).append( 
// 				 							"<tr>" +
// 				 							  "<td>" + Sls.emp_id + "</td>" +
// 				 					          "<td>" + Sls.emp_name + "</td>" +
// 				 					          "<td>" + Sls.emp_mail + "</td>" +
// 				 					          "<td>" + Sls.dep_name + "</td>" +
// 				 					          "<td>" + Sls.sl_id + "</td>" +
// 				 					          "<td>" + "<button class='buttonUpdate'value="+Sls.emp_id+"> "+"編輯"+"</button>"+ "</td>" +
// 				 					          "<td>" + "<button class='buttonDelete'value="+Sls.emp_id+"> "+"刪除"+"</button>" + "</td>" +
// 				 					        "</tr>" );
				 						updateValueEmp_id.text(uemp_id.val());
				 					    updateValueEmp_name.text(uemp_name.val());
				 						updateValueEmp_mail.text(uemp_mail.val());
				 						updateValueDep_name.text(udep_name.val());
				 						updateValueSl_id.text(usl_id.val());
// 				 					});
				 					
				 					uallFields.val("");//將新增form表單內容清空
						 			$('.validateTips').text("");////將新增form表單驗證區塊內容清空
						 			Sign_listUpdateForm.dialog( "close" );
				 				//});//取回資料庫資料並建立table內容結束
			 				}
			 			});
			 		}
			      return valid;
			    }
		  

		 	
		 	//diolog程式部分以下(刪除)
			//設定刪除確認表單寬度視窗資料開始
		    Sign_listDeleteConfirm =$( "#dialog-form3" ).dialog({
		        autoOpen: false,
		        height: 200,
		        width: 240,
		        modal: true,
		        buttons: {
		          "確認": deleteData ,
		          "放棄": function() {
		            $( this ).dialog( "close" );
		            $('#dialog-form3 p').text('是否要刪除此筆資料?');
		          }
		        }
		    });
		 	
		 	//綁定click事件使用者刪除icon
		    $( "tbody" ).button().on( "click",".buttonDelete", function() {
		    	deleteValue = $(this).val();
		    	deleteSelecter= $(this);
		    	Sign_listDeleteConfirm.dialog( "open" );
		    });
			function deleteData(){
			$.get('Sign_listServletJSON.do',{"emp_id":deleteValue,"action":"deleteSl"},function(data){
				if(data=="資料刪除成功"){
					console.log(deleteValue);
					console.log(data);
					deleteSelecter.parents("tr").remove();
					Sign_listDeleteConfirm.dialog( "close" );
				}else if (data=="資料刪除失敗"){
					console.log(deleteValue);
					console.log(data);
					$('#dialog-form3 p').text('資料刪除失敗，資料使用中');
				}
			});
			
	    	}
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
						document.Sign_listInsertForm.emp_id.value = this.firstChild.nodeValue;
						
						var id = txt.value;
						console.log(id);
						
						$.getJSON('EmployeeList',{'emp_id':id},function(datas){
							$.each(datas,function(i,emp){
								
								document.Sign_listInsertForm.emp_name.value = emp.emp_name;
								document.Sign_listInsertForm.emp_mail.value = emp.emp_mail;
								document.Sign_listInsertForm.dep_name.value = emp.dep_name;
								
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
	
		<!-- 權限名稱下拉選單 -->
	<script>
	$(function() {
		$.ajax({
			'type':'get',
			'url':'Sign_listXML',
			'dataType':'xml',
			'success':function(data){
				$(data).find('Sign_list').each(function(){
					var sl_id = $(this).children('sl_id').text();
					var sl_name = $(this).children('sl_name').text();
					console.log(sl_id);
					console.log(sl_name);
					var opt = $('<option></option>').val(sl_id).text(sl_name);
					$('#sl_id').append(opt);
				});
			}
		})
	})
	</script>
</body>
</html>
