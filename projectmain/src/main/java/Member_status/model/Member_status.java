package Member_status.model;

import java.io.Serializable;

public class Member_status implements Serializable{//考生狀況	(預約&錄取狀況)
	private Integer	sta_id;//狀況代號
	private	String	sta_name;//狀況名稱
	public Integer getSta_id() {
		return sta_id;
	}
	public void setSta_id(Integer sta_id) {
		this.sta_id = sta_id;
	}
	public String getSta_name() {
		return sta_name;
	}
	public void setSta_name(String sta_name) {
		this.sta_name = sta_name;
	}
	public Member_status(Integer sta_id, String sta_name) {
		super();
		this.sta_id = sta_id;
		this.sta_name = sta_name;
	}
	public Member_status() {
		super();
	}
	
}
