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
						<h3>教育中心資料修改</h3>
					</div>
					<div class=row>
						<!------------------點選修改教育中心表單區塊內容----------------------------- -->
						<div class="modal-content">
							<form action="EduServlet.do" method="post" name="EduUpdateFrom">
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel">修改中心資料</h4>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<label class="control-label">中心代號:</label> <input type="text"
											class="form-control" name="edu_id" value="${eduVO.edu_id}" readonly >
										<label style="color:red">${errorMsgs.edu_idMsg}</label>
									</div>
									<div class="form-group">
										<label class="control-label">中心名稱:</label> <input type="text"
											class="form-control" name="edu_name" value="${eduVO.edu_name}">
										<label style="color:red">${errorMsgs.edu_nameMsg}</label>
									</div>
									<div class="form-group">
										<label class="control-label">中心地址:</label> <input type="text"
											class="form-control" name="edu_add" value="${eduVO.edu_add}">
										<label style="color:red">${errorMsgs.edu_addMsg}</label>
									</div>
									<div class="form-group">
										<label class="control-label">中心電話:</label> <input type="text"
											class="form-control" name="edu_tel" value="${eduVO.edu_tel}">
										<label style="color:red">${errorMsgs.edu_telMsg}</label>
									</div>
									<div class="form-group">
										<label class="control-label">聯絡人:</label> <input type="text"
											class="form-control" name="edu_contact" value="${eduVO.edu_contact}">
										<label style="color:red">${errorMsgs.edu_contactMsg}</label>
									</div>
								</div>
								<div class="modal-footer">
									<input type="submit" class="btn btn-primary" value="Send">
									<input type="hidden" name="action" value="updateEdu">
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



