<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>狀態出來了</title>
<link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet">
<link href="../css/bootstrap/bootstrap-theme.min.css" rel="stylesheet">
<link href="../css/jquery-ui.css" rel="stylesheet">

</head>
<body>
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
        <div class="bs-example bs-example-tabs" role="tabpanel">
      <ul class="nav nav-tabs" role="tablist">
        <li role="presentation"><a href="#OK" role="tab" id="OK-tab" data-toggle="tab" aria-controls="OK">已核准</a></li>
        <li role="presentation"><a href="#NO" id="NO-tab" role="tab" data-toggle="tab" aria-controls="NO">未核准</a></li>
        <li role="presentation"><a href="#NEVER" role="tab" id="NEVER-tab" data-toggle="tab" aria-controls="NEVER">未報名</a></li>
        <li role="presentation"><a href="#YES" role="tab" id="YES-tab" data-toggle="tab" aria-controls="YES">已報名</a></li>
      </ul>
      <div id="myTabContent" class="tab-content">
        
           <div role="tabpanel" class="tab-pane fade" id="OK" aria-labelledBy="OK-tab">
              <p>
<!--                       <input type="button" value="狀態" id="buttonJSON" -->
<!--                           class="btn btn-danger"> -->
                      <table id="statusTable01" class="table table-bordered">
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
           <div role="tabpanel" class="tab-pane fade" id="NO" aria-labelledBy="NO-tab">
              <p>
<!--                       <input type="button" value="狀態" id="buttonJSON" -->
<!--                           class="btn btn-danger"> -->
                      <table id="statusTable02" class="table table-bordered">
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
           <div role="tabpanel" class="tab-pane fade" id="NEVER" aria-labelledBy="NEVER-tab">
              <p>
<!--                       <input type="button" value="狀態" id="buttonJSON" -->
<!--                           class="btn btn-danger"> -->
                      <table id="statusTable03" class="table table-bordered">
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
           <div role="tabpanel" class="tab-pane fade" id="YES" aria-labelledBy="YES-tab">
              <p>
