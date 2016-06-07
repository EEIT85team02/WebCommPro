package Examiner_offday.model;


import java.sql.SQLException;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.util.HibernateUtil;




public class Examiner_offdayDAO implements IExaminer_offdayDAO {
	
		private static final String GET_ALL_STMT = 
			"from Examiner_offday order by emp_id";


		public void insert(Examiner_offday exa) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				session.saveOrUpdate(exa);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}



		public void update(Examiner_offday exa) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				session.saveOrUpdate(exa);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}

		public void delete(String emp_id) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				Examiner_offday exa = (Examiner_offday) session.get(Examiner_offday.class, emp_id);
				session.delete(exa);
				session.getTransaction().commit();	
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}
		

		public Examiner_offday findByPrimaryKey(String emp_id) {
			Examiner_offday exa = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				exa = (Examiner_offday) session.get(Examiner_offday.class, emp_id);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return exa;
		}

		public List<Examiner_offday> getAll() {
			List<Examiner_offday> list = null;
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
		
		public static void  main(String[] args){
			IExaminer_offdayDAO dao = new Examiner_offdayDAO();
			Examiner_offday vo = new Examiner_offday();
			try {
				vo = dao.findByPrimaryKey("7001");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("vo===="+vo);
			
		}


}
