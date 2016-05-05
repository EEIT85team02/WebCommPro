<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	HELLO
	<form action='InsertExaminer_offday.do' method="post" name="Examiner_offdayForm">
		<div>員工代號:<input type="text" name="emp_id"></div>
		<div>請假開始日期:<input type="text" name="off_stardate"></div>
		<div>請假結束日期:<input type="text" name="off_enddate"></div>
		<div> 請假天數:<input type="text" name="off_day"></div>
		<div>職務代理人:<input type="text" name="emp_job_id"></div>
		<div>
		<input type="submit" value="送出">
		</div>
	</form>
</body>
</html>