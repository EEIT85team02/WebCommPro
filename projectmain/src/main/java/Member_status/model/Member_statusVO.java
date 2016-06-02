package Member_status.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import Stu_additional.model.Stu_additionalVO;

public class Member_statusVO implements Serializable{//考生狀況	(預約&錄取狀況)
	private Integer  sta_id;
	private	String	sta_name;//狀況名稱
	private Set<Stu_additionalVO> Stu_additionalVO = new HashSet<Stu_additionalVO>();
	
	public Integer getSta_id() {
		return sta_id;
	}
	public void setSta_id(Integer sta_id) {
		this.sta_id = sta_id;
	}
	public String getSta_name() {
		return sta_name;
	}
	public void setSta_name(String sta_name) {
		this.sta_name = sta_name;
	}
	public Set<Stu_additionalVO> getStu_additionalVO() {
		return Stu_additionalVO;
	}
	public void setStu_additionalVO(Set<Stu_additionalVO> stu_additionalVO) {
		Stu_additionalVO = stu_additionalVO;
	}

}
