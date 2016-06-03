<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student_MaintainForm</title>

<link rel="stylesheet" type="text/css" href="../css/fullCalendar/jquery-ui.css">
<style type="text/css">

.fancy {
	width: 900px;
	height: 600px;
}

.fancy h3 {
	height: 40px;
	line-height: 40px;
	border-bottom: 1px solid #d3d3d3;
	font-size: 16px
}

.fancy form {
	padding: 10px
}

.fancy p {
	height: 28px;
	line-height: 28px;
	padding: 4px;
	color: #999
}

.input {
	height: 20px;
	line-height: 20px;
	padding: 2px;
	border: 1px solid #d3d3d3;
	width: 150px
}

.btn {
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	padding: 5px 12px;
	cursor: pointer
}

.btn_ok {
	background: #360;
	border: 1px solid #390;
	color: #fff
}

.btn_cancel {
	background: #f0f0f0;
	border: 1px solid #d3d3d3;
	color: #666
}

.btn_del {
	background: #f90;
	border: 1px solid #f80;
	color: #fff
}

.sub_btn {
	height: 32px;
	line-height: 32px;
	padding-top: 6px;
	border-top: 1px solid #f0f0f0;
	text-align: right;
	position: relative
}

.sub_btn .del {
	position: absolute;
	left: 2px
}

.div1{
	float:left;
}

.div2{
	float:left;
	padding-left:120px;
}

.div3{
	float:left;
	padding-left:120px;
}

.div4{
	float:left;
	padding-top:50px;
}

.div5{
	float:left;
	padding-left:180px;
	padding-top:50px;
}

.div6{
	float:left;
	padding-left:180px;
	padding-top:50px;
}

.div7{
	float:left;
	width:750px;
	padding-top:50px;
}

.div8{
	float:left;
	width:20px;
	padding-top:50px;
}


</style>
<!-- fancybox -->
	<link rel="stylesheet" type="text/css" href="../css/fancybox/jquery.fancybox.css"> 	
	<script src='../js/fancybox/jquery.fancybox.pack.js'></script> 
<script type="text/javascript" src="../js/fancybox/jquery.form.min.js">
	
	$(document).ready(function(){ 
		
		
	    $(".datepicker").datepicker();//调用日历选择器 
	    $("#isallday").click(function(){//是否是全天事件 
	        if($("#sel_start").css("display")=="none"){ 
	            $("#sel_start,#sel_end").show(); 
	        }else{ 
	            $("#sel_start,#sel_end").hide(); 
	        } 
	    }); 
	     
	    $("#isend").click(function(){//是否有结束时间 
	        if($("#p_endtime").css("display")=="none"){ 
	            $("#p_endtime").show(); 
	        }else{ 
	            $("#p_endtime").hide(); 
	        } 
	        $.fancybox.resize();//调整高度自适应 
	    }); 
	    
	    $("#del_event").click(function(){ 
	        if(confirm("您确定要删除吗？")){ 
	            var eventid = <%=request.getParameter("id")%>; 
	            
	            $.get("AddEditEvent.do?action=del&id="+eventid,function(msg){ 
	               
	                    $.fancybox.close(); 
	                    $('#calendar').fullCalendar('refetchEvents'); 
        }); 
     }     
	});
	    
	
	$(function(){ 
	    //提交表单 
	    $('#add_form').ajaxForm({ 
	        beforeSubmit: showRequest, //表单验证 
	        success: showResponse //成功返回 
	    });  
	}); 
	 
	function showRequest(){ 
	    var events = $("#event").val(); 
	    if(events==''){ 
	        alert("请输入日程内容！"); 
	        $("#event").focus(); 
	        return false; 
	    } 
	} 
	 
	
	
	
	function showResponse(responseText, statusText, xhr, $form){ 
	    if(statusText=="success"){     
	        if(responseText==1){ 
	            $.fancybox.close();//关闭弹出层 
	            $('#calendar').fullCalendar('refetchEvents'); //重新获取所有事件数据 
	        }else{ 
	            alert(responseText); 
	        } 
	    }else{ 
	        alert(statusText); 
	    } 
	} 
	
	});
</script> 

