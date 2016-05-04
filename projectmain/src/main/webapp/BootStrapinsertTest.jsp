<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<!DOCTYPE html >
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
<title>bootstrapGOGO</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<link href="css/starter-template.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">你好,這是巡覽列</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
            <li class="active"><a href="#Home">Home</a></li>
            <li><a href="#About">About</a></li>
            <li><a href="#Lemon">Lemon</a></li>
            
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">下拉式選單 <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="#">Separated link</a></li>
                <li><a href="#">One more separated link</a></li>
              </ul>
            </li>
			</ul>
		</div><!--/.nav-collapse -->
	</div>
	</nav>
	
	<div class="starter-template">
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  請按我
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
    
    
    
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">檸檬酸酸的</h4>
      </div>
      
      
      
      <div class="modal-body">
        <input type="text">
        
       <input type="text"><input type="text"><input type="text"><input type="text"><input type="text"><input type="text">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
        <button type="button" class="btn btn-primary">送出</button>
      </div>
      
    </div>
  </div>
</div>
</div>

 <div class="container">
      <div class="starter-template">
        <h1>大家好</h1>
        <p class="lead">Use this document as a way to quickly start any new project.<br> All you get is this text and a mostly barebones HTML document.</p>
      </div>
</div>

	<div class=page-header>
		<h1>測試用Tables</h1>
	</div>
	<div class=row>
		<div class=col-md-6>
			<table class=table>
				<thead>
					<tr>
						<th>#<th>First Name
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
						<td> Bird
						<td>@twitter
			</table>
		</div>
		<div class=col-md-6>
			<table class="table table-striped">
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
						<td> Bird
						<td>@twitter
			</table>
		</div>
	</div>
	
	<div class=row>
		<div class=col-md-6>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>#
						<th>First Name
						<th>Last Name
						<th>Username
				<tbody>
					<tr>
						<td rowspan=2>1
						<td>Mark
						<td>Otto
						<td>@mdo
					<tr>
						<td>Mark
						<td>Otto
						<td>@TwBootstrap
					<tr>
						<td>2
						<td>Jacob
						<td>Thornton
						<td>@fat
					<tr>
						<td>3
						<td colspan=2>Larry Bird
						<td>@twitter
			</table>
		</div>
		<div class=col-md-6>
			<table class="table table-condensed">
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
						<td colspan=2>Larry Bird
						<td>@twitter
			</table>
		</div>
	</div>
	
	<!-- 影片嵌入 -->	
<!-- 	<div class="embed-responsive embed-responsive-16by9">
	<iframe class="embed-responsive-item"
		src="https://www.youtube.com/embed/hs29SkJhRZM" frameborder="0"
		allowfullscreen></iframe>
	</div> -->
	
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

</body>
</html>



<!-- <!-- ============(新增資料)================================= --> -->
<!-- <div class="starter-template"> -->
<!-- 		<!-- Button trigger modal --> -->
<!-- 		<button type="button" class="btn btn-primary btn-lg" -->
<!-- 			data-toggle="modal" data-target="#myModal">新增</button> -->
<!-- 		<!-- Modal --> -->
<!-- 		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" -->
<!-- 			aria-labelledby="myModalLabel" aria-hidden="true"> -->
<!-- 			<div class="modal-dialog"> -->
<!-- 				<div class="modal-content"> -->
<!-- 					<form action="InsertEdu.do" method="post" name="EduForm"> -->
<!-- 					<input type="hidden" name="action" value="addEdu"> -->
<!-- 						<div class="modal-header"> -->
<!-- 							<button type="button" class="close" data-dismiss="modal"> -->
<!-- 								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span> -->
<!-- 							</button> -->
<!-- 							<h4 class="modal-title" id="myModalLabel">教育中心資料新增</h4> -->
<!-- 						</div> -->
<!-- 						<div class="modal-body"> -->
<!-- 							<div class="form-group"> -->
<!-- 								<label>教育中心名稱:</label> <input type="text" -->
<!-- 									 name="edu_name"> -->
<!-- 							</div> -->
<!-- 							<div class="form-group"> -->
<!-- 								<label>地址:</label> <input type="text" -->
<!-- 									 name="edu_add"> -->
<!-- 							</div> -->
<!-- 							<div class="form-group"> -->
<!-- 								<label >電話:</label> <input type="text" -->
<!-- 									 name="edu_tel"> -->
<!-- 							</div> -->
<!-- 							<div class="form-group"> -->
<!-- 								<label >聯絡人:</label> <input type="text" -->
<!-- 									 name="edu_contact"> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="modal-footer"> -->
<!-- 							<button type="button" class="btn btn-default" -->
<!-- 								data-dismiss="modal">Close</button> -->
<!-- 							<input type="submit" class="btn btn-primary" value="Send"> -->
<!-- 							<input type="hidden" name="action" value="addEdu"> -->
<!-- 						</div> -->
<!-- 					</form> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->