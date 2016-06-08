package Talk.model;

import java.sql.SQLException;
import java.util.List;



public interface ITalkDAO {
	public void insert(TalkVO talk) throws SQLException;
	public void delete(Integer talkId) throws SQLException;
	public List<TalkVO> getAll() throws SQLException;
}
