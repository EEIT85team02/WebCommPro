<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<title>index_page</title>
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="author" content="">
</head>
<body>
	<!-- 引入top.jsp標頭檔 巡覽列部分-->
	<jsp:include page="/top/top.jsp" />

	<!-- 	===================新增表單選項================================================================================ -->
	<div class="maincontentdiv">
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary btn-lg"
			data-toggle="modal" data-target="#myModal">請按我</button>
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="InsertEdu.do" method="post" name="EduForm">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">檸檬酸酸的</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label class="control-label">教育中心名稱:</label> <input type="text"
									class="form-control" name="edu_name">
							</div>
							<div class="form-group">
								<label class="control-label">地址:</label> <input type="text"
									class="form-control" name="edu_add">
							</div>
							<div class="form-group">
								<label class="control-label">電話:</label> <input type="text"
									class="form-control" name="edu_tel">
							</div>
							<div class="form-group">
								<label class="control-label">聯絡人:</label> <input type="text"
									class="form-control" name="edu_contact">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<input type="submit" class="btn btn-primary" value="Send">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-------------中間內容畫面開始------------>
	<div class="container">
		<!-- 因為固定巡覽列位置，故建立div使顯示區塊下移50px -->
		<div class="maincontentdiv">
			<h1>大家好</h1>
			<p class="lead">
				Use this document as a way to quickly start any new project.<br>
				All you get is this text and a mostly barebones HTML document.
			</p>

			<div class="row">
				<div class="col-md-4">
					<h2>HTML5</h2>
					<p>HTML5是HTML最新的修訂版本，2014年10月由全球資訊網協會（W3C）完成標準制定。[2][3][4]目標是取代1999年所製定的HTML
						4.01和XHTML 1.0標準，以期能在網際網路應用迅速發展的時候，使網路標準達到符合當代的網路需求。</p>
					<p>
						<a class="btn btn-primary"
							href="https://zh.wikipedia.org/wiki/HTML5" role="button">詳細資料
							&raquo;</a>
					</p>
				</div>
				<div class="col-md-4">
					<h2>CSS3</h2>
					<p>階層式樣式表，一種用來為結構化文件（如HTML文件或XML應用）添加樣式（字型、間距和顏色等）的電腦語言，由W3C定義和維護。目前最新版本是CSS2.1，為W3C的推薦標準。CSS3現在已被大部分現代瀏覽器支援，而下一版的CSS4仍在開發過程中。</p>
					<p>
						<a class="btn btn-primary"
							href="https://zh.wikipedia.org/wiki/%E5%B1%82%E5%8F%A0%E6%A0%B7%E5%BC%8F%E8%A1%A8#CSS3"
							role="button">詳細資料 &raquo;</a>
					</p>
				</div>
				<div class="col-md-4">
					<h2>JavaScript</h2>
					<p>JavaScript，直譯式程式語言，是一種動態型別、基於原型的語言，內建支援類別。它的直譯器被稱為JavaScript引擎，為瀏覽器的一部分，廣泛用於用戶端的腳本語言，最早是在HTML網頁上使用，用來給HTML網頁增加動態功能。現在JavaScript也可被用於網路伺服器，如Node.js。</p>
					<p>
						<a class="btn btn-primary"
							href="https://zh.wikipedia.org/wiki/JavaScript" role="button">詳細資料
							&raquo;</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<!-- 	===================           表格             ================================================================ -->
	<div class="container">
		<div class=page-header>
			<h1>測試用Tables</h1>
		</div>
		<div class=row>
			<div class=col-md-8>
				<table class=table>
					<thead>
						<tr>
							<th>#
							<th>First Name
							<th>Last Name
							<th>Username
					<tbody>
						<tr>
							<td>1
							<td>Mark
							<td>Otto
							<td>@mdo
						<tr>
							<td>2
							<td>Jacob
							<td>Thornton
							<td>@fat
						<tr>
							<td>3
							<td>Larry
							<td>Bird
							<td>@twitter
				</table>
			</div>
		</div>
	</div>
	<footer class="container">
		<p>&copy; IIIEDU</p>
	</footer>
</body>
</html>

