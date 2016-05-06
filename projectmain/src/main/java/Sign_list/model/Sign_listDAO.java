package Sign_list.model;



import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import hibernate.util.HibernateUtil;




public class Sign_listDAO implements ISign_listDAO {
	
		private static final String GET_ALL_STMT = 
			"from Sign_list order by sl_id";


		public void insert(Sign_listVO sig) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				session.saveOrUpdate(sig);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}



		public void update(Sign_listVO sig) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				session.saveOrUpdate(sig);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}

		public void delete(Integer sl_id) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				Sign_listVO sig = (Sign_listVO) session.get(Sign_listVO.class, sl_id);
				session.delete(sig);
				session.getTransaction().commit();	
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}
		

		public Sign_listVO findByPrimaryKey(Integer sl_id) {
			Sign_listVO sig = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				sig = (Sign_listVO) session.get(Sign_listVO.class, sl_id);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return sig;
		}

		public List<Sign_listVO> getAll() {
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
