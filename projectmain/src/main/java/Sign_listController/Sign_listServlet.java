package Sign_listController;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Sign_list.model.Sign_listService;
import Sign_list.model.Sign_listVO;


@WebServlet("/Sign_list/Sign_listServlet.do")
public class Sign_listServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Sign_listServlet() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		//查詢一筆員工資料(來自Sign_listForm.jsp請求)
		if ("getOne_For_Display".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("emp_id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入員工編號");
				}
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Sign_list/Sign_listForm.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始查詢資料*****************************************/
				Sign_listService slSvc = new Sign_listService();
				String emp_id = null;
				
				Sign_listVO slVO = slSvc.getOneSl(emp_id);
				if (slVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Sign_list/Sign_listForm.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("slVO", slVO);
				String url = "/Sign_list/Sign_listForm.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Sign_list/Sign_listInsertForm.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		//更新權限設定(來自Sign_listUpdateForm.jsp)
		if ("update".equals(action)) { 
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String emp_id = new String(req.getParameter("emp_id").trim());
				String emp_lastname = null;
				String emp_firstname = null;
				String emp_mail = null;
				String dep_name = null;
				Integer sl_id = 0;
				
				Sign_listVO slVO = new Sign_listVO();
				slVO.setEmp_id(emp_id);
				slVO.setEmp_lastname(emp_lastname);
				slVO.setEmp_firstname(emp_firstname);
				slVO.setEmp_mail(emp_mail);
				slVO.setDep_name(dep_name);
				slVO.setSl_id(sl_id);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("slVO", slVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Sign_list/Sign_listUpdateForm.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始修改資料*****************************************/
				Sign_listService slSvc = new Sign_listService();
				slVO = slSvc.updateSl(emp_id, emp_lastname, emp_firstname, emp_mail, dep_name, sl_id);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("slVO", slVO); 
				String url = "/Sign_list/Sign_listForm.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Sign_list/Sign_listUpdateForm.jsp");
				failureView.forward(req, res);
			}
		}

		//新增員工權限資料(來自SignInsertForm.jsp)
        if ("insert".equals(action)) {  
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String emp_id = new String(req.getParameter("emp_id").trim());
				System.out.println(emp_id);
				String emp_lastname = req.getParameter("emp_lastname");
				System.out.println(emp_lastname);
				String emp_firstname = req.getParameter("emp_firstname");
				System.out.println(emp_firstname);
				String emp_mail = req.getParameter("emp_mail");
				System.out.println(emp_mail);
				String dep_name = req.getParameter("dep_name");
				System.out.println(dep_name);
				Integer sl_id = new Integer(req.getParameter("sl_id").trim());
				System.out.println(sl_id);
				System.out.println(req.getParameter("sl_name").trim());
				Sign_listVO slVO = new Sign_listVO();
				slVO.setEmp_id(emp_id);
				slVO.setEmp_lastname(emp_lastname);
				slVO.setEmp_firstname(emp_firstname);
				slVO.setEmp_mail(emp_mail);
				slVO.setDep_name(dep_name);
				slVO.setSl_id(sl_id);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("slVO", slVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Sign_list/Sign_listInsertForm.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				Sign_listService slSvc = new Sign_listService();
				slVO = slSvc.insertSl(emp_id, emp_lastname, emp_firstname, emp_mail, dep_name, sl_id);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				req.setAttribute("slVO", slVO); 
				String url = "/Sign_list/Sign_listForm.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Sign_list/Sign_listInsertForm.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
