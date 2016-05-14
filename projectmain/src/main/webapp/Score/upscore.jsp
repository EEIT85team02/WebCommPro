<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Student.model.*"%>
<%
  StudentVO studentVO = (StudentVO)request.getAttribute("studentVO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成績上傳</title>
</head>
<body>
<form method="post" action="upscore.do">
<table border="0">
     <tr>
		<td>班別:</td>
		<td><%=studentVO.getStu_id()%></td>
	</tr>
    <tr>
		<td>姓名:</td>
		<td><%=studentVO.getStu_name()%></td>
	</tr>

	<tr>
		<td>上機成績:</td>
		<td><input type="text" name="stu_implement" size="20" value="<%=studentVO.getStu_implement()%>" /></td>
	</tr>
	
	<tr>
		<td>面試成績:</td>
		<td><input type="text" name="stu_interview" size="20" value="<%=studentVO.getStu_interview()%>" /></td>
	</tr>

</table>
<input type="hidden" name="action" value="update">
<input type="hidden" name="stu_id" value="<%=studentVO.getStu_id()%>">
<input type="hidden" name="stu_name" value="<%=studentVO.getStu_name()%>">

<input type="hidden" name="stu_group" value="<%=studentVO.getStu_group()%>">
<input type="hidden" name="stu_age" value="<%=studentVO.getStu_age()%>">
<input type="hidden" name="stu_email" value="<%=studentVO.getStu_email()%>">
<input type="submit" value="送出修改"></form>
</body>
</html>