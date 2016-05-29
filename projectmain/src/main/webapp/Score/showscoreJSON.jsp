<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成績出來囉</title>
<link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet">
<link href="../css/bootstrap/bootstrap-theme.min.css" rel="stylesheet">
<link href="../css/jquery-ui.css" rel="stylesheet">

</head>
<body>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
            <input type="text" class="form-control" id="ustu_id" name="stu_id"  readonly="readonly">
          </div>
           <div class="form-group">
            <label for="recipient-name" class="control-label">姓名:</label>
            <input type="text" class="form-control" id="ustu_name" name="stu_name"  readonly="readonly">
          </div>
          <div class="form-group">
            <label for="recipient-name" class="control-label">上機成績:</label>
            <input type="text" class="form-control" id="ustu_implement" name="stu_implement">
          </div>
          <div class="form-group">
            <label for="recipient-name" class="control-label">面試成績:</label>
            <input type="text" class="form-control" id="ustu_interview" name="stu_interview">
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="default" data-dismiss="modal">取消</button>
        <input type="submit" class="primary" value="送出">
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
        <input type="hidden" id="log_pwhid" name="log_pw" >
        <input type="hidden" id="class_idhid" name="class_id" >
      </div>
    </div>
    </form>
  </div>
</div>
                   <input type="button" value="成績" id="buttonJSON"
						class="btn btn-danger">
                     <table id="scoreTable" class="table table-bordered">
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
	    <script src="../js/jquery.min.js"></script>
		<script src="../js/bootstrap/bootstrap.min.js"></script>
		<script src="../js/jquery.js"></script>
        <script src="../js/jquery-ui.js"></script>
		<script>
				$(function() {
			
					$('#buttonJSON').click(function() {  //查詢全部成績
						$('#scoreTable>tbody').empty();
						console.log("cc")
						$.getJSON('upscoreJSON.do',{'action':'getAllScore'},function(datas){
						console.log("aa")
							$.each(datas, function(i, score) {
						console.log("bb")
								var cell1 = $("<td></td>").text(score.stu_id);
								var cell2 = $("<td></td>").text(score.stu_name);
								var cell3 = $("<td></td>").text(score.stu_implement);
								var cell4 = $("<td></td>").text(score.stu_interview);
								var cell5 = $("<td></td>").html("<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo' value="+score.stu_id+" >修改</button>");
								
								var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5]);

								$('#scoreTable>tbody').append(row);
								
							});
		
						});
						
					});
				    
					 $(document).on("click",".btn-primary",function(){  //點擊修改按鈕
						 updateID = $(this).val(); //拿出ID去資料庫找資料
					     updateStu_id = $(this).parents("tr").find('td:eq(0)'); //找出各個欄位資料
					     updateStu_name = $(this).parents("tr").find('td:eq(1)');
					     updateStu_implement = $(this).parents("tr").find('td:eq(2)');
					     updateStu_interview = $(this).parents("tr").find('td:eq(3)');
//					     console.log(updateID)
						 $.getJSON("upscoreJSON.do",{"action":"getPkId",'stu_id':updateID},function(datas){
							 $.each(datas,function(i,score){
//								 console.log(score.stu_except)
								 $("#ustu_id").val(score.stu_id); //設定修改表單中各個欄位的值
								 $("#ustu_name").val(score.stu_name);
								 $("#ustu_implement").val(score.stu_implement);
								 $("#ustu_interview").val(score.stu_interview);
// 								 console.log($("#ustu_id").val(score.stu_id))
								 $("#stu_grouphid").attr("value",score.stu_group); //取出值並放入hidden的value進行修改
								 $("#stu_note1hid").attr("value",score.stu_note1);
								 $("#stu_agehid").attr("value",score.stu_age);
								 $("#stu_schhid").attr("value",score.stu_sch);
								 $("#stu_sexhid").attr("value",score.stu_sex);
								 $("#stu_emailhid").attr("value",score.stu_email);
								 $("#stu_prehid").attr("value",score.stu_pre);
								 $("#stu_testtimehid").attr("value",score.stu_testtime);
								 $("#stu_totalhid").attr("value",score.stu_total);
								 $("#stu_workdatehid").attr("value",score.stu_workdate);
								 $("#stu_excepthid").attr("value",score.stu_except);
								 $("#stu_seatnohid").attr("value",score.stu_seatno);
								 $("#stu_finalhid").attr("value",score.stu_final);
								 $("#stu_note2hid").attr("value",score.stu_note2);
								 $("#log_pwhid").attr("value",score.log_pw);
								 $("#class_idhid").attr("value",score.class_id);
							 })
						 })
					 })
					 
					 $('.primary').click(function(){  //修改後送出按鈕      
				 				updateStu_implement.text($("#ustu_implement").val()); //將各個欄位的值插入表格中
				 				updateStu_interview.text($("#ustu_interview").val());
 //				 				console.log($("#ustu_interview").val())
					            
					 })
					 
				});	
					
		</script>
    
</body>
</html>