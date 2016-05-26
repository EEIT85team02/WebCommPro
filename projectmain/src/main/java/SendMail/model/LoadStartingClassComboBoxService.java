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
import Student.model.StudentVO;
import Student.model.StudentDAO;

public class LoadStartingClassComboBoxService {
	
	 public static void main(String args[]) {	
		 try {
			 String s=getAllClass();
			 System.out.println("json==="+s);

		} catch (SQLException e) {

			e.printStackTrace();
		}
	 }
	
public static String getAllClass() throws SQLException {	
	IClassDAO classdao= new ClassDAO();

	List<ClassVO> allclasslist=classdao.getAll();


List  l1 = new LinkedList();

//classid加入map
for(int i=0,max=allclasslist.size();i<max;i++){
	String classidString=(String) allclasslist.get(i).getClass_id();
	
	 Map m1 = new HashMap();       
	 m1.put("class_id",classidString);   
	 l1.add(m1);

}

String JsonString = JSONValue.toJSONString(l1);

return JsonString;


	}

}
