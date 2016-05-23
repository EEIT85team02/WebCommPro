package Class.model;

import java.io.Serializable;

import Edu.model.EduVO;
public class ClassVO implements Serializable{//班級
	private String class_id; //建立班級代號
	private String	class_name ;//建立班級名稱
	private String	class_contact; //建立聯絡人
	private String	class_teach ; //建立班級導師
	private EduVO eduVO;//代表教育代號edu_id 
	
	
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
	
	public ClassVO(String class_id, String class_name, String class_contact,
			String class_teach, EduVO eduVO) {
		super();
		this.class_id = class_id;
		this.class_name = class_name;
		this.class_contact = class_contact;
		this.class_teach = class_teach;
		this.eduVO = eduVO;
	}
	public ClassVO() {
		super();
	}
	
	
	
}
