<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">
<html>
<head>
<title>Examiner_offday_Page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/supersized.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/supersized.shutter.css" type="text/css" media="screen" />

		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
<!-- 		<script type="text/javascript" src="../js/jquery.easing.min.js"></script> -->
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/supersized.3.2.7.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/theme/supersized.shutter.min.js"></script>
		<script type="text/javascript">
			
			jQuery(function($){
				
				$.supersized({
				
					// Functionality
					slideshow               :   1,			// Slideshow on/off
					autoplay				:	1,			// Slideshow starts playing automatically
					start_slide             :   0,			// Start slide (0 is random)
					stop_loop				:	0,			// Pauses slideshow on last slide
					random					: 	0,			// Randomize slide order (Ignores start slide)
					slide_interval          :   3000,		// Length between transitions
					transition              :   1, 			// 0-None, 1-Fade, 2-Slide Top, 3-Slide Right, 4-Slide Bottom, 5-Slide Left, 6-Carousel Right, 7-Carousel Left
					transition_speed		:	1000,		// Speed of transition
					new_window				:	1,			// Image links open in new window/tab
					pause_hover             :   0,			// Pause slideshow on hover
					keyboard_nav            :   1,			// Keyboard navigation on/off
					performance				:	1,			// 0-Normal, 1-Hybrid speed/quality, 2-Optimizes image quality, 3-Optimizes transition speed // (Only works for Firefox/IE, not Webkit)
					image_protect			:	1,			// Disables image dragging and right click with Javascript
															   
					// Size & Position						   
					min_width		        :   0,			// Min width allowed (in pixels)
					min_height		        :   0,			// Min height allowed (in pixels)
					vertical_center         :   1,			// Vertically center background
					horizontal_center       :   1,			// Horizontally center background
					fit_always				:	0,			// Image will never exceed browser width or height (Ignores min. dimensions)
					fit_portrait         	:   1,			// Portrait images will not exceed browser height
					fit_landscape			:   0,			// Landscape images will not exceed browser width
															   
					// Components							
					slide_links				:	'blank',	// Individual links for each slide (Options: false, 'num', 'name', 'blank')
					thumb_links				:	1,			// Individual thumb links for each slide
					thumbnail_navigation    :   0,			// Thumbnail navigation
					slides 					:  	[			// Slideshow Images
														{image : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/slides/kazvan-1.jpg', title : 'Image Credit: Maria Kazvan', thumb : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/kazvan-1.jpg'},
														{image : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/slides/kazvan-2.jpg', title : 'Image Credit: Maria Kazvan', thumb : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/kazvan-2.jpg'},  
														{image : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/slides/kazvan-3.jpg', title : 'Image Credit: Maria Kazvan', thumb : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/kazvan-3.jpg'},
														{image : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/slides/wojno-1.jpg', title : 'Image Credit: Colin Wojno', thumb : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/wojno-1.jpg'},
														{image : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/slides/wojno-2.jpg', title : 'Image Credit: Colin Wojno', thumb : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/wojno-2.jpg'},
														{image : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/slides/wojno-3.jpg', title : 'Image Credit: Colin Wojno', thumb : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/wojno-3.jpg'},
														{image : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/slides/shaden-1.jpg', title : 'Image Credit: Brooke Shaden', thumb : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/shaden-1.jpg'},
														{image : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/slides/shaden-2.jpg', title : 'Image Credit: Brooke Shaden', thumb : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/shaden-2.jpg'},
														{image : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/slides/shaden-3.jpg', title : 'Image Credit: Brooke Shaden', thumb : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/shaden-3.jpg'}
												],
												
					// Theme Options			   
					progress_bar			:	1,			// Timer for each slide							
					mouse_scrub				:	0
					
				});
		    });
		    
		</script>
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" >
<link href="${pageContext.request.contextPath}/css/maincontentdiv.css" rel="stylesheet" type="text/css" >
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.0-rc.2/themes/smoothness/jquery-ui.css">
<link href="${pageContext.request.contextPath}/css/lobibox.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/js/lobibox.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="author" content="">

