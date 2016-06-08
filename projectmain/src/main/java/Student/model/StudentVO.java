package Student.model;

import java.sql.Timestamp;
import java.util.*;
import java.io.Serializable;

import Stu_additional.model.Stu_additionalVO;
import Class.model.ClassVO;
public class StudentVO implements Serializable{//學員	(所有資策會學員)
	
	private static final long serialVersionUID = 1L;
	private Integer stu_id ;
	private Integer stu_group; 
	private String stu_note1 ;
	private Integer stu_seatno ;
	private String stu_name;
	private String stu_sch ; 
	private Integer stu_sex ; 
	private Integer stu_age ;
	private String stu_email ;
	private Integer stu_pre ;
	private Double stu_implement ;
	private Timestamp stu_testtime  ;
	private Double stu_interview ;
	private Double stu_total ;
	private Timestamp stu_workdate ;
	private Double stu_except ;
	private Integer stu_final ;
	private String stu_note2 ;
	private ClassVO classVO;
	private byte[] pub_key;
	private byte[] pri_key;
	private byte[] cipher_text;
	private byte[] log_pw;
	public byte[] getLog_pw() {
		return log_pw;
	}


	public void setLog_pw(byte[] log_pw) {
		this.log_pw = log_pw;
	}
	private Set<Stu_additionalVO> Stu_additionalVO = new HashSet<Stu_additionalVO>();

	
	
	public byte[] getPub_key() {
		return pub_key;
	}


	public void setPub_key(byte[] pub_key) {
		this.pub_key = pub_key;
	}


	public byte[] getPri_key() {
		return pri_key;
	}


	public void setPri_key(byte[] pri_key) {
		this.pri_key = pri_key;
	}


	public byte[] getCipher_text() {
		return cipher_text;
	}


	public void setCipher_text(byte[] cipher_text) {
		this.cipher_text = cipher_text;
	}


	public Integer getStu_id() {
		return stu_id;
	}


	public void setStu_id(Integer stu_id) {
		this.stu_id = stu_id;
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

	public Integer getStu_seatno() {
		return stu_seatno;
	}

	public void setStu_seatno(Integer stu_seatno) {
		this.stu_seatno = stu_seatno;
	}

	public String getStu_name() {
		return stu_name;
	}

	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}

	public String getStu_sch() {
		return stu_sch;
	}

	public void setStu_sch(String stu_sch) {
		this.stu_sch = stu_sch;
	}

	public Integer getStu_sex() {
		return stu_sex;
	}

	public void setStu_sex(Integer stu_sex) {
		this.stu_sex = stu_sex;
	}

	public Integer getStu_age() {
		return stu_age;
	}

	public void setStu_age(Integer stu_age) {
		this.stu_age = stu_age;
	}

	public String getStu_email() {
		return stu_email;
	}

	public void setStu_email(String stu_email) {
		this.stu_email = stu_email;
	}

	public Integer getStu_pre() {
		return stu_pre;
	}

	public void setStu_pre(Integer stu_pre) {
		this.stu_pre = stu_pre;
	}


	public Double getStu_implement() {

		return stu_implement;
	}


	public void setStu_implement(Double stu_implement) {

		this.stu_implement = stu_implement;
	}

	public Timestamp getStu_testtime() {
		return stu_testtime;
	}

	public void setStu_testtime(Timestamp stu_testtime) {
		this.stu_testtime = stu_testtime;
	}


	public Double getStu_interview() {

		return stu_interview;
	}


	public void setStu_interview(Double stu_interview) {

		this.stu_interview = stu_interview;
	}


	public Double getStu_total() {

		return stu_total;
	}


	public void setStu_total(Double stu_total) {

		this.stu_total = stu_total;
	}

	public Timestamp getStu_workdate() {
		return stu_workdate;
	}

	public void setStu_workdate(Timestamp stu_workdate) {
		this.stu_workdate = stu_workdate;
	}


	public Double getStu_except() {

		return stu_except;
	}


	public void setStu_except(Double stu_except) {

		this.stu_except = stu_except;
	}

	public Integer getStu_final() {
		return stu_final;
	}

	public void setStu_final(Integer stu_final) {
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

	public Set<Stu_additionalVO> getStu_additionalVO() {
		return Stu_additionalVO;
	}

	public void setStu_additionalVO(Set<Stu_additionalVO> Stu_additionalVO) {
		this.Stu_additionalVO = Stu_additionalVO;
	}

	public StudentVO() {
		super();
	}
	public Map<String, Object> getAllAttributes(){
		Map<String,Object> map = new LinkedHashMap<String, Object>();
		map.put("stu_id", "\""+getStu_id()+"\"");
		map.put("stu_group","\""+getStu_group()+"\"");
		map.put("stu_note1","\""+getStu_note1()+"\"");
		map.put("stu_seatno","\""+getStu_seatno()+"\"");
		map.put("stu_name","\""+getStu_name()+"\"");
		map.put("stu_sch","\""+getStu_sch()+"\"");
		map.put("stu_sex","\""+getStu_sex()+"\"");
		map.put("stu_age","\""+getStu_age()+"\"");
		map.put("stu_email","\""+getStu_email()+"\"");
		map.put("stu_pre","\""+getStu_pre()+"\"");
		map.put("stu_implement","\""+getStu_implement()+"\"");
		map.put("stu_testtime","\""+getStu_testtime()+"\"");
		map.put("stu_interview","\""+getStu_interview()+"\"");
		map.put("stu_total","\""+getStu_total()+"\"");
		map.put("stu_workdate","\""+getStu_workdate()+"\"");
		map.put("stu_except","\""+getStu_except()+"\"");
		map.put("stu_final","\""+getStu_final()+"\"");
		map.put("stu_note2","\""+getStu_note2()+"\"");
		
		

		return map;
	}
}
