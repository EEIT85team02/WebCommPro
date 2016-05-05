package Student.model;

import java.io.Serializable;

public class Student implements Serializable{//學員	(所有資策會學員)
	private String stu_id; //建立學員代號
	private String stu_lastname ;//建立姓
	private String stu_firstname ;//建立名
	private String stu_tel ;//建立電話(家用)
	private String stu_mobile ;//建立學員手機
	private String stu_email;//建立學員MAIL
	private String stu_add ;//建立學員地址
	private Integer stu_age ;//建立年次
	private String stu_sch ;//建立畢業學校
	private String stu_dep ;//建立科系
	private String class_id ; //建立班級代號
	private String log_pw ; //學員登入密碼??
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	public String getStu_lastname() {
		return stu_lastname;
	}
	public void setStu_lastname(String stu_lastname) {
		this.stu_lastname = stu_lastname;
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
	public Integer getStu_age() {
		return stu_age;
	}
	public void setStu_age(Integer stu_age) {
		this.stu_age = stu_age;
	}
	public String getStu_sch() {
		return stu_sch;
	}
	public void setStu_sch(String stu_sch) {
		this.stu_sch = stu_sch;
	}
	public String getStu_dep() {
		return stu_dep;
	}
	public void setStu_dep(String stu_dep) {
		this.stu_dep = stu_dep;
	}
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
	public String getLog_pw() {
		return log_pw;
	}
	public void setLog_pw(String log_pw) {
		this.log_pw = log_pw;
	}
	public Student(String stu_id, String stu_lastname, String stu_firstname,
			String stu_tel, String stu_mobile, String stu_email,
			String stu_add, Integer stu_age, String stu_sch, String stu_dep,
			String class_id, String log_pw) {
		super();
		this.stu_id = stu_id;
		this.stu_lastname = stu_lastname;
		this.stu_firstname = stu_firstname;
		this.stu_tel = stu_tel;
		this.stu_mobile = stu_mobile;
		this.stu_email = stu_email;
		this.stu_add = stu_add;
		this.stu_age = stu_age;
		this.stu_sch = stu_sch;
		this.stu_dep = stu_dep;
		this.class_id = class_id;
		this.log_pw = log_pw;
	}
	public Student() {
		super();
	}
	
}
