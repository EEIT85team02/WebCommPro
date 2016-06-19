<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
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
<link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" >
<link href="../css/bootstrap/bootstrap-theme.min.css" rel="stylesheet">
<script src="../js/jquery-1.12.3.min.js"></script>
<script src="../js/bootstrap/bootstrap.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.0-rc.2/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">

<meta charset="UTF-8">
<meta name="description" content="">
<meta name="author" content="">
<style>
.navbar-inverse {
    background-image: linear-gradient(to bottom,#E4C00D 0,rgba(249, 68, 27, 0.97) 100%);
}
.Main_Content {
	margin-top: 100px;
}

#ok {
	color: blue;
}



Toggle {
	color: green;
}

/* label, input { */
/* 	display: block; */
/* } */

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

	<table id="studentTable" class="table table-bordered">
		<tbody>

		</tbody>
	</table>



	<div class="container-fluid">
		<div class="Main_Content">
			<div class="row">
				<div class="col-xs-10 col-xs-offset-1">
					<p id="ptitle">主考官請假查詢</p>
					<hr>
					<table id="StuTable" class="display" cellspacing="0" width="100%">
						<thead>

							<tr>
								<th class="col-md-2 col-xs-2">員工代號</th>
								<th class="col-md-2 col-xs-2">員工請假單單號</th>
								<th class="col-md-2 col-xs-2">請假開始日期</th>
								<th class="col-md-2 col-xs-2">請假結束日期</th>
								<th class="col-md-2 col-xs-2">請假天數</th>
								<th class="col-md-2 col-xs-2">代理人</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						<tfoot>
							<tr>
								<th>員工代號</th>
								<th>員工請假單單號</th>
								<th>請假開始日期</th>
								<th>請假結束日期</th>
								<th>請假天數</th>
								<th>代理人</th>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- <script> -->
<%-- <%session.setAttribute("emp_id","7004");%> --%>
<!-- </script> -->

<script>


var emp_id= <%=session.getAttribute("emp_id")%>;
console.log(emp_id);
$(function() {
	//定義table資料來源json，與畫面顯示------>開始

	table = $('#StuTable')
			.DataTable(
					{

						"ajax" : {

							"url" : "/projectmain/Examiner_offday/showExaminerOffDay_controller.do?emp_id="+emp_id


						},

						"oLanguage" : {
							"sProcessing" : "資料正處理中...",
							"sLengthMenu" : "顯示 _MENU_ 筆記錄",
							"sZeroRecords" : "無符合資料",
							"sInfo" : "目前記錄：_START_ 至 _END_, 總筆數：_TOTAL_",
							"sInfoEmpty" : "顯示第 0 至 0 項結果，共 0 項",
							"sInfoFiltered" : "(從 _MAX_ 項結果過濾)",
							"sSearch" : "搜索:",
							"oPaginate" : {
								"sFirst" : "首頁",
								"sPrevious" : "上頁",
								"sNext" : "下頁",
								"sLast" : "尾頁"
							}
						},
						"bJQueryUI" : true,
						"bProcessing" : true,
						"sPaginationType" : "full_numbers",

					});

})

						
</script>
</body>
</html>
