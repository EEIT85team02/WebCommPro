package Sign_list.model;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import hibernate.util.HibernateUtil;


public class xxSign_listDAO implements ISign_listDAO {
	
		private static final String GET_ALL_STMT = 
			"select e.emp_id,e.emp_lastname,e.emp_firstname,e.emp_mail,e.dep_name,e.sl_id,s.sl_name "
			+ "from employee e inner join sign_list s on e.sl_id = s.sl_id";


		public void insert(Sign_listVO slVO) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				session.saveOrUpdate(slVO);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}



		public void update(Sign_listVO slVO) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				session.saveOrUpdate(slVO);
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
				Sign_listVO slVO = (Sign_listVO) session.get(Sign_listVO.class, emp_id);
				session.delete(slVO);
				session.getTransaction().commit();	
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}
		

		public Sign_listVO findByPrimaryKey(String emp_id) {
			Sign_listVO slVO = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				slVO = (Sign_listVO) session.get(Sign_listVO.class, emp_id);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return slVO;
		}

		public List<Sign_listVO> getAllSl() {
			List<Sign_listVO> list = null;
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
