<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成績出來囉</title>
<link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet">
<link href="../css/bootstrap/bootstrap-theme.min.css" rel="stylesheet">

</head>
<body>
                     <input type="button" value="成績" id="buttonJSON"
						class="btn btn-danger">
                     <table id="scoreTable" class="table table-bordered">
						<thead>
							<tr>
								<th>班別</th>
								<th>姓名</th>
		                        <th>上機成績</th>
		                        <th>面試成績</th>
								<th>修改</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
	    <script src="../js/jquery.min.js"></script>
		<script src="../js/bootstrap/bootstrap.min.js"></script>
		<script>
				$(function() {
					$('#buttonJSON').click(function() {
						$('#scoreTable>tbody').empty();
						$.getJSON('upscoreJSON.do',{'action':'getAllScore'},function(datas){

							$.each(datas, function(i, score) {

								var cell1 = $("<td></td>").text(score.stu_id);
								var cell2 = $("<td></td>").text(score.stu_name);
								var cell3 = $("<td></td>").text(score.stu_implement);
								var cell4 = $("<td></td>").text(score.stu_interview);
								var cell5 = $("<td></td>").text("<input type='submit' value='修改'>");
								
								var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5]);
								
								$('#scoreTable>tbody').append(row);
							});
						})
					});
				});	
					
		</script>
    
</body>
</html>