<!--                       <input type="button" value="狀態" id="buttonJSON" -->
<!--                           class="btn btn-danger"> -->
                      <table id="statusTable04" class="table table-bordered">
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
 
        <script src="../js/jquery.min.js"></script>
		<script src="../js/bootstrap/bootstrap.min.js"></script>
		<script src="../js/jquery-1.12.4.js"></script>

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
                              var Updatedatas = $('form[name="cancelok"]').serialize();
				 			     $.get('UpStuaddStatusJSON.do',Updatedatas,function(){
				 			    	 
				 			    	$('#statusTable01>tbody').empty();
				 			    	
				 			     $.getJSON('ShowStatusJSON.do',{'action':'getShowStatus01'},function(datas){
						        		
						        $.each(datas,function(i,status){
						        	var cell1 = $("<td></td>").text(status.stu_name);
									var cell2 = $("<td></td>").text(status.stu_email);
									var cell3 = $("<td></td>").text(status.stu_id);
									var cell4 = $("<td></td>").text(status.stu_applytime);
									var cell5 = $("<td></td>").text(status.sta_name);
									var cell6 = $("<td></td>").html("<button type='button' class='btn btn-info' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo' value="+status.stu_id+" >送信</button>");
									var cell7 = $("<td></td>").html("<button type='button' class='btn btn-warning' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo' value="+status.stu_add_id+" >取消核准</button>");
											
									var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5,cell6,cell7]);
											
									$('#statusTable01>tbody').append(row);
						             })
						          })
						     $('#statusTable02>tbody').empty();
		        	
		        	$.getJSON('ShowStatusJSON.do',{'action':'getShowStatus02'},function(datas){
		        		
		        		$.each(datas,function(i,status){
		        			var cell1 = $("<td></td>").text(status.stu_name);
							var cell2 = $("<td></td>").text(status.stu_email);
							var cell3 = $("<td></td>").text(status.stu_id);
							var cell4 = $("<td></td>").text(status.stu_applytime);
							var cell5 = $("<td></td>").text(status.sta_name);
							var cell6 = $("<td></td>").html("<button type='button' class='btn btn-success' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo' value="+status.stu_add_id+" >核准</button>");
									
							var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5,cell6]);
							
							$('#statusTable02>tbody').append(row);
		        		})
		        	})
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
                              var Updatedatas = $('form[name="ok"]').serialize();
				 			     $.get('UpStuaddStatusJSON.do',Updatedatas,function(){
				 			    	 
				 			    	$('#statusTable01>tbody').empty();
				 			    	
				 			     $.getJSON('ShowStatusJSON.do',{'action':'getShowStatus01'},function(datas){
						        		
						        $.each(datas,function(i,status){
						        	var cell1 = $("<td></td>").text(status.stu_name);
									var cell2 = $("<td></td>").text(status.stu_email);
									var cell3 = $("<td></td>").text(status.stu_id);
									var cell4 = $("<td></td>").text(status.stu_applytime);
									var cell5 = $("<td></td>").text(status.sta_name);
									var cell6 = $("<td></td>").html("<button type='button' class='btn btn-info' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo' value="+status.stu_id+" >送信</button>");
									var cell7 = $("<td></td>").html("<button type='button' class='btn btn-warning' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo' value="+status.stu_add_id+" >取消核准</button>");
											
									var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5,cell6,cell7]);
											
									$('#statusTable01>tbody').append(row);
						             })
						          })
						     $('#statusTable02>tbody').empty();
		        	
		        	$.getJSON('ShowStatusJSON.do',{'action':'getShowStatus02'},function(datas){
		        		
		        		$.each(datas,function(i,status){
		        			var cell1 = $("<td></td>").text(status.stu_name);
							var cell2 = $("<td></td>").text(status.stu_email);
							var cell3 = $("<td></td>").text(status.stu_id);
							var cell4 = $("<td></td>").text(status.stu_applytime);
							var cell5 = $("<td></td>").text(status.sta_name);
							var cell6 = $("<td></td>").html("<button type='button' class='btn btn-success' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo' value="+status.stu_add_id+" >核准</button>");
									
							var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5,cell6]);
							
							$('#statusTable02>tbody').append(row);
		        		})
		        	})
				 			    })
							 })
						 })
					 })
				
		        		$('#statusTable01>tbody').empty();
		        	
		        	$.getJSON('ShowStatusJSON.do',{'action':'getShowStatus01'},function(datas){
		        		
		        		$.each(datas,function(i,status){
		        			var cell1 = $("<td></td>").text(status.stu_name);
							var cell2 = $("<td></td>").text(status.stu_email);
							var cell3 = $("<td></td>").text(status.stu_id);
							var cell4 = $("<td></td>").text(status.stu_applytime);
							var cell5 = $("<td></td>").text(status.sta_name);
							var cell6 = $("<td></td>").html("<button type='button' class='btn btn-info' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo' value="+status.stu_id+" >送信</button>");
							var cell7 = $("<td></td>").html("<button type='button' class='btn btn-warning' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo' value="+status.stu_add_id+" >取消核准</button>");
							
							var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5,cell6,cell7]);
							
							$('#statusTable01>tbody').append(row);
		        		})
		        	})
		        		$('#statusTable02>tbody').empty();
		        	
		        	$.getJSON('ShowStatusJSON.do',{'action':'getShowStatus02'},function(datas){
		        		
		        		$.each(datas,function(i,status){
		        			var cell1 = $("<td></td>").text(status.stu_name);
							var cell2 = $("<td></td>").text(status.stu_email);
							var cell3 = $("<td></td>").text(status.stu_id);
							var cell4 = $("<td></td>").text(status.stu_applytime);
							var cell5 = $("<td></td>").text(status.sta_name);
							var cell6 = $("<td></td>").html("<button type='button' class='btn btn-success' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo' value="+status.stu_add_id+" >核准</button>");
									
							var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5,cell6]);
							
							$('#statusTable02>tbody').append(row);
		        		})
		        	})
		        		$('#statusTable03>tbody').empty();
		        	
		        	$.getJSON('ShowStatusJSON.do',{'action':'getShowStatus03'},function(datas){
		        		
		        		$.each(datas,function(i,status){
		        			var cell1 = $("<td></td>").text(status.stu_name);
							var cell2 = $("<td></td>").text(status.stu_email);
							var cell3 = $("<td></td>").text(status.stu_id);
							var cell4 = $("<td></td>").text(status.stu_applytime);
							var cell5 = $("<td></td>").text(status.sta_name);
							
									
							var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5]);
							
							$('#statusTable03>tbody').append(row);
		        		})
		        	})
		        		$('#statusTable04>tbody').empty();
		        	
		        	$.getJSON('ShowStatusJSON.do',{'action':'getShowStatus04'},function(datas){
		        		
		        		$.each(datas,function(i,status){
		        			var cell1 = $("<td></td>").text(status.stu_name);
							var cell2 = $("<td></td>").text(status.stu_email);
							var cell3 = $("<td></td>").text(status.stu_id);
							var cell4 = $("<td></td>").text(status.stu_applytime);
							var cell5 = $("<td></td>").text(status.sta_name);
					
									
							var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5]);
							
							$('#statusTable04>tbody').append(row);
		        		})
		        	})
		        		  
		        })
		</script>
</body>
</html>