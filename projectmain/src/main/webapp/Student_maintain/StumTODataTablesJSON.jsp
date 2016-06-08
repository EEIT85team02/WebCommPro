<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">
<html>
<head>
<title>Student_maintain_Page</title>
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
					<table id="Student_MaintainTable" class="display" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="col-md-2 col-xs-2">考生代號</th>
								<th class="col-md-2 col-xs-2">考生名字</th>
								<th class="col-md-2 col-xs-2">班級代號</th>
								<th class="col-md-3 col-xs-3">班級名稱</th>
								<th class="col-md-3 col-xs-3">E-mail</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						<tfoot>
							<tr>
								<th>考生代號</th>
								<th>考生名字</th>
								<th>班級代號</th>
								<th>班級名稱</th>
								<th>E-mail</th>
							</tr>
						</tfoot>
					</table>
					<button id="buttonDetail">明細修改</button>
					
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$(function() {
			//定義table資料來源json，與畫面顯示------>開始
			var table = $('#Student_MaintainTable').DataTable( {
				 	"ajax": {
			            "url": "/projectmain/Student_maintain/StumToJSONInitTableServlet",
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
		    var deleteOrUpdateValue = null;//檢查是否有選取資料行	
		    	//點選要修改的那行，先將選擇的[行]資料儲存
			$('#Student_MaintainTable tbody').on( 'click', 'tr', function () {
					deleteOrUpdateValue = $(this).find('td:eq(0)').text(); 
					console.log(deleteOrUpdateValue);
						if ( $(this).hasClass('selected') ) {
				            $(this).removeClass('selected');
				        }
				        else {
				            table.$('tr.selected').removeClass('selected');
				            $(this).addClass('selected');
				        }
			} );
			
			//按下明細修改按鈕
			$('#buttonDetail').click(function() {
			if(deleteOrUpdateValue==null){
			   console.log(deleteOrUpdateValue);
			   alert("請先選取要編輯的資料");
			}else{
				console.log(deleteOrUpdateValue)
				$.get('StudentProfileServlet',{"stu_id":deleteOrUpdateValue,"action":"stu_add"},function(data){	
					console.log(data);
					$.each(JSON.parse(data),function(key,val){
						var stu_id = val.stu_id;
						var stu_name = val.stu_name;
						var class_id = val.class_id;
						var stu_email = val.stu_email;
						var stu_group = val.stu_group;
						var stu_seatno = val.stu_seatno;
						var stu_age = val.stu_age;
						var stu_sch = val.stu_sch;
						var stu_sex = val.stu_sex;
						var test_start = val.test_start;
						var test_end = val.test_end;
						var stu_applytime = val.stu_applytime;
						var sta_id = val.sta_id;
						var emp_id = val.emp_id;
						var confirm_time = val.confirm_time;
						var stu_pre = val.stu_pre;
						var stu_implement = val.stu_implement;
						var stu_testtime=val.stu_testtime;
						var stu_interview = val.stu_interview;
						var stu_total = val.stu_total;
						var stu_workdate = val.stu_workdate;
						var stu_except = val.stu_except;
						var stu_final = val.stu_final;
						var stu_note1 = val.stu_note1;
						var stu_note2 = val.stu_note2;
						var pub_key = val.pub_key;
						var pri_key = val.pri_key;
						var cipher_text = val.cipher_text;
						var log_pw = val.log_pw;
						
						var log_pw = val.log_pw;
						$.fancybox({//调用fancybox弹出层 
    			                'type':'ajax', 
    			                'href':'/projectmain/Student_maintain/Stum_Detail.jsp?action=add&stu_id='+stu_id
    			                +'&stu_name='+stu_name
    			                +'&class_id='+class_id
    			                +'&stu_email='+stu_email
    			                +'&stu_group='+stu_group
    			                +'&stu_seatno='+stu_seatno
    			                +'&stu_age='+stu_age
    			                +'&stu_sch='+stu_sch
    			                +'&stu_sex='+stu_sex
    			                +'&test_start='+test_start
    			                +'&test_end='+test_end
    			                +'&stu_applytime='+stu_applytime
    			                +'&sta_id='+sta_id
    			                +'&emp_id='+emp_id
    			                +'&confirm_time='+confirm_time
    			                +'&stu_pre='+stu_pre
    			                +'&stu_implement='+stu_implement
    			                +'&stu_testtime='+stu_testtime
    			                +'&stu_interview='+stu_interview
    			                +'&stu_total='+stu_total
    			                +'&stu_workdate='+stu_workdate
    			                +'&stu_except='+stu_except
    			                +'&stu_final='+stu_final
    			                +'&stu_note1='+stu_note1
    			                +'&stu_note2='+stu_note2
    			                +'&pub_key='+pub_key
    			                +'&pri_key='+pri_key
    			                +'&cipher_text='+cipher_text
    			                +'&log_pw='+log_pw
    			                
    			        }); 
					});
						
				});
	    		}
			});
			    
		} );//load函數結束
		
		
	</script>
</body>
</html>






