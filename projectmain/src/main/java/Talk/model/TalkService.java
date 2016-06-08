package Talk.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.simple.JSONValue;



public class TalkService {
	private ITalkDAO dao;

	public TalkService() {
		dao= new TalkDAO();
	}
	
	
	public void insertTalk(String talkName,String talkGender, Integer talkChose,
			String talkContent) throws SQLException {
		TalkVO talk = new TalkVO();
		talk.setTalkName(talkName);
		talk.setTalkGender(talkGender);
		talk.setTalkChose(talkChose);
		talk.setTalkContent(talkContent);
		
		
		dao.insert(talk);
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
			map.put("talkName",talk.getTalkName());
			map.put("talkGender",talk.getTalkGender());
			map.put("talkChose",talk.getTalkChose().toString());
			map.put("talkContent",talk.getTalkContent());
		
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
		for(TalkVO talk :list){
			List<String> detail = new ArrayList<String>();
			detail.add(talk.getTalkId().toString());
			detail.add(talk.getTalkName());
			detail.add(talk.getTalkGender());
			detail.add(talk.getTalkChose().toString());
			detail.add(talk.getTalkContent());
			talkVO.add(detail);
		}
		Map<String,List<List<String>>> mapJSON=new HashMap<String,List<List<String>>>();
		mapJSON.put("data",talkVO);
		jsonValue = JSONValue.toJSONString(mapJSON);
		return jsonValue;
	}
	
	
	
}
