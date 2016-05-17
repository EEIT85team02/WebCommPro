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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");

		//新增權限設定
		  if ("insert".equals(action)) { 
				
				List<String> errorMsgs = new LinkedList<String>();
				request.setAttribute("errorMsgs", errorMsgs);
				String emp_id = null;
				Integer sl_id = 0;
				
				try {
					/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
					
					Sign_listVO slVO = new Sign_listVO();
					slVO.setEmp_id(emp_id);
					slVO.setSl_id(sl_id);

					if (!errorMsgs.isEmpty()) {
						request.setAttribute("slVO", slVO); 
						RequestDispatcher failureView = request
								.getRequestDispatcher("/Sign_list/Sign_listInsertForm.jsp");
						failureView.forward(request, response);
						return;
					}
					
					/***************************2.開始新增資料***************************************/
					Sign_listService slSvc = new Sign_listService();
					slVO = slSvc.insertSign_list(emp_id, sl_id);
					
					/***************************3.新增完成,準備轉交(Send the Success view)***********/
					String url = "/Sign_list/Sign_listForm.jsp";
					RequestDispatcher successView = request.getRequestDispatcher(url);
					successView.forward(request, response);				
					System.out.println("success");
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add(e.getMessage());
					RequestDispatcher failureView = request
							.getRequestDispatcher("/Sign_list/Sign_listInsertForm.jsp");
					failureView.forward(request, response);
				}
			}
		
	}

}
