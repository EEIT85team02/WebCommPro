package Talk.model;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.simple.JSONValue;

import Edu.model.EduVO;



public class TalkService {
	private ITalkDAO dao;

	public TalkService() {
		dao= new TalkDAO();
	}
	
	
	public void insertTalk(String talkTitle,String talkName, Integer talkChose,
			String talkMail,String talkContent,String retalkContent,Timestamp talkDate,Timestamp retalkDate,Integer talkstatus) throws SQLException {
		TalkVO talk = new TalkVO();
		talk.setTalkTitle(talkTitle);
		talk.setTalkName(talkName);
		talk.setTalkChose(talkChose);
		talk.setTalkMail(talkMail);
		talk.setTalkContent(talkContent);
		talk.setRetalkContent(retalkContent);
		talk.setTalkDate(talkDate);
		talk.setRetalkDate(retalkDate);
		talk.setTalkstatus(talkstatus);
		dao.insert(talk);
	}
	public void updateTalk(Integer talkId,String retalkContent,Timestamp retalkDate,Integer talkstatus) throws SQLException {
		dao.update(talkId,retalkContent,retalkDate,talkstatus);
	}
	
	public void deleteTalk(Integer talkId) throws SQLException{
		 dao.delete(talkId);
	}
	
	public void deleteTalkMulti(String talkIdJSON) throws SQLException{
		JSONArray ja = new JSONArray(talkIdJSON);//將字串再轉回JSON
		for(int i=0,max=ja.length();i< max;i++){
			String jsonIndex = ja.getString(i);
			Integer talkId = Integer.parseInt(jsonIndex);
			System.out.println("talkId======"+talkId);
			dao.delete(talkId);
		}
	}
	
	
	public List<TalkVO> getAllTalk() throws SQLException{
		return dao.getAll();
	}
	//取得全部資料轉JSON -MAP對應
	public String getAllTalkToJSON() throws SQLException{
		List talks=new LinkedList();
		List<TalkVO> list=dao.getAll();
		String jsonString= null;
		for(TalkVO talk :list){
			Map<String,String> map = new HashMap<String,String>();
			map.put("talkId",talk.getTalkId().toString());
			map.put("talkTitle",talk.getTalkTitle());
			map.put("talkName",talk.getTalkName());
			map.put("talkChose",talk.getTalkChose().toString());
			map.put("talkMail",talk.getTalkMail());
			map.put("talkContent",talk.getTalkContent());
			map.put("retalkContent",talk.getRetalkContent());
			map.put("talkDate",talk.getTalkDate().toString());
			map.put("retalkDate",talk.getRetalkDate().toString());
			map.put("talkstatus",talk.getTalkstatus().toString());
			talks.add(map);
		}
		jsonString = JSONValue.toJSONString(talks);
		return jsonString;
	}
	//取得全部資料轉JSON -資料LIST對應MAP
	public String getAllTalkToJSONInitTable() throws SQLException{
		List<TalkVO> list=dao.getAll();
		List<List<String>> talkVO = new LinkedList<List<String>>();
		String jsonValue = null;
		String talkChose=null;
		String talkstatus=null;
		for(TalkVO talk :list){
			List<String> detail = new ArrayList<String>();
			String talkId =talk.getTalkId().toString();
			String talkTitle =talk.getTalkTitle();
			String talkName =talk.getTalkName();
			Integer talkChoseValue =talk.getTalkChose();
			System.out.println(talkChoseValue);
			if (talkChoseValue==1){
				talkChose="是";
			}else {
				talkChose="否";
			}
			String talkContent =talk.getTalkContent();
			String retalkContent =talk.getRetalkContent();
			String talkDate =talk.getTalkDate().toString();
			Integer talkstatusValue =talk.getTalkstatus();
			if (talkstatusValue == 1){
				talkstatus ="已回覆";
			}else{
				talkstatus ="未回覆";
			}
			
			detail.add(talkId);
			detail.add(talkTitle);
			detail.add(talkName);
			detail.add(talkChose);
			detail.add(talkContent);
			detail.add(retalkContent);
			detail.add(talkDate);
			detail.add(talkstatus);
			talkVO.add(detail);
		}
		Map<String,List<List<String>>> mapJSON=new HashMap<String,List<List<String>>>();
		mapJSON.put("data",talkVO);
		jsonValue = JSONValue.toJSONString(mapJSON);
		return jsonValue;
	}
	
	public String findByPrimaryKeyTalkToJSON(Integer talkId) throws SQLException{
		List talks=new LinkedList();
		TalkVO talk=dao.findByPrimaryKey(talkId);
		String jsonString= null;
			Map<String,String> map = new HashMap<String,String>();
			map.put("talkId",talk.getTalkId().toString());
			map.put("retalkContent",talk.getRetalkContent());
			map.put("talkMail",talk.getTalkMail());
			map.put("talkName",talk.getTalkName());
			talks.add(map);
			jsonString = JSONValue.toJSONString(talks);
			return jsonString;
	}
	
	
	
}
