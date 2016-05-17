<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="Sign_list.model.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Sign_list_Page</title>
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="author" content="">

</head>
<body>
	<!-- 引入top.jsp標頭檔 巡覽列部分-->
	<jsp:include page="/top/top.jsp" />
	<!-------------中間內容畫面開始------------>
	<!-- 固定巡覽列位置，建立div使區塊下移 (starter-template)-->
	<div class="container">
		<div class="maincontentdiv">
			<div class="row">
				<div class="col-md-12">
					<form class="form-search">
						<input type="text" class="input-small"> 
						<input type="submit" class="btn" value="Search">
						<input type="hidden" name="action" value="getOne_For_Display">
					</form>
					<div class=page-header>
						<h3>權限資料查詢</h3>
					</div>
					<div class=row>
						<table class="table table-hover">
							<thead>
								<tr>
									<th class="col-md-1 col-xs-1">#</th>
									<th class="col-md-2 col-xs-2">姓名</th>
									<th class="col-md-4 col-xs-4">Email</th>
									<th class="col-md-1 col-xs-1">部門</th>
									<th class="col-md-2 col-xs-2">權限</th>
									<th class="col-md-1 col-xs-1">修改</th>
									<th class="col-md-1 col-xs-1">刪除</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var='slVO' items='${list}'>
									<tr>
										<td>${slVO.emp_id}</td>
										<td>${slVO.emp_name}</td>
										<td>${slVO.emp_mail}</td>
										<td>${slVO.dep_name}</td>
										<td>${slVO.sl_id}</td>
										<td>
											<form action="Sign_listServlet.do" method="post">
												<input type="submit" value="修改" name='update'> 
												<input type="hidden" name="action" value="getOneSign_list"> 
												<input type="hidden" name="sl_id" value="${slVO.sl_id}">
											</form>
										</td>
										<td>
											<form action="Sign_listServlet.do" method="post">
												<input type="submit" value="刪除" name='delete'> 
												<input type="hidden" name="action" value="deleteSign_list"> 
												<input type="hidden" name="sl_id" value="${slVO.sl_id}">
											</form>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						
						<!------------------點選新增教育中心表單區塊內容----------------------------- -->
						<div>
							<form action="Sign_listInsertForm.jsp" method="post">
								<input type="submit" value="新增"> <input type="hidden"
									name="action">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	$(document).ready(function(){
		$('input[name="delete"]').css('color','red').click(function(){
			alert("該筆資料將刪除");
		})
	})
	
	</script>
	<script>
	
	</script>
</body>
</html>
