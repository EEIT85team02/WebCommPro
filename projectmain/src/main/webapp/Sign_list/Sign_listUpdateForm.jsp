<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
						<h3>權限設定資料修改</h3>
					</div>
					<div class=row>
						<!------------------點選修改權限設定表單區塊內容----------------------------- -->
						<div class="modal-content">
							<form action="InsertSign_list.do" method="post" name="Sign_listUpdateForm">
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel">修改權限資料</h4>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<label class="control-label">權限代號:</label> <input type="text"
											class="form-control" name="sl_id" value="${slVO.sl_id}" readonly>
<%-- 										<label style="color:red">${errorMsgs}</label> --%>
									</div>
									<div class="form-group">
										<label class="control-label">權限名稱:</label> <input type="text"
											class="form-control" name="sl_name" value="${slVO.sl_name}">
										<label style="color:red">${errorMsgs}</label>
									</div>
								</div>
								<div class="modal-footer">
									<input type="submit" class="btn btn-primary" value="Send">
									<input type="hidden" name="action" value="updateSign_list">
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



