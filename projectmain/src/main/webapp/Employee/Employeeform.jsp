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
	<form action='InsertEmployee.do' method="post" name="EmployeeForm">
		<div>員工代號:<input type="text" name="emp_id"></div>
		<div>姓:<input type="text" name="emp_lastname"></div>
		<div>名:<input type="text" name="emp_firstname"></div>
		<div>部門編號:<input type="text" name="dep_id"></div>
		<div>部門名稱:<input type="text" name="dep_name"></div>
		<div>MAIL:<input type="text" name="emp_mail"></div>
		<div>權限代號:<input type="text" name="sl_id"></div>
		
		<div>
		<input type="submit" value="送出">
		</div>
	</form>
</body>
</html>