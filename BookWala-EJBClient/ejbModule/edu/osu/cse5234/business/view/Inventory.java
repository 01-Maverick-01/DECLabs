package edu.osu.cse5234.business.view;

import java.io.Serializable;
import java.util.List;

import edu.osu.cse5234.model.Item;

public class Inventory implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -376911873795007009L;
	List<Item> items;

	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}
}
