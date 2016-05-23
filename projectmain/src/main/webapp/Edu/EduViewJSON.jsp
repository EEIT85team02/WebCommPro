<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
<title>Edu_Page</title>
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
<style>
.Main_Content {
	margin-top: 100px;
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

div#users-contain {
	width: 350px;
	margin: 20px 0;
}

div#users-contain table {
	margin: 1em 0;
	border-collapse: collapse;
	width: 100%;
}

div#users-contain table td, div#users-contain table th {
	border: 1px solid #eee;
	padding: .6em 10px;
	text-align: left;
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
					<div class=>
						<table class="table table-hover" id="EduTable">
							<thead>
								<tr>
									<th class="col-md-3 col-xs-3">名稱</th>
									<th class="col-md-3 col-xs-3">地址</th>
									<th class="col-md-2 col-xs-2">電話</th>
									<th class="col-md-2 col-xs-2">連絡人</th>
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

						<!------------------點選新增教育中心表單區塊內容----------------------------- -->
							<button id="buttonAdd">新增資料</button>
							<button id="buttonUpdate1">資料修改</button>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- 設定新增FORM表單區塊dialog -->
	<div id="dialog-form1" title="Create 教育中心資料">
		<p class="validateTips">表單驗證顯示</p>
		<form>
			<fieldset>
				<label for="edu_name">中心名稱</label> 
				<input type="text" name="edu_name" id="edu_name" value="台北資策會" class="text ui-widget-content ui-corner-all"> 
				<label for="edu_add">中心地址</label> 
				<input type="text" name="edu_add" id="edu_add" value="台北市" class="text ui-widget-content ui-corner-all"> 
				<label for="edu_tel">中心電話</label> 
				<input type="text"name="edu_tel" id="edu_tel" value="022987456" class="text ui-widget-content ui-corner-all">
				<label for="edu_contact">聯絡人</label> 
				<input type="text"name="edu_contact" id="edu_contact" value="林書豪" class="text ui-widget-content ui-corner-all">
				<!-- Allow form submission with keyboard without duplicating the dialog button -->
				<input type="submit" tabindex="-1"
					style="position: absolute; top: -1000px">
			</fieldset>
		</form>
	</div>
	
	<!-- 設定修改FORM表單區塊dialog -->
	<div id="dialog-form2" title="Update 教育中心資料">
		<p class="validateTips">表單驗證顯示</p>
		<form>
			<fieldset>
				<label for="edu_id">中心代號</label> 
				<input type="text" name="edu_id" id="edu_id"  readOnly class="text ui-widget-content ui-corner-all">
				<label for="edu_name">中心名稱</label> 
				<input type="text" name="edu_name" id="edu_name" value="台北資策會" class="text ui-widget-content ui-corner-all"> 
				<label for="edu_add">中心地址</label> 
				<input type="text" name="edu_add" id="edu_add" value="台北市" class="text ui-widget-content ui-corner-all"> 
				<label for="edu_tel">中心電話</label> 
				<input type="text"name="edu_tel" id="edu_tel" value="022987456" class="text ui-widget-content ui-corner-all">
				<label for="edu_contact">聯絡人</label> 
				<input type="text"name="edu_contact" id="edu_contact" value="林書豪" class="text ui-widget-content ui-corner-all">
				<!-- Allow form submission with keyboard without duplicating the dialog button -->
				<input type="submit" tabindex="-1"
					style="position: absolute; top: -1000px">
			</fieldset>
		</form>
	</div>


	<script>
		$(function() {
			//載入頁面時，先利用getJSON方法呼叫EduJSON.do，取回資料庫資料並建立table內容
			$('#EduTable>tbody>tr').remove();
			$.getJSON('EduServletJSON.do', {"action":"getALLEdu"}, function(datas) {
				//datas 就是一個JSON物件
				$.each(datas, function(i, Edus) {
					//var edu_id = Edus.edu_id;
					
					//欄位內容
					$( "#EduTable>tbody" ).append( 
						"<tr>" +
				          "<td>" + Edus.edu_name + "</td>" +
				          "<td>" + Edus.edu_add + "</td>" +
				          "<td>" + Edus.edu_tel + "</td>" +
				          "<td>" + Edus.edu_contact + "</td>" +
				          "<td>" + "<button class='buttonUpdate'> "+"修改"+"</button>"+ "</td>" +
				          "<td>" + "<button class='buttonDelete'> "+"刪除"+"</button>" + "</td>" +
				        "</tr>" );
					console.log(Edus.edu_id);
					
				});
			})//取回資料庫資料並建立table內容結束
			
			
			
			//diolog程式部分以下(新增)
			 var  form,EduInsertForm,EduUpdateForm,
			  edu_id = $( "#edu_id" ),
		      edu_name = $( "#edu_name" ),
		      edu_add = $( "#edu_add" ),
		      edu_tel = $( "#edu_tel" ),
		      edu_contact = $( "#edu_contact" ),
		      allFields = $( [] ).add( edu_id ).add( edu_name ).add( edu_add ).add( edu_tel ).add( edu_contact ),
		      tips = $( ".validateTips" );
		 //在驗證顯示區塊新增class t->傳入的一段文字
		    function updateTips( t ) {
		      tips
		        .text( t )
		        .addClass( "ui-state-highlight" );
		      setTimeout(function() {
		        tips.removeClass( "ui-state-highlight", 1500 );
		      }, 500 );
		    }
		 //驗證資料長度是否符合規則o->$('#欄位ID')欄位資料、n->欄位名稱、min->最短長度、max->最長長度
		    function checkLength( o, n, min, max ) {
		      if ( o.val().length > max || o.val().length < min ) {
		        o.addClass( "ui-state-error" );
		        updateTips( "欄位: " + n + "長度必須於 " +
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
			  valid = valid && checkLength( edu_name, "edu_name", 1, 30 );
		      valid = valid && checkLength( edu_add, "edu_add", 1, 30 );
		      valid = valid && checkLength( edu_tel, "edu_tel", 7, 15 );
		      valid = valid && checkLength( edu_contact, "edu_contact", 1, 15 );
		      valid = valid && checkRegexp( edu_tel, /^([0-9])+$/, "電話欄位只允許輸入數字 : 0-9" );
		 		if ( valid ) {
		        $( "#EduTable tbody" ).append( "<tr>" +
		          "<td>" + edu_name.val() + "</td>" +
		          "<td>" + edu_add.val() + "</td>" +
		          "<td>" + edu_tel.val() + "</td>" +
		          "<td>" + edu_contact.val() + "</td>" +
		          "<td>" + "<button class='buttonUpdate'>"+"修改"+"</button>"+ "</td>" +
		          "<td>" + "<button class='buttonDelete'>"+"刪除"+"</button>" + "</td>" +
		        "</tr>" );
		        EduInsertForm.dialog( "close" );
		        EduUpdateForm.dialog( "close" );
		      }
		      return valid;
		    }
		  //驗證表單資料是否錯誤結束
		 
		  //設定表單寬度視窗資料開始
		    EduInsertForm = $( "#dialog-form1" ).dialog({
		      autoOpen: false,
		      height: 500,
		      width: 400,
		      modal: true,
		      buttons: {
		        "send": addData,
		        Cancel: function() {
		        	EduInsertForm.dialog( "close" );
		        }
		      },
		      close: function() {
		        form[ 0 ].reset();
		        allFields.removeClass( "ui-state-error" );
		      }
		    });
		  	//設定表單寬度視窗資料結束
		  	form = EduInsertForm.find( "form" ).on( "submit", function( event ) {
		      event.preventDefault();
		      addData();
		    });
		 	//綁定click事件使用者新增icon，開啟dialog 表單EduInsertForm
		    $( "#buttonAdd" ).button().on( "click", function() {
		    	EduInsertForm.dialog( "open" );
		    });//diolog程式部分結束
		    
		    
		    
			//diolog程式部分以下(更新)
		 //在驗證顯示區塊新增class t->傳入的一段文字
		    function updateTips( t ) {
		      tips
		        .text( t )
		        .addClass( "ui-state-highlight" );
		      setTimeout(function() {
		        tips.removeClass( "ui-state-highlight", 1500 );
		      }, 500 );
		    }
		
		
		
		 
		  //設定表單寬度視窗資料開始
		    EduUpdateForm = $( "#dialog-form2" ).dialog({
		      autoOpen: false,
		      height: 650,
		      width: 400,
		      modal: true,
		      buttons: {
			        "send": addData,
			        Cancel: function() {
			        	EduUpdateForm.dialog( "close" );
			        }
			      },
		      close: function() {
		        form[ 0 ].reset();
		        allFields.removeClass( "ui-state-error" );
		      }
		    });
		  	//設定表單寬度視窗資料結束
		  	form1 = EduUpdateForm.find( "form" ).on( "submit", function( event ) {
		      event.preventDefault();
		      addData();
		    });
		 	//綁定click事件使用者修改icon，開啟dialog 表單EduUpdateForm
		    $( "tbody" ).button().on( "click",".buttonUpdate", function() {
		    	EduUpdateForm.dialog( "open" );
		    });
			
			

		});//load函數結束
	</script>
</body>
</html>






