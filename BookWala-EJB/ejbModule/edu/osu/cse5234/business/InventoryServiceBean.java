package edu.osu.cse5234.business;

import edu.osu.cse5234.business.view.Inventory;
import edu.osu.cse5234.business.view.InventoryService;
import edu.osu.cse5234.model.Item;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.Remote;
import javax.ejb.Stateless;

/**
 * Session Bean implementation class InventoryServiceBean
 */
@Stateless
@Remote(InventoryService.class)
public class InventoryServiceBean implements InventoryService {
	
	private List<Item> itemsInInventory = instantiateStore();
    /**
     * Default constructor. 
     */
    public InventoryServiceBean() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Inventory getAvailableInventory() {
		
		Inventory inventory = new Inventory();
		inventory.setItems(itemsInInventory);
		
		return inventory;
	}

	@Override
	public boolean validateQuantity(List<Item> items) {
		for (Item item : items) {
			if (item.getQuantity().isEmpty() || !isStringNumeric(item.getQuantity()))
				return false;
			
			for (Item storeItem : itemsInInventory) {
				if (item.getName().equalsIgnoreCase(storeItem.getName())) {
					int requiredCount = Integer.parseInt(item.getQuantity());
					int availableCount = Integer.parseInt(storeItem.getQuantity());
					if (availableCount < requiredCount)
						return false;
				}
			}
		}
		
		return true;
	}

	@Override
	public boolean updateInventory(List<Item> items) {
		return true;
	}
	
	private List<Item> instantiateStore() {
		
		List<Item> items = new ArrayList<>();
		
		Item item = new Item();
		item.setName("A Promised Land");
		item.setPrice("10.99");
		item.setQuantity("5");
		items.add(item);
		
		item = new Item();
		item.setName("The Guardians");
		item.setPrice("12.99");
		item.setQuantity("6");
		items.add(item);
		
		item = new Item();
		item.setName("The fall of Gandolin");
		item.setPrice("14.99");
		item.setQuantity("7");
		items.add(item);
		
		item = new Item();
		item.setName("The Chambers of Sceret");
		item.setPrice("7.99");
		item.setQuantity("8");
		items.add(item);
		
		item = new Item();
		item.setName("Book-X");
		item.setPrice("16.99");
		item.setQuantity("9");
		items.add(item);
		
		item = new Item();
		item.setName("Book-Y");
		item.setQuantity("10");
		item.setPrice("1.99");
		items.add(item);

		item = new Item();
		item.setName("Book-Z");
		item.setPrice("1.99");
		item.setQuantity("11");
		items.add(item);
		
		return items;
	}
	
	private Boolean isStringNumeric(String str) {
		for (int i = 0; i < str.length(); i++) {
			if (str.charAt(i) < '0' || str.charAt(i) > '9') {
				return false;
			}
		}
		return true;
	}
	
}
