package Class.model;


import java.sql.SQLException;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import Edu.model.EduDAO;
import Edu.model.EduVO;
import Edu.model.IEduDAO;
import hibernate.util.HibernateUtil;




public class ClassDAO implements IClassDAO {
	
		private static final String GET_ALL_STMT = 
			"from ClassVO order by class_id";
		
		private static final String CheckClassId_STMT = 
				"select count(*) as count from ClassVO where class_id = :class_id";
		private static final String GET_ALL_Class = 
				"from ClassVO";

		public void insert(ClassVO cla) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				session.saveOrUpdate(cla);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}



		public void update(ClassVO cla) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				session.saveOrUpdate(cla);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}

		public void delete(String class_id) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				//ClassVO cla = (ClassVO) session.get(ClassVO.class, class_id);
				ClassVO cla = new ClassVO(); //刪除關聯
				cla.setClass_id(class_id);
				
				session.delete(cla);
				session.getTransaction().commit();	
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}
		

		public ClassVO findByPrimaryKey(String class_id) {
			ClassVO cla = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				cla =(ClassVO) session.get(ClassVO.class, class_id);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return cla;
		}
		
//		public String CheckClassId(String class_id) {
//			String msg = null;
//			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//			try {
//				msg= "帳號不存在";
//				session.beginTransaction();
//				Query query = session.createQuery(CheckClassId_STMT);
//				query.setParameter("class_id", class_id);
//				long count = (Long)(query.list().get(0));
//				session.getTransaction().commit();
//				if(count != 0 ){
//					msg= "帳號已存在";
//				}
//			} catch (RuntimeException ex) {
//				session.getTransaction().rollback();
//				throw ex;
//			}
//			return msg;
//		}

		public List<ClassVO> getAll() {
			List<ClassVO> list = null;
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
		
		public List<ClassVO> getAllClass() {
			List<ClassVO> list = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				Query query = session.createQuery(GET_ALL_Class);
				list = query.list();
				System.out.println("query.list()======"+query.list());
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return list;
		}	
		
		
		public static void main(String[] args) {

			IClassDAO dao = new ClassDAO();
			List<ClassVO> list1;
			ClassVO msg = null;
			try {
				msg = dao.findByPrimaryKey("EEIT84");
				System.out.println(msg);
//				list1 = dao.getAll();
//				for (ClassVO cla : list1) {
//					System.out.println(cla.getClass_id());
//					System.out.println(cla.getClass_name() );
//					System.out.println(cla.getClass_contact());
//					System.out.println(cla.getClass_teach());
//					System.out.println(cla.getEduVO().getEdu_id());
//					System.out.println(cla.getEduVO().getEdu_name());
//						
//						
//					}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			
			
		}
		


}
