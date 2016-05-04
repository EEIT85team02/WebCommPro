package Member_status.model;



import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import hibernate.util.HibernateUtil;




public class Member_statusDAO implements IMember_statusDAO {
	
		private static final String GET_ALL_STMT = 
			"from Member_status order by sta_id";


		public void insert(Member_status mem) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				session.saveOrUpdate(mem);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}



		public void update(Member_status mem) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				session.saveOrUpdate(mem);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}

		public void delete(Integer sta_id) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				Member_status mem = (Member_status) session.get(Member_status.class, sta_id);
				session.delete(mem);
				session.getTransaction().commit();	
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}
		

		public Member_status findByPrimaryKey(Integer sta_id) {
			Member_status mem = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				mem = (Member_status) session.get(Member_status.class, sta_id);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return mem;
		}

		public List<Member_status> getAll() {
			List<Member_status> list = null;
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
