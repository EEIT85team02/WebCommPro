<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-tw">
<head>
<title>Mail_template_Page</title>
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
						<table class="table table-hover" id="Mail_templateTable">
							<thead>
								<tr>
									
									<th class="col-md-3 col-xs-3">名稱</th>
									<th class="col-md-3 col-xs-3">內容</th>
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
	<div id="dialog-form1" title="Create Email樣板設定">
		<p class="validateTips">表單驗證顯示</p>
		<form>
			<fieldset>
				<label for="mail_name">樣板名稱</label> 
				<input type="text" name="mail_name" id="mail_name" value="預約成功" class="text ui-widget-content ui-corner-all"> 
				<label for="mail_text">樣版內容</label> 
				<textarea name="mail_text" id="mail_text" value="預約報名已成功" class="form-control" rows="12"></textarea>
<!-- 				<input type="text" name="mail_text" id="mail_text" value="預約報名已成功" class="text ui-widget-content ui-corner-all" -->
<!-- 					style="height:250px">  -->
				<!-- Allow form submission with keyboard without duplicating the dialog button -->
				<input type="submit" tabindex="-1"
					style="position: absolute; top: -1000px">
			</fieldset>
		</form>
	</div>
	
	<!-- 設定修改FORM表單區塊dialog -->
	<div id="dialog-form2" title="Update Email樣板設定">
		<p class="validateTips">表單驗證顯示</p>
		<form>
			<fieldset>
				<label for="mail_id">樣板代號</label> 
				<input type="text" name="mail_id" id="mail_id"  readOnly class="text ui-widget-content ui-corner-all">
				<label for="mail_name">樣板名稱</label> 
				<input type="text" name="mail_name" id="mail_name" value="預約成功" class="text ui-widget-content ui-corner-all"> 
				<label for="mail_text">樣版內容</label> 
				<textarea name="mail_text" id="mail_text" value="預約報名已成功" class="form-control" rows="12"></textarea>
<!-- 				<input type="text" name="mail_text" id="mail_text" value="預約報名已成功" class="text ui-widget-content ui-corner-all" -->
<!-- 					style="height:250px">  -->
				<!-- Allow form submission with keyboard without duplicating the dialog button -->
				<input type="submit" tabindex="-1"
					style="position: absolute; top: -1000px">
			</fieldset>
		</form>
	</div>


	<script>
		$(function() {
			//載入頁面時，先利用getJSON方法呼叫EduJSON.do，取回資料庫資料並建立table內容
			$('#Mail_templateTable>tbody>tr').remove();
			$.getJSON('MailServletJSON.do', {"action":"getALLMail"}, function(datas) {
				//datas 就是一個JSON物件
				$.each(datas, function(i, Mails) {
					//var edu_id = Edus.edu_id;
					
					//欄位內容
					$( "#Mail_templateTable>tbody" ).append( 
						"<tr>" +
				          "<td>" + Mails.mail_name + "</td>" +
				          "<td>" + Mails.mail_text + "</td>" +
				          "<td>" + "<button class='buttonUpdate'> "+"修改"+"</button>"+ "</td>" +
				          "<td>" + "<button class='buttonDelete'> "+"刪除"+"</button>" + "</td>" +
				        "</tr>" );
					console.log(Mails.mail_id);
					
				});
			})//取回資料庫資料並建立table內容結束
			
			
			
			//diolog程式部分以下(新增)
			 var  form,MailInsertForm,MailUpdateForm,
			  mail_id = $( "#mail_id" ),
		      mail_name = $( "#mail_name" ),
		      mail_text = $( "#mail_text" ),
		      allFields = $( [] ).add( mail_id ).add( mail_name ).add( mail_text ),
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
			  valid = valid && checkLength( mail_name, "mail_name", 1, 10 );
		      valid = valid && checkLength( mail_text, "mail_text", 1, 250 );
		 		if ( valid ) {
		        $( "#Mail_templateTable tbody" ).append( "<tr>" +
		          "<td>" + mail_name.val() + "</td>" +
		          "<td>" + mail_text.val() + "</td>" +
		          "<td>" + "<button class='buttonUpdate'>"+"修改"+"</button>"+ "</td>" +
		          "<td>" + "<button class='buttonDelete'>"+"刪除"+"</button>" + "</td>" +
		        "</tr>" );
		        MailInsertForm.dialog( "close" );
		        MailUpdateForm.dialog( "close" );
		      }
		      return valid;
		    }
		  //驗證表單資料是否錯誤結束
		 
		  //設定表單寬度視窗資料開始
		    MailInsertForm = $( "#dialog-form1" ).dialog({
		      autoOpen: false,
		      height: 600,
		      width: 400,
		      modal: true,
		      open: function() {
		          $('.ui-widget-overlay').addClass('custom-overlay');
		      },
		      close: function() {
		          $('.ui-widget-overlay').removeClass('custom-overlay');
		      },
		      buttons: {
		        "send": addData,
		        Cancel: function() {
		        	MailInsertForm.dialog( "close" );
		        }
		      },
		      close: function() {
		        form[ 0 ].reset();
		        allFields.removeClass( "ui-state-error" );
		      }
		    });
		  	//設定表單寬度視窗資料結束
		  	form = MailInsertForm.find( "form" ).on( "submit", function( event ) {
		      event.preventDefault();
		      addData();
		    });
		 	//綁定click事件使用者新增icon，開啟dialog 表單MailInsertForm
		    $( "#buttonAdd" ).button().on( "click", function() {
		    	MailInsertForm.dialog( "open" );
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
		    MailUpdateForm = $( "#dialog-form2" ).dialog({
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
			        "send": addData,
			        Cancel: function() {
			        	MailUpdateForm.dialog( "close" );
			        }
			      },
		      close: function() {
		        form[ 0 ].reset();
		        allFields.removeClass( "ui-state-error" );
		      }
		    });
		  	//設定表單寬度視窗資料結束
		  	form1 = MailUpdateForm.find( "form" ).on( "submit", function( event ) {
		      event.preventDefault();
		      addData();
		    });
		 	//綁定click事件使用者修改icon，開啟dialog 表單MailUpdateForm
		    $( "tbody" ).button().on( "click",".buttonUpdate", function() {
		    	MailUpdateForm.dialog( "open" );
		    });
			
			

		});//load函數結束
	</script>
</body>
</html>
