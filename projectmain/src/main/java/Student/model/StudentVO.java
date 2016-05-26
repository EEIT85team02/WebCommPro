package Student.model;
import java.util.*;
import java.io.Serializable;
import Class.model.ClassVO;
public class StudentVO implements Serializable{//學員	(所有資策會學員)
	private int stu_group; 
	private String stu_note1 ;
	private String stu_id ;
	private String stu_name ;
	private int stu_age ;
	private String stu_sch;
	private String stu_sex ;
	private String stu_email ;
	private String stu_pre ;
	private double stu_implement ;
	private String stu_testtime  ;
	private double stu_interview ;
	private double stu_total ;
	private Date stu_workdate ;
	private int stu_except ;
	private String stu_final ;
	private String stu_note2 ;

	
	private ClassVO classVO;


	

	public int getStu_group() {
		return stu_group;
	}
	public void setStu_group(int stu_group) {
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
	public int getStu_age() {
		return stu_age;
	}
	public void setStu_age(int stu_age) {
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
	public double getStu_implement() {
		return stu_implement;
	}
	public void setStu_implement(double stu_implement) {
		this.stu_implement = stu_implement;
	}
	public String getStu_testtime() {
		return stu_testtime;
	}
	public void setStu_testtime(String stu_testtime) {
		this.stu_testtime = stu_testtime;
	}
	public double getStu_interview() {
		return stu_interview;
	}
	public void setStu_interview(double stu_interview) {
		this.stu_interview = stu_interview;
	}
	public double getStu_total() {
		return stu_total;
	}
	public void setStu_total(double stu_total) {
		this.stu_total = stu_total;
	}
	public Date getStu_workdate() {
		return stu_workdate;
	}
	public void setStu_workdate(Date stu_workdate) {
		this.stu_workdate = stu_workdate;
	}
	public int getStu_except() {
		return stu_except;
	}
	public void setStu_except(int stu_except) {
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
	public ClassVO getClassVO() {
		return classVO;
	}
	public void setClassVO(ClassVO classVO) {
		this.classVO = classVO;
	}
//	public Student(	int stu_group, 
//	String stu_note1 ,
//	String stu_id ,
//	String stu_name ,
//	int stu_age ,
//	String stu_sch,
//	String stu_sex ,
//	String stu_email ,
//	String stu_pre ,
//	double stu_implement ,
//	String stu_testtime  ,
//	double stu_interview ,
//	double stu_total ,
//	Date stu_workdate ,
//	int stu_except ,
//	String stu_final ,
//	String stu_note2 ,
//	String class_id ) {
//		super();
//		this.stu_group = stu_group;
//		this.stu_note1 = stu_note1;
//		this.stu_id = stu_id;
//		this.stu_name = stu_name;
//		this.stu_age = stu_age;
//		this.stu_sch = stu_sch;
//		this.stu_sex = stu_sex;
//		this.stu_email = stu_email;
//		this.stu_pre = stu_pre;
//		this.stu_implement = stu_implement;
//		this.stu_testtime = stu_testtime;
//		this.stu_interview = stu_interview;
//		this.stu_total = stu_total;
//		this.stu_workdate = stu_workdate;
//		this.stu_except = stu_except;
//		this.stu_final = stu_final;
//		this.stu_note2 = stu_note2;
//		this.class_id = class_id;
//
//
//	}
	public StudentVO() {
		super();
	}
	
}
