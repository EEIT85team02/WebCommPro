package view_Member.model;

public class view_Member {  //檢視考生基本資料
	private	String	stu_id;//學員代號
	private	String	stu_lastmame;//姓
	private	String	stu_firstname;//名
	private	String	stu_tel;//電話1(家裡電話)
	private	String	stu_mobile;//電話2（手機）
	private	String	stu_email;//mail
	private	String	stu_add;//地址
	//Member join Student
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	public String getStu_lastmame() {
		return stu_lastmame;
	}
	public void setStu_lastmame(String stu_lastmame) {
		this.stu_lastmame = stu_lastmame;
	}
	public String getStu_firstname() {
		return stu_firstname;
	}
	public void setStu_firstname(String stu_firstname) {
		this.stu_firstname = stu_firstname;
	}
	public String getStu_tel() {
		return stu_tel;
	}
	public void setStu_tel(String stu_tel) {
		this.stu_tel = stu_tel;
	}
	public String getStu_mobile() {
		return stu_mobile;
	}
	public void setStu_mobile(String stu_mobile) {
		this.stu_mobile = stu_mobile;
	}
	public String getStu_email() {
		return stu_email;
	}
	public void setStu_email(String stu_email) {
		this.stu_email = stu_email;
	}
	public String getStu_add() {
		return stu_add;
	}
	public void setStu_add(String stu_add) {
		this.stu_add = stu_add;
	}
	public view_Member(String stu_id, String stu_lastmame,
			String stu_firstname, String stu_tel, String stu_mobile,
			String stu_email, String stu_add) {
		super();
		this.stu_id = stu_id;
		this.stu_lastmame = stu_lastmame;
		this.stu_firstname = stu_firstname;
		this.stu_tel = stu_tel;
		this.stu_mobile = stu_mobile;
		this.stu_email = stu_email;
		this.stu_add = stu_add;
	}
	public view_Member() {
		super();
	}
}
