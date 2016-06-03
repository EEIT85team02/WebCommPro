package SendMail.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SendMail.model.EncryptIdentificationIdService;
import Student.model.StudentDAO;
import Student.model.StudentVO;

/**
 * Servlet implementation class Verification_controller
 */
@WebServlet("/Verification_controller")
public class Verification_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Verification_controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		this.doPost(req, res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("恭喜你連到servlet");
		String keyString=req.getParameter("key");
		System.out.println("抓到得key是"+keyString);
		

		String emailString=req.getParameter("email");
		System.out.println("抓到得email是"+emailString);
		
		EncryptIdentificationIdService eifi=new EncryptIdentificationIdService();
		StudentVO st;
		String stu_name=null;
		Integer stu_id=null;
			try {
				st = eifi.decrypt(keyString,emailString);
				stu_name=st.getStu_name();
				stu_id=st.getStu_id();
				System.out.println("配對到的學生姓名是=="+st.getStu_name());
				System.out.println("配對到的學生id是=="+st.getStu_id());
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(stu_id!=null){
				HttpSession session =req.getSession();
				session.setAttribute("stu_name", stu_name);
				session.setAttribute("stu_id", stu_id);
			req.getRequestDispatcher("/SendMail/Redirect.jsp").forward(req, res);

			}else{
				
			}
		

		}

	
}
