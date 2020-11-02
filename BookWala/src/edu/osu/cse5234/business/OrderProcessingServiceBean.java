package edu.osu.cse5234.business;

import java.util.concurrent.ThreadLocalRandom;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import edu.osu.cse5234.business.view.Inventory;
import edu.osu.cse5234.business.view.InventoryService;
import edu.osu.cse5234.model.Item;
import edu.osu.cse5234.model.LineItem;
import edu.osu.cse5234.model.Order;
import edu.osu.cse5234.util.ServiceLocator;

/**
 * Session Bean implementation class OrderProcessingServiceBean
 */
@Stateless
@LocalBean
public class OrderProcessingServiceBean {
	
	@PersistenceContext
	private EntityManager entityManager;
    /**
     * Default constructor. 
     */
    public OrderProcessingServiceBean() {
        // TODO Auto-generated constructor stub
    }
    	
    public String processOrder(Order order) {
    	if (validateItemAvailability(order)) {
    		order.setCustomerName(order.getShippingInfo().getName());
    		order.setEmailAddress(order.getShippingInfo().getEmail());
    		
    		entityManager.persist(order);
    		entityManager.flush();
        	return String.valueOf(ThreadLocalRandom.current().nextInt());
    	}
    	return "FAILED";
    }
    
    public boolean validateItemAvailability(Order order) {
    	InventoryService inventoryService = ServiceLocator.getInventoryService();
		Inventory inventory = inventoryService.getAvailableInventory();
		for(LineItem item : order.getItems()) {
			for(Item item1 : inventory.getItems()) {
				if(item.getItemNumber() == item1.getItemNumber()) {
					if(item.getQuantity() > Integer.parseInt(item1.getQuantity())) {
						return false;
					}
				}
			}
		}
    	return true;
    }
}
