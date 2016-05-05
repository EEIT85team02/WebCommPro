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
	<form action='InsertStudent.do' method="post" name="StudentForm">
		<div>學員代號:<input type="text" name="stu_id"></div>
		<div>姓:<input type="text" name="stu_lastname"></div>
		<div>名:<input type="text" name="stu_firstname"></div>
		<div>電話(家用):<input type="text" name="stu_tel"></div>
		<div>手機:<input type="text" name="stu_mobile"></div>
		<div>MAIL:<input type="text" name="stu_email"></div>
		<div>地址:<input type="text" name="stu_add"></div>
		<div>年次:<input type="text" name="stu_age"></div>
		<div>畢業學校:<input type="text" name="stu_sch"></div>
		<div>科系:<input type="text" name="stu_dep"></div>
		<div>班級代號:<input type="text" name="class_id"></div>
		<div>學員登入密碼??:<input type="text" name="log_pw"></div>
		<div>
		<input type="submit" value="送出">
		</div>
	</form>
</body>
</html>