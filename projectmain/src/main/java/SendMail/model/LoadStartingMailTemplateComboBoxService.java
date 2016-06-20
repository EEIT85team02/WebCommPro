package SendMail.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONValue;

import Class.model.ClassVO;
import Class.model.ClassDAO;
import Class.model.IClassDAO;
import Mail_template.model.IMail_templateDAO;
import Mail_template.model.Mail_templateVO;
import Mail_template.model.Mail_templateDAO;

public class LoadStartingMailTemplateComboBoxService {

	 public static void main(String args[]) {	
		 try {
			 String s=getAllMailText();
			 System.out.println("json==="+s);

		} catch (SQLException e) {

			e.printStackTrace();
		}
	 }
	

public static String getAllMailText() throws SQLException {	

	IMail_templateDAO templatedao =new Mail_templateDAO();
	List<Mail_templateVO> alltemplatelist=templatedao.getAll();


List  l2 = new LinkedList();
for(int i=0,max=alltemplatelist.size();i<max;i++){

	String mailNameString=(String) alltemplatelist.get(i).getMail_name();	

	 Map m2 = new HashMap(); 
	 m2.put("Mail_template",mailNameString);
	 l2.add(m2);	 
}

String mailTextJsonString = JSONValue.toJSONString(l2);
return mailTextJsonString;


	}
}
