package cn.edu.neusoft.fawutong.domain;

public class UserCase {
	private int ucid,uid;
	private String uctype,nickname,sendtime,description,idcode,telephone,ucstatus;
	public String getUcstatus() {
		return ucstatus;
	}
	public void setUcstatus(String ucstatus) {
		this.ucstatus = ucstatus;
	}
	public int getUcid() {
		return ucid;
	}
	public void setUcid(int ucid) {
		this.ucid = ucid;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getIdcode() {
		return idcode;
	}
	public void setIdcode(String idcode) {
		this.idcode = idcode;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUctype() {
		return uctype;
	}
	public void setUctype(String uctype) {
		this.uctype = uctype;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getSendtime() {
		return sendtime;
	}
	public void setSendtime(String sendtime) {
		this.sendtime = sendtime;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
