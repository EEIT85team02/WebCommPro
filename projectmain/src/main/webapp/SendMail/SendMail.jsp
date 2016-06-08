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

	<!-- �ޤJtop.jsp���Y�� �����C����-->
	<jsp:include page="/top/top.jsp" />
	<!-------------�������e�e���}�l------------>
	<!-- �T�w�����C��m�A�إ�div�ϰ϶��U�� (starter-template)-->





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
							�Z�šG
							<select id="class" name="class" class="display">
							</select>
							</select> email�˪O:
							<select id="content" name="content" class="display">
							</select>
							<tr>

								<th class="col-md-1 col-xs-1">checkbox</th>
								<th class="col-md-1 col-xs-1">�ǥͩm�W</th>
								<th class="col-md-3 col-xs-3">�ǥͦ~��</th>
								<th class="col-md-3 col-xs-3">�Ǯըt��</th>
								<th class="col-md-3 col-xs-3">�ǥ�email</th>
								<th class="col-md-2 col-xs-2">�o�H����</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						<tfoot>
							<tr>
								<th>checkbox</th>
								<th>�ǥͩm�W</th>
								<th>�ǥͦ~��</th>
								<th>�Ǯըt��</th>
								<th>�ǥ�email</th>
								<th>�o�H����</th>
							</tr>
						</tfoot>
					</table>

					<!------------------�I��s�W�Ш|���ߪ��϶����e----------------------------- -->
					<button id="Toggle">�������</button>
					<button id="ok">�T�w</button>


				</div>
			</div>
		</div>
	</div>
	<!-- 	�ոլݥ�EL���� -->
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
		var sel = document.getElementById("class");//��class�U�Ԧ���檺id
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
			//�w�qtable��ƨӷ�json�A�P�e�����------>�}�l

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
									"sProcessing" : "��ƥ��B�z��...",
									"sLengthMenu" : "��� _MENU_ ���O��",
									"sZeroRecords" : "�L�ŦX���",
									"sInfo" : "�ثe�O���G_START_ �� _END_, �`���ơG_TOTAL_",
									"sInfoEmpty" : "��ܲ� 0 �� 0 �����G�A�@ 0 ��",
									"sInfoFiltered" : "(�q _MAX_ �����G�L�o)",
									"sSearch" : "�j��:",
									"oPaginate" : {
										"sFirst" : "����",
										"sPrevious" : "�W��",
										"sNext" : "�U��",
										"sLast" : "����"
									}
								},
								"bJQueryUI" : true,
								"bProcessing" : true,
								"sPaginationType" : "full_numbers",

							});

		})

// 		-------------------------����\��}�l
 Toggle.click(function(){	 
	 //this vs $(this)	 
	if(flag==0){
	
	 $(':checkbox').prop('checked',true);
	 Toggle.text('��������');
	 flag=1;
	}else if(flag==1){
			 $(':checkbox').prop('checked',false);
			 Toggle.text('�������');
			 flag=0;
	}
 });

