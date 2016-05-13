<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成績上傳</title>
</head>
<body>
<form method="post" action="upscore.do">
<input type="text" name="stu_id" size="45">
<br>
<input type="text" name="stu_name" size="45">
<br>
<input type="text" name="stu_implement" size="45">
<br>
<input type="text" name="stu_interview" size="45">
<br>
<input type="hidden" name="action" value="update">
<input type="submit" value="送出修改"></form>
</body>
</html>