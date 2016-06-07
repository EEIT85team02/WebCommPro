package Examiner_offday.model;


import java.sql.SQLException;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.util.HibernateUtil;




public class Examiner_offdayDAO implements IExaminer_offdayDAO {
	
		private static final String GET_ALL_STMT = 

			"from Examiner_offdayVO order by exam_id";




		public void update(Examiner_offdayVO examVO) {

			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				session.saveOrUpdate(examVO);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}


		public Examiner_offdayVO findByPrimaryKey(Integer exam_id) {
			Examiner_offdayVO examVO = null;

			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				examVO = (Examiner_offdayVO) session.get(Examiner_offdayVO.class, exam_id);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return examVO;
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

		

		public static void main(String[] args){
			IExaminer_offdayDAO dao = new Examiner_offdayDAO();
			List<Examiner_offdayVO> aa;
			try {
				aa = dao.getAll();
				System.out.println(aa);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			


		}


}
