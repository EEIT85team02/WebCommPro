<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
<title>權限設定資料</title>
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
															{image : '../img/background6.jpg', title : 'Image Credit: Colin Wojno', thumb : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/wojno-3.jpg'}
												],
												
					// Theme Options			   
					progress_bar			:	1,			// Timer for each slide							
					mouse_scrub				:	0
					
				});
		    });
		    
		</script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.0-rc.2/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
<link href="../css/lobibox.min.css" rel="stylesheet">
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="author" content="">

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
	<!-- 引入top.jsp標頭檔 巡覽列部分-->
	<jsp:include page="/top/top.jsp" />
	<!-------------中間內容畫面開始------------>
	<!-- 固定巡覽列位置，建立div使區塊下移 (starter-template)-->
	<div class="container-fluid">
		<div class="Main_Content">
			<div class="row">
				<div class="col-xs-10 col-xs-offset-1">
				<p id="ptitle">權限設定資料</p>
				<hr>
					<table id="Sign_listTable" class="display" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="col-md-3 col-xs-3">權限代號</th>
								<th class="col-md-9 col-xs-9">權限名稱</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						<tfoot>
							<tr>
								<th>權限代號</th>
								<th>權限名稱</th>
							</tr>
						</tfoot>
					</table>

					<!------------------點選新增權限設定表單區塊內容----------------------------- -->
					<button id="buttonAdd" class="ui-button ui-corner-all ui-widget">新增</button>
					<button id="buttonUpdate" class="ui-button ui-corner-all ui-widget">編輯</button>
					<button id="buttonDelete" class="ui-button ui-corner-all ui-widget">刪除</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 設定新增FORM表單區塊dialog -->
	<div id="dialog-insertForm" title="建立權限設定資料">
		<p class="validateTips"></p>
		<form name="SlInsertForm">
			<fieldset>
				<label for="sl_id">權限代號</label> 
				<input type="text" name="sl_id" id="sl_id" class="text ui-widget-content ui-corner-all" placeholder="請輸入權限代號">
				<label for="sl_name">權限名稱</label> 
				<input type="text" name="sl_name" id="sl_name" class="text ui-widget-content ui-corner-all" placeholder="請輸入權限名稱" autocomplete="off"> 
				<input type="hidden" name="action" value="addSl">
				<input type="submit" tabindex="-1" style="position: absolute; top: -1000px">
			</fieldset>
		</form>
	</div>
	<!-- 設定修改FORM表單區塊dialog -->
	<div id="dialog-updateForm" title="修改權限設定資料">
		<p class="validateTips"></p>
		<form name="SlUpdateForm" action="updateSl">
			<fieldset>
				<label for="sl_id">權限代號</label> 
				<input type="text" name="sl_id" id="usl_id" readOnly style="background-color:#DDDDDD" class="text ui-widget-content ui-corner-all">
				<label for="sl_name">權限名稱</label> 
				<input type="text" name="sl_name" id="usl_name" class="text ui-widget-content ui-corner-all" autocomplete="off"> 
				<input type="hidden" name="action" value="updateSl">
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
			var table = $('#Sign_listTable').DataTable( {
				 	"ajax": {
			            "url": "Sign_listToJSONInitTableServlet",
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
			var form,SlInsertForm,SlUpdateForm,
			 	sl_id = $( "#sl_id" ),
		      	sl_name = $( "#sl_name" ),
			
				usl_id = $('#usl_id'),
			  	usl_name = $('#usl_name'),
				
				deleteOrUpdateValue = null;//檢查是否有選取資料行
				
		      	allFields = $( [] ).add( sl_id ).add( sl_name );
		      	uallFields = $( [] ).add( usl_id ).add( usl_name );
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
			  //點選新增鍵，所執行的方法
			    function insertSlFormToCreateTable() {
			      var valid = true;
			      allFields.removeClass( "ui-state-error" );
			      valid = valid && checkLength( sl_id, "代號", 1, 2 );
				  valid = valid && checkLength( sl_name, "名稱", 1, 20 );
				  valid = valid && checkRegexp( sl_id, /^([0-9])$/, "代號欄位只允許輸入數字 : 0-9" );
			 		if ( valid ) {
			 			var Insertdatas = $('form[name="SlInsertForm"]').serialize();
			 			$.post('Sign_listServletJSON.do',Insertdatas,function(data){
			 				console.log(data);
			 				if(data=="資料新增失敗"){
			 					$('.validateTips').css('color','red').text("新增錯誤");
			 				}
			 				else if(data=="資料新增成功"){
			 					table.ajax.reload();//重新載入data tables的資料
			 					allFields.val("");//將新增form表單內容清空
						 		$('.validateTips').text("");////將新增form表單驗證區塊內容清空
						 		deleteOrUpdateValue = null;
				 				SlInsertForm.dialog( "close" );//將新增form表單關閉
				 				//取回資料庫資料並建立table內容結束
			 				}
			 			});
			 		}
			      return valid;
			    }
			  //設定表單寬度視窗資料開始
			    SlInsertForm = $( "#dialog-insertForm" ).dialog({
			      autoOpen: false,
			      height: 500,
			      width: 500,
			      modal: true,
			      open: function() {
			          $('.ui-widget-overlay').addClass('custom-overlay');
			      },
			      close: function() {
			          $('.ui-widget-overlay').removeClass('custom-overlay');
			      },
			      buttons: {
			        "送出": insertSlFormToCreateTable,
			        "取消": function() {
			        	SlInsertForm.dialog( "close" );
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
			  	form = SlInsertForm.find( "form" ).on( "submit", function( event ) {
			      event.preventDefault();
			      insertSlFormToCreateTable();
			    });
			 	//綁定click事件使用者新增icon，開啟dialog 表單EduInsertForm
			    $( "#buttonAdd" ).button().on( "click", function() {
			    	SlInsertForm.dialog( "open" );
			    });//diolog程式部分結束
			
			
			
			    
			    
			    
				//點選要刪除或編輯的那行，按刪除或編輯鍵即可，先將選擇的[行]資料儲存
				$('#Sign_listTable tbody').on( 'click', 'tr', function () {
					deleteOrUpdateValue = $(this).find('td:eq(0)').text(); 
					sl_idUpdateValue = $(this).find('td:eq(0)'); 
					sl_nameUpdateValue = $(this).find('td:eq(1)');
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
				SlUpdateForm = $( "#dialog-updateForm" ).dialog({
			      autoOpen: false,
			      height: 650,
			      width: 500,
			      modal: true,
			      open: function() {
			          $('.ui-widget-overlay').addClass('custom-overlay');
			      },
			      close: function() {
			          $('.ui-widget-overlay').removeClass('custom-overlay');
			      },
			      buttons: {
				        "送出": updateSlFormToCreateTable,
				        "取消": function() {
				        	SlUpdateForm.dialog( "close" );
				        }
				      },
			      close: function() {
			        form[ 0 ].reset();
			        uallFields.removeClass( "ui-state-error" );
			      }
			    });
			    
			  	//設定表單寬度視窗資料結束
			  	form = SlUpdateForm.find( "form" ).on( "submit", function( event ) {
			      event.preventDefault();
			      updateSlFormToCreateTable();
			    });

			  //綁定click事件使用者編輯icon，開啟dialog 表單SlUpdateForm
			 	$('#buttonUpdate').click( function () {
			    	if(deleteOrUpdateValue==null){
			    		console.log(deleteOrUpdateValue);
// 			    		alert("請先選取要編輯的資料");
			   Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
	 			    			{
	 			    			msg: "請先選取要編輯的資料"
	 			    			});
			    	}else{
			    		usl_id.val(sl_idUpdateValue.text());
		    			usl_name.val(sl_nameUpdateValue.text());
		    			SlUpdateForm.dialog( "open" );
			    	}
			    } );
			    //點選修改鍵，所執行的方法
			    function updateSlFormToCreateTable() {
				      var valid = true;
				      uallFields.removeClass( "ui-state-error" );
				      valid = valid && checkLength( usl_id, "代號", 1, 2 );
					  valid = valid && checkLength( usl_name, "名稱", 1, 20 );
					  valid = valid && checkRegexp( usl_id, /^([0-9])$/, "代號欄位只允許輸入數字 : 0-9" );
				 		if ( valid ) {
				 			var Updatedatas = $('form[name="SlUpdateForm"]').serialize();
				 			$.get('Sign_listServletJSON.do',Updatedatas,function(data){
				 				if(data=="資料更新失敗"){
				 					 $('.validateTips').css('color','red').text("更新錯誤");
				 				}
				 				else if(data=="資料更新成功"){
				 					
				 					sl_idUpdateValue.text(usl_id.val());
				 					sl_nameUpdateValue.text(usl_name.val());
				 					
							 		$('.validateTips').text("");////將更新form表單驗證區塊內容清空
					 				SlUpdateForm.dialog( "close" );
				 				}
				 			});
				 		}
				      return valid;
				    }
			  	
			    
    			//diolog程式部分以下(刪除)
				//設定刪除確認表單寬度視窗資料開始
			    SlDeleteConfirm =$( "#dialog-deleteForm" ).dialog({
			        autoOpen: false,
			        height: 330,
			        width: 440,
			        modal: true,
			        open: function() {
				          $('.ui-widget-overlay').addClass('custom-overlay');
				      },
				      close: function() {
				          $('.ui-widget-overlay').removeClass('custom-overlay');
				      },
			        buttons: {
			          "確認": deleteSlFormToCreateTable ,
			          "返回": function() {
			            $( this ).dialog( "close" );
			            $('#dialog-deleteForm p').text('是否要刪除此筆資料?');
			          }
			        }
			    });
			 	
			    //點選刪除鍵，所執行的方法
				function deleteSlFormToCreateTable(){
				$.get('Sign_listServletJSON.do',{"sl_id":deleteOrUpdateValue,"action":"deleteSl"},function(data){
					if(data=="資料刪除成功"){
						console.log(deleteOrUpdateValue);
						console.log(data);
						table.row('.selected').remove().draw( false );//刪除畫面上class為selected的那行
						deleteOrUpdateValue = null;
						SlDeleteConfirm.dialog( "close" );
					}else if (data=="資料刪除失敗"){
						$('#dialog-deleteForm p').text('資料刪除失敗，資料使用中');
					}
				});
				
		    	}
			   
		
			 
			    $('#buttonDelete').click( function () {
			    	
			    	if(deleteOrUpdateValue==null){
// 			    		alert("請先選取要刪除的資料");
			     Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
		 			    			{
		 			    			msg: "請先選取要刪除的資料"
		 			    			});
			    	}else{
			    		SlDeleteConfirm.dialog( "open" );
			    	}
			    } );
			    
			    
	} );//load函數結束
	</script>
</body>
</html>






