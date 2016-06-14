<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>狀態出來了</title>
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
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap-theme.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/jquery-ui.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/DataTables/DataTables-1.10.11/css/jquery.dataTables.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/DataTables/DataTables-1.10.11/css/jquery.dataTables.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/lobibox.min.css" rel="stylesheet">
<style>
.navbar-inverse {
    background-image: linear-gradient(to bottom,#E4C00D 0,rgba(249, 68, 27, 0.97) 100%);
}
.Main_Content {
	margin-top: 100px;
}
a {
    color: rgb(179, 24, 188);
    text-decoration: none;
}
</style>
</head>
<body>
<jsp:include page="/top/ExamierTop.jsp" />
<form method="post" action="EmailJSON.do" name="EmailGOGO">
        <input type="hidden" name="action"	value="sendEmaildata">
        <input type="hidden" id="stu_namehid" name="stu_name" >
        <input type="hidden" id="stu_emailhid" name="stu_email" >
        <input type="hidden" id="stu_applytimehid" name="stu_applytime" >
 </form> 
<form method="post" action="UpStuaddStatusJSON.do" name="cancelok">
        <input type="hidden" name="action"	value="upstatuscancel">
        <input type="hidden" id="stu_add_idhidc" name="stu_add_id" >
        <input type="hidden" id="stu_idhidc" name="stu_id" >
        <input type="hidden" id="test_starthidc" name="test_start" >
        <input type="hidden" id="test_endhidc" name="test_end" >
        <input type="hidden" id="stu_applytimehidc" name="stu_applytime" >
        <input type="hidden" id="sta_idhidc" name="sta_id" >
        <input type="hidden" id="emp_idhidc" name="emp_id" >
        <input type="hidden" id="confirm_timehidc" name="confirm_time" >
 </form>  
 <form method="post" action="UpStuaddStatusJSON.do" name="ok">
        <input type="hidden" name="action"	value="upstatusok">
        <input type="hidden" id="stu_add_idhidok" name="stu_add_id" >
        <input type="hidden" id="stu_idhidok" name="stu_id" >
        <input type="hidden" id="test_starthidok" name="test_start" >
        <input type="hidden" id="test_endhidok" name="test_end" >
        <input type="hidden" id="stu_applytimehidok" name="stu_applytime" >
        <input type="hidden" id="sta_idhidok" name="sta_id" >
        <input type="hidden" id="emp_idhidok" name="emp_id" >
        <input type="hidden" id="confirm_timehidok" name="confirm_time" >
 </form> 
 <div class="Main_Content">      
        <div class="bs-example bs-example-tabs" role="tabpanel">
      <ul class="nav nav-tabs" role="tablist">
        <li role="presentation"><a href="#OK" role="tab" id="OK-tab" data-toggle="tab" aria-controls="OK">已核准</a></li>
        <li role="presentation" class="active"><a href="#NO" id="NO-tab" role="tab" data-toggle="tab" aria-controls="NO">未核准</a></li>
        <li role="presentation"><a href="#NEVER" role="tab" id="NEVER-tab" data-toggle="tab" aria-controls="NEVER">未報名</a></li>
        <li role="presentation"><a href="#YES" role="tab" id="YES-tab" data-toggle="tab" aria-controls="YES">已錄取</a></li>
        <li role="presentation"><a href="#NYES" role="tab" id="NYES-tab" data-toggle="tab" aria-controls="NYES">未錄取</a></li>
      </ul>
      <div id="myTabContent" class="tab-content">
        
           <div role="tabpanel" class="tab-pane fade" id="OK" aria-labelledBy="OK-tab">
              <p>
<!--                       <input type="button" value="狀態" id="buttonJSON" -->
<!--                           class="btn btn-danger"> -->
                      <table id="statusTable01" class="display" cellspacing="0" width="100%">
                         <thead>
                            <tr>
                                <th>姓名</th>
		                        <th>E-mail</th>
		                        <th>班別</th>
		                        <th>預約日期</th>
		                        <th>狀態</th>
		                        <th>送信</th>
		                        <th>取消核准</th>
                            </tr>
                         </thead>
                         <tbody>
                         </tbody>
                      </table>
               <p>
           </div>
           <div role="tabpanel" class="tab-pane fade in active" id="NO" aria-labelledBy="NO-tab">
              <p>
<!--                       <input type="button" value="狀態" id="buttonJSON" -->
<!--                           class="btn btn-danger"> -->
                      <table id="statusTable02" class="display" cellspacing="0" width="100%">
                         <thead>
                            <tr>
                                <th>姓名</th>
		                        <th>E-mail</th>
		                        <th>班別</th>
		                        <th>預約日期</th>
		                        <th>狀態</th>
		                    	<th>核准</th>
                            </tr>
                         </thead>
                         <tbody>
                         </tbody>
                      </table>
               <p>
           </div>
           <div role="tabpanel" class="tab-pane fade" id="NEVER" aria-labelledBy="NEVER-tab">
              <p>
<!--                       <input type="button" value="狀態" id="buttonJSON" -->
<!--                           class="btn btn-danger"> -->
                      <table id="statusTable03" class="display" cellspacing="0" width="100%">
                         <thead>
                            <tr>
                                <th>姓名</th>
		                        <th>E-mail</th>
		                        <th>班別</th>
<!-- 		                        <th>預約日期</th> -->
		                        <th>狀態</th>
                            </tr>
                         </thead>
                         <tbody>
                         </tbody>
                      </table>
               <p>
           </div>
           <div role="tabpanel" class="tab-pane fade" id="YES" aria-labelledBy="YES-tab">
              <p>
<!--                       <input type="button" value="狀態" id="buttonJSON" -->
<!--                           class="btn btn-danger"> -->
                      <table id="statusTable04" class="display" cellspacing="0" width="100%">
                         <thead>
                            <tr>
                                <th>姓名</th>
		                        <th>E-mail</th>
		                        <th>班別</th>
		                        <th>預約日期</th>
		                        <th>狀態</th>
                            </tr>
                         </thead>
                         <tbody>
                         </tbody>
                      </table>
               <p>
           </div>
            <div role="tabpanel" class="tab-pane fade" id="NYES" aria-labelledBy="NYES-tab">
              <p>
<!--                       <input type="button" value="狀態" id="buttonJSON" -->
<!--                           class="btn btn-danger"> -->
                      <table id="statusTable05" class="display" cellspacing="0" width="100%">
                         <thead>
                            <tr>
                                <th>姓名</th>
		                        <th>E-mail</th>
		                        <th>班別</th>
		                        <th>預約日期</th>
		                        <th>狀態</th>
                            </tr>
                         </thead>
                         <tbody>
                         </tbody>
                      </table>
               <p>
           </div>
          
        </div>
     </div>
</div> 
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
        <script src="${pageContext.request.contextPath}/DataTables/DataTables-1.10.11/js/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/lobibox.min.js"></script>
		<script>
		        $(function(){

		        	 $(document).on("click",".btn-warning",function(){  //點擊取消核准按鈕
						 updateID = $(this).val();   //拿出button的value的stu_add_id去資料庫找資料 
						 $.getJSON("UpStuaddStatusJSON.do",{"action":"getStuAddId",'stu_add_id':updateID},function(datas){
			//				 console.log(datas)
							 $.each(datas,function(i,score){
								 
								 $("#stu_add_idhidc").val(score.stu_add_id); //取出值並放入hidden的value進行修改
								 $("#stu_idhidc").val(score.stu_id);
								 $("#test_starthidc").val(score.test_start);
								 $("#test_endhidc").val(score.test_end);
								 $("#stu_applytimehidc").val(score.stu_applytime);
								 $("#sta_idhidc").val(score.sta_id);
								 $("#emp_idhidc").val(score.emp_id);
								 $("#confirm_timehidc").val(score.confirm_time);
           //                       console.log(score.test_start)
                              var Updatedatas = $('form[name="cancelok"]').serialize();  //form表單資料序列化丟到servlet更新
				 			     $.post('UpStuaddStatusJSON.do',Updatedatas,function(){
				 			    	 
				 			    	table1.ajax.reload();  //重新讀取表格資料
				 			    	table2.ajax.reload();
				 			    	
// 				 			    	$('#statusTable01>tbody').empty();
				 			    	
// 				 			     $.getJSON('ShowStatusJSON.do',{'action':'getShowStatus01'},function(datas){
						        		
// 						        $.each(datas,function(i,status){
// 						        	var cell1 = $("<td></td>").text(status.stu_name);
// 									var cell2 = $("<td></td>").text(status.stu_email);
// 									var cell3 = $("<td></td>").text(status.stu_id);
// 									var cell4 = $("<td></td>").text(status.stu_applytime);
// 									var cell5 = $("<td></td>").text(status.sta_name);
// 									var cell6 = $("<td></td>").html("<button type='button' class='btn btn-info' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo' value="+status.stu_id+" >送信</button>");
// 									var cell7 = $("<td></td>").html("<button type='button' class='btn btn-warning' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo' value="+status.stu_add_id+" >取消核准</button>");
											
// 									var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5,cell6,cell7]);
											
// 									$('#statusTable01>tbody').append(row);
// 						             })
// 						          })
// 						     $('#statusTable02>tbody').empty();
		        	
// 		        	$.getJSON('ShowStatusJSON.do',{'action':'getShowStatus02'},function(datas){
		        		
// 		        		$.each(datas,function(i,status){
// 		        			var cell1 = $("<td></td>").text(status.stu_name);
// 							var cell2 = $("<td></td>").text(status.stu_email);
// 							var cell3 = $("<td></td>").text(status.stu_id);
// 							var cell4 = $("<td></td>").text(status.stu_applytime);
// 							var cell5 = $("<td></td>").text(status.sta_name);
// 							var cell6 = $("<td></td>").html("<button type='button' class='btn btn-success' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo' value="+status.stu_add_id+" >核准</button>");
									
// 							var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5,cell6]);
							
// 							$('#statusTable02>tbody').append(row);
// 		        		})
// 		        	})
				 			    })
							 })
						 })
					 })
					 $(document).on("click",".btn-success",function(){  //點擊核准按鈕
						 updateID = $(this).val();   //拿出button的value的stu_add_id去資料庫找資料 
						 $.getJSON("UpStuaddStatusJSON.do",{"action":"getStuAddId",'stu_add_id':updateID},function(datas){
			//				 console.log(datas)
							 $.each(datas,function(i,score){
								 
								 $("#stu_add_idhidok").val(score.stu_add_id); //取出值並放入hidden的value進行修改
								 $("#stu_idhidok").val(score.stu_id);
								 $("#test_starthidok").val(score.test_start);
								 $("#test_endhidok").val(score.test_end);
								 $("#stu_applytimehidok").val(score.stu_applytime);
								 $("#sta_idhidok").val(score.sta_id);
								 $("#emp_idhidok").val(score.emp_id);
								 $("#confirm_timehidok").val(score.confirm_time);
           //                       console.log(score.test_start)
                              var Updatedatas = $('form[name="ok"]').serialize();   //form表單資料序列化丟到servlet更新
				 			     $.post('UpStuaddStatusJSON.do',Updatedatas,function(){
				 			    	 
				 			    	table1.ajax.reload();   //重新讀取表格資料
				 			    	table2.ajax.reload(); 
				 			    	
// 				 			    	$('#statusTable01>tbody').empty();
				 			    	
// 				 			     $.getJSON('ShowStatusJSON.do',{'action':'getShowStatus01'},function(datas){
						        		
// 						        $.each(datas,function(i,status){
// 						        	var cell1 = $("<td></td>").text(status.stu_name);
// 									var cell2 = $("<td></td>").text(status.stu_email);
// 									var cell3 = $("<td></td>").text(status.stu_id);
// 									var cell4 = $("<td></td>").text(status.stu_applytime);
// 									var cell5 = $("<td></td>").text(status.sta_name);
// 									var cell6 = $("<td></td>").html("<button type='button' class='btn btn-info' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo' value="+status.stu_id+" >送信</button>");
// 									var cell7 = $("<td></td>").html("<button type='button' class='btn btn-warning' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo' value="+status.stu_add_id+" >取消核准</button>");
											
// 									var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5,cell6,cell7]);
											
// 									$('#statusTable01>tbody').append(row);
// 						             })
// 						          })
// 						     $('#statusTable02>tbody').empty();
		        	
// 		        	$.getJSON('ShowStatusJSON.do',{'action':'getShowStatus02'},function(datas){
		        		
// 		        		$.each(datas,function(i,status){
// 		        			var cell1 = $("<td></td>").text(status.stu_name);
// 							var cell2 = $("<td></td>").text(status.stu_email);
// 							var cell3 = $("<td></td>").text(status.stu_id);
// 							var cell4 = $("<td></td>").text(status.stu_applytime);
// 							var cell5 = $("<td></td>").text(status.sta_name);
// 							var cell6 = $("<td></td>").html("<button type='button' class='btn btn-success' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo' value="+status.stu_add_id+" >核准</button>");
									
// 							var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5,cell6]);
							
// 							$('#statusTable02>tbody').append(row);
// 		        		})
// 		        	})
				 			    })
							 })
						 })
					 })
					 
					 $(document).on("click",".btn-info",function(){ //點擊送信按鈕	 
						 updateID = $(this).val();  //拿出button的value的stu_id去資料庫找資料
//						 console.log(updateID)
						$.getJSON("EmailJSON.do",{"action":"getEmailPkId",'stu_id':updateID},function(datas){
//							 console.log(datas)
							 $.each(datas,function(i,email){
								 
								 $("#stu_namehid").val(email.stu_name); //取出值並放入hidden的value進行修改
								 $("#stu_emailhid").val(email.stu_email);
								 $("#stu_applytimehid").val(email.stu_applytime);

 //                                 console.log(email.stu_name)
                              var Updatedatas = $('form[name="EmailGOGO"]').serialize();   //form表單資料序列化丟到servlet
				 			     $.post('EmailJSON.do',Updatedatas,function(){
 
				 			   })
				 			 })
						 })
						 Lobibox.alert("success", //AVAILABLE TYPES: "error", "info", "success", "warning"
		 			    			{
		 			    			msg: "成功送出信件"
		 			    			});
					})
							//定義table資料來源json，與畫面顯示------>開始
					var table1 = $('#statusTable01').DataTable( {
						 	"ajax": {
					            "url": "ShowStatusJSON.do?action=getShowStatus01",
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
					
				   var table2 = $('#statusTable02').DataTable( {
						 	"ajax": {
					            "url": "ShowStatusJSON.do?action=getShowStatus02",
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
					
					$('#statusTable03').DataTable( {
					 	"ajax": {
				            "url": "ShowStatusJSON.do?action=getShowStatus03",
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
					
					$('#statusTable04').DataTable( {
					 	"ajax": {
				            "url": "ShowStatusJSON.do?action=getShowStatus04",
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
					
					$('#statusTable05').DataTable( {
					 	"ajax": {
				            "url": "ShowStatusJSON.do?action=getShowStatus05",
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
// 		        		$('#statusTable01>tbody').empty();
		        	
// 		        	$.getJSON('ShowStatusJSON.do',{'action':'getShowStatus01'},function(datas){
		        		
// 		        		$.each(datas,function(i,status){
// 		        			var cell1 = $("<td></td>").text(status.stu_name);
// 							var cell2 = $("<td></td>").text(status.stu_email);
// 							var cell3 = $("<td></td>").text(status.stu_id);
// 							var cell4 = $("<td></td>").text(status.stu_applytime);
// 							var cell5 = $("<td></td>").text(status.sta_name);
// 							var cell6 = $("<td></td>").html("<button type='button' class='btn btn-info' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo' value="+status.stu_id+" >送信</button>");
// 							var cell7 = $("<td></td>").html("<button type='button' class='btn btn-warning' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo' value="+status.stu_add_id+" >取消核准</button>");
							
// 							var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5,cell6,cell7]);
							
// 							$('#statusTable01>tbody').append(row);
// 		        		})
// 		        	})
// 		        		$('#statusTable02>tbody').empty();
		        	
// 		        	$.getJSON('ShowStatusJSON.do',{'action':'getShowStatus02'},function(datas){
		        		
// 		        		$.each(datas,function(i,status){
// 		        			var cell1 = $("<td></td>").text(status.stu_name);
// 							var cell2 = $("<td></td>").text(status.stu_email);
// 							var cell3 = $("<td></td>").text(status.stu_id);
// 							var cell4 = $("<td></td>").text(status.stu_applytime);
// 							var cell5 = $("<td></td>").text(status.sta_name);
// 							var cell6 = $("<td></td>").html("<button type='button' class='btn btn-success' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo' value="+status.stu_add_id+" >核准</button>");
									
// 							var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5,cell6]);
							
// 							$('#statusTable02>tbody').append(row);
// 		        		})
// 		        	})
// 		        		$('#statusTable03>tbody').empty();
		        	
// 		        	$.getJSON('ShowStatusJSON.do',{'action':'getShowStatus03'},function(datas){
		        		
// 		        		$.each(datas,function(i,status){
// 		        			var cell1 = $("<td></td>").text(status.stu_name);
// 							var cell2 = $("<td></td>").text(status.stu_email);
// 							var cell3 = $("<td></td>").text(status.stu_id);
// 							var cell4 = $("<td></td>").text(status.stu_applytime);
// 							var cell5 = $("<td></td>").text(status.sta_name);
							
									
// 							var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5]);
							
// 							$('#statusTable03>tbody').append(row);
// 		        		})
// 		        	})
// 		        		$('#statusTable04>tbody').empty();
		        	
// 		        	$.getJSON('ShowStatusJSON.do',{'action':'getShowStatus04'},function(datas){
		        		
// 		        		$.each(datas,function(i,status){
// 		        			var cell1 = $("<td></td>").text(status.stu_name);
// 							var cell2 = $("<td></td>").text(status.stu_email);
// 							var cell3 = $("<td></td>").text(status.stu_id);
// 							var cell4 = $("<td></td>").text(status.stu_applytime);
// 							var cell5 = $("<td></td>").text(status.sta_name);
					
									
// 							var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5]);
							
// 							$('#statusTable04>tbody').append(row);
// 		        		})
// 		        	})
// 		        	$('#statusTable05>tbody').empty();
		        	
// 		        	$.getJSON('ShowStatusJSON.do',{'action':'getShowStatus05'},function(datas){
		        		
// 		        		$.each(datas,function(i,status){
// 		        			var cell1 = $("<td></td>").text(status.stu_name);
// 							var cell2 = $("<td></td>").text(status.stu_email);
// 							var cell3 = $("<td></td>").text(status.stu_id);
// 							var cell4 = $("<td></td>").text(status.stu_applytime);
// 							var cell5 = $("<td></td>").text(status.sta_name);
					
									
// 							var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5]);
							
// 							$('#statusTable05>tbody').append(row);
// 		        		})
// 		        	})	  
		        })
		</script>
</body>
</html>