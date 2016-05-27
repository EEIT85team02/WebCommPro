package SendMail.Controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import SendMail.model.LoadStartingMailTemplateComboBoxService;


@WebServlet("/SendMail/LoadStartingMailTemplateComboBox_controller.do")
public class LoadStartingMailTemplateComboBox_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoadStartingMailTemplateComboBox_controller() {
        super();

    }
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		this.doPost(req, res);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8"); 
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();

		LoadStartingMailTemplateComboBoxService lsmtcs= new LoadStartingMailTemplateComboBoxService();		

		String MailTemplateJsonString=null;
		
		try {

			MailTemplateJsonString=lsmtcs.getAllMailText();			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		out.println(MailTemplateJsonString);
	}

}