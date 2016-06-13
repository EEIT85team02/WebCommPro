<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student_MaintainForm</title>

<link rel="stylesheet" type="text/css" href="/projectmain/css/fullCalendar/jquery-ui.css">

<style type="text/css">

.fancy {
	width: 700px;
	height: 500px;
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
	padding-left:50px;
	padding-top:50px;
}

.div3 h1{
	color:green;
}

.div4{
	float:left;
	padding-left:30px;
}

.div4 h1{
	color:red;
}

.div4 p{
	color:#ff7575;
}

</style>
<!-- fancybox -->
	<link rel="stylesheet" type="text/css" href="/projectmain/css/fancybox/jquery.fancybox.css"> 
	<script src='/projectmain/js/fancybox/jquery.fancybox.pack.js'></script> 
<script type="text/javascript" src="/projectmain/js/fancybox/jquery.form.min.js">

</script> 
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.0-rc.2/themes/smoothness/jquery-ui.css">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
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
			
			<%
				if(request.getParameter("stu_id")==null){ 
					out.print("<div class='div3'>");
					out.print("<h1>此請假區間沒有面試預約</h1>");
					out.print("</div>");
				}else{
					out.print("<div class='div4'>");
					out.print("<h1>此請假區間有面試預約</h1>");
					out.print("<p>考生代號："+request.getParameter("stu_id"));
					out.print("<p>考生姓名："+request.getParameter("stu_name"));
					out.print("<p>監考開始時間："+request.getParameter("test_start"));
					out.print("<p>監考結束時間："+request.getParameter("test_end"));
					out.print("</div>");
				}
				%>

		</form>
	</div>
</body>
</html>
