package Talk.model;


import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import Edu.model.EduVO;
import hibernate.util.HibernateUtil;




public class TalkDAO implements ITalkDAO {
	
		private static final String GET_ALL_STMT = 
			"from TalkVO order by talkId";
		private static final String UPDATE_STMT=
			"UPDATE TalkVO SET  retalkContent=:retalkContent,retalkDate=:retalkDate,talkstatus=:talkstatus  WHERE talkId =:talkId";
		public void insert(TalkVO talk) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				session.saveOrUpdate(talk);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}
		public void update(Integer talkId,String retalkContent,Timestamp retalkDate,Integer talkstatus) throws SQLException{
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				Query query = session.createQuery(UPDATE_STMT);
				query.setParameter("retalkContent", retalkContent);
				query.setParameter("retalkDate", retalkDate);
				query.setParameter("talkstatus", talkstatus);
				query.setParameter("talkId", talkId);
				query.executeUpdate();
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			
			
		}
		

		public void delete(Integer talkId) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				TalkVO talk = (TalkVO) session.get(TalkVO.class, talkId);
				session.delete(talk);
				session.getTransaction().commit();	
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}
		
		public TalkVO findByPrimaryKey(Integer talkId) throws SQLException{
			TalkVO talk = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				talk = (TalkVO) session.get(TalkVO.class, talkId);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return talk;
		}
			
			
		
		

		public List<TalkVO> getAll() {
			List<TalkVO> list = null;
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
		
		public static void main(String[]args){
			
			java.sql.Timestamp today= new java.sql.Timestamp(new java.util.Date().getTime());
			ITalkDAO dao = new TalkDAO();
			try {
				dao.update(3,"",today,1);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}


}
