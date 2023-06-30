package com.demo.entity;


public class Employee {

	private int id;

	private String fullname;

	private String email;

	private int phone;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public Employee(int id, String fullname, String email, int phone) {
		super();
		this.id = id;
		this.fullname = fullname;
		this.email = email;
		this.phone = phone;
	}
	public Employee() {
		super();
	}
	
}
