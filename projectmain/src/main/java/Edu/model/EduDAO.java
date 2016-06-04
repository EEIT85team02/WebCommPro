package Edu.model;



import hibernate.util.HibernateUtil;

import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

import Class.model.ClassVO;




public class EduDAO implements IEduDAO {
	
		private static final String GET_ALL_STMT = 
			"from EduVO";
		
		
		public void insert(EduVO edu) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				session.saveOrUpdate(edu);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}



		public void update(EduVO edu) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				session.saveOrUpdate(edu);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}

		public void delete(Integer edu_id) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				EduVO edu = (EduVO) session.get(EduVO.class, edu_id);
				session.delete(edu);
				session.getTransaction().commit();	
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}
		

		public EduVO findByPrimaryKey(Integer edu_id) {
			EduVO edu = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				edu = (EduVO) session.get(EduVO.class, edu_id);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return edu;
		}

		public List<EduVO> getAll() {
			List<EduVO> list = null;
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

		public Set<ClassVO> getClasByEdu_id(Integer edu_id) {		
			Set<ClassVO> set = findByPrimaryKey(edu_id).getClas();
			return set;
		}
		
		
		
		
		
		public static void main(String[] args) throws Exception {

			IEduDAO dao = new EduDAO();

			List<EduVO> list1;
			int count= 0;
			System.out.println("=============="+ count++);
			try {
				list1 = dao.getAll();
				for (EduVO edu : list1) {
					System.out.print(edu.getEdu_id());
					System.out.print(edu.getEdu_name() );
					System.out.print(edu.getEdu_add());
					System.out.print(edu.getEdu_tel());
					System.out.print(edu.getEdu_contact());
					System.out.println();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			
			
		}
		
		
		
		
		
		

}
