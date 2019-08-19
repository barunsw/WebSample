package com.barunsw.websample.jqx;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class ProductVo {
	private String firstName;
	private String lastName;
	private String productName;
	private float priceValue;
	private int quantity;
	private float total;
	
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

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public float getPriceValue() {
		return priceValue;
	}

	public void setPriceValue(float priceValue) {
		this.priceValue = priceValue;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
