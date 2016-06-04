package Class.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import Edu.model.EduVO;
import Stu_additional.model.Stu_additionalVO;
import Student.model.StudentVO;
import Test_Date.model.Test_DateVO;
import Test_interval.model.Test_intervalVO;
public class ClassVO implements Serializable{//班級
	private String class_id; //建立班級代號
	private String	class_name ;//建立班級名稱
	private String	class_contact; //建立聯絡人
	private String	class_teach ; //建立班級導師
	private EduVO eduVO;//代表教育代號edu_id 

	private Set<StudentVO> stus =new HashSet<StudentVO>();
	private Set<Test_DateVO> tds = new HashSet<Test_DateVO>();
	private Set<Test_intervalVO> tis = new HashSet<Test_intervalVO>();
	
	
	



	public String getClass_id() {
		return class_id;
	}




	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}




	public String getClass_name() {
		return class_name;
	}




	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}




	public String getClass_contact() {
		return class_contact;
	}




	public void setClass_contact(String class_contact) {
		this.class_contact = class_contact;
	}




	public String getClass_teach() {
		return class_teach;
	}




	public void setClass_teach(String class_teach) {
		this.class_teach = class_teach;
	}




	public EduVO getEduVO() {
		return eduVO;
	}




	public void setEduVO(EduVO eduVO) {
		this.eduVO = eduVO;
	}




	public Set<StudentVO> getStus() {
		return stus;
	}




	public void setStus(Set<StudentVO> stus) {
		this.stus = stus;
	}




	public Set<Test_DateVO> getTds() {
		return tds;
	}




	public void setTds(Set<Test_DateVO> tds) {
		this.tds = tds;
	}




	public Set<Test_intervalVO> getTis() {
		return tis;
	}




	public void setTis(Set<Test_intervalVO> tis) {
		this.tis = tis;
	}




	public ClassVO(String class_id, String class_name, String class_contact,
			String class_teach, EduVO eduVO, Set<StudentVO> stus,
			Set<Test_DateVO> tds, Set<Test_intervalVO> tis) {
		super();
		this.class_id = class_id;
		this.class_name = class_name;
		this.class_contact = class_contact;
		this.class_teach = class_teach;
		this.eduVO = eduVO;
		this.stus = stus;
		this.tds = tds;
		this.tis = tis;
	}




	public ClassVO() {
		super();
	}
	
	
	
}
