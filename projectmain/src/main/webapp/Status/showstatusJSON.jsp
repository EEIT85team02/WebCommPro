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
<style>
.my-error-class {
    color:#DF0101;
}
.my-valid-class {
    color:#2E2EFE;
}
</style>
</head>
<body>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
  <form method="post" action="ShowStatusJSON.do" name="upup">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="exampleModalLabel">我的....</h4>
      </div>
      <div class="modal-body">  
         <div class="form-group">
            <label for="recipient-name" class="control-label">姓名:</label>
            <input type="text" class="form-control" id="ustu_name" name="stu_name"  readonly="readonly">
          </div>
           <div class="form-group">
            <label for="recipient-name" class="control-label">E-mail:</label>
            <input type="text" class="form-control" id="ustu_email" name="stu_email"  readonly="readonly">
          </div>
          <div class="form-group">
            <label for="recipient-name" class="control-label">班別:</label>
            <input type="text" class="form-control" id="ustu_id" name="stu_id"  readonly="readonly">
          </div>
          <div class="form-group">
            <label for="recipient-name" class="control-label">預約日期:</label>
            <input type="text" class="form-control" id="ustu_applytime" name="stu_applytime"  readonly="readonly">
          </div>     
          <div class="form-group">
            <label for="recipient-name" class="control-label">狀態:</label>
            <input type="text" class="form-control" id="usta_name" name="sta_name" required>
            <label for="sta_name" class="error"></label>   
          </div>     
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
        <button type="submit" class="btn btn-primary" >送出</button>
        <input type="hidden" name="action"	value="upstatus">
<!--         <input type="hidden" id="stu_grouphid" name="stu_group" > -->
<!--         <input type="hidden" id="stu_note1hid" name="stu_note1" > -->
<!--         <input type="hidden" id="stu_agehid" name="stu_age" > -->
<!--         <input type="hidden" id="stu_schhid" name="stu_sch" > -->
<!--         <input type="hidden" id="stu_sexhid" name="stu_sex" > -->
<!--         <input type="hidden" id="stu_emailhid" name="stu_email" > -->
<!--         <input type="hidden" id="stu_prehid" name="stu_pre" > -->
<!--         <input type="hidden" id="stu_testtimehid" name="stu_testtime" > -->
<!--         <input type="hidden" id="stu_totalhid" name="stu_total" > -->
<!--         <input type="hidden" id="stu_workdatehid" name="stu_workdate" > -->
<!--         <input type="hidden" id="stu_excepthid" name="stu_except" > -->
<!--         <input type="hidden" id="stu_seatnohid" name="stu_seatno" > -->
<!--         <input type="hidden" id="stu_finalhid" name="stu_final" > -->
<!--         <input type="hidden" id="stu_note2hid" name="stu_note2" > -->
<!--         <input type="hidden" id="log_pwhid" name="log_pw" > -->
<!--         <input type="hidden" id="class_idhid" name="class_id" > -->
      </div>
    </div>
    </form>
  </div>
</div>
        <div class="bs-example bs-example-tabs" role="tabpanel">
      <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#WAIT" id="WAIT-tab" role="tab" data-toggle="tab" aria-controls="WAIT" aria-expanded="true">核准中</a></li>
        <li role="presentation"><a href="#OK" role="tab" id="OK-tab" data-toggle="tab" aria-controls="OK">已核准</a></li>
        <li role="presentation"><a href="#NO" id="NO-tab" role="tab" data-toggle="tab" aria-controls="NO">未核准</a></li>
        <li role="presentation"><a href="#NEVER" role="tab" id="NEVER-tab" data-toggle="tab" aria-controls="NEVER">未報名</a></li>
        <li role="presentation"><a href="#YES" role="tab" id="YES-tab" data-toggle="tab" aria-controls="YES">已報名</a></li>
        <li role="presentation"><a href="#WAITING" role="tab" id="WAITING-tab" data-toggle="tab" aria-controls="WAITING">報名中</a></li>
      </ul>
      <div id="myTabContent" class="tab-content">
          <div role="tabpanel" class="tab-pane fade in active" id="WAIT" aria-labelledBy="WAIT-tab">
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
		                        <th>修改</th>
                            </tr>
                         </thead>
                         <tbody>
                         </tbody>
                      </table>
               <p>
           </div>
           <div role="tabpanel" class="tab-pane fade" id="OK" aria-labelledBy="OK-tab">
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
		                        <th>修改</th>
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
                      <table id="statusTable03" class="table table-bordered">
                         <thead>
                            <tr>
                                <th>姓名</th>
		                        <th>E-mail</th>
		                        <th>班別</th>
		                        <th>預約日期</th>
		                        <th>狀態</th>
		                        <th>修改</th>
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
                      <table id="statusTable04" class="table table-bordered">
                         <thead>
                            <tr>
                                <th>姓名</th>
		                        <th>E-mail</th>
		                        <th>班別</th>
		                        <th>預約日期</th>
		                        <th>狀態</th>
		                        <th>修改</th>
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
                      <table id="statusTable05" class="table table-bordered">
                         <thead>
                            <tr>
                                <th>姓名</th>
		                        <th>E-mail</th>
		                        <th>班別</th>
		                        <th>預約日期</th>
		                        <th>狀態</th>
		                        <th>修改</th>
                            </tr>
                         </thead>
                         <tbody>
                         </tbody>
                      </table>
               <p>
           </div>
                <div role="tabpanel" class="tab-pane fade" id="WAITING" aria-labelledBy="WAITING-tab">
              <p>
