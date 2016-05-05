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
	<form action='InsertTest_Date.do' method="post" name="Test_DateForm">
		<div>班級代號:<input type="text" name="class_id"></div>
		<div>考試日期:<input type="text" name="test_startdate"></div>
		<div>考試時段代號:<input type="text" name="test_hour_id"></div>
		<div>
		<input type="submit" value="送出">
		</div>
	</form>
</body>
</html>