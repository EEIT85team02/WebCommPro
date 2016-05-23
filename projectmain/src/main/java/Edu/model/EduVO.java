package Edu.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import Class.model.ClassVO;
public class EduVO implements Serializable{//教育訓練中心
	private Integer	edu_id ;  //教育中心代號
	private String edu_name ;  //教育中心名稱
	private String edu_add ; //地址
	private String edu_tel; //建立電話
	private String edu_contact; //建立聯絡人
	private Set<ClassVO> clas = new HashSet<ClassVO>();
	
	
	public Integer getEdu_id() {
		return edu_id;
	}
	public void setEdu_id(Integer edu_id) {
		this.edu_id = edu_id;
	}
	public String getEdu_name() {
		return edu_name;
	}
	public void setEdu_name(String edu_name) {
		this.edu_name = edu_name;
	}
	public String getEdu_add() {
		return edu_add;
	}
	public void setEdu_add(String edu_add) {
		this.edu_add = edu_add;
	}
	public String getEdu_tel() {
		return edu_tel;
	}
	public void setEdu_tel(String edu_tel) {
		this.edu_tel = edu_tel;
	}
	public String getEdu_contact() {
		return edu_contact;
	}
	public void setEdu_contact(String edu_contact) {
		this.edu_contact = edu_contact;
	}
	

	public Set<ClassVO> getClas() {
		return clas;
	}
	public void setClas(Set<ClassVO> clas) {
		this.clas = clas;
	}
	
	public EduVO(Integer edu_id, String edu_name, String edu_add,
			String edu_tel, String edu_contact, Set<ClassVO> clas) {
		super();
		this.edu_id = edu_id;
		this.edu_name = edu_name;
		this.edu_add = edu_add;
		this.edu_tel = edu_tel;
		this.edu_contact = edu_contact;
		this.clas = clas;
	}
	public EduVO() {
		super();
	}
	
	
	
}