</head>
<body>
	<div class="fancy">
		<h3>考生資料明細</h3>
		<form id="Student_MaintainForm" action="StudentProfileServlet" method="post">
			<input type="hidden" name="action" value="updateStum">
			
			<input type="hidden" class="input" name="stu_id" readOnly
					id="stu_id" value=<%=request.getParameter("stu_id")%>>
			<input type="hidden" class="input" name="stu_name" readOnly
					id="stu_name" value=<%=request.getParameter("stu_name")%>>
			<input type="hidden" class="input" name="class_id" readOnly
					id="class_id" value=<%=request.getParameter("class_id")%>>
			<input type="hidden" class="input" name="stu_email" readOnly
					id="stu_email" value=<%=request.getParameter("stu_email")%>>
			<input type="hidden" class="input" name="stu_group" readOnly
					id="stu_group" value=<%=request.getParameter("stu_group")%>>
			<input type="hidden" class="input" name="stu_seatno" readOnly
					id="stu_seatno" value=<%=request.getParameter("stu_seatno")%>>
			<input type="hidden" class="input" name="stu_age" readOnly
					id="stu_age" value=<%=request.getParameter("stu_age")%>>
			<input type="hidden" class="input" name="stu_sch" readOnly
					id="stu_sch" value=<%=request.getParameter("stu_sch")%>>
			<input type="hidden" class="input" name="stu_sex" readOnly
					id="stu_sex" value=<%=request.getParameter("stu_sex")%>>
			<input type="hidden" class="input" name="test_startdate" readOnly
					id="test_startdate" value=<%=request.getParameter("test_startdate")%>>
			<input type="hidden" class="input" name="stu_applytime" readOnly
					id="stu_applytime" value=<%=request.getParameter("stu_applytime")%>>
			<input type="hidden" class="input" name="sta_id" readOnly
					id="sta_id" value=<%=request.getParameter("sta_id")%>>
			<input type="hidden" class="input" name="emp_id" readOnly
					id="emp_id" value=<%=request.getParameter("emp_id")%>>
			<input type="hidden" class="input" name="confirm_time" readOnly
					id="confirm_time" value=<%=request.getParameter("confirm_time")%>>
			<input type="hidden" class="input" name="stu_pre" readOnly
					id="stu_pre" value=<%=request.getParameter("stu_pre")%>>
			<input type="hidden" class="input" name="log_pw" readOnly
					id="log_pw" value=<%=request.getParameter("log_pw")%>>
					
			<div class="div1">
				<p>考生代號：<%=request.getParameter("stu_id")%></p>
				<p>考生姓名：<%=request.getParameter("stu_name")%></p>
				<p>班級代號：<%=request.getParameter("class_id")%></p>
				<p>考生E-mail：<%=request.getParameter("stu_email")%></p>
				<p>組別：<%=request.getParameter("stu_group")%></p>
			</div>
			<div class="div2">
				<p>座號：<%=request.getParameter("stu_seatno")%></p>
				<p>年次：<%=request.getParameter("stu_age")%></p>
				<p>畢業學校：<%=request.getParameter("stu_sch")%></p>
				<p>性別：<%=request.getParameter("stu_sex")%></p>
				<p>考試時間：<%=request.getParameter("test_startdate")%></p>
			</div>
			<div class="div3">
				<p>預約報名時間：<%=request.getParameter("stu_applytime")%></p>
				<p>狀況代號：<%=request.getParameter("sta_id")%></p>
				<p>主考官：<%=request.getParameter("emp_id")%></p>
				<p>確認時間：<%=request.getParameter("confirm_time")%></p>
				<p>是否已約上機考：<%=request.getParameter("stu_pre")%></p>
			</div>
			
			<div class="div4">
				<label>上機測驗分數：</label>
				<input type="text" class="input" name="stu_implement"
					id="stu_implement" value=<%=request.getParameter("stu_implement")%>>
				<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
				<label>上機測驗時間：</label>
				<input type="text" class="input" name="stu_testtime"
					id="stu_testtime" value=<%=request.getParameter("stu_testtime")%>>
				<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
				<label>Interview分數：</label>
				<input type="text" class="input" name="stu_interview"
					id="stu_interview" value=<%=request.getParameter("stu_interview")%>>
			</div>
				
			<div class="div5">
				<label>總分：</label>
				<input type="text" class="input" name="stu_total"
					id="stu_total" value=<%=request.getParameter("stu_total")%>>
				<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>	
				<label>最快可上班日：</label>
				<input type="text" class="input" name="stu_workdate"
					id="stu_workdate" value=<%=request.getParameter("stu_workdate")%>>
				<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>	
				<label>期望薪資：</label>
				<input type="text" class="input" name="stu_except"
					id="stu_except" value=<%=request.getParameter("stu_except")%>>
			</div>
				
			<div class="div6">
				<label>Final Ranking：</label>
				<input type="text" class="input" name="stu_final"
					id="stu_final" value=<%=request.getParameter("stu_final")%>>
				<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
				<label>備註1：</label>
				<input type="text" class="input" name="stu_note1"
					id="stu_note1" value=<%=request.getParameter("stu_note1")%>>
				<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
				<label>備註2：</label>
				<input type="text" class="input" name="stu_note2"
					id="stu_note2" value=<%=request.getParameter("stu_note2")%>>
			</div>	
				
			<div class="div7">
				<input type="button" class="btn btn_del" id="del_event" value="取消"  onclick="del()"></span> 
			</div>
			<div class="div8">
				<input type="submit" class="btn btn_ok" id="detailButton" value="存檔">
				<!-- <input type="button" class="btn btn_cancel" value="取消" onClick="$.fancybox.close()"> -->
			</div>
		</form>
	</div>
</body>
</html>