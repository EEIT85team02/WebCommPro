package Mail_template.model;

import java.io.Serializable;

public class Mail_templateVO implements Serializable{ //Email樣板
	private	Integer	mail_id;//樣板代號
	private	String	mail_name;//樣板名稱
	private	String	mail_text;//樣板內容
	public Integer getMail_id() {
		return mail_id;
	}
	public void setMail_id(Integer mail_id) {
		this.mail_id = mail_id;
	}
	public String getMail_name() {
		return mail_name;
	}
	public void setMail_name(String mail_name) {
		this.mail_name = mail_name;
	}
	public String getMail_text() {
		return mail_text;
	}
	public void setMail_text(String mail_text) {
		this.mail_text = mail_text;
	}
	public Mail_templateVO(Integer mail_id, String mail_name, String mail_text) {
		super();
		this.mail_id = mail_id;
		this.mail_name = mail_name;
		this.mail_text = mail_text;
	}
	public Mail_templateVO() {
		super();
	}
	
}
