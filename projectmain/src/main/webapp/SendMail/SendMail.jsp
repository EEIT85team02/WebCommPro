<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="Student.model.*"%>
<%@ page import="SendMail.Controller.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" >
<link href="../css/lobibox.min.css" rel="stylesheet">
<script src="../js/jquery-1.12.3.min.js"></script>
<script src="../js/bootstrap/bootstrap.min.js"></script>
<script src="../js/lobibox.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.0-rc.2/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">

<meta charset="UTF-8">
<meta name="description" content="">
<meta name="author" content="">
<style>
.Main_Content {
	margin-top: 100px;
}

#ok {
	color: blue;
}



Toggle {
	color: green;
}

label, input {
	display: block;
}

input.text {
	margin-bottom: 12px;
	width: 95%;
	padding: .4em;
}

fieldset {
	padding: 0;
	border: 0;
	margin-top: 25px;
}

h1 {
	font-size: 1.2em;
	margin: .6em 0;
}

.ui-dialog .ui-state-error {
	padding: .3em;
}

.validateTips {
	border: 1px solid transparent;
	padding: 0.3em;
}
</style>


</head>
<body>

	<!-- 引入top.jsp標頭檔 巡覽列部分-->
	<jsp:include page="/top/top.jsp" />
	<!-------------中間內容畫面開始------------>
	<!-- 固定巡覽列位置，建立div使區塊下移 (starter-template)-->





	<!-- --------------------------- -->





	<table id="studentTable" class="table table-bordered">
		<tbody>

		</tbody>
	</table>



	<div class="container">
		<div class="Main_Content">
			<div class="row">

				<div class="col-md-12">
					<hr>
					<table id="StuTable" class="display" cellspacing="0" width="100%">
						<thead>
							班級：
							<select id="class" name="class" class="display">
							</select>
							</select> email樣板:
							<select id="content" name="content" class="display">
							</select>
							<tr>

								<th class="col-md-1 col-xs-1">checkbox</th>
								<th class="col-md-1 col-xs-1">學生姓名</th>
								<th class="col-md-3 col-xs-3">學生年次</th>
								<th class="col-md-3 col-xs-3">學校系級</th>
								<th class="col-md-3 col-xs-3">學生email</th>
								<th class="col-md-2 col-xs-2">發信種類</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						<tfoot>
							<tr>
								<th>checkbox</th>
								<th>學生姓名</th>
								<th>學生年次</th>
								<th>學校系級</th>
								<th>學生email</th>
								<th>發信種類</th>
							</tr>
						</tfoot>
					</table>

					<!------------------點選新增教育中心表單區塊內容----------------------------- -->
					<button id="Toggle">全部選取</button>
					<button id="ok">確定</button>


				</div>
			</div>
		</div>
	</div>
	<!-- 	試試看用EL抓資料 -->
	<!-- 	<table> -->

	<%-- 	<c:forEach var="studentVO" items="${allstudent}" > --%>
	<!-- 		<tr align='center' valign='middle'> -->
	<%-- 			<td>${studentVO.stu_id}</td> --%>
	<%-- 			<td>${studentVO.stu_lastname}</td> --%>
	<%-- 			<td>${studentVO.stu_firstname}</td> --%>
	<%-- 			<td>${studentVO.stu_tel}</td> --%>
	<%-- 			<td>${studentVO.stu_email}</td> --%>
	<!-- 			<td> -->
	<%-- 	          ${studentVO.classVO.class_id}         --%>
	<!-- 			</td> -->

	<!-- 		</tr> -->
	<%-- 	</c:forEach>	 --%>
	<!-- 	</table> -->
	<!-- 	<table>					 -->
	<%-- 	<c:forEach var="Mail_templateVO" items="${textcontent}" > --%>
	<!-- 		<tr align='center' valign='middle'> -->
	<%-- 			<td>${Mail_templateVO}</td> --%>

	<!-- 		</tr> -->
	<%-- 	</c:forEach>	 --%>
	<!-- 	</table>					 -->

	<script>
	window.onload = function ()
	{
		loadSendAllMail();
	}
		var sel = document.getElementById("class");//抓class下拉式選單的id
		document.getElementById("class").onload = loadClassSelector();
		//document.getElementById("class").onload = loadSendAllMail();
		sel.addEventListener("change", changeList);
		sel.addEventListener("change", loadSendAllMail);

		var sel1 = document.getElementById("content");
		document.getElementById("content").onload = loadMailTextSelector();
		sel1.addEventListener("change", changeList);
		sel1.addEventListener("change", loadSendAllMail);

		var btn = document.getElementById("ok");

		btn.addEventListener("click", enterInformationToSendMail);

		var datas = null;
		var js = null;
		var selectedJSON = null;
		var table = null
		var returndatas = null;
		var classNumber = "EEIT70";
		var content = 1;
		var flag=0;	
		var Toggle= $('#Toggle');
		console.log("classNumber" + classNumber + "content" + content)

		$(function() {
			//定義table資料來源json，與畫面顯示------>開始

			table = $('#StuTable')
					.DataTable(
							{

								"ajax" : {

									"url" : "/projectmain/SendMail/SendMail.do?class="
											+ classNumber
											+ "&content="
											+ content,

								},

								"oLanguage" : {
									"sProcessing" : "資料正處理中...",
									"sLengthMenu" : "顯示 _MENU_ 筆記錄",
									"sZeroRecords" : "無符合資料",
									"sInfo" : "目前記錄：_START_ 至 _END_, 總筆數：_TOTAL_",
									"sInfoEmpty" : "顯示第 0 至 0 項結果，共 0 項",
									"sInfoFiltered" : "(從 _MAX_ 項結果過濾)",
									"sSearch" : "搜索:",
									"oPaginate" : {
										"sFirst" : "首頁",
										"sPrevious" : "上頁",
										"sNext" : "下頁",
										"sLast" : "尾頁"
									}
								},
								"bJQueryUI" : true,
								"bProcessing" : true,
								"sPaginationType" : "full_numbers",

							});

		})

