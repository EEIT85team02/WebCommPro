package Test_interval.model;

import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.simple.JSONValue;

import com.fullcalendar.service.CalendarService;

import Student.model.StudentVO;
import Test_Date.model.Test_DateService;
import Test_Date.model.Test_DateVO;
import Test_period.model.Test_periodService;
import Test_period.model.Test_periodVO;
import Class.model.ClassService;
import Class.model.ClassVO;

public class Test_intervalService {
	private ITest_intervalDAO dao;

	public Test_intervalService() {
		dao= new Test_intervalDAO();
	}
	
	public void insertTi( String class_id, Date test_startdate,
			Date test_enddate) throws SQLException {
		Test_intervalVO tiVO = new Test_intervalVO();
		
		tiVO.setTest_startdate(test_startdate);
		tiVO.setTest_enddate(test_enddate);
		ClassVO cla = new ClassVO();
		cla.setClass_id(class_id);
		tiVO.setClaVO(cla);
		
		dao.insert(tiVO);
	}
	
	public void updateTi(Integer test_interval_id,String class_id, Date test_startdate,
			Date test_enddate) throws SQLException {
		Test_intervalVO tiVO = new Test_intervalVO();
		tiVO.setTest_interval_id(test_interval_id);
		tiVO.setTest_startdate(test_startdate);
		tiVO.setTest_enddate(test_enddate);
		
		ClassVO cla = new ClassVO();
		cla.setClass_id(class_id);
		tiVO.setClaVO(cla);
		dao.update(tiVO);
	}
	public void deleteTi(Integer test_interval_id) throws SQLException{
		dao.delete(test_interval_id);
	}
	public Test_intervalVO findByPrimaryKeyTi(Integer test_interval_id) throws SQLException{
		return dao.findByPrimaryKey(test_interval_id);
	}
	//驗證TI 資料表是否存在CLASS_ID的這筆資料
	public List<Test_intervalVO> findByTiClass_id(String class_id) throws SQLException{
		return dao.findByTiClass_id(class_id);
	}
	public List<Test_intervalVO> getAllTi() throws SQLException{
		return dao.getAll();
	}
	public String getAllTiToJSON() throws SQLException{
		List tis=new LinkedList();
		List<Test_intervalVO> list=dao.getAll();
		String jsonString= null;
		for(Test_intervalVO tiVO :list){
			Map<String,String> map = new HashMap<String,String>();
			map.put("test_interval_id",tiVO.getTest_interval_id().toString());
			map.put("class_id",tiVO.getClaVO().getClass_id());
			map.put("class_name",tiVO.getClaVO().getClass_name());
			map.put("test_startdate",tiVO.getTest_startdate().toString());
			map.put("test_enddate",tiVO.getTest_enddate().toString());
			tis.add(map);
		}
		jsonString = JSONValue.toJSONString(tis);
		return jsonString;
	}
	
	public String getAllTiToJSONInitTable() throws SQLException{
		List<Test_intervalVO> list=dao.getAll();
		List<List<String>> tiVO = new LinkedList<List<String>>();
		String jsonValue = null;
		for(Test_intervalVO a :list){
			List<String> detailTiVO = new ArrayList<String>();
			detailTiVO.add(a.getTest_interval_id().toString());
			detailTiVO.add(a.getClaVO().getClass_id());
			detailTiVO.add(a.getClaVO().getClass_name());
			detailTiVO.add(a.getTest_startdate().toString());
			detailTiVO.add(a.getTest_enddate().toString());
			tiVO.add(detailTiVO);
		}
		Map<String,List<List<String>>> mapJSON=new HashMap<String,List<List<String>>>();
		mapJSON.put("data",tiVO);
		jsonValue = JSONValue.toJSONString(mapJSON);
		return jsonValue;
	}
	
