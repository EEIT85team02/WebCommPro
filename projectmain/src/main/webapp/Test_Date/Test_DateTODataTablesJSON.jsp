<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">
<html>
<head>
<title>考試日期查詢</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/supersized.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/supersized.shutter.css" type="text/css" media="screen" />

		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
<!-- 		<script type="text/javascript" src="../js/jquery.easing.min.js"></script> -->
		
		<script type="text/javascript" src="../js/supersized.3.2.7.min.js"></script>
		<script type="text/javascript" src="../theme/supersized.shutter.min.js"></script>
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
														{image : '../img/background6.jpg', title : 'Image Credit: Colin Wojno', thumb : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/wojno-3.jpg'},
														
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


input.text{ 
	padding: .4em; 
} 


fieldset{
	padding: 0;
	border: 0;
	margin-top: 25px;
}

h1 {
	font-size: 1.2em;
	margin: .6em 0;
}

 
.ui-dialog, .ui-state-error {
	padding: .3em;
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
	<div class="container-fluid">
		<div class="Main_Content">
			<div class="row">
				<div class="col-md-12">
				<hr>
					<table id="Test_DateTable" class="display" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th>#</th>
								<th class="col-md-2 col-xs-2">班級代號</th>
								<th class="col-md-2 col-xs-2">班級名稱</th>
								<th class="col-md-2 col-xs-2">考試日期</th>
								<th class="col-md-1 col-xs-1">可報/人</th>
								<th class="col-md-1 col-xs-1">已報/人</th>
								<th class="col-md-2 col-xs-2">開始時間</th>
								<th class="col-md-2 col-xs-2">結束時間</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						<tfoot>
							<tr>
								<th>#</th>
								<th>班級代號</th>
								<th>班級名稱</th>
								<th>考試日期</th>
								<th>可報/人</th>
								<th>已報/人</th>
								<th>開始時間</th>
								<th>結束時間</th>
							</tr>
						</tfoot>
					</table>
					<!------------------點選新增教育中心表單區塊內容----------------------------- -->
					<button id="buttonUpdate" class="ui-button ui-corner-all ui-widget">編輯考試日期或人數</button>
					<button id="buttonDelete" class="ui-button ui-corner-all ui-widget">刪除</button>
					<button id="buttonAll" class="ui-button ui-corner-all ui-widget">全部選取</button>
					<button id="buttonRe" class="ui-button ui-corner-all ui-widget">取消全選</button>
					<button id="buttonSel" class="ui-button ui-corner-all ui-widget">選取筆數查詢</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 設定修改FORM表單區塊dialog -->
	<div id="dialog-updateForm" title="修改教育中心資料">
		<p class="allValid"></p>
		<form name="TdUpdateForm" action="updateEdu">
			<fieldset>
				<div class="divForm">
					<label for="test_date_id" class="labelTitle">代號</label> 
					<input type="text" name="test_date_id" size="20" id="utest_date_id" readOnly >
					<br>
				</div>
				 	
				<div class="divForm">
					<label for="class_name" class="labelTitle">班級名稱:</label> 
					<input type="text" name="class_name" size="20" id="uclass_name" readOnly autocomplete="off">
					<br>
				</div>
				 	
				<div class="divForm">
					<label for="test_date" class="labelTitle">考試日期:</label> 
					<input type="date" name="test_date" size="20" id="utest_date" autocomplete="off"> 
					<span id="spanutest_date"></span><br>
				</div>
				 	
				<div class="divForm">
					<label for="test_people" class="labelTitle">報名人數:</label> 
					<input type="number"  min="0" max="5" step="1" name="test_people" size="20" id="utest_people" autocomplete="off">
					<span id="spanutest_people"></span><br>
				</div>
				 	
				<input type="hidden" name="class_id" id="uclass_id">
				<input type="hidden" name="test_hour_id" id="utest_hour_id">
				<input type="hidden" name="exam_people" id="uexam_people">
				
				
				<input type="hidden" name="action" value="updateTd">
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
			var table = $('#Test_DateTable').DataTable( {
				 	"ajax": {
			            "url": "/projectmain/Test_Date/Test_DateToJSONInitTableServlet",
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
			var form,TdUpdateForm
				utest_date_id = $('#utest_date_id'),
				uclass_name = $('#uclass_name'),
				utest_date = $('#utest_date'),
				utest_people = $('#utest_people'),
				uexam_people = $('#uexam_people'),
				uclass_id = $('#uclass_id');
				utest_hour_id = $('#utest_hour_id'),
				
				
				spanutest_date = $('#spanutest_date'),
				spanutest_people = $('#spanutest_people');
				
				var checkutest_date=null;
				var checkutest_people=null;
				
				uallSpan = $( [] ).add( spanutest_date ).add( spanutest_people );
			
				uallFields = $( [] ).add( utest_date_id ).add( uclass_name ).add( utest_date ).add( utest_people ).add( uexam_people );
				allValid =$('.allValid');
				
		   
			 	//點選tr資料，更換class類別,若被選取則更新為未選取，反之選取
				$('#Test_DateTable tbody').on( 'click', 'tr', function () {
					$(this).toggleClass('selected');
				    });
				
			    
			    //diolog程式部分以下(更新)
				//設定表單寬度視窗資料開始
				TdUpdateForm = $( "#dialog-updateForm" ).dialog({
			      autoOpen: false,
			      height: 400,
			      width: 700,
			      modal: true,
			      open: function() {
			          $('.ui-widget-overlay').addClass('custom-overlay');
			      },
			      close: function() {
			          $('.ui-widget-overlay').removeClass('custom-overlay');
			      },
			      buttons: {
				        "send": updateTdFormToCreateTable,
				        Cancel: function() {
				        	TdUpdateForm.dialog( "close" );
				        }
				      },
			      close: function() {
			        form[ 0 ].reset();
			        uallFields.removeClass( "ui-state-error" );
			       	uallFields.val("");//將更新form表單內容清空
					allValid.text("");//將更新form表單驗證區塊內容清空
					uallSpan.text("");//將更新FROM表單的span內容清空
			      
			      }
			    });
			    
			  	//設定表單寬度視窗資料結束
			  	form = TdUpdateForm.find( "form" ).on( "submit", function( event ) {
			      event.preventDefault();
			      updateTdFormToCreateTable();
			    });
				//綁定click事件使用者編輯icon，開啟dialog 表單TdUpdateForm(判斷資料是否多選-僅能選取一筆!!)
				//table.rows('.selected').data().length->指的是，有幾筆列資料，套用得Class為selected
			 	$('#buttonUpdate').click( function () {
			 		if(table.rows('.selected').data().length == 0){
// 			    		alert("請選取一筆要進行編輯的資料");
			 Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
	 			    			{
	 			    			msg: "請選取一筆要進行編輯的資料"
	 			    			});
			    	}else if(table.rows('.selected').data().length > 1){
// 			    		alert("[編輯]功能僅能選取一筆資料。");
			  Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
		 			    			{
		 			    			msg: "[編輯]功能僅能選取一筆資料。"
		 			    			});
			    	}else if(table.rows('.selected').data().length == 1){
			    		ClickUpdateValue = $('tr.selected').find('td:eq(0)').text();//抓到選到的class為selected的教育中心代號
				 		console.log(ClickUpdateValue);
				 		$.getJSON('Test_DateServletJSON.do', {"action":"getoneTd","test_date_id":ClickUpdateValue}, function(datas) {
							console.log(datas);
							//將抓到的教育中心代號，發送request請資料庫傳回該筆資料JSON
							$.each(datas, function(i, Tds) {
								utest_date_id.val(Tds.test_date_id);
								uclass_name.val(Tds.class_name);
								utest_date.val(Tds.test_date);
								utest_people.val(Tds.test_people);
								
								uexam_people.val(Tds.exam_people);
								uclass_id.val(Tds.class_id);
								utest_hour_id.val(Tds.test_hour_id);
							});
						});
				 		TdUpdateForm.dialog( "open" );
			    	}
			 	} );
			    //點選修改鍵，所執行的方法
			    function updateTdFormToCreateTable() {
				      if ( checkUpdateForm()  ) {
				 			var Updatedatas = $('form[name="TdUpdateForm"]').serialize();
				 			//console.log(Updatedatas);
				 			$.get('Test_DateServletJSON.do',Updatedatas,function(data){
				 				console.log(data);
				 				if(data=="資料更新失敗"){
				 					allValid.css('color','red').text("更新錯誤");
				 				}
				 				else if(data=="資料更新成功"){
				 					table.ajax.reload();//重新載入data tables的資料 ?? 須改為直接抓取原更新表單的值回填回去表格
				 					TdUpdateForm.dialog( "close" );
				 				}
				 			});
				 		}
				 	  sel=[];
				    }
			  	//diolog程式部分以下(刪除)
				//設定刪除確認表單寬度視窗資料開始
			   TdDeleteConfirm =$( "#dialog-deleteForm" ).dialog({
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
			          "確認": deleteTdFormToCreateTable ,
			          "放棄": function() {
			        	sel=[];
			            $( this ).dialog( "close" );
			            $('#dialog-deleteForm p').text('是否要刪除資料?');
			          }
			        }
			    });
			 	//點選刪除鍵，所執行的方法
				function deleteTdFormToCreateTable(){
			 	$.get('Test_DateServletJSON.do',{"test_date_id":selJSON,"action":"deleteTdMulti"},function(data){
					if(data=="資料刪除成功"){
						//table.row('tbody > tr.selected').remove().draw( false );//刪除畫面上class為selected的那行
						table.ajax.reload();//重新載入data tables的資料 ?? 須改為直接抓取原更新表單的值回填回去表格
						TdDeleteConfirm.dialog( "close" );
					}else if (data=="資料刪除失敗"){
						$('#dialog-deleteForm p').text('資料刪除失敗，資料使用中');
					}
				});
			 	sel=[];
				}
			 	
			 	var sel=[];
				$('#buttonDelete').click( function () {
			    	if(table.rows('.selected').data().length==0){
// 			    		alert("請先選取要刪除的資料");
			   Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
		 			    			{
		 			    			msg: "請先選取要刪除的資料"
		 			    			});
			    	}else if(table.rows('.selected').data().length>=1){
			    		var trSelLength = $('tbody > tr.selected');//tr被SELECT到的長度
// 			    		alert("共選取"+table.rows('.selected').data().length+"筆資料。");
			    Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
		 			    			{
		 			    			msg: "共選取"+table.rows('.selected').data().length+"筆資料。"
		 			    			});
			    		for(var i=0,max=trSelLength.length;i<max;i++){
			    			var	obj = $('tbody > tr.selected:eq('+i+')').find('td:eq(0)').text();
			    			sel.push(obj);//將obj資料加到sel陣列
			    		}
			    		console.log("sel====="+sel);
			    		selJSON =JSON.stringify(sel);//將JSON轉成字串
			    		console.log("selJSON-----"+selJSON);
			    		TdDeleteConfirm.dialog( "open" );
			    	}
			    });
				
				//icon全部選取
				$('#buttonAll').click(function(){
					$('tbody > tr').addClass('selected');
				})
				//icon取消全選
				$('#buttonRe').click(function(){
					$('tbody > tr').removeClass('selected');
				})
				//icon查詢選取筆數
				 $('#buttonSel').click( function () {
// 				        alert( table.rows('.selected').data().length +' 筆資料被選取' );
		Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
	 			    			{
	 			    			msg: table.rows('.selected').data().length +' 筆資料被選取'
	 			    			});
				});
				
				//修改表格欄位判斷
				//ckeckutest_date欄位滑鼠離開後的判斷驗證
				utest_date.blur(fcheckutest_date);
				function fcheckutest_date(){
					checkutest_date=false;
					var utest_dateVal=utest_date.val();
					
					if(utest_dateVal==""){
						spanutest_date.html("<img src='../img/error.png' style='width:16px'/>考試日期不可為空白").css('color','red');
					}else{
						spanutest_date.html("<img src='../img/correct.png' style='width:16px'/>");
						checkutest_date=true;
					}
				}
				
				//ckeckutest_date欄位滑鼠離開後的判斷驗證
				utest_people.blur(fcheckutest_people);
				function fcheckutest_people(){
					checkutest_people=false;
					var utest_peopleVal=utest_people.val();
					var uexam_peopleVal=uexam_people.val();
					if(utest_peopleVal==""){
						spanutest_people.html("<img src='../img/error.png' style='width:16px'/>可報名人數不可為空白").css('color','red');
					}else if(utest_peopleVal < uexam_peopleVal){
						spanutest_people.html("<img src='../img/error.png' style='width:16px'/>考報名人數不可小於已報名人數").css('color','red');
					}else{
						spanutest_people.html("<img src='../img/correct.png' style='width:16px'/>");
						checkutest_people=true;
					}
				}
				
				function checkUpdateForm(){
					fcheckutest_date();
					fcheckutest_people();
					console.log(checkutest_date);
					console.log(checkutest_people);
					if(checkutest_date && checkutest_people){
// 						alert("資料皆正確，送出中");
          Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
	 			    			{
	 			    			msg: "資料皆正確，送出中"
	 			    			});
						return true;
					}
					else {
// 						alert("資料錯誤，請檢查欄位長度格式是否正確");
       Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
	 			    			{
	 			    			msg: "資料錯誤，請檢查欄位長度格式是否正確"
	 			    			});
						return false;
					} 
				}
				
				
				
				
			} );//load函數結束
	</script>
</body>
</html>






