package edu.osu.cse5234.model;

import java.util.List;

import edu.osu.cse5234.model.Item;

public class Order {
	List<Item> items;

	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}
}