<!--                       <input type="button" value="狀態" id="buttonJSON" -->
<!--                           class="btn btn-danger"> -->
                      <table id="statusTable06" class="table table-bordered">
                         <thead>
                            <tr>
                                <th>姓名</th>
		                        <th>E-mail</th>
		                        <th>班別</th>
		                        <th>預約日期</th>
		                        <th>狀態</th>
		                        <th>修改</th>
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
		<script>
		        $(function(){
		        	 $(document).on("click",".btn-primary",function(){  //點擊修改按鈕
						 updateID = $(this).val(); //拿出button的value的ID去資料庫找資料
					     updateStu_name = $(this).parents("tr").find('td:eq(0)'); //找出各個欄位資料
					     updateStu_email = $(this).parents("tr").find('td:eq(1)');
					     updateStu_id = $(this).parents("tr").find('td:eq(2)');
					     updateStu_applytime = $(this).parents("tr").find('td:eq(3)');
					     updateSta_name = $(this).parents("tr").find('td:eq(4)');
//					     console.log(updateID)
						 $.getJSON("ShowStatusJSON.do",{"action":"getPkId",'stu_id':updateID},function(datas){
//							 console.log(datas)
							 $.each(datas,function(i,score){
//								 console.log(score.stu_testtime)
								 $("#ustu_name").val(score.stu_name); //設定修改表單中各個欄位的值
								 $("#ustu_email").val(score.stu_email);
								 $("#ustu_id").val(score.stu_id);
								 $("#ustu_applytime").val(score.stu_applytime);
								 $("#usta_name").val(score.sta_name);
//								 console.log($("#ustu_id").val(score.stu_id))
// 								 $("#stu_grouphid").val(score.stu_group); //取出值並放入hidden的value進行修改
// 								 $("#stu_note1hid").val(score.stu_note1);
// 								 $("#stu_agehid").val(score.stu_age);
							 })
						 })
					 })
					 $('.primary').click(function(){  //修改後送出按鈕		

						 var Updatedatas = $('form[name="upup"]').serialize();
					 })
				
// 		          $('#buttonJSON').click(function(){		        	  		          
		        	$('#statusTable01>tbody').empty();
		        	
		        	$.getJSON('ShowStatusJSON.do',{'action':'getShowStatus01'},function(datas){
		        		
		        		$.each(datas,function(i,status){
		        			var cell1 = $("<td></td>").text(status.stu_name);
							var cell2 = $("<td></td>").text(status.stu_email);
							var cell3 = $("<td></td>").text(status.stu_id);
							var cell4 = $("<td></td>").text(status.stu_applytime);
							var cell5 = $("<td></td>").text(status.sta_name);
							var cell6 = $("<td></td>").html("<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo' value="+status.stu_id+" >修改</button>");
									
							var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5,cell6]);
							
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
							var cell6 = $("<td></td>").html("<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo' value="+status.stu_id+" >修改</button>");
									
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
							var cell6 = $("<td></td>").html("<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo' value="+status.stu_id+" >修改</button>");
									
							var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5,cell6]);
							
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
							var cell6 = $("<td></td>").html("<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo' value="+status.stu_id+" >修改</button>");
									
							var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5,cell6]);
							
							$('#statusTable04>tbody').append(row);
		        		})
		        	})
		        		$('#statusTable05>tbody').empty();
		        	
		        	$.getJSON('ShowStatusJSON.do',{'action':'getShowStatus05'},function(datas){
		        		
		        		$.each(datas,function(i,status){
		        			var cell1 = $("<td></td>").text(status.stu_name);
							var cell2 = $("<td></td>").text(status.stu_email);
							var cell3 = $("<td></td>").text(status.stu_id);
							var cell4 = $("<td></td>").text(status.stu_applytime);
							var cell5 = $("<td></td>").text(status.sta_name);
							var cell6 = $("<td></td>").html("<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo' value="+status.stu_id+" >修改</button>");
									
							var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5,cell6]);
							
							$('#statusTable05>tbody').append(row);
		        		})
		        	})
		        		$('#statusTable06>tbody').empty();
		        	
		        	$.getJSON('ShowStatusJSON.do',{'action':'getShowStatus06'},function(datas){
		        		
		        		$.each(datas,function(i,status){
		        			var cell1 = $("<td></td>").text(status.stu_name);
							var cell2 = $("<td></td>").text(status.stu_email);
							var cell3 = $("<td></td>").text(status.stu_id);
							var cell4 = $("<td></td>").text(status.stu_applytime);
							var cell5 = $("<td></td>").text(status.sta_name);
							var cell6 = $("<td></td>").html("<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo' value="+status.stu_id+" >修改</button>");
									
							var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5,cell6]);
							
							$('#statusTable06>tbody').append(row);
		        		})
		        	})
// 		         })
		        })
		</script>
</body>
</html>