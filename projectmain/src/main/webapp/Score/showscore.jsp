<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="Student.model.*"%>
<%
  StudentVO studentVO = (StudentVO)request.getAttribute("studentVO");
%>
  <%
  StudentService Svc = new StudentService();
    List<StudentVO> list = Svc.getAll();
    pageContext.setAttribute("list",list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>成績出來囉</title>
<link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet">
<link href="../css/bootstrap/bootstrap-theme.min.css" rel="stylesheet">

</head>
<body>
<!-- <table border='1' bordercolor='#CCCCFF' width='800'> -->
<!-- 	<tr> -->
<!-- 		<th>班別</th> -->
<!-- 		<th>姓名</th> -->
<!-- 		<th>上機成績</th> -->
<!-- 		<th>面試成績</th> -->
<!-- 		<th>修改</th> -->
<!-- 	</tr> -->
<%-- 	<c:forEach var="StudentVO" items="${list}"> --%>
<!-- 		<tr align='center' valign='middle'> -->
<%-- 			<td>${StudentVO.stu_id}</td> --%>
<%-- 			<td>${StudentVO.stu_name}</td> --%>
<%-- 			<td>${StudentVO.stu_implement}</td> --%>
<%-- 			<td>${StudentVO.stu_interview}</td> --%>
<!-- 			<td> -->
<%-- 	<form method="post" action="<%=request.getContextPath()%>/Score/upscore.do"> --%>
<!-- 		<input type="submit" value="修改"> -->
<%-- 		 <input type="hidden" name="stu_id" value="${StudentVO.stu_id}"> --%>
<!-- 	     <input type="hidden" name="action"	value="updatepage"> -->
<!-- 	</form> -->
<!-- 	         </td> -->
<%-- 			</c:forEach> --%>
<!-- 			</table> -->
	<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>班別</th>
		<th>姓名</th>
		<th>上機成績</th>
		<th>面試成績</th>
		<th>修改</th>
	</tr>
	<c:forEach var="StudentVO" items="${list}">
		<tr align='center' valign='middle'>
			<td>${StudentVO.stu_id}</td>
			<td>${StudentVO.stu_name}</td>
			<td>${StudentVO.stu_implement}</td>
			<td>${StudentVO.stu_interview}</td>
			<td>
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">修改成績</button>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="exampleModalLabel">New message</h4>
      </div>
      <div class="modal-body">
        <form role="form" method="post" action="<%=request.getContextPath()%>/Score/upscore.do">
          <div class="form-group">
            <label for="recipient-name" class="control-label">上機成績:</label>
             <input type="text" class="form-control" id="recipient-name" name="stu_implement" value="${studentVO.stu_implement}">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">面試成績:</label>
            <input type="text" class="form-control" id="recipient-name" name="stu_interview" value="${studentVO.stu_interview}">
          </div>      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <input type="submit" class="btn btn-primary" value="送出">
        <input type="hidden" name="action" value="update">

<input type="hidden" name="stu_group" value="${studentVO.stu_group}">
<input type="hidden" name="stu_note1" value="${studentVO.stu_note1}">
<input type="hidden" name="stu_id" value="${studentVO.stu_id}">
<input type="hidden" name="stu_name" value="${studentVO.stu_name}">
<input type="hidden" name="stu_age" value="${studentVO.stu_age}">
<input type="hidden" name="stu_sch" value="${studentVO.stu_sch}">
<input type="hidden" name="stu_sex" value="${studentVO.stu_sex}">
<input type="hidden" name="stu_email" value="${studentVO.stu_email}">
<input type="hidden" name="stu_pre" value="${studentVO.stu_pre}">
<input type="hidden" name="stu_testtime" value="${studentVO.stu_testtime}">
<input type="hidden" name="stu_total" value="${studentVO.stu_total}">
<input type="hidden" name="stu_workdate" value="${studentVO.stu_workdate}">
<input type="hidden" name="stu_except" value="${studentVO.stu_except}">
<input type="hidden" name="stu_final" value="${studentVO.stu_final}">
<input type="hidden" name="stu_note2" value="${studentVO.stu_note2}">
      </div>
    </div>
  </div>
</div>
	         </td>
			</c:forEach>
			</table>
        </form>   
<!--         <form method="post" action="upscore.do"> -->
<!-- <table border="0"> -->
<!--      <tr> -->
<!-- 		<td>班別:</td> -->
<%-- 		<td><%=studentVO.getStu_id()%></td> --%>
<!-- 	</tr> -->
<!--     <tr> -->
<!-- 		<td>姓名:</td> -->
<%-- 		<td><%=studentVO.getStu_name()%></td> --%>
<!-- 	</tr> -->

<!-- 	<tr> -->
<!-- 		<td>上機成績:</td> -->
<%-- 		<td><input type="text" name="stu_implement" size="20" value="<%=studentVO.getStu_implement()%>" /></td> --%>
<!-- 	</tr> -->
	
<!-- 	<tr> -->
<!-- 		<td>面試成績:</td> -->
<%-- 		<td><input type="text" name="stu_interview" size="20" value="<%=studentVO.getStu_interview()%>" /></td> --%>
<!-- 	</tr> -->

<!-- </table> -->
<!-- <input type="hidden" name="action" value="update"> -->
<%-- <input type="hidden" name="stu_group" value="<%=studentVO.getStu_group()%>"> --%>
<%-- <input type="hidden" name="stu_note1" value="<%=studentVO.getStu_note1()%>"> --%>
<%-- <input type="hidden" name="stu_id" value="<%=studentVO.getStu_id()%>"> --%>
<%-- <input type="hidden" name="stu_name" value="<%=studentVO.getStu_name()%>"> --%>
<%-- <input type="hidden" name="stu_age" value="<%=studentVO.getStu_age()%>"> --%>
<%-- <input type="hidden" name="stu_sch" value="<%=studentVO.getStu_sch()%>"> --%>
<%-- <input type="hidden" name="stu_sex" value="<%=studentVO.getStu_sex()%>"> --%>
<%-- <input type="hidden" name="stu_email" value="<%=studentVO.getStu_email()%>"> --%>
<%-- <input type="hidden" name="stu_pre" value="<%=studentVO.getStu_pre()%>"> --%>
<%-- <input type="hidden" name="stu_testtime" value="<%=studentVO.getStu_testtime()%>"> --%>
<%-- <input type="hidden" name="stu_total" value="<%=studentVO.getStu_total()%>"> --%>
<%-- <input type="hidden" name="stu_workdate" value="<%=studentVO.getStu_workdate()%>"> --%>
<%-- <input type="hidden" name="stu_except" value="<%=studentVO.getStu_except()%>"> --%>
<%-- <input type="hidden" name="stu_final" value="<%=studentVO.getStu_final()%>"> --%>
<%-- <input type="hidden" name="stu_note2" value="<%=studentVO.getStu_note2()%>"> --%>
<!-- <input type="submit" value="送出修改"></form> -->
        <script src="../js/jquery.min.js"></script>
		<script src="../js/bootstrap/bootstrap.min.js"></script>
</body>
</html>