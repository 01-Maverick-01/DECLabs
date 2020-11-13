package edu.osu.cse5234.business;

import java.util.Date;
import java.util.concurrent.ThreadLocalRandom;

import javax.annotation.Resource;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.jms.ConnectionFactory;
import javax.jms.JMSConnectionFactory;
import javax.jms.JMSContext;
import javax.jms.Queue;
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
@Resource(name="jms/emailQCF", lookup="jms/emailQCF", type=ConnectionFactory.class)
public class OrderProcessingServiceBean {
	
	@PersistenceContext
	private EntityManager entityManager;
	
	@Inject
	@JMSConnectionFactory("java:comp/env/jms/emailQCF")
	private JMSContext jmsContext;
	
	@Resource(lookup="jms/emailQ")
	private Queue queue;
	
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
    		notifyUser(order.getShippingInfo().getEmail());
        	return String.valueOf(ThreadLocalRandom.current().nextInt());
    	}
    	return "FAILED";
    }
    
    public boolean validateItemAvailability(Order order) {
    	
    	if (order.getItems().size() == 0) return false;
    	
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
    
    private void notifyUser(String customerEmail) {
    	String message = customerEmail + ":" + "Your order was successfully submitted. " 
    						+ "You will hear from us when items are shipped. " +  new Date();
    	System.out.println("Sending message: " + message);
    	jmsContext.createProducer().send(queue, message);
    	System.out.println("Message Sent!");
    }
}
