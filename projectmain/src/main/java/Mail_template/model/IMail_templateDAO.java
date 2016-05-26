package Mail_template.model;

import java.sql.SQLException;
import java.util.List;



public interface IMail_templateDAO {
	public void insert(Mail_templateVO mailVO) throws SQLException;
	public void update(Mail_templateVO mailVO) throws SQLException;
	public void delete(Integer mail_id) throws SQLException;
	public Mail_templateVO findByPrimaryKey(Integer mail_id) throws SQLException;
	public List<Mail_templateVO> getAllMail() throws SQLException;
	public List<Mail_templateVO> getAll() throws SQLException;	
}

