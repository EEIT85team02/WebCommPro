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
	<form action='InsertMail_template.do' method="post" name="Mail_templateForm">
		<div>樣板名稱:<input type="text" name="mail_name"></div>
		<div>樣板內容:<input type="text" name="mail_text"></div>

		<div>
		<input type="submit" value="送出">
		</div>
	</form>
</body>
</html>