package EmployeeController;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Employee.model.Employee;
import Employee.model.EmployeeDAO;
import Employee.model.IEmployeeDAO;


@WebServlet("/Employee/InsertEmployee.do")
public class InsertEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertEmployee() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			System.out.println("OK1");
			IEmployeeDAO emp= new EmployeeDAO(); 
			System.out.println("Ok2");
			request.setCharacterEncoding("UTF-8");
			String emp_id = request.getParameter("emp_id");
			String emp_lastname = request.getParameter("emp_lastname");
			String emp_firstname = request.getParameter("emp_firstname");
			Integer dep_id = Integer.parseInt(request.getParameter("dep_id"));
			String dep_name = request.getParameter("dep_name");
			String emp_mail = request.getParameter("emp_mail");
			Integer sl_id = Integer.parseInt(request.getParameter("sl_id"));
			Employee emp1= new Employee();
			emp1.setEmp_id(emp_id);
			emp1.setEmp_lastname(emp_lastname);
			emp1.setEmp_firstname(emp_firstname);
			emp1.setDep_id(dep_id);
			emp1.setDep_name(dep_name);
			emp1.setEmp_mail(emp_mail);
			emp1.setSl_id(sl_id);
			emp.insert(emp1);
			System.out.println("okokokok");
			
			RequestDispatcher rd = request.getRequestDispatcher("/Employee/EmployeeformOK.jsp");
			rd.forward(request, response);
			return;
		} catch (SQLException e) {
			e.printStackTrace();
		} 	
	}

}
