package Talk.model;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import Edu.model.EduVO;



public interface ITalkDAO {
	public void insert(TalkVO talk) throws SQLException;
	public void update(Integer talkId,String retalkContent,Timestamp retalkDate,Integer talkstatus) throws SQLException;
	public void delete(Integer talkId) throws SQLException;
	public TalkVO findByPrimaryKey(Integer talkId) throws SQLException;
	public List<TalkVO> getAll() throws SQLException;
}
