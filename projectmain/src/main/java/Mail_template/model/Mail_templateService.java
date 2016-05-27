package Mail_template.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.simple.JSONValue;



public class Mail_templateService {
	private IMail_templateDAO dao;

	public Mail_templateService() {
		dao= new Mail_templateDAO();
	}
	
	
	public void insertMail( String mail_name, String mail_text) throws SQLException {
		Mail_templateVO mailVO = new Mail_templateVO();
		mailVO.setMail_name(mail_name);
		mailVO.setMail_text(mail_text);
		dao.insert(mailVO);
	}
	
	public void updateMail(Integer mail_id,String mail_name, String mail_text) throws SQLException {
		Mail_templateVO mailVO = new Mail_templateVO();
		mailVO.setMail_id(mail_id);
		mailVO.setMail_name(mail_name);
		mailVO.setMail_text(mail_text);
		
		dao.update(mailVO);
	}
	public void deleteMail(Integer mail_id) throws SQLException{
		dao.delete(mail_id);
	}
	public Mail_templateVO findByPrimaryKeyMail(Integer mail_id) throws SQLException{
		return dao.findByPrimaryKey(mail_id);
	}
	public List<Mail_templateVO> getAllMail() throws SQLException{
		return dao.getAllMail();
	}
	public String getAllMailToJSON() throws SQLException{
		List mails=new LinkedList();
		List<Mail_templateVO> list=dao.getAllMail();
		String jsonString= null;
		for(Mail_templateVO mailVO :list){
			Map<String,String> map = new HashMap<String,String>();
			map.put("mail_id",mailVO.getMail_id().toString());
			map.put("mail_name",mailVO.getMail_name());
			map.put("mail_text",mailVO.getMail_text());
			mails.add(map);
		}
		jsonString = JSONValue.toJSONString(mails);
		return jsonString;
	}
	
	public String getAllMailToJSONInitTable() throws SQLException{
		List<Mail_templateVO> list=dao.getAllMail();
		List<List<String>> mailVO = new LinkedList<List<String>>();
		String jsonValue = null;
		for(Mail_templateVO a :list){
			List<String> detailMailVO = new ArrayList<String>();
			detailMailVO.add(a.getMail_id().toString());
			detailMailVO.add(a.getMail_name());
			detailMailVO.add(a.getMail_text());
			mailVO.add(detailMailVO);
		}
		Map<String,List<List<String>>> mapJSON=new HashMap<String,List<List<String>>>();
		mapJSON.put("data",mailVO);
		jsonValue = JSONValue.toJSONString(mapJSON);
		return jsonValue;
	}
	
	public String findByPrimaryKeyMailToJSON(Integer mail_id) throws SQLException{
		List mails=new LinkedList();
		Mail_templateVO mailVO=dao.findByPrimaryKey(mail_id);
		String jsonString= null;
			Map<String,String> map = new HashMap<String,String>();
			map.put("mail_id",mailVO.getMail_id().toString());
			map.put("mail_name",mailVO.getMail_name());
			map.put("mail_text",mailVO.getMail_text());
			mails.add(map);
			jsonString = JSONValue.toJSONString(mails);
			return jsonString;
	}

}
