<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Class_Page</title>
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
						<input type="text" class="input-small"> <input
							type="submit" class="btn" value="Search">
					</form>
					<div class=page-header>
						<h3>班級資料查詢</h3>
					</div>
					<div class=row>
						<table class="table table-hover">
							<thead>
								<tr>
									<th class="col-md-2 col-xs-2">班級代號</th>
									<th class="col-md-2 col-xs-2">班級名稱</th>
									<th class="col-md-4 col-xs-4">聯絡人</th>
									<th class="col-md-1 col-xs-1">導師</th>
									<th class="col-md-1 col-xs-1">#</th>
									<th class="col-md-1 col-xs-1">修改</th>
									<th class="col-md-1 col-xs-1">刪除</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var='classVO' items='${classVO}'>
									<tr>
										<td>${classVO.class_id}</td>
										<td>${classVO.class_name}</td>
										<td>${classVO.class_contact}</td>
										<td>${classVO.class_teach}</td>
										<td>${classVO.eduVO.edu_id}</td>
										<td>
											<form action="ClassServlet.do" method="post">
												<input type="submit" value="修改" name='update'> 
												<input type="hidden" name="action" value="getoneClass"> 
												<input type="hidden" name="class_id" value="${classVO.class_id}">
											</form>
										</td>
										<td>
											<form action="ClassServlet.do" method="post">
												<input type="submit" value="刪除" name='delete'> 
												<input type="hidden" name="action" value="deleteClass"> 
												<input type="hidden" name="class_id" value="${classVO.class_id}">
											</form>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						
						<!------------------點選新增教育中心表單區塊內容----------------------------- -->
						<div>
							<form action="ClassInsertFrom.jsp" method="post">
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
</body>
</html>



