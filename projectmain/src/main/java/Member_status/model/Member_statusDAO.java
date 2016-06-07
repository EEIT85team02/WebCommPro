package Member_status.model;



import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

import Stu_additional.model.Stu_additionalVO;
import hibernate.util.HibernateUtil;




public class Member_statusDAO implements IMember_statusDAO {
	
		private static final String GET_ALL_STMT = 
			"from Member_statusVO order by sta_id";


		public void insert(Member_statusVO mem) {
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



		public void update(Member_statusVO mem) {
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
				Member_statusVO mem = (Member_statusVO) session.get(Member_statusVO.class, sta_id);
				session.delete(mem);
				session.getTransaction().commit();	
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}
		

		public Member_statusVO findByPrimaryKey(Integer sta_id) {
			Member_statusVO mem = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				mem = (Member_statusVO) session.get(Member_statusVO.class, sta_id);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return mem;
		}

		public List<Member_statusVO> getAll() {
			List<Member_statusVO> list = null;
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
		
			public List<Member_statusVO> getStatusOK() {
			List<Member_statusVO> list = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				Query query = session.createQuery("from Member_statusVO where sta_name=:sta_name");
				Member_statusVO member_statusVO = new Member_statusVO();
				member_statusVO.setSta_name("已核准"); 
				query.setProperties(member_statusVO);
				list = query.list();
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return list;
		}
			public List<Member_statusVO> getStatusNO() {
				List<Member_statusVO> list = null;
				Session session = HibernateUtil.getSessionFactory().getCurrentSession();
				try {
					session.beginTransaction();
					Query query = session.createQuery("from Member_statusVO where sta_name=:sta_name");
					Member_statusVO member_statusVO = new Member_statusVO();
					member_statusVO.setSta_name("未核准"); 
					query.setProperties(member_statusVO);
					list = query.list();
					session.getTransaction().commit();
				} catch (RuntimeException ex) {
					session.getTransaction().rollback();
					throw ex;
				}
				return list;
			}
			public List<Member_statusVO> getStatusNEVER() {
				List<Member_statusVO> list = null;
				Session session = HibernateUtil.getSessionFactory().getCurrentSession();
				try {
					session.beginTransaction();
					Query query = session.createQuery("from Member_statusVO where sta_name=:sta_name");
					Member_statusVO member_statusVO = new Member_statusVO();
					member_statusVO.setSta_name("未報名"); 
					query.setProperties(member_statusVO);
					list = query.list();
					session.getTransaction().commit();
				} catch (RuntimeException ex) {
					session.getTransaction().rollback();
					throw ex;
				}
				return list;
			}
			public List<Member_statusVO> getStatusYES() {
				List<Member_statusVO> list = null;
				Session session = HibernateUtil.getSessionFactory().getCurrentSession();
				try {
					session.beginTransaction();
					Query query = session.createQuery("from Member_statusVO where sta_name=:sta_name");
					Member_statusVO member_statusVO = new Member_statusVO();
					member_statusVO.setSta_name("已錄取"); 
					query.setProperties(member_statusVO);
					list = query.list();
					session.getTransaction().commit();
				} catch (RuntimeException ex) {
					session.getTransaction().rollback();
					throw ex;
				}
				return list;
			}
			public List<Member_statusVO> getStatusNYES() {
				List<Member_statusVO> list = null;
				Session session = HibernateUtil.getSessionFactory().getCurrentSession();
				try {
					session.beginTransaction();
					Query query = session.createQuery("from Member_statusVO where sta_name=:sta_name");
					Member_statusVO member_statusVO = new Member_statusVO();
					member_statusVO.setSta_name("未錄取"); 
					query.setProperties(member_statusVO);
					list = query.list();
					session.getTransaction().commit();
				} catch (RuntimeException ex) {
					session.getTransaction().rollback();
					throw ex;
				}
				return list;
			}



			@Override
			public Set<Stu_additionalVO> getStuBySta_id(Integer sta_id)
					throws SQLException {
				Set<Stu_additionalVO> set = findByPrimaryKey(sta_id).getStu_additionalVO();
				return set;
			}


}
