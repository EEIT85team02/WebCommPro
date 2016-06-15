package com.fullcalendar.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Student.model.IStudentDAO;
import Student.model.StudentDAO;
import Student.model.StudentVO;

import com.google.gson.ExclusionStrategy;
import com.google.gson.FieldAttributes;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@WebServlet("/CalendarFromDBServlet")
public class CalendarFromDBServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IStudentDAO dao = new StudentDAO();

	public CalendarFromDBServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		// 告訴Gson 我們要的格式 必須配合 Hibernate的ORM技術
		Gson gson = new GsonBuilder().setExclusionStrategies(
				new ExclusionStrategy() {

					@Override
					public boolean shouldSkipField(FieldAttributes f) {
						return false;
					}

					@Override
					public boolean shouldSkipClass(Class<?> clazz) {

						return (clazz == StudentVO.class);
					}

				})
//					.registerTypeAdapter(Boolean.class,  new TypeAdapter<Boolean>(){
//
//					@Override
//					public void write(JsonWriter out, Boolean value)
//							throws IOException {
////						if(value.equals(new Integer("1"))){
////							out.value(true);
////						}
////						if(value.equals(new Integer("0"))){
////							out.value(false);
////						}
//						   if (value == null) {
//							      out.nullValue();
//							    } else {
//							    	System.out.println("out==="+out);
//							      out.value(value);
//							    }
//					}
//
//					@Override
//					public Boolean read(JsonReader in) throws IOException {
////						return null;
//						  JsonToken peek = in.peek();
//						    switch (peek) {
//						    case BOOLEAN:
//						      return in.nextBoolean();
//						    case NULL:
//						      in.nextNull();
//						      return null;
//						    case NUMBER:
//						      return in.nextInt() != 0;
//						    case STRING:
//						      return Boolean.parseBoolean(in.nextString());
//						    default:
//						      throw new IllegalStateException("Expected BOOLEAN or NUMBER but was " + peek);
//						    }
//					}
//					
//				})
				.setPrettyPrinting()
				.create();
		// 也可以在create()之前先.serializeNulls
//		<h1>stuName:${sessionScope.userId}</h1>
//		<h1>stuNumber:${sessionScope.stuID}</h1>
		Integer stuID = new Integer(request.getSession().getAttribute("stu_id").toString());