	public String findByPrimaryKeyTiToJSON(Integer test_interval_id) throws SQLException{
		List tis=new LinkedList();
		Test_intervalVO tiVO=dao.findByPrimaryKey(test_interval_id);
		String jsonString= null;
			Map<String,String> map = new HashMap<String,String>();
			map.put("test_interval_id",tiVO.getTest_interval_id().toString());
			map.put("class_id",tiVO.getClaVO().getClass_id());
			map.put("class_name",tiVO.getClaVO().getClass_name());
			map.put("test_startdate",tiVO.getTest_startdate().toString());
			map.put("test_enddate",tiVO.getTest_enddate().toString());
			tis.add(map);
			jsonString = JSONValue.toJSONString(tis);
			return jsonString;
	}
	
	//新增產生Test_Date資料表明細資料
	public void createTestDateDetailData(String class_id,Date test_startdate,Date test_enddate) throws SQLException{
		Test_periodService tpSrc= new Test_periodService();
		Test_DateService tdSrc =  new Test_DateService();
		java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd"); //設定日期格式，年/月/日
		java.util.Date beginDate; //接收開始日期
		java.util.Date endDate; //接收結束日期
		Integer test_people=2; //預設可報名人數為2個人
		Integer exam_people=0; //預設已報名人數為0
		List<Test_periodVO> listTp =  tpSrc.getAllTp(); //取得個時段資料
		long day =0;//相差的天數
		java.sql.Date test_date =null;
		try {
			beginDate = format.parse(test_startdate.toString());
			endDate= format.parse(test_enddate.toString());  
			day=((endDate.getTime()-beginDate.getTime())/(24*60*60*1000))+1; 
			System.out.println("相隔的天數="+day);
			for(Test_periodVO tpVO :listTp){
				Integer test_hour_id  = tpVO.getTest_hour_id();
				java.sql.Time test_starthour = tpVO.getTest_starthour();
				java.sql.Time test_endhour= tpVO.getTest_endhour();
				System.out.println(test_hour_id);
				System.out.println(test_starthour);
				System.out.println(test_endhour);
				for(int i=0;i<day;i++){
					Calendar gc = Calendar.getInstance();
					gc.setTime(beginDate);
					gc.add(Calendar.DAY_OF_MONTH, +i);
					test_date = new java.sql.Date(gc.getTime().getTime());
					tdSrc.insertTd(class_id, test_date, test_people, exam_people, test_hour_id);
				}
			}
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
	}
//Calendar gc = Calendar.getInstance();
//gc.setTime(beginDate);
//gc.add(Calendar.DAY_OF_MONTH, +1 );
//test_date = new java.sql.Date(gc.getTime().getTime());   //gc.getTime()==>型態是java.util.Date  故轉換成java.sql.Date要再getTime()
	
//	求兩個日期之間相隔的天數:
//	Java代碼
//	1. java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");  
//	2. java.util.Date beginDate= format.parse("2007-12-24");  
//	3. java.util.Date endDate= format.parse("2007-12-25");  
//	4. long day=(date.getTime()-mydate.getTime())/(24*60*60*1000);  
//	5. System.out.println("相隔的天數="+day);
	
//	日期比較:簡單的比較可以以字串的形式直接比較,也可使用
//	java.sql.Date.valueOf("2007-03-08").compareTo(java.sql.Date.valueOf("2007-03-18"))方式來比較日期的大小.也可使用java.util.Date.after(java.util.Date)來比較.
//
//	相差時間：
//	long difference=c2.getTimeInMillis()-c1.getTimeInMillis();
//	相差天數：long day=difference/(3600*24*1000)
//	相差小時：long hour=difference/(3600*1000)
//	相差分鐘：long minute=difference/(60*1000)
//	相差秒： long second=difference/1000
	
//	得到2007-12-25日期:
//		Java代碼
//		1. Calendar calendar = new GregorianCalendar(2007, 11, 25,0,0,0);  
//		2. Date date = calendar.getTime();  
//		3. System.out.println("2007 Christmas is:"+format.format(date));
//
//		java月份是從0-11,月份設置時要減1.
//
//		GregorianCalendar構造方法參數依次為：年，月-1，日，時，分，秒.
//
//		取日期的部分:
//		Java代碼
//		1. int year =calendar.get(Calendar.YEAR);  
//		2. 
//		3. int month=calendar.get(Calendar.MONTH)+1;  
//		4. 
//		5. int day =calendar.get(Calendar.DAY_OF_MONTH);  
//		6. 
//		7. int hour =calendar.get(Calendar.HOUR_OF_DAY);  
//		8. 
//		9. int minute =calendar.get(Calendar.MINUTE);  
//		10. 
//		11. int seconds =calendar.get(Calendar.SECOND);
//
//
//		取月份要加1.
	//刪除對應的class_id ----Test_Date資料表明細資料
		public void deleteTestDateDetailData(String class_id) throws SQLException{
			Test_DateService tdSrc =  new Test_DateService();
			List<Test_DateVO> list = tdSrc.getAllTdClassId(class_id);
			for(Test_DateVO tdVO : list){
				Integer test_date_id= tdVO.getTest_date_id();
				tdSrc.deleteTd(test_date_id);
			}
		}
		
		
		
		
		//新增產生Fullcalendar資料表明細資料(無變數產生多時段，簡單來說就是寫死)
		public void createFullcalendarDetailData111(String class_id,Date test_startdate,Date test_enddate) throws SQLException{
			CalendarService calendarSrc = new CalendarService();
			ClassService classSrc = new ClassService();
			ClassVO clas = new ClassVO(); 
			clas = classSrc.findByPrimaryKeyClass(class_id);
			String title0 = null;
			String title1 = "Java(10AM)";
			String title2 = "Java(02PM)";

			java.util.Date test_startdate1 = new Date(-2*60*60*1000);
			java.util.Date test_startdate2 = new Date(2*60*60*1000);

		    java.util.Date test_enddate1 = null;
			String color0 = "#08d572";
			String color1 = "#3A87AD";
			Integer editable =1;
			Integer overlap =1;
			String rendering0="background";
			String rendering1=null;
			String constraint=null;
			Set<StudentVO> set = clas.getStus();
			int count=1;
			for(StudentVO stu :set){
				System.out.println("count============"+count);
				 Integer stu_id = stu.getStu_id();
				 String id = stu_id.toString();
				 calendarSrc.insertCalendar(id, title0, test_startdate, test_enddate, color0, stu_id, editable, overlap, rendering0, constraint);
				 calendarSrc.insertCalendar(id, title1, test_startdate1, test_enddate1, color1, stu_id, editable, overlap, rendering1, constraint);
				 calendarSrc.insertCalendar(id, title2, test_startdate2, test_enddate1, color1, stu_id, editable, overlap, rendering1, constraint);
				count++;
			}
		}
		
		
		//新增產生Fullcalendar含時段........資料表明細資料(變數產生多時段，簡單來說..用這個就對了)
				public void createFullcalendarDetailData(String class_id,Date test_startdate,Date test_enddate) throws SQLException{
					CalendarService calendarSrc = new CalendarService();
					ClassService classSrc = new ClassService();
					ClassVO clas = new ClassVO(); 
					clas = classSrc.findByPrimaryKeyClass(class_id);
					String title0 = null;
					String titleValue = "Java";
					java.util.Date test_enddate1 = null;
					String color0 = "#08d572";
					String color1 = "#3A87AD";
					Integer editable =1;
					Integer overlap =1;
					String rendering0="background";
					String rendering1=null;
					String constraint=null;
					
					Set<StudentVO> set = clas.getStus();
					for(StudentVO stu :set){
						 Integer stu_id = stu.getStu_id();
						 String id = stu_id.toString();
						 calendarSrc.insertCalendar(id, title0, test_startdate, test_enddate, color0, stu_id, editable, overlap, rendering0, constraint);
						 Test_periodService tpSrc =new Test_periodService();
						 List<Test_periodVO> list = tpSrc.getAllTp();
						for(Test_periodVO tpVO :list){
							Integer timeValue = Integer.parseInt(tpVO.getTest_starthour().toString().substring(0,2));
							System.out.println("抓取到的時段為===="+timeValue);
							String title = titleValue+"("+timeValue+":00)";
							java.util.Date test_startdate1 = new Date((timeValue-8)*60*60*1000);
							 calendarSrc.insertCalendar(id, title, test_startdate1, test_enddate1, color1, stu_id, editable, overlap, rendering1, constraint);
							
							
						}
						 
						
					}
				}
		
	
				
		//方法結束
	
	

	
}