// 		-------------------------全選功能開始
 Toggle.click(function(){	 
	 //this vs $(this)	 
	if(flag==0){
	
	 $(':checkbox').prop('checked',true);
	 Toggle.text('取消全選');
	 flag=1;
	}else if(flag==1){
			 $(':checkbox').prop('checked',false);
			 Toggle.text('全部選取');
			 flag=0;
	}
 });

// 		-------------------------全選功能結束


		//--------------------一開始將班級全部抓出來的方法--------------------------------
		function loadClassSelector() {
			var xhr = new XMLHttpRequest(), id = 0;
			var frag = document.createDocumentFragment();

			if (xhr != null) {
				xhr.addEventListener("readystatechange", function() {
					if (xhr.readyState == 4) {
						if (xhr.status == 200) {
							datas = xhr.responseText;
							console.log("datas" + datas);
							//還是要轉型成JSON物件
							js = JSON.parse(datas);
							console.log("js" + js);

							//var myBody = document.querySelector("select");
							var myBody = document.getElementById("class")
							//先刪除表格中的內容
							while (myBody.hasChildNodes()) {
								myBody.removeChild(myBody.lastChild);
							}

							//讀出JSON中的資料
							//將資料顯示在html的select標籤中

							//用for迴圈讀出JSON中的資料   
							for (var i = 0, max = js.length; i < max; i++) {

								var class_id = js[i].class_id;

								console.log("class_id=====" + class_id);
								var cell0 = document.createElement("option");
								var txt0 = document.createTextNode(class_id);
								cell0.name = "class_id" + i;
								cell0.value = class_id;
								cell0.appendChild(txt0);
								myBody.appendChild(cell0);

							}

							myBody.appendChild(frag);
						} else {
// 							alert(xhr.status + ":" + xhr.statusText);
			Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
		 			    			{
		 			    			msg: xhr.status + ":" + xhr.statusText
		 			    			});
						}
					}

				});

				xhr.open('post', 'LoadStartingClassComboBox_controller.do',
						true);
				xhr.setRequestHeader("Content-Type",
						"application/x-www-form-urlencoded");
				xhr.send();
			} else {
// 				alert("您的瀏覽器不支援Ajax功能!!");
	Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
			    			{
			    			msg: "您的瀏覽器不支援Ajax功能!!"
			    			});
			}

		}
		//-------------------一開始將email樣本全部抓出來的發紡-----------------------
		function loadMailTextSelector() {
			var xhr = new XMLHttpRequest(), id = 0;
			var frag = document.createDocumentFragment();

			if (xhr != null) {
				xhr.addEventListener("readystatechange", function() {
					if (xhr.readyState == 4) {
						if (xhr.status == 200) {
							datas = xhr.responseText;
							console.log("datas" + datas);
							//還是要轉型成JSON物件
							js = JSON.parse(datas);
							console.log("js" + js);

							//var myBody = document.querySelector("select");
							var myBody = document.getElementById("content")
							//先刪除表格中的內容
							while (myBody.hasChildNodes()) {
								myBody.removeChild(myBody.lastChild);
							}

							//讀出JSON中的資料
							//將資料顯示在html的select標籤中

							//用for迴圈讀出JSON中的資料   
							for (var i = 0, max = js.length; i < max; i++) {

								var Mail_template = js[i].Mail_template;

								console.log("Mailtext=====" + Mail_template);
								var cell1 = document.createElement("option");
								var txt1 = document
										.createTextNode(Mail_template);
								cell1.name = "Mail_template" + i;
								cell1.value = i + 1;
								cell1.appendChild(txt1);
								myBody.appendChild(cell1);

							}

							myBody.appendChild(frag);
						} else {
// 							alert(xhr.status + ":" + xhr.statusText);
			Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
					    			{
					    			msg: xhr.status + ":" + xhr.statusText
					    			});
						}
					}

				});

				xhr.open('post',
						'LoadStartingMailTemplateComboBox_controller.do', true);
				xhr.setRequestHeader("Content-Type",
						"application/x-www-form-urlencoded");
				xhr.send();
			} else {
// 				alert("您的瀏覽器不支援Ajax功能!!");
		Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
		    			{
		    			msg: "您的瀏覽器不支援Ajax功能!!"
		    			});
			}

		}

		//-------------------------------------------
		function changeList() {
			classNumber = sel.options[sel.selectedIndex].value;
			content = sel1.options[sel1.selectedIndex].value;
			console.log("classNumber in method=" + classNumber
					+ "classNumber in content=" + content);
			//table.ajax.reload();
			table.ajax.url(
					"/projectmain/SendMail/SendMail.do?class="
							+ classNumber + "&content=" + content).load();
		}

		function loadSendAllMail() {
			var xhr = new XMLHttpRequest(), id = 0;
			var frag = document.createDocumentFragment();

			if (xhr != null) {
				xhr.addEventListener("readystatechange", function() {
					if (xhr.readyState == 4) {
						if (xhr.status == 200) {
							datas = xhr.responseText;
							//returndatas=datas;

							console.log("從AJAX回來的datas====" + datas);
							//console.log("returndatas====="+returndatas);
							//還是要轉型成JSON物件
							js = JSON.parse(datas);
							console.log("從AJAX回來的datas轉 js====" + js);

							// 		---------------------------------------------舊方法開始 				

							// 						var myBody = document.querySelector(".table>tbody");

							// 						//先刪除表格中的內容
							// 						while(myBody.hasChildNodes()){
							// 							myBody.removeChild(myBody.lastChild);
							// 						}

							//讀出JSON中的資料
							//將資料顯示在html的select標籤中

							//用for迴圈讀出JSON中的資料   
							// 		               	  for(var i = 0,max=js.length;i<max;i++){
							// 		               		  var stu_name=js[i].stu_name;
							// 		               		  var stu_age=js[i].stu_age;
							// 		               		  var stu_sch=js[i].stu_sch;

							// 		               		  var class_id=js[i].class_id;
							// 		               		  var stu_email=js[i].stu_email;

							// 		               		  var mail_name=js[i].mail_name;  

							// 		 					  var cell0=document.createElement("td");
							// 		 					  var checkbox=document.createElement("input");
							// 		 					  checkbox.type="checkbox";
							// 		 					  checkbox.id="checkboxid"+i;
							// 		 					  checkbox.name="checkboxname";
							// 		 					  checkbox.value=i;
							// 		 					  cell0.appendChild(checkbox);	               		  

							// 		               		  console.log("stu_name"+stu_name);
							// 		 					  var cell1=document.createElement("td");
							// 		 					  var txt1=document.createTextNode(stu_name);
							// 		 					  cell1.id="stu_name"+i;
							// 		 					  cell1.name="stu_name"+i;		 					 
							// 		 					  cell1.appendChild(txt1);

							// 		               		  console.log("stu_age"+stu_age);
							// 		 					  var cell2=document.createElement("td");
							// 		 					  var txt2=document.createTextNode(stu_age);
							// 		 					  cell2.id="stu_age"+i;
							// 		 					  cell2.name="stu_age"+i;		 					 
							// 		 					  cell2.appendChild(txt2);

							// 		               		  console.log("stu_sch"+stu_age);
							// 		 					  var cell3=document.createElement("td");
							// 		 					  var txt3=document.createTextNode(stu_sch);
							// 		 					  cell3.id="stu_sch"+i;
							// 		 					  cell3.name="stu_sch"+i;		 					 
							// 		 					  cell3.appendChild(txt3);

							// 		 					  var cell4=document.createElement("td");
							// 		 					  var txt4=document.createTextNode(stu_email);
							// 		 					  cell4.id="stu_email"+i;
							// 		 					  cell4.name="stu_email"+i;
							// 		 					  cell4.appendChild(txt4);

							// 		 					  var cell5=document.createElement("td");
							// 		 					  var txt5=document.createTextNode(class_id);
							// 		 					  cell5.id="class_id"+i;
							// 		 					  cell5.name="class_id"+i;	 					 
							// 		 					  cell5.appendChild(txt5);

							// 		 					  var cell6=document.createElement("td");
							// 		 					  var txt6=document.createTextNode(mail_name);
							// 		 					  cell6.id="mail_name"+i;
							// 		 					  cell6.name="mail_name"+i;		 					 
							// 		 					  cell6.appendChild(txt6);
							//原來預想本來是用form表單一個一個學生包起來送出所以要一個個有按鈕 
							// 		 					  var cell6=document.createElement("td");
							// 		 					  var button=document.createElement("button");
							// 		 					  button.type="submit";
							// 		 					  button.value="Submit"
							// 		 					  var txt6=document.createTextNode("送出");
							// 		 					  cell6.appendChild(button);
							// 		 					 button.appendChild(txt6);

							// 		 					  var row = document.createElement("tr");

							// 		 					 row.appendChild(cell0);
							// 		 		 			 row.appendChild(cell1);
							// 		 					 row.appendChild(cell2);
							// 		 					 row.appendChild(cell3);
							// 		 					 row.appendChild(cell4);
							// 		 					 row.appendChild(cell5);
							// 		 					 row.appendChild(cell6);

							// 	 					   	 frag.appendChild(row);
							// 		               	  }

							// 		                  //再將讀出的資料顯示在html的table標籤中
							// 		               	  //參考語法如下
							// 		               	  //建立<td>iPhone</td>
							// 		               	  //var cell1 = document.createElement("td");
							// 	 					  //var txt1 = document.createTextNode("iPhone");
							// 	 					  //cell1.appendChild(txt1);
							// 	 					  //將<td>加到<tr>之下
							// 	 					  //var row = document.createElement("tr");
							// 	 					  //row.appendChild(cell1);
							// 	 					  //將<tr>加到<tbody>之下

							// 	 						myBody.appendChild(frag);
							//--------------------------------舊方法結束 
						} else {
// 							alert(xhr.status + ":" + xhr.statusText);
			Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
					    			{
					    			msg: xhr.status + ":" + xhr.statusText
					    			});
						}
					}

				});

				//讀取html select標籤中，目前被選取項目的value(CategoryID)，語法參考如下
				//select.options[select.selectedIndex].value
				classNumber = sel.options[sel.selectedIndex].value;
				content = sel1.options[sel1.selectedIndex].value;
				//使用get的方式，將資料id傳到Server端Products.java的程式
				console.log(classNumber);
				console.log(content);
				xhr.open('post', 'SelectStudentInformationNormalJSON_controller.do', true);
				xhr.setRequestHeader("Content-Type",
						"application/x-www-form-urlencoded");
				xhr.send("class=" + classNumber + "&content=" + content);
			} else {
// 				alert("您的瀏覽器不支援Ajax功能!!");
	Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
		    			{
		    			msg: "您的瀏覽器不支援Ajax功能!!"
		    			});
			}

		}
		//-------------------------------enterInformationToSendMail是選擇checkbox之後按下送出所處發的方法---------------------	
		function enterInformationToSendMail() {
			var xhr = new XMLHttpRequest(), id = 0;
			var frag = document.createDocumentFragment();
			var arr = new Array();
			//getElement"s"ByName,checkbox裡面的name都要是一樣的，我會將有相同名稱的一起抓入陣列
			//obj是一個陣列，裡面裝的是被選到checkbox的名子
			var obj = document.getElementsByName("checkboxname");

			var selected = [];

			for (var i = 0; i < obj.length; i++) {
				//obj.check是將有否打勾，true就執行下面
				if (obj[i].checked) {
					selected.push(obj[i].value);//selected是愈加陣列的名稱，push是可以將值一個一個接到陣列後面
					
				}
			}



			for (var i = 0, max = selected.length; i < max; i++) {

				//將selected陣列裡面的數值作為陣列第幾個元素的參考
				//像選到第0個，我就去抓js陣列中的第幾個元素，js陣列是我的
				//SelectStudentInformation_controller中回傳的值
				var selectobj = js[selected[i]];
				console.log(selected[i]);
				//concat() 方法用於連接兩個或多個陣列。
				//方法不會改變原來陣列的值
				//http://www.w3school.com.cn/jsref/jsref_concat_array.asp
				
				arr = arr.concat(selectobj);


			}

			selectedJSON = JSON.stringify(arr);
			console.log("selectedJSON"+selectedJSON);			
// 			alert("email寄送結束");
Lobibox.alert("success", //AVAILABLE TYPES: "error", "info", "success", "warning"
		    			{
		    			msg: "email寄送結束"
		    			});
			xhr.open('post', 'SendMail1.do', true);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xhr.send("key=" + selectedJSON);

			// 	        xhr.open('post','SendMail1.do',false);
			// 	        xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			// 			xhr.send("key="+selectedJSON);	

		}
	</script>
</body>
</html>