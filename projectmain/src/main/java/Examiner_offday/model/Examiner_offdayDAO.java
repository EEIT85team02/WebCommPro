package Examiner_offday.model;


import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.util.HibernateUtil;




public class Examiner_offdayDAO implements IExaminer_offdayDAO {
	
		private static final String GET_ALL_STMT = 
			"from Examiner_offdayVO order by emp_id";


		public void insert(Examiner_offdayVO exa) {
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



		public void update(Examiner_offdayVO exa) {
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
				Examiner_offdayVO exa = (Examiner_offdayVO) session.get(Examiner_offdayVO.class, emp_id);
				session.delete(exa);
				session.getTransaction().commit();	
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}
		

		public Examiner_offdayVO findByPrimaryKey(String emp_id) {
			Examiner_offdayVO exa = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				exa = (Examiner_offdayVO) session.get(Examiner_offdayVO.class, emp_id);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return exa;
		}

		public List<Examiner_offdayVO> getAll() {
			List<Examiner_offdayVO> list = null;
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
		public static void main(String[] args) {
			
			Examiner_offdayDAO eo=new Examiner_offdayDAO();
			Examiner_offdayVO eog=eo.findByPrimaryKey("7004");

			System.out.println(eog.getEmp_id());


		}

}
