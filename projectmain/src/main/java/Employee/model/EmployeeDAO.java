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
			"from Employee order by emp_id";


		public void insert(EmployeeVO emp) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				session.saveOrUpdate(emp);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}



		public void update(EmployeeVO emp) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				session.saveOrUpdate(emp);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}

		public void delete(String emp_id) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				EmployeeVO emp = (EmployeeVO) session.get(EmployeeVO.class, emp_id);
				session.delete(emp);
				session.getTransaction().commit();	
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}
		

		public EmployeeVO findByPrimaryKey(String emp_id) {
			EmployeeVO emp = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				emp = (EmployeeVO) session.get(EmployeeVO.class, emp_id);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return emp;
		}

		public List<EmployeeVO> getAll() {
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



		@Override
		public Set<Stu_additionalVO> getEmpByEmp_id(String emp_id)
				throws SQLException {
			Set<Stu_additionalVO> set = findByPrimaryKey(emp_id).getStu_additionalVO();
			return null;
		}


}
