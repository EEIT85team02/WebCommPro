<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>

	<input type="text" id="enterpwfirst" name="enterpwfirst"
		placeholder="��J�s�K�X" maxlength="6">
	<span id="span1"></span>
	<br />
	<input type="text" id="enterpwsecond" name="enterpwsecond"
		placeholder="�A����J�s�K�X" maxlength="6">
	<span id="span2"></span>
	<br />
	<input type="submit" id="ok" value="�T�{"
		>
	<br />



	<script>
		window.onload = function() {

			// 	var strUrl = location.search;
			// 	  var getPara, ParaVal;
			// 	  var aryPara = [];
			// 	  if (strUrl.indexOf("?") != -1) {
			// 	    var getSearch = strUrl.split("?");
			// 	    getPara = getSearch[1];
			// 	    ParaVal = getPara.split("=");

			//  	    alert(ParaVal[1]);

			// 	  }

			document.getElementById("enterpwfirst").onblur = checkFirstPassword;
			document.getElementById("enterpwsecond").onblur = checkSecondPassword;
			document.getElementById("ok").onclick =checkFirstPassword;
			document.getElementById("ok").onclick =checkSecondPassword;
			document.getElementById("ok").onclick =passDataToServlet;

		}
		var checkFirstPasswordflag = 0;
		var checkSecondPasswordflag = 0;

		function passDataToServlet() {
			if (checkFirstPasswordflag == 1 && checkSecondPasswordflag == 1) {
				var xhr = new XMLHttpRequest(), id = 0;
				var frag = document.createDocumentFragment();

				if (xhr != null) {
					xhr.addEventListener("readystatechange", function() {
						if (xhr.readyState == 4) {
							if (xhr.status == 200) {
								location.href = "/projectmain/LoginForwarded.do"

							} else {
								alert(xhr.status + ":" + xhr.statusText);
							}
						}

					});
					var strUrl = location.search;
					var getPara, ParaVal;
					var aryPara = [];
					if (strUrl.indexOf("?") != -1) {
						var getSearch = strUrl.split("?");
						getPara = getSearch[1];
						ParaVal = getPara.split("=");

						alert(ParaVal[1]);
					}
					xhr.open('post', "ChangePassword_controller.do", true);
					xhr.setRequestHeader("Content-Type",
							"application/x-www-form-urlencoded");
					var successPW = document.getElementById("enterpwsecond").value;
					xhr.send("password=" + successPW + "&email=" + ParaVal[1]);
				} else {
					alert("�z���s�������䴩Ajax�\��!!");
				}
			}

		}

		function checkFirstPassword() {
			var thePassword = document.getElementById("enterpwfirst").value;
			var thePassword2 = document.getElementById("enterpwsecond").value;
			if (thePassword == "") {
				document.getElementById("span1").innerHTML = "<img src='no.png' style='width:16px'/>�Фſ�J�ť�";
				checkFirstPasswordflag = 0;

			}
			else {
				checkSecondPassword();
				document.getElementById("span1").innerHTML = "<img src='oo.png' style='width:16px'/>�K�X�]�m���\";
				checkFirstPasswordflag = 1;
			}

		}
		function checkSecondPassword() {
			var thePassword1 = document.getElementById("enterpwfirst").value;
			var thePassword2 = document.getElementById("enterpwsecond").value;
			if (thePassword2 == "") {
				document.getElementById("span2").innerHTML = "<img src='no.png' style='width:16px'/>�Фſ�J�ť�";
				checkSecondPasswordflag = 0;
			} else if (thePassword1 == thePassword2) {
				document.getElementById("span2").innerHTML = "<img src='oo.png' style='width:16px'/>�K�X�T�{���\";
				checkSecondPasswordflag = 1;

			} else {
				document.getElementById("span2").innerHTML = "<img src='no.png' style='width:16px'/>�K�X�ݻP�Ĥ@����J���@�P";
				checkSecondPasswordflag = 0;
			}

		}
	</script>
</body>
</html>