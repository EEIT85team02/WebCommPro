package Employee.model;


import java.sql.SQLException;
import java.util.List;

import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

import Stu_additional.model.Stu_additionalVO;
import hibernate.util.HibernateUtil;




public class EmployeeDAO implements IEmployeeDAO {
	
		private static final String GET_ALL_STMT = 
			"from EmployeeVO where sl_id<>0 order by emp_id";


//		public void insert(EmployeeVO empVO) {
//			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//			try {
//				session.beginTransaction();
//				session.saveOrUpdate(empVO);
//				session.getTransaction().commit();
//			} catch (RuntimeException ex) {
//				session.getTransaction().rollback();
//				throw ex;
//			}
//		}


		public void update(EmployeeVO empVO) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				session.saveOrUpdate(empVO);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}


//		public void delete(String emp_id) {
//			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//			try {
//				session.beginTransaction();
//				//ClassVO cla = (ClassVO) session.get(ClassVO.class, class_id);
//				EmployeeVO empVO = new EmployeeVO(); //刪除關聯
//				empVO.setEmp_id(emp_id);
//				
//				session.delete(empVO);
//				session.getTransaction().commit();	
//			} catch (RuntimeException ex) {
//				session.getTransaction().rollback();
//				throw ex;
//			}
//		}

		

		public EmployeeVO findByPrimaryKey(String emp_id) {

			EmployeeVO empVO = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();

				empVO =(EmployeeVO) session.get(EmployeeVO.class, emp_id);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return empVO;
		}

		
		public List<EmployeeVO> getAllEmp() {
			List<EmployeeVO> list = null;
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
		
//		public List<ClassVO> getAllClass() {
//			List<ClassVO> list = null;
//			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//			try {
//				session.beginTransaction();
//				Query query = session.createQuery(GET_ALL_Class);
//				list = query.list();
//				System.out.println("query.list()======"+query.list());
//				session.getTransaction().commit();
//			} catch (RuntimeException ex) {
//				session.getTransaction().rollback();
//				throw ex;
//			}
//			return list;
//		}	


		@Override
		public Set<Stu_additionalVO> getEmpByEmp_id(String emp_id)
				throws SQLException {
			Set<Stu_additionalVO> set = findByPrimaryKey(emp_id).getStu_additionalVO();
			return null;
		}


}
