<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>成績出來囉</title>
<link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet">
<link href="../css/bootstrap/bootstrap-theme.min.css" rel="stylesheet">

</head>
<body>

  <form method="post" action="<%=request.getContextPath()%>/Score/upscore.do">
				<input type="submit" value="成績" > 
				<input type="hidden" name="action" value="score">  
		</form>
	<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>班別</th>
		<th>姓名</th>
		<th>上機成績</th>
		<th>面試成績</th>
		<th>修改</th>
	</tr>
	<c:forEach var="StudentVO" items="${studentVO}">
		<tr align='center' valign='middle'>
			<td>${StudentVO.stu_id}</td>
			<td>${StudentVO.stu_name}</td>
			<td>${StudentVO.stu_implement}</td>
			<td>${StudentVO.stu_interview}</td>
			<td> 
			
	
		<input type="submit" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo" value="修改">
		 <input type="hidden" name="stu_id" value="${StudentVO.stu_id}">
	     <input type="hidden" name="action"	value="updatepage">
	<form method="post" action="<%=request.getContextPath()%>/Score/upscore.do">
			 <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="exampleModalLabel">New message</h4>
      </div>
      <div class="modal-body">
        <form role="form">
          <div class="form-group">
            <label for="recipient-name" class="control-label">上機成績:</label>
            <input type="text" class="form-control" id="recipient-name" name="stu_implement" value="${studentVO.stu_implement}">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">面試成績:</label>
            <textarea class="form-control" id="message-text" name="stu_interview" value="${studentVO.stu_interview}"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" >Close</button>
        <input type="submit" class="btn btn-primary" value="Send message">
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
 </form>
	         </td>
			</c:forEach>
			</table>
  
 
        <script src="../js/jquery.min.js"></script>
		<script src="../js/bootstrap/bootstrap.min.js"></script>
</body>
</html>