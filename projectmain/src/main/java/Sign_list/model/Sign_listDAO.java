package Sign_list.model;



import hibernate.util.HibernateUtil;

import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

import Class.model.ClassVO;





public class Sign_listDAO implements ISign_listDAO {
	
		private static final String GET_ALL_STMT = 
			"from Sign_listVO where sl_id<>0 order by emp_id";


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

		

//		public static void main(String[] args) {
//
//			IEduDAO dao = new EduDAO();
//			List<EduVO> list1;
//			try {
//				list1 = dao.getAll();
//				for (EduVO edu : list1) {
//					System.out.print(edu.getEdu_id());
//					System.out.print(edu.getEdu_name() );
//					System.out.print(edu.getEdu_add());
//					System.out.print(edu.getEdu_tel());
//					System.out.print(edu.getEdu_contact());
//					System.out.println();
//				}
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		
//			
//			
//		}
		
		
		
		
		
		

}
