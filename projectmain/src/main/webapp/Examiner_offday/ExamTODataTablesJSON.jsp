<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">
<html>
<head>
<title>Examiner_offday_Page</title>
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

<!-- fancybox -->
	<link rel="stylesheet" type="text/css" href="/projectmain/css/fancybox/jquery.fancybox.css"> 	
	<script src='/projectmain/js/fancybox/jquery.fancybox.pack.js'></script> 
	
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
					<table id="Examiner_offdayTable" class="display" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="col-md-1.5 col-xs-1.5">請假單單號</th>
								<th class="col-md-1.5 col-xs-1.5">主考官代號</th>
								<th class="col-md-1.5 col-xs-1.5">主考官名字</th>
								<th class="col-md-1.5 col-xs-1.5">請假開始日期</th>
								<th class="col-md-1.5 col-xs-1.5">請假結束日期</th>
								<th class="col-md-1.5 col-xs-1.5">請假天數</th>
								<th class="col-md-1.5 col-xs-1.5">職務代理人代號</th>
								<th class="col-md-1.5 col-xs-1.5">職務代理人</th>
								
							</tr>
						</thead>
						<tbody>
						</tbody>
						<tfoot>
							<tr>
								<th>請假單單號</th>
								<th>主考官代號</th>
								<th>主考官名字</th>
								<th>請假開始日期</th>
								<th>請假結束日期</th>
								<th>請假天數</th>
								<th>職務代理人代號</th>
								<th>職務代理人</th>
							</tr>
						</tfoot>
					</table>
					<button id="buttonDetail">明細修改</button>
					<button id="buttonUpdate">編輯代理人</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 設定修改FORM表單區塊dialog -->
	<div id="dialog-updateForm" title="修改主考官資料">
		<p class="allValid"></p>
		<form name="ExamUpdateForm" action="updateExam">
			<fieldset>
				<div class="divForm">
					<label for="exam_id" class="labelTitle">請假單單號:</label> 
					<input type="text" name="exam_id" id="uexam_id" size="20"  readOnly> 
					
				</div>
				
				<div class="divForm">
					<label for="emp_id" class="labelTitle">主考官代號:</label> 
					<input type="text" name="emp_id" id="uemp_id" size="20"  readOnly> 
					
				</div>
				
				<div class="divForm">
					<label for="off_startdate" class="labelTitle">請假開始日期:</label> 
					<input type="text" name="off_startdate" id="uoff_startdate" size="20"  autocomplete="off" readOnly>
					
				</div>
				
				<div class="divForm">
					<label for="off_enddate" class="labelTitle">請假結束日期:</label> 
					<input type="text" name="off_enddate" id="uoff_enddate" size="20"  autocomplete="off" readOnly> 
					
				</div>
				<div class="divForm">
					<label for="off_day" class="labelTitle">請假天數:</label> 
					<input type="text" name="off_day" id="uoff_day" size="20"  autocomplete="off" readOnly> 
					
				</div>
				<div class="divForm">
					<label for="emp_job_id" class="labelTitle">職務代理人:</label> 
					<select id="uselectEmp_job_id" name='emp_job_id'>
				   	</select>
				</div>
				
				
				<input type="hidden" name="action" value="updateExam">
				<input type="submit" tabindex="-1" style="position: absolute; top: -1000px">
			</fieldset>
		</form>
	</div>
	<script>
		$(function() {
			//定義table資料來源json，與畫面顯示------>開始
			var table = $('#Examiner_offdayTable').DataTable( {
				 	"ajax": {
			            "url": "/projectmain/Examiner_offday/ExamToJSONInitTableServlet",
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
		    	
		    	 //新增dialog區塊變數宣告
			var form,ExamUpdateForm,
			 	
				uexam_id = $('#uexam_id'),
			  	uemp_id = $('#uemp_id'),
			  	uemp_name = $('#uemp_name'),
			  	uoff_startdate = $('#uoff_startdate'),
			  	uoff_enddate = $('#uoff_enddate'),
			  	uoff_day = $('#uoff_day'),
			  	uselectEmp_job_id = $('#uselectEmp_job_id')
				
				deleteOrUpdateValue = null;//檢查是否有選取資料行
				
		      	uallFields = $( [] ).add( uexam_id ).add( uemp_id ).add( uemp_name ).add( uoff_startdate ).add( uoff_enddate ).add( uoff_day ).add( uselectEmp_job_id );
		      	tips = $( ".validateTips" );
		    	
			    
			//點選要修改的那行，先將選擇的[行]資料儲存
			$('#Examiner_offdayTable tbody').on( 'click', 'tr', function () {
					deleteOrUpdateValue = $(this).find('td:eq(0)').text();
					exam_idUpdateValue = $(this).find('td:eq(0)');
					emp_idUpdateValue = $(this).find('td:eq(1)');
					emp_nameUpdateValue = $(this).find('td:eq(2)');
					off_startdateUpdateValue = $(this).find('td:eq(3)');
					off_enddateUpdateValue = $(this).find('td:eq(4)');
					off_dayUpdateValue = $(this).find('td:eq(5)');
					emp_job_idUpdateValue = $(this).find('td:eq(6)');
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
				ExamUpdateForm = $( "#dialog-updateForm" ).dialog({
			      autoOpen: false,
			      height: 650,
			      width: 400,
			      modal: true,
			      buttons: {
				        "send": updateExamFormToCreateTable,
				        Cancel: function() {
				        	ExamUpdateForm.dialog( "close" );
				        }
				      },
			      close: function() {
			        form[ 0 ].reset();
			        uallFields.removeClass( "ui-state-error" );
			      }
			    });
			    
			  	//設定表單寬度視窗資料結束
			  	form = ExamUpdateForm.find( "form" ).on( "submit", function( event ) {
			      event.preventDefault();
			      updateExamFormToCreateTable();
			    });

			  //綁定click事件使用者編輯icon，開啟dialog 表單ExamUpdateForm
			 	$('#buttonUpdate').click( function () {
			    	if(deleteOrUpdateValue==null){
			    		console.log(deleteOrUpdateValue);
			    		alert("請先選取要編輯的資料");
			    	}else{
			    		uexam_id.val(exam_idUpdateValue.text());
		    			uemp_id.val(emp_idUpdateValue.text());
		    			uemp_name.val(emp_nameUpdateValue.text());
		    			uoff_startdate.val(off_startdateUpdateValue.text());
		    			uoff_enddate.val(off_enddateUpdateValue.text());
		    			uoff_day.val(off_dayUpdateValue.text());
		    			uselectEmp_job_id.val(emp_job_idUpdateValue.text());
		    			ExamUpdateForm.dialog( "open" );
			    	}
			    } );
			    
			    //呼叫ServletJSON取回下拉選單資料--編輯表單(代理人下拉選單)
			    $.getJSON('EmployeeServletJSON.do', {"action":"getALLEmp"}, function(datas) {
					console.log("datas:"+datas);
					$.each(datas, function(i, Emps) {
						uselectEmp_job_id.append( 
					 			"<option value="+ Emps.emp_id +">"+Emps.emp_id+"</option>" 
			       			);

					});
				});//取回資料庫資料並建立內容結束
				
			    //點選修改鍵，所執行的方法
			    function updateExamFormToCreateTable() {
				 		var Updatedatas = $('form[name="ExamUpdateForm"]').serialize();
				 		$.get('Examiner_offdayServlet',Updatedatas,function(data){
				 		console.log(data)
				 			if(data=="資料更新失敗"){
				 					$('.validateTips').css('color','red').text("更新錯誤");
				 			}
				 			else if(data=="資料更新成功"){
				 					
				 				exam_idUpdateValue.text(uexam_id.val());
				 				emp_idUpdateValue.text(uemp_id.val());
				 				emp_nameUpdateValue.text(uemp_name.val());
				 				off_startdateUpdateValue.text(uoff_startdate.val());
				 				off_enddateUpdateValue.text(uoff_enddate.val());
				 				off_dayUpdateValue.text(uoff_day.val());
				 				emp_job_idUpdateValue.text(uselectEmp_job_id.val());
				 					
							 	$('.validateTips').text("");////將更新form表單驗證區塊內容清空
					 			ExamUpdateForm.dialog( "close" );
				 			}
				 		});
				 	}
				 	
				 	

			//按下明細按鈕
			$('#buttonDetail').click(function() {
			console.log(deleteOrUpdateValue)
				$.get('Examiner_offdayServlet',{"exam_id":deleteOrUpdateValue,"action":"getoneExam"},function(data){	
					console.log(data);
					$.each(JSON.parse(data),function(key,val){
						var exam_id = val.exam_id;
						var off_stardate = val.off_stardate;
						var off_enddate = val.off_enddate;
						var off_day = val.off_day;
						var emp_job_id = val.emp_job_id;
						var emp_id = val.emp_id;
						var emp_name = val.emp_name;
						var emp_mail = val.emp_mail;
						var dep_name = val.dep_name;
						
						$.fancybox({//调用fancybox弹出层 
    			                'type':'ajax', 
    			                'href':'/projectmain/Examiner_offday/Exam_Detail.jsp?action=add&exam_id='+exam_id
    			                +'&off_stardate='+off_stardate
    			                +'&off_enddate='+off_enddate
    			                +'&off_day='+off_day
    			                +'&emp_job_id='+emp_job_id
    			                +'&emp_id='+emp_id
    			                +'&emp_name='+emp_name
    			                +'&emp_mail='+emp_mail
    			                +'&dep_name='+dep_name
    			                
    			        }); 
					});
						
				});
	    		
			});
			    
		} );//load函數結束
		
		
	</script>
</body>
</html>






