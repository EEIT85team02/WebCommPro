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
	<!-- 固定巡覽列位置，建立div使區塊下移 (maincontentdiv)-->
	<div class="container">
		<div class="maincontentdiv">
			<div class="row">
				<!--設定版面內容100%-->
				<div class="col-md-12">
				<form class="form-search">
						<input type="text" class="input-small"> <input
							type="submit" class="btn" value="Search">
					</form>
					<div class=page-header>
						<h3>班級資料新增</h3>
					</div>
					<div class=row>
						<!------------------點選新增班級資料表單區塊內容----------------------------- -->
						<div class="modal-content">
							<form action="ClassServlet.do" method="post" name="ClassInsertFrom">
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel">新增班級資料資料</h4>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<label class="control-label">班級代號:</label> <input type="text"
											class="form-control" name="class_id" value="${param.class_id}">
										<label style="color:red">${errorMsgs.class_idMsg}</label>
									</div>
									<div class="form-group">
										<label class="control-label">班級名稱:</label> <input type="text"
											class="form-control" name="class_name" value="${param.class_name}">
										<label style="color:red">${errorMsgs.class_nameMsg}</label>
									</div>
									<div class="form-group">
										<label class="control-label">聯絡人:</label> <input type="text"
											class="form-control" name="class_contact" value="${param.class_contact}">
										<label style="color:red">${errorMsgs.class_contactMsg}</label>
									</div>
									<div class="form-group">
										<label class="control-label">導師:</label> <input type="text"
											class="form-control" name="class_teach" value="${param.class_teach}">
										<label style="color:red">${errorMsgs.class_teachMsg}</label>
									</div>
									<div class="form-group">
										<label class="control-label">中心代號:</label> <input type="text"
											class="form-control" name="edu_id" value="${param.eduVO.edu_id}">
										<label style="color:red">${errorMsgs.edu_idMsg}</label>
									</div>
								</div>
								<div class="modal-footer">
									<input type="submit" class="btn btn-primary" value="Send">
									<input type="hidden" name="action" value="addClass">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>



