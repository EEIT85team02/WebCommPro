package Sign_list.model;

public class Sign_listVO {
	private Integer sl_id ; 		//權限代號   
	private String sl_name ;	//權限名稱
	public Integer getSl_id() {
		return sl_id;
	}
	public void setSl_id(Integer sl_id) {
		this.sl_id = sl_id;
	}
	public String getSl_name() {
		return sl_name;
	}
	public void setSl_name(String sl_name) {
		this.sl_name = sl_name;
	}
	public Sign_listVO(Integer sl_id, String sl_name) {
		super();
		this.sl_id = sl_id;
		this.sl_name = sl_name;
	}
	public Sign_listVO() {
		super();
	}
	
}
