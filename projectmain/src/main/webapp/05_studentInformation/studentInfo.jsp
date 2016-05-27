<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <c:if test="${empty LoginOK}"> --%>
<%-- 	<c:set var="target" value="${pageContext.request.servletPath}" --%>
<%-- 		scope="session" /> --%>
<%-- 	<c:redirect url="/01_login/LoginBegin.jsp" /> --%>
<%-- </c:if> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 匯入css -->
	<jsp:include page="/references/head_resources_css.jsp" />
	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考生基本資料</title>
<style type="text/css">
label,input{
	display: block;
}
#dialog{
/* 	background-color:silver; */
}
</style>




<!-- DataTables -->
<!-- <script> -->
<!-- // $(document).ready(function() { -->
<!-- </script> -->

<script type="text/javascript" src="${pageContext.request.contextPath}/MyLib/student_info.js"></script>

<!-- <script> -->
<!-- // }); -->
<!-- </script> -->



<!-- 傳統dialog -->
<script type="text/javascript" src="${pageContext.request.contextPath}/MyLib/dialog_old.js"></script>



</head>
	<!-- 匯入js -->
	<jsp:include page="/references/head_resources_js.jsp" />
	
	
<body>
<div class="container">
	<!-- 匯入功能表列 -->
	<jsp:include page="/references/navigator.jsp" />
	
	
	
<!-- 1. bootstrap的modal	 -->
	<!-- Trigger the modal with a button -->
<!--   <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button> -->

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
		<!-- 大 -->
    <div class="modal-dialog modal-lg">
    
		<!-- 小 -->
<!--     <div class="modal-dialog modal-sm"> -->

		<!-- 中 -->
<!--     <div class="modal-dialog"> -->

    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">考生基本資料維護</h4>
        </div>
        <div class="modal-body">
<!--           <p>Some text in the modal.</p> -->
          <div id=showMember></div>
<!--           <div class="form-group"><div id=showMember></div></div> -->
          <div class="form-group"><div id=formMember></div></div>
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
 
	
	
	
	
	
	
<!-- 2. 傳統dialog -->
<div id="dialog" title="Create new user">
  <form>
    <fieldset>
      <label for="name">Name</label>
      <input type="text" name="name" id="name" value="Jane Smith" class="text ui-widget-content ui-corner-all">
      <label for="email">Email</label>
      <input type="text" name="email" id="email" value="jane@smith.com" class="text ui-widget-content ui-corner-all">
      <label for="password">Password</label>
      <input type="password" name="password" id="password" value="xxxxxxx" class="text ui-widget-content ui-corner-all">
<!-- Allow form submission with keyboard without duplicating the dialog button -->
      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
    </fieldset>
  </form>
  </div>

      <div class="starter-template">
<h1>考生資料維護</h1>


	<c:forEach var='name' items='${pageContext.session.attributeNames}'>

<c:if test="${name}=='userId'">
	${userId}
</c:if>
	</c:forEach>

	<script type="text/javascript">
	$( "#dialog" ).dialog({ autoOpen: false });
	</script>
<table id="example" class="display" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>編號</th>
                <th>姓名</th>
                <th>年次</th>
                <th>性別</th>
                <th>學校</th>
                <th>組別</th>
                <th>座號</th>
                <th>E-mail</th>
                <th>已考(pc)</th>
                <th>成績(pc)</th>
                <th>日期(pc)</th>
                <th>成績(i)</th>
                <th>總成績</th>
                <th>最快上班日</th>
                <th>預期薪資</th>
                <th>Rank</th>
                <th>備註</th>
                <th>班別</th>
                <th>梯次</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>編號</th>
                <th>姓名</th>
                <th>年次</th>
                <th>性別</th>
                <th>學校</th>
                <th>組別</th>
                <th>座號</th>
                <th>E-mail</th>
                <th>已考(pc)</th>
                <th>成績(pc)</th>
                <th>日期(pc)</th>
                <th>成績(i)</th>
                <th>總成績</th>
                <th>最快上班日</th>
                <th>預期薪資</th>
                <th>Rank</th>
                <th>備註</th>
                <th>班別</th>
                <th>梯次</th>
            </tr>
        </tfoot>
    </table>
	 </div>
    </div><!-- /.container -->
   <!-- 匯入js -->
	<jsp:include page="/references/foot_resources_js.jsp" />

	
</body>
</html>