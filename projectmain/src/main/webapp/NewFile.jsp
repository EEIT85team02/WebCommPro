<%@ page contentType="text/html;charset=MS950"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.io.*"%>
<%
	Date date = new Date();
	String str = " 發問時間 :" + date;

	response.setContentType("text/html;charset=MS950");// unicode
	request.setCharacterEncoding("MS950");

	String tname = request.getParameter("name");

	String temail = request.getParameter("email");
	String tfeedback = request.getParameter("feedback");

	if (tname != null && temail != null && tfeedback != null) {
		String tfilepath = application.getRealPath("/")
				+ "feedback.txt";
		BufferedWriter bw = new BufferedWriter(new FileWriter(
				tfilepath, true));
		bw.write("\n" + str + "\n");
		bw.write("<p>");
		bw.write("<em>Name: </em>" + tname + "<br>");
		bw.write("<p>");
		bw.write("<em>Email address:</em>" + temail);
		bw.write("<p>");
		int count = tfeedback.length();
		String sub = tfeedback.substring(25, count);
		bw.write(sub);
		bw.write("<hr>");
		bw.close();

	}//end if
%>
</body>
</html>