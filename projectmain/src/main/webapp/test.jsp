<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>index_page</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name=description content="">
<meta name=author content="">
<script src="js/jquery-1.9.1.js"></script>
<script src="js/bootstrap.js"></script>
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap-responsive.css"
	type="text/css" />

</head>

<body>
	<div class="panel-group" id="accordion" role="tablist"
		aria-multiselectable="true">
		
		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="headingOne">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion"
						href="#collapseOne" aria-expanded="true"
						aria-controls="collapseOne"> Collapsible Group Item #1 </a>
				</h4>
			</div>
			<div id="collapseOne" class="panel-collapse collapse in"
				role="tabpanel" aria-labelledby="headingOne">
				<div class="panel-body">Anim pariatur cliche reprehenderit,
					enim eiusmod high life accusamus terry richardson ad squid. 3 wolf
					moon officia aute, non cupidatat skateboard dolor brunch. Food
					truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
					sunt aliqua put a bird on it squid single-origin coffee nulla
					assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer
					labore wes anderson cred nesciunt sapiente ea proident. Ad vegan
					excepteur butcher vice lomo. Leggings occaecat craft beer
					farm-to-table, raw denim aesthetic synth nesciunt you probably
					haven't heard of them accusamus labore sustainable VHS.</div>
			</div>
		</div>
<!-- 		================================================ -->
		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="headingTwo">
				<h4 class="panel-title">
					<a class="collapsed" data-toggle="collapse"
						data-parent="#accordion" href="#collapseTwo" aria-expanded="false"
						aria-controls="collapseTwo"> Collapsible Group Item #2 </a>
				</h4>
			</div>
			<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel"
				aria-labelledby="headingTwo">
				<div class="panel-body">Anim pariatur cliche reprehenderit,
					enim eiusmod high life accusamus terry richardson ad squid. 3 wolf
					moon officia aute, non cupidatat skateboard dolor brunch. Food
					truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
					sunt aliqua put a bird on it squid single-origin coffee nulla
					assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer
					labore wes anderson cred nesciunt sapiente ea proident. Ad vegan
					excepteur butcher vice lomo. Leggings occaecat craft beer
					farm-to-table, raw denim aesthetic synth nesciunt you probably
					haven't heard of them accusamus labore sustainable VHS.</div>
			</div>
		</div>
		
<!-- 		======================================================== -->
		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="headingThree">
				<h4 class="panel-title">
					<a class="collapsed" data-toggle="collapse"
						data-parent="#accordion" href="#collapseThree"
						aria-expanded="false" aria-controls="collapseThree">
						Collapsible Group Item #3 </a>
				</h4>
			</div>
			<div id="collapseThree" class="panel-collapse collapse"
				role="tabpanel" aria-labelledby="headingThree">
				<div class="panel-body">Anim pariatur cliche reprehenderit,
					enim eiusmod high life accusamus terry richardson ad squid. 3 wolf
					moon officia aute, non cupidatat skateboard dolor brunch. Food
					truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
					sunt aliqua put a bird on it squid single-origin coffee nulla
					assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer
					labore wes anderson cred nesciunt sapiente ea proident. Ad vegan
					excepteur butcher vice lomo. Leggings occaecat craft beer
					farm-to-table, raw denim aesthetic synth nesciunt you probably
					haven't heard of them accusamus labore sustainable VHS.</div>
			</div>
		</div>

	</div>
<!-- 		新增icon語法================================================================ -->

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
													type="text" class="form-control" name="edu_name"
													value="${param.edu_name}" placeholder="中心名稱"> <label
													style="color: red">${errorMsgs.edu_nameMsg}</label>
											</div>
											<div class="form-group">
												<label class="control-label">中心地址:</label> <input
													type="text" class="form-control" name="edu_add"
													value="${param.edu_add}" placeholder="中心地址"> <label
													style="color: red">${errorMsgs.edu_addMsg}</label>
											</div>
											<div class="form-group">
												<label class="control-label">中心電話:</label> <input
													type="text" class="form-control" name="edu_tel"
													value="${param.edu_tel}" placeholder="中心電話"> <label
													style="color: red">${errorMsgs.edu_telMsg}</label>
											</div>
											<div class="form-group">
												<label class="control-label">聯絡人:</label> <input type="text"
													class="form-control" name="edu_contact"
													value="${param.edu_contact}" placeholder="聯絡人"> <label
													style="color: red">${errorMsgs.edu_contactMsg}</label>
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

</body>
</html>

