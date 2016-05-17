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
					<div class=page-header>
						<h3>權限資料新增</h3>
					</div>
					<div class=row>
						<!------------------點選新增權限設定表單區塊內容----------------------------- -->
						<div class="modal-content">
							<form action="Sign_listServlet.do" method="post" name="Sign_listInsertFrom">
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel">新增權限資料</h4>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<label class="control-label">員工編號:</label> 
										<input type="text" id="txtId" 
											class="form-control" name="emp_id" value="${param.emp_id}">
										<label style="color:red">${errorMsgs}</label>
										<div id="div1"></div>
										<label class="control-label">員工姓名:</label> 
										<input type="text" id="txtName" disabled
											class="form-control" name="emp_name" value="${param.emp_name}">
										<label style="color:red">${errorMsgs}</label>	
										<label class="control-label">員工Email:</label> 
										<input type="text" id="txtEmail" disabled
											class="form-control" name="emp_mail" value="${param.emp_mail}">
										<label style="color:red">${errorMsgs}</label>
										<label class="control-label">部門:</label> 
										<input type="text" id="txtDep" disabled
											class="form-control" name="dep_name" value="${param.dep_name}">
										<label style="color:red">${errorMsgs}</label>
										<label class="control-label">權限:</label> 
										<select id="select1" class="form-control" name="sl_name"></select>													
									</div>
								</div>
								<div class="modal-footer">
									<input type="submit" class="btn btn-primary" value="Send">
									<input type="hidden" name="action" value="insert">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 員工編號關鍵字 -->
	<script>
	var show;
	window.addEventListener("load", init, false);
	var txt = document.getElementById("txtId");
	function init() {
		txt.addEventListener("keyup", getData, false);
		show = document.getElementById("div1");
	}
	function getData() {
		if(txt.value==''){
			if (show.childNodes.length > 0) {
				show.removeChild(show.childNodes[0]);
				}
			return;
		}
		var xhrEmpId = new XMLHttpRequest();
		
		if (xhrEmpId != null) {
			xhrEmpId.addEventListener("readystatechange", function(){
				if (xhrEmpId.readyState == 4) {
	                if (xhrEmpId.status == 200) {
	                    var name = xhrEmpId.responseText;
	                    var datas = JSON.parse(name);  
						show.style.display = "block";
						if (show.childNodes.length > 0) {
							show.removeChild(show.childNodes[0]);
							}
						var eleDiv = document.createElement("div");
						eleDiv.className = "list-group";
						for (var j = 0, max = datas.length; j < max; j++) {
						var txtBtn = document.createTextNode(datas[j]);
						var eleBtn = document.createElement("button");
						eleBtn.className = "list-group-item";
						eleBtn.setAttribute("type", "button");
						eleBtn.appendChild(txtBtn);

						eleBtn.addEventListener("click", function() {
						document.Sign_listInsertFrom.emp_id.value = this.firstChild.nodeValue;
						
						var id = txt.value;
						console.log(id);
						$.getJSON('EmployeeList',{'emp_id':id},function(datas){
							$.each(datas,function(i,emp){
								
								document.Sign_listInsertFrom.emp_name.value = emp.emp_lastname + emp.emp_firstname;
								document.Sign_listInsertFrom.emp_mail.value = emp.emp_mail;
								document.Sign_listInsertFrom.dep_name.value = emp.dep_name;
								
// 								var row = $('<tr></tr>').append([cell1,cell2,cell3,cell4]);
// 								$('#productTable>tbody').append(row);				
							})
						})
						
						
						
						show.style.display = "none";
						}, false)
						eleDiv.appendChild(eleBtn);
					}
					show.appendChild(eleDiv);	
				}
	            else {
	                alert(xhrEmpId.status + ":" + xhrEmpId.statusText);
	            }
	          }
	        });
			
			xhrEmpId.open("get", "Sign_listAuto?keyword="+txt.value); 
			xhrEmpId.send();
			
			}
	    }
	
	</script>
	
	<!-- 權限名稱下拉選單 -->
	<script>
	$(function() {
		$.ajax({
			'type':'get',
			'url':'Sign_listXML',
			'dataType':'xml',
			'success':function(data){
				$(data).find('Sign_list').each(function(){
					var sl_id = $(this).children('sl_id').text();
					var sl_name = $(this).children('sl_name').text();
					console.log(sl_id);
					console.log(sl_name);
					var opt = $('<option></option>').val(sl_id).text(sl_name);
					$('#select1').append(opt);
				});
			}
		})
	})
	</script>

</body>
</html>
