<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student_MaintainForm</title>
<link href="../css/lobibox.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/projectmain/css/fullCalendar/jquery-ui.css">
<style type="text/css">

.fancy {
	width: 700px;
	height: 350px;
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
	width: 150px;
}


.div1{
	float:left;
	padding-left:30px;
	width:350px;
}

.div2{
	float:left;
	padding-left:50px;
}

.div3{
	float:left;
	padding-left:120px;
}


</style>
<!-- fancybox -->
	<link rel="stylesheet" type="text/css" href="/projectmain/css/fancybox/jquery.fancybox.css"> 
	<script src="../js/lobibox.min.js"></script>	
	<script src='/projectmain/js/fancybox/jquery.fancybox.pack.js'></script> 
<script type="text/javascript" src="/projectmain/js/fancybox/jquery.form.min.js">

	
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
// 	        alert("请输入日程内容！"); 
     Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
			 	{
			 	 msg: "请输入日程内容！"
			 });
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
// 	            alert(responseText); 
	        	  Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
	      			 	{
	      			 	 msg: "responseText"
	      			 });
	        } 
	    }else{ 
// 	        alert(statusText); 
	    	  Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
	  			 	{
	  			 	 msg: "statusText"
	  			 });
	    } 
	} 
	
	});
</script> 

</head>
<body>
	<div class="fancy">
		<h3>主考官資料明細</h3>
		<form id="Student_MaintainForm" action="StudentProfileServlet" method="post">
					
			<div class="div1">
				<p>主考官代號：<%=request.getParameter("emp_id")%></p>
				<p>主考官姓名：<%=request.getParameter("emp_name")%></p>
				<p>部門：<%=request.getParameter("dep_name")%></p>
				<p>主考官E-mail：<%=request.getParameter("emp_mail")%></p>
		
			</div>
			<div class="div2">
				<p>請假單單號：<%=request.getParameter("exam_id")%></p>
				<p>請假開始日期：<%=request.getParameter("off_startdate")%></p>
				<p>請假結束日期：<%=request.getParameter("off_enddate")%></p>
				<p>請假天數：<%=request.getParameter("off_day")%></p>
				<p>職務代理人：<%=request.getParameter("emp_job_id")%></p>

			</div>
			<div class="div3">
				<p>考生代號：<%=request.getParameter("stu_id")%></p>
				<p>考生姓名：<%=request.getParameter("stu_name")%></p>
<%-- 				<p>監考開始時間：<%=request.getParameter("test_start")%></p> --%>
<%-- 				<p>監考結束時間：<%=request.getParameter("test_end")%></p> --%>
			</div>
			
		</form>
	</div>
</body>
</html>