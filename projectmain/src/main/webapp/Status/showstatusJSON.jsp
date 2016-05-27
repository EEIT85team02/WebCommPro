<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>狀態出來了</title>
<link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet">
<link href="../css/bootstrap/bootstrap-theme.min.css" rel="stylesheet">

</head>
<body>
                      <input type="button" value="狀態" id="buttonJSON"
                          class="btn btn-danger">
                      <table id="statusTable" class="table table-bordered">
                         <thead>
                            <tr>
                                <th>姓名</th>
		                        <th>E-mail</th>
		                        <th>班別</th>
		                        <th>預約日期</th>
		                        <th>狀態</th>
		                        <th>修改</th>
                            </tr>
                         </thead>
                         <tbody>
                         </tbody>
                      </table>
        <script src="../js/jquery.min.js"></script>
		<script src="../js/bootstrap/bootstrap.min.js"></script>
		<script>
		        $(function(){
		          $('#buttonJSON').click(function(){		        	  		          
		        	$('#statusTable>tbody').empty();
		        	
		        	$.getJSON('ShowStatusJSON.do',{'action':'getShowStatus'},function(datas){
		        		
		        		$.each(datas,function(i,status){
		        			var cell1 = $("<td></td>").text(status.stu_name);
							var cell2 = $("<td></td>").text(status.stu_email);
							var cell3 = $("<td></td>").text(status.stu_id);
							var cell4 = $("<td></td>").text(status.stu_applytime);
							var cell5 = $("<td></td>").text(status.sta_name);
							var cell6 = $("<td></td>").html("<button value="+status.stu_id+"> "+"修改"+"</button>");
									
							var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5,cell6]);
							
							$('#statusTable>tbody').append(row);
		        		})
		        	})
		         })
		        })
		</script>
</body>
</html>