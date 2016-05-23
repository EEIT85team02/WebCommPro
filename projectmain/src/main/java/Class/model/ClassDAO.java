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
		
		public static void main(String[] args) {

			IClassDAO dao = new ClassDAO();
			List<ClassVO> list1;
			try {
				list1 = dao.getAll();
				for (ClassVO cla : list1) {
					System.out.println(cla.getClass_id());
					System.out.println(cla.getClass_name() );
					System.out.println(cla.getClass_contact());
					System.out.println(cla.getClass_teach());
					System.out.println(cla.getEduVO().getEdu_id());
					System.out.println(cla.getEduVO().getEdu_name());
						
						
					}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			
			
		}
		


}
