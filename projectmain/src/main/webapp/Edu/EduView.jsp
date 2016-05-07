<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Edu_Page</title>
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
		<!-- 設定全版面內容100% 分為兩部分 比例4:8-->
		<div class="maincontentdiv">
			<div class="row">
				<!-- 設定全版面內容100% 分為兩部分 比例4:8  第一部份開始-->
				<div class="col-md-4">
					<form class="form-search">
						<input type="text" class="input-small"> <input
							type="submit" class="btn" value="Search">
					</form>
				</div>
				<!-- 設定全版面內容100% 分為兩部分 比例4:8  第二部份開始-->
				<div class="col-md-8">
					<div class=page-header>
						<h3>教育中心資料查詢</h3>
					</div>
					<div class=row>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>中心代號</th>
									<th>中心名稱</th>
									<th>中心地址</th>
									<th>中心電話</th>
									<th>連絡人</th>
									<th>修改</th>
									<th>刪除</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var='eduVO' items='${eduVO}'>
								<tr>
									<td>${eduVO.edu_id}</td>
									<td>${eduVO.edu_name}</td>
									<td>${eduVO.edu_add}</td>
									<td>${eduVO.edu_tel}</td>
									<td>${eduVO.edu_contact}</td>
									<td>
										<form action="EduServlet.do" method="post">
											<input type="submit" value="修改"> 
											<input type="hidden" name="action" value="getoneEdu">
											<input type="hidden" name="edu_id" value="${eduVO.edu_id}">
										</form>
									</td>
									<td>
										<form action="EduServlet.do" method="post">
											<input type="submit" value="刪除"> 
											<input type="hidden" name="action" value="deleteEdu">
											<input type="hidden" name="edu_id" value="${eduVO.edu_id}">
										</form>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						<!------------------點選新增教育中心表單區塊內容----------------------------- -->
						<button type="button" class="btn btn-primary btn-lg"
							data-toggle="modal" data-target="#myModal">新增</button>
						<!-- Modal -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<form action="EduServlet.do" method="post" name="EduForm">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">
												<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
											</button>
											<h4 class="modal-title" id="myModalLabel">新增中心資料</h4>
										</div>
										<div class="modal-body">
											<div class="form-group">
												<label class="control-label">中心名稱:</label> <input
													type="text" class="form-control" name="edu_name" value="${param.edu_name}" placeholder="中心名稱">
												<label style="color:red">${errorMsgs.edu_nameMsg}</label>
											</div>
											<div class="form-group">
												<label class="control-label">中心地址:</label> <input type="text"
													class="form-control" name="edu_add" value="${param.edu_add}" placeholder="中心地址">
												<label style="color:red">${errorMsgs.edu_addMsg}</label>
											</div>
											<div class="form-group">
												<label class="control-label">中心電話:</label> <input type="text"
													class="form-control" name="edu_tel" value="${param.edu_tel}" placeholder="中心電話">
												<label style="color:red">${errorMsgs.edu_telMsg}</label>
											</div>
											<div class="form-group">
												<label class="control-label">聯絡人:</label> <input type="text"
													class="form-control" name="edu_contact" value="${param.edu_contact}" placeholder="聯絡人">
												<label style="color:red">${errorMsgs.edu_contactMsg}</label>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
											<input type="submit" class="btn btn-primary" value="Send">
											<input type="hidden" name="action" value="addEdu">
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>



