package com.barunsw.websample.vo;

public class AddressVo {
	private int seq;
	private String firstName;
	private String lastName;
	private String phone;
	
	public int getSeq() { 
		return seq; 
	}
	
	public void setSeq(final int seq) {
		this.seq = seq;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
}
