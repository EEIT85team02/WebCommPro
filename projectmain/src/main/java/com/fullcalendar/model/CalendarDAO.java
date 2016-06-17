package com.fullcalendar.model;

import hibernate.util.HibernateUtil;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;

public class CalendarDAO implements CalendarDAO_interface {
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
			CalendarVO calendarVO = (CalendarVO) session.get(CalendarVO.class,
					id);// A車
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
			calendarVO = (CalendarVO) session.get(CalendarVO.class, orderId);// A車
																				// -
																				// get()
																				// 也可用laod()
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

	/**
	 * 非傳統CRUD 【依賴DB來運算】
	 */
	// 所有
	@Override
	public List<CalendarVO> getAllEventsForAdm() { // 取得最新所有事件【給主考官或者管理者使用】
		List<CalendarVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Property title = Property.forName("title");
			Property start = Property.forName("start");

			Criteria query = session.createCriteria(CalendarVO.class)
					.add(Restrictions.disjunction().add(title.isNotNull()))
					.add(Restrictions.disjunction().add(start.isNotNull()));
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	
	// 別人已定
	@Override
	public List<CalendarVO> getAllOthersEvents(Integer stuID) {
		List<CalendarVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Property title = Property.forName("title");
			Property start = Property.forName("start");
			Property end = Property.forName("end");
			// Property id = Property.forName("id");

			Criteria query = session.createCriteria(CalendarVO.class)
					.add(Restrictions.disjunction().add(title.isNotNull()))
					.add(Restrictions.disjunction().add(end.isNotNull()))
					.add(Restrictions.disjunction().add(start.isNotNull()))
					.add(Restrictions.not(Restrictions.eq("id", "" + stuID)));
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	// 自己未定
	public List<CalendarVO> getEventsToken(Integer stuID) {
		List<CalendarVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Property title = Property.forName("title");
			Property start = Property.forName("start");
			Property end = Property.forName("end");
			// Property id = Property.forName("id");

			Criteria query = session.createCriteria(CalendarVO.class)
					.add(title.isNotNull())
					.add(Restrictions.not(Restrictions.disjunction().add(end.isNotNull())))
					.add(Restrictions.disjunction().add(start.isNotNull()))
					.add(Restrictions.eq("id", "" + stuID));
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
		
		
	}
	// 自己已定
	public List<CalendarVO> getLatestEvents(Integer stuID){
		List<CalendarVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Property title = Property.forName("title");
			Property start = Property.forName("start");
			Property end = Property.forName("end");
			// Property id = Property.forName("id");

			Criteria query = session.createCriteria(CalendarVO.class)
					.add(title.isNotNull())
					.add(Restrictions.disjunction().add(end.isNotNull()))
					.add(Restrictions.disjunction().add(start.isNotNull()))
					.add(Restrictions.eq("id", "" + stuID));
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	// 限制
	public List<CalendarVO> getConstrains(Integer stuID) {
		List<CalendarVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Property title = Property.forName("title");
			Property start = Property.forName("start");
			Property end = Property.forName("end");
			// Property id = Property.forName("id");

			Criteria query = session.createCriteria(CalendarVO.class)
					.add(Restrictions.not(Restrictions.disjunction().add(title.isNotNull())))
					.add(Restrictions.disjunction().add(end.isNotNull()))
					.add(Restrictions.disjunction().add(start.isNotNull()))
					.add(Restrictions.eq("id", "" + stuID));
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;		
	}

	//--2016/06/16處理當使用者報名成立時，將資料查詢出來塞回stu_additional
	@Override
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
	
	public static void main(String args[]) {
		CalendarDAO_interface dao = new CalendarDAO();
		// List<CalendarVO> calendarVOs = dao.getAllOthersEvents();
		// for(CalendarVO one:calendarVOs){
		// System.out.println(one.getTitle());
		// }
		// dao.findByPrimaryKey(new Integer("1"));
		// dao.getAll();
		List<CalendarVO> calendarVOs = dao
				.getLatestEvents(new Integer("17"));
//		.getConstrains(new Integer("18"));
//		.getEventsToken(new Integer("18"));
//		.getAllOthersEvents(new Integer("18"));
		int max = calendarVOs.size();
		for (int i = 0; i < max; i++) {
			System.out.println(calendarVOs.get(i).getOrderId());
//			System.out.println(calendarVOs.get(i).getTitle());
			System.out.println(calendarVOs.get(i).getColor());
			// System.out.println(dao.getAllOthersEvents().size());

		}

	}

	

	


}
