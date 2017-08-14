package com.sk.mvcproject;

// C���� ����ü ���� ������ Class
public class Member {

	private String mem_id;
	private String mem_pwd;
	private String mem_name;
	private String gender;
	private String hobby;
	
	
	// default ������ ���� 
	public Member() {
		
	}

	public Member(String mem_id, String mem_pwd, String mem_name, String gender, String hobby) {
		
		this.mem_id = mem_id;
		this.mem_pwd = mem_pwd;
		this.mem_name = mem_name;
		this.gender = gender;
		this.hobby = hobby;
	}
	
	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pwd() {
		return mem_pwd;
	}

	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	
	

}