<!-- fancybox -->
	<link rel="stylesheet" type="text/css" href="/projectmain/css/fancybox/jquery.fancybox.css"> 	
	<script src='/projectmain/js/fancybox/jquery.fancybox.pack.js'></script> 
	
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

					<button id="buttonDetail" class="ui-button ui-corner-all ui-widget">明細</button>
					<button id="buttonUpdate" class="ui-button ui-corner-all ui-widget">編輯代理人</button>

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
				            deleteOrUpdateValue=null;
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
			      open: function() {
			          $('.ui-widget-overlay').addClass('custom-overlay');
			      },
			      close: function() {
			          $('.ui-widget-overlay').removeClass('custom-overlay');
			      },
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
// 			    		alert("請先選取要編輯的資料");
			    		Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
	 			    			{
	 			    			msg: "請先選取要編輯的資料"
	 			    			});
		    
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
			    $.getJSON('/projectmain/Examiner_offday/EmployeeServletJSON.do', {"action":"getALLEmp"}, function(datas) {
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
				 		$.get('/projectmain/Examiner_offdayServlet',Updatedatas,function(data){
				 		console.log(data)
				 			if(data=="failed"){
				 					$('.validateTips').css('color','red').text("更新錯誤");
				 			}
				 			else if(data=="success"){
				 				console.log("11111")	
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

			if(deleteOrUpdateValue==null){
			   console.log(deleteOrUpdateValue);
// 			   alert("請先選取要瀏覽的資料");
			   Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
	 			    			{
	 			    			msg: "請先選取要編輯的資料"
	 			    			});
			}else{
			    console.log(deleteOrUpdateValue)
				$.get('/projectmain/Examiner_offdayServlet',{"exam_id":deleteOrUpdateValue,"action":"getoneExam"},function(data){	
					console.log(data)
					$.each(JSON.parse(data),function(i,val){
					console.log("dd="+data)
						var exam_id = val.exam_id;
						console.log("ee="+exam_id)

						var off_startdate = val.off_startdate;
						var off_enddate = val.off_enddate;
						var off_day = val.off_day;
						var emp_job_id = val.emp_job_id;
						var emp_id = val.emp_id;
						var emp_name = val.emp_name;
						var emp_mail = val.emp_mail;
						var dep_name = val.dep_name;

						
						console.log("sss="+val.key)
						if(val.key!=undefined){
							console.log("cc="+val.key)
							var key = JSON.stringify(val.key);
							console.log("bb1="+key)
							console.log("ee="+exam_id)
		
							for(var i=0;i<val.key.length;i++){
// 								console.log("aa="+val.key[i].stu_id)
// 								console.log("bb="+key)
								var stu_id = val.key[i].stu_id;
								var stu_name = val.key[i].stu_name;
								var test_start = val.key[i].test_start;
								var test_end = val.key[i].test_end;
								
								var date1 = off_startdateUpdateValue.text();
								var date2 = off_enddateUpdateValue.text();
								sdate = new Date(date1);
								edate = new Date(date2);
								tdate = new Date(test_start);
								sdate1 = sdate.getTime();
								edate1 = edate.getTime();
								tdate1 = tdate.getTime();
								
								if(tdate1>=sdate1&&tdate1<=edate1){

									$.fancybox({//调用fancybox弹出层 
									
			    			                'type':'ajax', 
			    			                'href':'/projectmain/Examiner_offday/Exam_Detail.jsp?action=add&exam_id='+exam_id
			    			                +'&off_startdate='+off_startdate
			    			                +'&off_enddate='+off_enddate
			    			                +'&off_day='+off_day
			    			                +'&emp_job_id='+emp_job_id
			    			                +'&emp_id='+emp_id
			    			                +'&emp_name='+emp_name
			    			                +'&emp_mail='+emp_mail
			    			                +'&dep_name='+dep_name
			    			                +'&stu_id='+stu_id
			    			                +'&stu_name='+stu_name
			    			                +'&test_start='+test_start
			    			                +'&test_end='+test_end
			    			                
			    			        });
								}else{console.log("8888");
									$.fancybox({//调用fancybox弹出层 
										
		    			                'type':'ajax', 
		    			                'href':'/projectmain/Examiner_offday/Exam_Detail.jsp?action=add&exam_id='+exam_id
		    			                +'&off_startdate='+off_startdate
		    			                +'&off_enddate='+off_enddate
		    			                +'&off_day='+off_day
		    			                +'&emp_job_id='+emp_job_id
		    			                +'&emp_id='+emp_id
		    			                +'&emp_name='+emp_name
		    			                +'&emp_mail='+emp_mail
		    			                +'&dep_name='+dep_name
		    			                
		    			         	});      
								}
							}	
						}else{
							$.fancybox({//调用fancybox弹出层 
							
	    			                'type':'ajax', 
	    			                'href':'/projectmain/Examiner_offday/Exam_Detail.jsp?action=add&exam_id='+exam_id
	    			                +'&off_startdate='+off_startdate
	    			                +'&off_enddate='+off_enddate
	    			                +'&off_day='+off_day
	    			                +'&emp_job_id='+emp_job_id
	    			                +'&emp_id='+emp_id
	    			                +'&emp_name='+emp_name
	    			                +'&emp_mail='+emp_mail
	    			                +'&dep_name='+dep_name
	    			                
	    			         });      
						}	
						

					});
				});

	    		}
		
			});
		});	//load函數結束
		
		
	</script>
</body>
</html>






