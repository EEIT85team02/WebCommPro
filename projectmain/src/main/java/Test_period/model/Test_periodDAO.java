package Test_period.model;



import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

import Stu_additional.model.Stu_additionalVO;
import hibernate.util.HibernateUtil;




public class Test_periodDAO implements ITest_periodDAO {
	
		private static final String GET_ALL_STMT = 
			"from Test_periodVO order by test_hour_id";


		public void insert(Test_periodVO tpVO) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				session.saveOrUpdate(tpVO);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}



		public void update(Test_periodVO tpVO) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				session.saveOrUpdate(tpVO);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}

		public void delete(Integer test_hour_id) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				Test_periodVO tpVO = (Test_periodVO) session.get(Test_periodVO.class, test_hour_id);
				session.delete(tpVO);
				session.getTransaction().commit();	
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}
		

		public Test_periodVO findByPrimaryKey(Integer test_hour_id) {
			Test_periodVO tpVO = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				tpVO = (Test_periodVO) session.get(Test_periodVO.class, test_hour_id);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return tpVO;
		}

		public List<Test_periodVO> getAll() {
			List<Test_periodVO> list = null;
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



		@Override
		public Set<Stu_additionalVO> getTestHourByTest_hour_id(
				Integer test_hour_id) throws SQLException {
			Set<Stu_additionalVO> set = findByPrimaryKey(test_hour_id).getStu_additionalVO();
			return null;
		}


}
