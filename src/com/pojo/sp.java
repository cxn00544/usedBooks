package com.pojo;

import java.sql.Timestamp;

import javax.xml.crypto.Data;



public class sp {
	private Integer spID;     
	private Integer userId;   
	private String sp;      
	private String sptittle;   
	private String statuss;   
	private String telephone;        
	private Timestamp create_time ;
	public Integer getSpID() {
		return spID;
	}
	public void setSpID(Integer spID) {
		this.spID = spID;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getSp() {
		return sp;
	}
	public void setSp(String sp) {
		this.sp = sp;
	}
	public String getSptittle() {
		return sptittle;
	}
	public void setSptittle(String sptittle) {
		this.sptittle = sptittle;
	}
	public String getStatuss() {
		return statuss;
	}
	public void setStatuss(String statuss) {
		this.statuss = statuss;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public Timestamp getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Timestamp create_time) {
		this.create_time = create_time;
	}
	
	
	
}
