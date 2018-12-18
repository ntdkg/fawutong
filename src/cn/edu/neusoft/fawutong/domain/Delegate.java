package cn.edu.neusoft.fawutong.domain;

public class Delegate {
	
	private int did;
	private int uid;
	private String dcaseType;
	private String dbizType;
	private float dprice;
	private String dstatus;
	private String ddeadline;
	private String ddescription;
	private String dnickname;
	private String dsendtime;
	
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getDcaseType() {
		return dcaseType;
	}
	public void setDcaseType(String dcaseType) {
		this.dcaseType = dcaseType;
	}
	public String getDbizType() {
		return dbizType;
	}
	public void setDbizType(String dbizType) {
		this.dbizType = dbizType;
	}
	public float getDprice() {
		return dprice;
	}
	public void setDprice(float dprice) {
		this.dprice = dprice;
	}
	
	public String getDstatus() {
		return dstatus;
	}
	public void setDstatus(String dstatus) {
		this.dstatus = dstatus;
	}
	public String getDdeadline() {
		return ddeadline;
	}
	public void setDdeadline(String ddeadline) {
		this.ddeadline = ddeadline;
	}
	public String getDdescription() {
		return ddescription;
	}
	public void setDdescription(String ddescription) {
		this.ddescription = ddescription;
	}
	public String getDnickname() {
		return dnickname;
	}
	public void setDnickname(String dnickname) {
		this.dnickname = dnickname;
	}
	public void setDsendtime(String dsendtime) {
		this.dsendtime = dsendtime;
	}
	public String getDsendtime() {
		return dsendtime;
	}
}
