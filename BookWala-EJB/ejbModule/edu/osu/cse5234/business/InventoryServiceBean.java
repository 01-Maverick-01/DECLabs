package edu.osu.cse5234.business;

import edu.osu.cse5234.business.view.Inventory;
import edu.osu.cse5234.business.view.InventoryService;
import edu.osu.cse5234.model.Item;

import java.util.List;

import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * Session Bean implementation class InventoryServiceBean
 */
@Stateless
@Remote(InventoryService.class)
public class InventoryServiceBean implements InventoryService {
	
	private String MY_QUERY = "Select i from Item i";
	
	@PersistenceContext
	private EntityManager entityManager;
	
    /**
     * Default constructor. 
     */
    public InventoryServiceBean() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Inventory getAvailableInventory() {
		
		entityManager.createQuery(MY_QUERY, Item.class).getResultList();
		
		Inventory inventory = new Inventory();
		inventory.setItems(getInventoryItems());
		
		return inventory;
	}

	@Override
	public boolean validateQuantity(List<Item> items) {
		for (Item item : items) {
			if (item.getQuantity().isEmpty() || !isStringNumeric(item.getQuantity()))
				return false;
			
			for (Item storeItem : getInventoryItems()) {
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
	
	private List<Item> getInventoryItems() {
		return entityManager.createQuery(MY_QUERY, Item.class).getResultList();
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
