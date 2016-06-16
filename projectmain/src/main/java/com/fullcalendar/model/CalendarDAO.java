package com.fullcalendar.model;

import hibernate.util.HibernateUtil;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;



public class CalendarDAO implements CalendarDAO_interface{
	private static final String GET_ALL_STMT = "from CalendarVO order by orderId";
	private static final String GET_VO_STMT = "from CalendarVO where stu_id=:stu_id and title=:title";
	
	
	@Override
	public void insert(CalendarVO calendarVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(calendarVO);// A車
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}		
	}

	@Override
	public void update(CalendarVO calendarVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(calendarVO);// A車
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}		
	}

	@Override
	public void delete(Integer id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			CalendarVO calendarVO = (CalendarVO) session.get(CalendarVO.class, id);// A車
			session.delete(calendarVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}				
	}

	@Override
	public CalendarVO findByPrimaryKey(Integer orderId) {
		CalendarVO calendarVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			calendarVO = (CalendarVO) session.get(CalendarVO.class, orderId);// A車 - get() 也可用laod()
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return calendarVO;
	}

	@Override
	public List<CalendarVO> getAll() {
		List<CalendarVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);// B車
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
/*
	@Override
	public List<CalendarVO> findLastUpdateEventsByStudentId(Integer stuID) {// 這邊的id不是primary key 而是某位人的id
		List<CalendarVO> list = new ArrayList<CalendarVO>();
		List<CalendarVO> events = new ArrayList<CalendarVO>();
		Set<String> eventidset = new LinkedHashSet<String>();
		List<CalendarVO> latestList = new ArrayList<CalendarVO>();
		
		//取得同所有人的所有events 紀錄
		list = getAll();
		for(CalendarVO one:list){
			if(one.getStudentVO().getStuID().equals(stuID)){
				//取得同一個人的所有events
				events.add(one);
				//取得事件的種類數目 不重複
				eventidset.add(one.getId());
			}
		}
		
		for(String oneid:eventidset){
			CalendarVO latestone = null;
			int a=0;
			for(CalendarVO one:events){
				// 固定某事件不變 
				if(one.getId().equals(oneid)){
					if(a==0){
						//判斷誰是最新的事件
						a=one.getOrderId().intValue();//a沒值 先賦值
						latestone = one;
					}else{
						latestone=a>=one.getOrderId().intValue()?latestone:one;//比較a與相同事件之間的大小 只留比較大的! 
					}
				}
			}
			latestList.add(latestone);
		}
		
		return latestList;
	}	
	
	*/

	@Override
	public List<CalendarVO> findLastUpdateEventsByStudentId(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	//--2016/06/16處理當使用者報名成立時，將資料查詢出來塞回stu_additional
	public List<CalendarVO> findStu_additionalDetailData(Integer stu_id,String title){
		List<CalendarVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_VO_STMT);// B車
			query.setParameter("stu_id", stu_id);
			query.setParameter("title", title);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
		
		
	}

	
	public static void main(String args[]){
	CalendarDAO_interface dao = new CalendarDAO();
//	dao.findByPrimaryKey(new Integer("1"));
//	dao.getAll();
	List<CalendarVO> list = null;
	try {
		list = dao.findStu_additionalDetailData(18,"Java");
		for(CalendarVO aa :list){
			System.out.println(aa.getTitle());
			System.out.println(aa.getStudentVO().getStu_id());
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
}





}
