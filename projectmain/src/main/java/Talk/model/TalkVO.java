package Talk.model;

import java.io.Serializable;

public class TalkVO implements Serializable{
	private Integer talkId;//留言訊息代號
	private String talkName; //訪客姓名
	private String talkGender;//訪客性別
	private Integer talkChose;//是否悄悄話
	private String	talkContent; //留言內容
	

	public Integer getTalkId() {
		return talkId;
	}


	public void setTalkId(Integer talkId) {
		this.talkId = talkId;
	}

	public String getTalkName() {
		return talkName;
	}


	public void setTalkName(String talkName) {
		this.talkName = talkName;
	}


	public String getTalkGender() {
		return talkGender;
	}


	public void setTalkGender(String talkGender) {
		this.talkGender = talkGender;
	}


	public Integer getTalkChose() {
		return talkChose;
	}

	public void setTalkChose(Integer talkChose) {
		this.talkChose = talkChose;
	}

	public String getTalkContent() {
		return talkContent;
	}


	public void setTalkContent(String talkContent) {
		this.talkContent = talkContent;
	}


	public TalkVO(Integer talkId, String talkName, String talkGender,
			Integer talkChose, String talkContent) {
		super();
		this.talkId = talkId;
		this.talkName = talkName;
		this.talkGender = talkGender;
		this.talkChose = talkChose;
		this.talkContent = talkContent;
	}


	public TalkVO() {
		super();
	}
	

}
