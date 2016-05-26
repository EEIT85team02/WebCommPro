package Student.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import Stu_additional.model.Stu_additionalVO;

public class StudentVO implements Serializable{//學員	(所有資策會學員)
	private Integer stu_group; 
	private String stu_note1 ;
	private String stu_id ;
	private String stu_name;
	private Integer stu_age;
	private String stu_sch ; 
	private String stu_sex ; 
	private String stu_email ;
	private String stu_pre ;
	private Double stu_implement ;
	private String stu_testtime ;
	private Double stu_interview ; 
	private String stu_total ; 
	private String stu_workdate ; 
	private Integer stu_except ; 
	private String stu_final ; 
	private String stu_note2 ;
	private Set<Stu_additionalVO> stus = new HashSet<Stu_additionalVO>();
	
	public Set<Stu_additionalVO> getStus() {
		return stus;
	}
	public void setStus(Set<Stu_additionalVO> stus) {
		this.stus = stus;
	}
	public Integer getStu_group() {
		return stu_group;
	}
	public void setStu_group(Integer stu_group) {
		this.stu_group = stu_group;
	}
	public String getStu_note1() {
		return stu_note1;
	}
	public void setStu_note1(String stu_note1) {
		this.stu_note1 = stu_note1;
	}
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	public String getStu_name() {
		return stu_name;
	}
	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
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
	public String getStu_sex() {
		return stu_sex;
	}
	public void setStu_sex(String stu_sex) {
		this.stu_sex = stu_sex;
	}
	public String getStu_email() {
		return stu_email;
	}
	public void setStu_email(String stu_email) {
		this.stu_email = stu_email;
	}
	public String getStu_pre() {
		return stu_pre;
	}
	public void setStu_pre(String stu_pre) {
		this.stu_pre = stu_pre;
	}
	public Double getStu_implement() {
		return stu_implement;
	}
	public void setStu_implement(Double stu_implement) {
		this.stu_implement = stu_implement;
	}
	public String getStu_testtime() {
		return stu_testtime;
	}
	public void setStu_testtime(String stu_testtime) {
		this.stu_testtime = stu_testtime;
	}
	public Double getStu_interview() {
		return stu_interview;
	}
	public void setStu_interview(Double stu_interview) {
		this.stu_interview = stu_interview;
	}
	public String getStu_total() {
		return stu_total;
	}
	public void setStu_total(String stu_total) {
		this.stu_total = stu_total;
	}
	public String getStu_workdate() {
		return stu_workdate;
	}
	public void setStu_workdate(String stu_workdate) {
		this.stu_workdate = stu_workdate;
	}
	public Integer getStu_except() {
		return stu_except;
	}
	public void setStu_except(Integer stu_except) {
		this.stu_except = stu_except;
	}
	public String getStu_final() {
		return stu_final;
	}
	public void setStu_final(String stu_final) {
		this.stu_final = stu_final;
	}
	public String getStu_note2() {
		return stu_note2;
	}
	public void setStu_note2(String stu_note2) {
		this.stu_note2 = stu_note2;
	} 

}
