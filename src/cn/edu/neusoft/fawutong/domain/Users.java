package cn.edu.neusoft.fawutong.domain;

public class Users {
	
	private int uid,lisHot;
	private String lname,lresume,lcity,loffice,limage,uphone,uname,lisLaw,upassword,uemail,lstatus,umoney;
	public String getLstatus() {          //律师状态审核通过未通过
		return lstatus;
	}
	public void setLstatus(String lstatus) {      
		this.lstatus = lstatus;
	}
	public int getUid() {        //用户id
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getLisHot() {     //律师热度
		return lisHot;
	}
	public void setLisHot(int lisHot) {
		this.lisHot = lisHot;
	}
	public String getLname() {  //真实姓名
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getLresume() {    //律师个人简介
		return lresume;
	}
	public void setLresume(String lresume) {  
		this.lresume = lresume;
	}
	public String getLcity() {  //律师所在城市
		return lcity;
	}
	public void setLcity(String lcity) {
		this.lcity = lcity;
	}
	public String getLoffice() { //律师事务所
		return loffice;
	}
	public void setLoffice(String loffice) {
		this.loffice = loffice;
	}
	public String getLimage() {   //用户头像
		return limage;
	}
	public void setLimage(String limage) {
		this.limage = limage;
	}
	public String getUphone() {  //手机账号
		return uphone;
	}
	public void setUphone(String uphone) {
		this.uphone = uphone;
	}
	public String getUname() {    //昵称
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getLisLaw() {    //是否是律师
		return lisLaw;
	}
	public void setLisLaw(String lisLaw) {
		this.lisLaw = lisLaw;
	}
	public String getUpassword() {  //密码
		return upassword;
	}
	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}
	public String getUemail() {         //邮箱
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUmoney() {       //拥有金额
		
		return umoney;
	}
	public void setUmoney(String umoney) {
		this.umoney = umoney;
	}
}