// 		-------------------------����\�൲��


		//--------------------�@�}�l�N�Z�ť�����X�Ӫ���k--------------------------------
		function loadClassSelector() {
			var xhr = new XMLHttpRequest(), id = 0;
			var frag = document.createDocumentFragment();

			if (xhr != null) {
				xhr.addEventListener("readystatechange", function() {
					if (xhr.readyState == 4) {
						if (xhr.status == 200) {
							datas = xhr.responseText;
							console.log("datas" + datas);
							//�٬O�n�૬��JSON����
							js = JSON.parse(datas);
							console.log("js" + js);

							//var myBody = document.querySelector("select");
							var myBody = document.getElementById("class")
							//���R����椤�����e
							while (myBody.hasChildNodes()) {
								myBody.removeChild(myBody.lastChild);
							}

							//Ū�XJSON�������
							//�N�����ܦbhtml��select���Ҥ�

							//��for�j��Ū�XJSON�������   
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
// 				alert("�z���s�������䴩Ajax�\��!!");
	Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
			    			{
			    			msg: "�z���s�������䴩Ajax�\��!!"
			    			});
			}

		}
		//-------------------�@�}�l�Nemail�˥�������X�Ӫ��o��-----------------------
		function loadMailTextSelector() {
			var xhr = new XMLHttpRequest(), id = 0;
			var frag = document.createDocumentFragment();

			if (xhr != null) {
				xhr.addEventListener("readystatechange", function() {
					if (xhr.readyState == 4) {
						if (xhr.status == 200) {
							datas = xhr.responseText;
							console.log("datas" + datas);
							//�٬O�n�૬��JSON����
							js = JSON.parse(datas);
							console.log("js" + js);

							//var myBody = document.querySelector("select");
							var myBody = document.getElementById("content")
							//���R����椤�����e
							while (myBody.hasChildNodes()) {
								myBody.removeChild(myBody.lastChild);
							}

							//Ū�XJSON�������
							//�N�����ܦbhtml��select���Ҥ�

							//��for�j��Ū�XJSON�������   
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
// 				alert("�z���s�������䴩Ajax�\��!!");
		Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
		    			{
		    			msg: "�z���s�������䴩Ajax�\��!!"
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

							console.log("�qAJAX�^�Ӫ�datas====" + datas);
							//console.log("returndatas====="+returndatas);
							//�٬O�n�૬��JSON����
							js = JSON.parse(datas);
							console.log("�qAJAX�^�Ӫ�datas�� js====" + js);

							// 		---------------------------------------------�¤�k�}�l 				

							// 						var myBody = document.querySelector(".table>tbody");

							// 						//���R����椤�����e
							// 						while(myBody.hasChildNodes()){
							// 							myBody.removeChild(myBody.lastChild);
							// 						}

							//Ū�XJSON�������
							//�N�����ܦbhtml��select���Ҥ�

							//��for�j��Ū�XJSON�������   
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
							//��ӹw�Q���ӬO��form���@�Ӥ@�Ӿǥͥ]�_�Ӱe�X�ҥH�n�@�ӭӦ����s 
							// 		 					  var cell6=document.createElement("td");
							// 		 					  var button=document.createElement("button");
							// 		 					  button.type="submit";
							// 		 					  button.value="Submit"
							// 		 					  var txt6=document.createTextNode("�e�X");
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

							// 		                  //�A�NŪ�X�������ܦbhtml��table���Ҥ�
							// 		               	  //�Ѧһy�k�p�U
							// 		               	  //�إ�<td>iPhone</td>
							// 		               	  //var cell1 = document.createElement("td");
							// 	 					  //var txt1 = document.createTextNode("iPhone");
							// 	 					  //cell1.appendChild(txt1);
							// 	 					  //�N<td>�[��<tr>���U
							// 	 					  //var row = document.createElement("tr");
							// 	 					  //row.appendChild(cell1);
							// 	 					  //�N<tr>�[��<tbody>���U

							// 	 						myBody.appendChild(frag);
							//--------------------------------�¤�k���� 
						} else {
// 							alert(xhr.status + ":" + xhr.statusText);
			Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
					    			{
					    			msg: xhr.status + ":" + xhr.statusText
					    			});
						}
					}

				});

				//Ū��html select���Ҥ��A�ثe�Q������ت�value(CategoryID)�A�y�k�ѦҦp�U
				//select.options[select.selectedIndex].value
				classNumber = sel.options[sel.selectedIndex].value;
				content = sel1.options[sel1.selectedIndex].value;
				//�ϥ�get���覡�A�N���id�Ǩ�Server��Products.java���{��
				console.log(classNumber);
				console.log(content);
				xhr.open('post', 'SelectStudentInformationNormalJSON_controller.do', true);
				xhr.setRequestHeader("Content-Type",
						"application/x-www-form-urlencoded");
				xhr.send("class=" + classNumber + "&content=" + content);
			} else {
// 				alert("�z���s�������䴩Ajax�\��!!");
	Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
		    			{
		    			msg: "�z���s�������䴩Ajax�\��!!"
		    			});
			}

		}
		//-------------------------------enterInformationToSendMail�O���checkbox������U�e�X�ҳB�o����k---------------------	
		function enterInformationToSendMail() {
			var xhr = new XMLHttpRequest(), id = 0;
			var frag = document.createDocumentFragment();
			var arr = new Array();
			//getElement"s"ByName,checkbox�̭���name���n�O�@�˪��A�ڷ|�N���ۦP�W�٪��@�_��J�}�C
			//obj�O�@�Ӱ}�C�A�̭��˪��O�Q���checkbox���W�l
			var obj = document.getElementsByName("checkboxname");

			var selected = [];

			for (var i = 0; i < obj.length; i++) {
				//obj.check�O�N���_���ġAtrue�N����U��
				if (obj[i].checked) {
					selected.push(obj[i].value);//selected�O�U�[�}�C���W�١Apush�O�i�H�N�Ȥ@�Ӥ@�ӱ���}�C�᭱
					
				}
			}



			for (var i = 0, max = selected.length; i < max; i++) {

				//�Nselected�}�C�̭����ƭȧ@���}�C�ĴX�Ӥ������Ѧ�
				//������0�ӡA�ڴN�h��js�}�C�����ĴX�Ӥ����Ajs�}�C�O�ڪ�
				//SelectStudentInformation_controller���^�Ǫ���
				var selectobj = js[selected[i]];
				console.log(selected[i]);
				//concat() ��k�Ω�s����өΦh�Ӱ}�C�C
				//��k���|���ܭ�Ӱ}�C����
				//http://www.w3school.com.cn/jsref/jsref_concat_array.asp
				
				arr = arr.concat(selectobj);


			}

			selectedJSON = JSON.stringify(arr);
			console.log("selectedJSON"+selectedJSON);			
// 			alert("email�H�e����");
Lobibox.alert("success", //AVAILABLE TYPES: "error", "info", "success", "warning"
		    			{
		    			msg: "email�H�e����"
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