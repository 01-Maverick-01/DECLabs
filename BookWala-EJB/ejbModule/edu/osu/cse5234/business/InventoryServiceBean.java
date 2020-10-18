package edu.osu.cse5234.business;

import edu.osu.cse5234.Item;
import edu.osu.cse5234.business.view.Inventory;
import edu.osu.cse5234.business.view.InventoryService;

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

    /**
     * Default constructor. 
     */
    public InventoryServiceBean() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Inventory getAvailableInventory() {
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
		
		Inventory inventory = new Inventory();
		inventory.setItems(items);
		
		return inventory;
	}

	@Override
	public boolean validateQuantity(List<Item> items) {
		return true;
	}

	@Override
	public boolean updateInventory(List<Item> items) {
		return true;
	}
	
	
}
