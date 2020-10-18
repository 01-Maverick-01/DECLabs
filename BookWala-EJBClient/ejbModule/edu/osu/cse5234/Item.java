package edu.osu.cse5234;

import java.io.Serializable;

public class Item implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3143973915858706302L;
	public String name;
	public String price;
	public String quantity;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
}
