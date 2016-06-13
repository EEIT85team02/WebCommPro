package Talk.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class TalkVO implements Serializable{
	private Integer talkId;//留言訊息代號
	private String talkTitle;//留言主題
	private String talkName; //訪客姓名
	private Integer talkChose;//是否悄悄話
	private String talkMail;//MAIL
	private String	talkContent; //留言內容
	private String	retalkContent; //回復內容
	private Timestamp	talkDate; //留言時間
	private Timestamp	retalkDate; //回覆時間
	private Integer talkstatus;//回覆狀態
	public Integer getTalkId() {
		return talkId;
	}
	public void setTalkId(Integer talkId) {
		this.talkId = talkId;
	}
	public String getTalkTitle() {
		return talkTitle;
	}
	public void setTalkTitle(String talkTitle) {
		this.talkTitle = talkTitle;
	}
	public String getTalkName() {
		return talkName;
	}
	public void setTalkName(String talkName) {
		this.talkName = talkName;
	}
	public Integer getTalkChose() {
		return talkChose;
	}
	public void setTalkChose(Integer talkChose) {
		this.talkChose = talkChose;
	}
	public String getTalkMail() {
		return talkMail;
	}
	public void setTalkMail(String talkMail) {
		this.talkMail = talkMail;
	}
	public String getTalkContent() {
		return talkContent;
	}
	public void setTalkContent(String talkContent) {
		this.talkContent = talkContent;
	}
	public String getRetalkContent() {
		return retalkContent;
	}
	public void setRetalkContent(String retalkContent) {
		this.retalkContent = retalkContent;
	}
	public Timestamp getTalkDate() {
		return talkDate;
	}
	public void setTalkDate(Timestamp talkDate) {
		this.talkDate = talkDate;
	}
	public Timestamp getRetalkDate() {
		return retalkDate;
	}
	public void setRetalkDate(Timestamp retalkDate) {
		this.retalkDate = retalkDate;
	}
	public Integer getTalkstatus() {
		return talkstatus;
	}
	public void setTalkstatus(Integer talkstatus) {
		this.talkstatus = talkstatus;
	}
	public TalkVO(Integer talkId, String talkTitle, String talkName,
			Integer talkChose, String talkMail, String talkContent,
			String retalkContent, Timestamp talkDate, Timestamp retalkDate,
			Integer talkstatus) {
		super();
		this.talkId = talkId;
		this.talkTitle = talkTitle;
		this.talkName = talkName;
		this.talkChose = talkChose;
		this.talkMail = talkMail;
		this.talkContent = talkContent;
		this.retalkContent = retalkContent;
		this.talkDate = talkDate;
		this.retalkDate = retalkDate;
		this.talkstatus = talkstatus;
	}
	public TalkVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