//		stuID = new Integer("4");
//		out.write(gson.toJson(new ListLatestEventsService()
//		.listLatestEvents(stuID)));//只更新限制條件
		String str;
		try {
			str = gson.toJson(new ListLatestEventsService().listLatestEvents((stuID)));
			out.write(str.replaceAll("\"overlap\": 0,",  "\"overlap\": false,").replaceAll("\"overlap\": 1,",  "\"overlap\": true,"));
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		out.write(str.replaceAll("\"overlap\": 0,",  "\"overlap\": false,"));
		
		// 只是把資料庫的 0 換成false 1換成true
		
		
		
//		.listLatestEvents(stuID)));
//				.listLatestEvents(new Integer(1))));

		/**
		 * 使用StudentDAO版本
		 */
		/*
		 * List<CalendarVO> latestList = new ArrayList<CalendarVO>(); //
		 * 準備用來裝載事項種類的集合 Set<Integer> eventNum = new LinkedHashSet<Integer>();
		 * 
		 * // 取得指定的人 -- stuID=integer(1) 為已知 StudentVO studentVO =
		 * dao.findByPrimaryKey(new Integer(1)); // 取得各種屬性 -- 因為gson的關係
		 * 要先濾掉CalendarVO 這個屬性 // 預設studentVO 裡面會有三個CalendarVO 表示有三個事項可以選擇
		 * Set<CalendarVO> events = studentVO.getCalendarVO(); //
		 * 將stuID=1這個人的所有歷史紀錄都給滾出來 for(CalendarVO one:events){ // 先找出總共有幾個事項可以選擇
		 * eventNum.add(one.getId()); }
		 * 
		 * // 濾出最新的事件們 for(Integer ithEventNum:eventNum){ // 逐eventID種類過濾
		 * CalendarVO latestone = null; // 準備擺放位置 int a =0; // 準備比較新舊
		 * for(CalendarVO ithEvent:events){
		 * if(ithEvent.getId().equals(ithEventNum)){ // 相同eventID if(a==0){ //
		 * a=ithEvent.getOrderId().intValue(); // 轉型 latestone = ithEvent;
		 * }else{ latestone = a >= ithEvent.getOrderId().intValue()?
		 * latestone:ithEvent; } } } latestList.add(latestone); }
		 * 
		 * // 把最新的events打包成CalendarVO List<CalendarVO> latestCalendarVO = new
		 * ArrayList<CalendarVO>(); for(CalendarVO one:latestList){ Integer
		 * orderId = new Integer(one.getOrderId()); Integer id = new
		 * Integer(one.getId()); String title = ""+one.getTitle();
		 * java.util.Date start = one.getStart(); java.util.Date end =
		 * one.getEnd(); String color = ""+one.getColor();
		 * 
		 * // 以CalendarVO 為單位打包 CalendarVO tempVO = new CalendarVO();
		 * tempVO.setOrderId(orderId); tempVO.setId(id); tempVO.setTitle(title);
		 * tempVO.setStart(start); tempVO.setEnd(end); tempVO.setColor(color);
		 * 
		 * 
		 * 
		 * // 以CalendarVO 的List打包 latestCalendarVO.add(tempVO); }
		 */

		
		
		
		/**
		 * 使用CalendarDAO版本
		 */
		/*
		 *  CalendarDAO_interface dao = new CalendarDAO(); //
		 * List<CalendarVO> l ; // List<CalendarVO> l = new
		 * ArrayList<CalendarVO>(); // l.add(dao.findByPrimaryKey(new
		 * Integer(1))); CalendarVO l = new CalendarVO();
		 * l=dao.findByPrimaryKey(new Integer(1)); // 到資料庫更新最新的事件 // 給定事件為單位
		 * group // 每個事件的最後一個 排序orderid最大的 // l = new
		 * ListAllEventsService().listAllEvents(new Integer(1)); //
		 * System.out.println(l.toString());
		 * 
		 * 
		 * 
		 * 
		 * Integer orderId = new Integer(l.getOrderId()); Integer id = new
		 * Integer(l.getId()); String title = ""+l.getTitle(); java.util.Date
		 * start = l.getStart(); java.util.Date end = l.getEnd(); String color =
		 * ""+l.getColor(); Integer stuID = l.getStudentVO().getStuID();
		 * StudentVO studentVO = l.getStudentVO(); CalendarVO j = new
		 * CalendarVO();
		 * 
		 * 
		 * 
		 * // j.setStudentVO(studentVO);
		 * 
		 * j.setOrderId(orderId); j.setId(stuID); j.setColor(color);
		 * j.setStart(start); j.setEnd(end); j.setTitle(title);
		 */

		/*
		 * association version CalendarVO c = new CalendarVO();
		 * //c.getStudentVO(Id(1);// 人員 // c.setEventId(1);// token
		 * c.setOrderId(new Integer(1)); c.setId(new Integer(1));
		 * c.setTitle("Task in Progress"); c.setStart(new java.util.Date(new
		 * java.util.Date().getTime())); c.setEnd(new java.util.Date(new
		 * java.util.Date().getTime()+10000000)); c.setColor("blue"); StudentVO
		 * studentVO = new StudentVO();
		 * 
		 * studentVO.setStuID(new Integer(1)); studentVO.setStuName("陳顥賢");
		 * studentVO.setStuAge(new Integer(76)); studentVO.setStuGender(new
		 * Integer(1)); studentVO.setStuSchool("DDDDDDDDDDDDDDD");
		 * studentVO.setStuTeam(new Integer(2)); studentVO.setStuSeatNo(new
		 * Integer(29)); studentVO.setStuEmail("pighouse7647@gmail.com");
		 * studentVO.setStuIsExamPC(new Integer(1)); studentVO.setStuScorePC(new
		 * Double(100)); studentVO.setStuDatePC(new java.util.Date());
		 * studentVO.setStuScoreIn(new Double(100));
		 * studentVO.setStuScoreSum(new Double(100));
		 * studentVO.setStuDateHire(new java.util.Date());
		 * studentVO.setStuSalary(new Double(32000)); studentVO.setStuFinalR(new
		 * Integer(1)); studentVO.setStuNote(""); studentVO.setStuMajor("EEIT");
		 * studentVO.setStuSession(new Integer(85));
		 * 
		 * c.setStudentVO(studentVO);
		 */

		/*
		 * // one table version CalendarVO d = new CalendarVO(); d.setId(2);
		 * d.setEventId(2); d.setStart(new java.util.Date(new
		 * java.util.Date().getTime())); d.setEnd(new java.util.Date(new
		 * java.util.Date().getTime()+20000000));
		 * d.setTitle("Task in Progress"); d.setColor("green");
		 * 
		 * 
		 * CalendarVO e = new CalendarVO(); e.setId(3); e.setEventId(3);
		 * e.setStart(new java.util.Date(new java.util.Date().getTime()));
		 * e.setEnd(new java.util.Date(new
		 * java.util.Date().getTime()+40000000));
		 * e.setTitle("Task in Progress"); e.setColor("#ff9f89"); l.add(d);
		 * l.add(e); l.add(c);
		 */

		// out.write(l.getClass().getName());//ArrayList

		// for(CalendarVO one:l){
		// out.write(one.getTitle().toString()); // 印出 重要事項1
		// }
		// out.write(new Gson().toJson(l.get(0))); // 印出錯誤
		// out.write(new Gson().toJson(l));
		// new Gson().toJson(j).replace("}", "\"stuID:\"+\"1\"}");

		// 手動加上stuid的版本
		// out.write(new Gson().toJson(j).replace("}",
		// ",\"stuID\":1}]").replace("{", "[{"));

		// out.write(new Gson().toJson(latestCalendarVO));

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

}
