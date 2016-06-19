package Examiner_offday.model;


import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

import Employee.model.EmployeeDAO;
import Employee.model.EmployeeVO;



import hibernate.util.HibernateUtil;




public class Examiner_offdayDAO implements IExaminer_offdayDAO {
	
		private static final String GET_ALL_STMT = 

			"from Examiner_offdayVO order by exam_id";
		private static final String GET_EXAMINER_OFFDAY_By_EMPID = 
				"from Examiner_offdayVO where empid=?";	



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
			Examiner_offdayVO aa;
			try {
				aa = dao.findByPrimaryKey(1);
				System.out.println(aa);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			


		}


		@Override
			public List<Examiner_offdayVO> findByEmpForExamier(Integer exam_id) {
				List<Examiner_offdayVO> list = null;
				Session session = HibernateUtil.getSessionFactory().getCurrentSession();
				try {
					session.beginTransaction();
					Query query = session.createQuery(GET_ALL_STMT);
					list = query.list();
					for(Iterator iter = list.iterator();iter.hasNext();) {
						Examiner_offdayVO vo = 
								(Examiner_offdayVO) iter.next();
						/*org.hibernate.Hibernate.initialize(vo.getEmpVO());*/
						org.hibernate.Hibernate.initialize(vo.getEmpVO().getStu_additionalVO());
					}
					session.getTransaction().commit();
				} catch (RuntimeException ex) {
					session.getTransaction().rollback();
					throw ex;
				}
				return list;
			}

}
