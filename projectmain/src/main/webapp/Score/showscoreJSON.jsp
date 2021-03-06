<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考生成績查詢</title>
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
					       					   	 		{image : '../img/background.jpg', title : 'Image Credit: Maria Kazvan', thumb : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/kazvan-1.jpg'},
														{image : '../img/background2.jpg', title : 'Image Credit: Maria Kazvan', thumb : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/kazvan-2.jpg'},  
														{image : '../img/background3.jpg', title : 'Image Credit: Maria Kazvan', thumb : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/kazvan-3.jpg'},
														{image : '../img/background3.jpg', title : 'Image Credit: Colin Wojno', thumb : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/wojno-1.jpg'},
														{image : '../img/background4.jpg', title : 'Image Credit: Colin Wojno', thumb : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/wojno-2.jpg'},
														{image : '../img/background5.jpg', title : 'Image Credit: Colin Wojno', thumb : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/wojno-3.jpg'},
														{image : '../img/background6.jpg', title : 'Image Credit: Colin Wojno', thumb : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/wojno-3.jpg'}
												],
												
					// Theme Options			   
					progress_bar			:	1,			// Timer for each slide							
					mouse_scrub				:	0
					
				});
		    });
		    
		</script>
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap-theme.min.css" rel="stylesheet">
<%-- <link href="${pageContext.request.contextPath}/css/jquery-ui.css" rel="stylesheet"> --%>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.0-rc.2/themes/smoothness/jquery-ui.css">
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
.my-error-class {
    color:#DF0101;
}
.my-valid-class {
    color:#0101DF;
}

#ptitle{
	text-align:center;
	font-size:50px;
	font-weight: bold;
	font-family:"Microsoft JhengHei";
	color:#008888;
}
body {
    font-family: "Microsoft JhengHei","Lato","Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 20px;
    line-height: 1.42857143;
    color: #4d6384;
    background-color: #ffffff;
    font-weight: bold;
}
</style>
</head>
<body>
<jsp:include page="/top/ExamierTop.jsp" />
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
  <div class="modal-dialog">
  <form method="post" action="upscoreJSON.do" name="upup">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="exampleModalLabel">我的....</h4>
      </div>
      <div class="modal-body">  
         <div class="form-group">
            <label for="recipient-name" class="control-label">班別:</label>
            <input type="text" class="form-control" id="ustu_id" name="stu_id"  readOnly style="background-color:#DDDDDD">
          </div>
           <div class="form-group">
            <label for="recipient-name" class="control-label">姓名:</label>
            <input type="text" class="form-control" id="ustu_name" name="stu_name"  readOnly style="background-color:#DDDDDD">
          </div>
          <div class="form-group">
            <label for="recipient-name" class="control-label">上機成績:</label>
            <input type="text" class="form-control" id="ustu_implement" name="stu_implement" required>
            <label for="stu_implement" class="error"></label>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="control-label">面試成績:</label>
            <input type="text" class="form-control" id="ustu_interview" name="stu_interview" required>
            <label for="stu_interview" class="error"></label>   
          </div>     
      </div>
      <div class="modal-footer">
        <button type="button" class="btn-danger" data-dismiss="modal">取消</button>
        <button type="button" class="btn-success" >送出</button>
        <input type="hidden" name="action"	value="upscore">
        <input type="hidden" id="stu_grouphid" name="stu_group" >
        <input type="hidden" id="stu_note1hid" name="stu_note1" >
        <input type="hidden" id="stu_agehid" name="stu_age" >
        <input type="hidden" id="stu_schhid" name="stu_sch" >
        <input type="hidden" id="stu_sexhid" name="stu_sex" >
        <input type="hidden" id="stu_emailhid" name="stu_email" >
        <input type="hidden" id="stu_prehid" name="stu_pre" >
        <input type="hidden" id="stu_testtimehid" name="stu_testtime" >
        <input type="hidden" id="stu_totalhid" name="stu_total" >
        <input type="hidden" id="stu_workdatehid" name="stu_workdate" >
        <input type="hidden" id="stu_excepthid" name="stu_except" >
        <input type="hidden" id="stu_seatnohid" name="stu_seatno" >
        <input type="hidden" id="stu_finalhid" name="stu_final" >
        <input type="hidden" id="stu_note2hid" name="stu_note2" >
        <input type="hidden" id="class_idhid" name="class_id" >
        <input type="hidden" id="pub_keyhid" name="pub_key" >
        <input type="hidden" id="pri_keyhid" name="pri_key" >
        <input type="hidden" id="cipher_texthid" name="cipher_text" >
        <input type="hidden" id="log_pwhid" name="log_pw" >
      </div>
    </div>
    </form>
  </div>
</div>
<div class="Main_Content">
<div class="col-xs-10 col-xs-offset-1">
<p id="ptitle">考生成績查詢</p>

<!--                    <input type="button" value="成績" id="buttonJSON" -->
<!-- 						class="btn btn-danger"> -->
                     <table id="scoreTable" class="display" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th>班別</th>
								<th>姓名</th>
		                        <th>上機成績</th>
		                        <th>面試成績</th>
								<th>修改</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
</div>
</div>
	    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery-migrate-1.2.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/additional-methods.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/messages_zh_TW.min.js"></script>
        <script src="${pageContext.request.contextPath}/DataTables/DataTables-1.10.11/js/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/lobibox.min.js"></script>
		<script>
				$(function() {
					//定義table資料來源json，與畫面顯示------>開始
					$('#scoreTable').DataTable( {
						 	"ajax": {
					            "url": "upscoreJSON.do?action=getAllScore",
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
                       
//  						$('#scoreTable>tbody').empty();   

//   						$.getJSON("upscoreJSON.do", {"action":"getAllScore"}, function(datas){												
						
// 							$.each(datas, function(i, score) {

// 								var cell1 = $("<td></td>").text(score.stu_id);
// 								var cell2 = $("<td></td>").text(score.stu_name);
// 								var cell3 = $("<td></td>").text(score.stu_implement);
// 								var cell4 = $("<td></td>").text(score.stu_interview);
// 								var cell5 = $("<td></td>").html("<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo' value="+score.stu_id+" >修改</button>");
// //								console.log(score.stu_testtime)
// 								var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5]);
                                   
// 								$('#scoreTable>tbody').append(row);
								
// 							});
		
// 						});
						
					
				})
					 $(document).on("click",".btn-info",function(){  //點擊修改按鈕
						 updateID = $(this).val(); //拿出button的value的ID去資料庫找資料
					     updateStu_id = $(this).parents("tr").find('td:eq(0)'); //找出各個欄位資料
					     updateStu_name = $(this).parents("tr").find('td:eq(1)');
					     updateStu_implement = $(this).parents("tr").find('td:eq(2)');
					     updateStu_interview = $(this).parents("tr").find('td:eq(3)');
					     console.log(updateID)
						 $.getJSON("upscoreJSON.do",{"action":"getPkId",'stu_id':updateID},function(datas){
//							 console.log(datas)
							 $.each(datas,function(i,score){
//								 console.log(score.stu_id)
								 $("#ustu_id").val(score.stu_id); //設定修改表單中各個欄位的值
								 $("#ustu_name").val(score.stu_name);
								 $("#ustu_implement").val(score.stu_implement);
								 $("#ustu_interview").val(score.stu_interview);
//								 console.log($("#ustu_id").val(score.stu_id))
								 $("#stu_grouphid").val(score.stu_group); //取出值並放入hidden的value進行修改
								 $("#stu_note1hid").val(score.stu_note1);
								 $("#stu_agehid").val(score.stu_age);
								 $("#stu_schhid").val(score.stu_sch);
								 $("#stu_sexhid").val(score.stu_sex);
								 $("#stu_emailhid").val(score.stu_email);
								 $("#stu_prehid").val(score.stu_pre);
								 $("#stu_testtimehid").val(score.stu_testtime);
								 $("#stu_totalhid").val(score.stu_total);
								 $("#stu_workdatehid").val(score.stu_workdate);
								 $("#stu_excepthid").val(score.stu_except);
								 $("#stu_seatnohid").val(score.stu_seatno);
								 $("#stu_finalhid").val(score.stu_final);
								 $("#stu_note2hid").val(score.stu_note2);
 								 $("#class_idhid").val(score.class_id);
 								 $("#pub_keyhid").val(score.pub_key);
 								 $("#pri_keyhid").val(score.pri_key);
 								 $("#cipher_texthid").val(score.cipher_text);
 								 $("#log_pwhid").val(score.log_pw);
// 								 console.log(score.class_id);
							 })
						 })
					 })
					 
					 $('.btn-success').click(function(){  //修改後送出按鈕		
						
						 var Updatedatas = $('form[name="upup"]').serialize();
				 			$.get('upscoreJSON.do',Updatedatas,function(data){
				 				if(data=="資料更新成功"){
				 				updateStu_implement.text($("#ustu_implement").val()); //將各個欄位的值插入表格中
				 				updateStu_interview.text($("#ustu_interview").val());
				 				$('#exampleModal').modal('hide');
				 				Lobibox.alert("success", //AVAILABLE TYPES: "error", "info", "success", "warning"
			 			    			{
			 			    			msg: "資料更新成功"
			 			    			});
				 				}else if(data=="資料更新失敗"){
				 					Lobibox.alert("error", //AVAILABLE TYPES: "error", "info", "success", "warning"
				 			    			{
				 			    			msg: "資料更新失敗"
				 			    			});
				 			     
				 				}
					            
					 })

                  })
                           $(".close").click(function() {  //點擊右上XX按鈕將錯誤訊息重置
                            	validator.resetForm();
                                   });
                            $(".btn-danger").click(function() {  //點擊取消按鈕將錯誤訊息重置
                            	validator.resetForm();
                                   });

                     var validator = $('form[name="upup"]').validate({
			        	errorClass: "my-error-class", //錯誤數值顏色
			        	validClass: "my-valid-class", //正確數值顏色
						rules:{
						stu_implement:{               //驗證欄
							           required:true,
							           number:true,
							           min:0,
							           max:100
								},
					    stu_interview:{               //驗證欄
					    	           required:true,
					    	           number:true,
					    	           min:0,
					    	           max:100
					    	           }
			                    },

					})	

		</script>
    
</body>
</html>
