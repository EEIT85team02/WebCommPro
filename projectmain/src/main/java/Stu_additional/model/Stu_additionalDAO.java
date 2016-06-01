package Stu_additional.model;

import hibernate.util.HibernateUtil;

import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

import Student.model.StudentVO;

public class Stu_additionalDAO implements IStu_additionalDAO{
		private static final String GET_ALL_STMT = 
				"from Stu_additionalVO order by stu_id";
		private static final String GET_STU_ADD_BY_STU_ID = 
				"from Stu_additionalVO where stu_id = ?";		
/*		private static final String GET_STUDENT_By_Class = 
				"from Stu_additionalVO where class_id=?";	*/		
	
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


		public void insert(Stu_additionalVO stu_add) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				session.saveOrUpdate(stu_add);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}



		public void update(Stu_additionalVO stu_add) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				session.saveOrUpdate(stu_add);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}

		public void delete(Integer stu_add_id) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				Stu_additionalVO stu_add = (Stu_additionalVO) session.get(Stu_additionalVO.class, stu_add_id);
				session.delete(stu_add);
				session.getTransaction().commit();	
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}
		
		public List<Stu_additionalVO> findByStu_id(Integer stu_id) throws SQLException {
			//Stu_additionalVO stu_add = null;
			List<Stu_additionalVO> list = null;
			System.out.println("------------------------"+stu_id);
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				Query query = session.createQuery(GET_STU_ADD_BY_STU_ID);
				query.setParameter(0,stu_id);
				list = query.list();
				System.out.println("11111111111"+list);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return list;
		}

		public Stu_additionalVO findByPrimaryKey2(Integer stu_id) {
			Stu_additionalVO stu_add = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				stu_add = (Stu_additionalVO) session.get(Stu_additionalVO.class, stu_id);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return stu_add;
		}
		
		public Stu_additionalVO findByPrimaryKey(Integer stu_add_id) throws SQLException {
			Stu_additionalVO stu_add = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				stu_add = (Stu_additionalVO) session.get(Stu_additionalVO.class, stu_add_id);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return stu_add;
		}
}
