<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		<!-- 設定全版面內容100% 分為兩部分 比例4:8-->
		<div class="maincontentdiv">
			<div class="row">
				<!-- 設定全版面內容100% 分為兩部分 比例4:8  第一部份開始-->
				<div class="col-md-4">
					<form class="form-search">
						<input type="text" class="input-small"> <input
							type="submit" class="btn" value="送出">
                        <input type="hidden" name="action" value="getOneSign_list">
					</form>
				</div>
				<!-- 設定全版面內容100% 分為兩部分 比例4:8  第二部份開始-->
				<div class="col-md-8">
					<div class=page-header>
						<h3>權限資料查詢</h3>
					</div>
					<div class=row>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>權限代號</th>
									<th>權限名稱</th>
									<th>修改</th>
									<th>刪除</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var='sig' items='${sig}'>
								<tr>
									<td>${sig.sl_id}</td>
									<td>${sig.sl_name}</td>
									<td>
										<form action="InsertSign_list.do" method="post">
											<input type="submit" value="修改"> 
											<input type="hidden" name="action" value="getOneSign_list">
											<input type="hidden" name="sl_id" value="${sig.sl_id}">
										</form>
									</td>
									<td>
										<form action="InsertSign_list.do" method="post">
											<input type="submit" value="刪除"> 
											<input type="hidden" name="action" value="deleteSign_list">
											<input type="hidden" name="sl_id" value="${sig.sl_id}">
										</form>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						<!------------------點選新增權限設定表單區塊內容----------------------------- -->
						<button type="button" class="btn btn-primary btn-lg"
							data-toggle="modal" data-target="#myModal">新增</button>
						<!-- Modal -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<form action="InsertSign_list.do" method="post" name="Sign_listForm">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">
												<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
											</button>
											<h4 class="modal-title" id="myModalLabel">新增權限資料</h4>
										</div>
										<div class="modal-body">
											<div class="form-group">
												<label class="control-label">權限代號:</label> <input
													type="text" class="form-control" name="sl_id" value="${param.sl_id}" placeholder="權限代號">
												
											</div>
											<div class="form-group">
												<label class="control-label">權限名稱:</label> <input type="text"
													class="form-control" name="sl_name" value="${param.sl_name}" placeholder="權限名稱">
												
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
											<input type="submit" class="btn btn-primary" value="Send">
											<input type="hidden" name="action" value="addSign_list">
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

