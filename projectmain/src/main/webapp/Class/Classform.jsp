<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
HELLO
	<form action='InsertClass.do' method="post" name="ClassForm">
		<div>班級代號:<input type="text" name="class_id"></div>
		<div>班級名稱:<input type="text" name="class_name"></div>
		<div>聯絡人:<input type="text" name="class_contact"></div>
		<div>班級導師:<input type="text" name="class_teach"></div>
		<div>教育代號:<input type="text" name="edu_id"></div>
		<div>
		<input type="submit" value="送出">
		</div>
	</form>
</body>
</html>