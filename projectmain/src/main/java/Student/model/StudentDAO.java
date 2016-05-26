package Student.model;


import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.util.HibernateUtil;




public class StudentDAO implements IStudentDAO {
	
		private static final String GET_ALL_STMT = 
			"from StudentVO order by stu_id";
		private static final String GET_ALL_GMAIL = 
				"select stu_email from Student where stu_email like '%@gmail.com'";	
		private static final String GET_ALL_NONGMAIL = 
				"select stu_email from Student where stu_email not like '%@gmail.com'";	
		private static final String GET_ALL_Class = 
				"select distinct class_id from Student";		
		private static final String GET_STUDENT_By_Class = 
				"from StudentVO where class_id=?";			
		public void insert(StudentVO stu) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				session.saveOrUpdate(stu);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}



		public void update(StudentVO stu) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				session.saveOrUpdate(stu);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}

		public void delete(String stu_id) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				StudentVO stu = (StudentVO) session.get(StudentVO.class, stu_id);
				session.delete(stu);
				session.getTransaction().commit();	
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}
		

		public StudentVO findByPrimaryKey(String stu_id) {
			StudentVO stu = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				stu = (StudentVO) session.get(StudentVO.class, stu_id);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return stu;
		}

		public List<StudentVO> getAll() {
			List<StudentVO> list = null;
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
		public List<String> getAllGmail() {
			List<String> list = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				Query query = session.createQuery(GET_ALL_GMAIL);
				list = query.list();
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return list;
		}
		public List<String> getAllNonGmail() {
			List<String> list = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				Query query = session.createQuery(GET_ALL_NONGMAIL);
				list = query.list();
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return list;
		}
		public List<String> getAllClass() {
			List<String> list = null;
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
		//輸入class抓全部學生
		public List<StudentVO> getAllStudentByClass(String class_id) {
			List<StudentVO> list = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				

				Query query = session.createQuery(GET_STUDENT_By_Class);
				query.setParameter(0, class_id);
				list = query.list();
				System.out.println("query.list()======"+query.list());
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return list;
		}			
		
		
}
