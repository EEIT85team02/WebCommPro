package Stu_additional.model;

import hibernate.util.HibernateUtil;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import Member_status.model.Member_statusVO;

public class Stu_additionalDAO implements IStu_additionalDAO{
	private static final String GET_ALL_STMT = 
			"from Stu_additionalVO order by stu_id";
	
	public List<Stu_additionalVO> getAll() {
		List<Stu_additionalVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

}
