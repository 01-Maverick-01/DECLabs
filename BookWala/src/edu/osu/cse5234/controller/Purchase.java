package edu.osu.cse5234.controller;

import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.osu.cse5234.model.Item;
import edu.osu.cse5234.model.Order;
import edu.osu.cse5234.model.PaymentInfo;
import edu.osu.cse5234.model.ShippingInfo;

@Controller
@RequestMapping("/purchase")
public class Purchase {
	Order inventory = instantiateStore();
	
	@RequestMapping(method = RequestMethod.GET)
	public String viewOrderEntryForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Order order = new Order();
		order.setItems(new ArrayList<Item>(inventory.getItems()));
		for (Item item : order.getItems()) {
			item.setQuantity("");
		}
		request.setAttribute("order", inventory);
		handleErrors(request);
		
		return "OrderEntryForm";
	}
	
	@RequestMapping(path = "/submitItems", method = RequestMethod.POST)
	public String submitItems(@ModelAttribute("order") Order order, HttpServletRequest request) {
		List<Item> selectedItems = new ArrayList<>();
		for (Item item : order.getItems()) {
			if (!item.getQuantity().isEmpty() && isStringNumeric(item.getQuantity())) {
				selectedItems.add(item);
			}
		}
		Order selectedOrder = new Order();
		selectedOrder.setItems(selectedItems);
		
		if (selectedItems.size() > 0) {
			request.getSession().setAttribute("order", selectedOrder);
			request.getSession().removeAttribute("errors");
			return "redirect:/purchase/paymentEntry";
		} else {
			request.getSession().setAttribute("errors", "No item was selected/invalid quantity specified. Please select items you want to purchase.");
			return "redirect:/purchase";
		}
	}
	
	@RequestMapping(path = "/paymentEntry", method = RequestMethod.GET)
	public String viewPaymentEntryForm(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("payment", new PaymentInfo());
		handleErrors(request);
		
		return "PaymentEntryForm";
	}
	
	@RequestMapping(path = "/submitPayment", method = RequestMethod.POST)
	public String submitPayment(@ModelAttribute("payment") PaymentInfo paymentInfo, HttpServletRequest request) {
		String error = validatePaymentInfo(paymentInfo);
		if (error.length() == 0) {
			request.getSession().setAttribute("payment", paymentInfo);
			return "redirect:/purchase/shippingEntry";
		} else {
			request.getSession().setAttribute("errors", error);
			return "redirect:/purchase/paymentEntry";
		}
	}
	
	@RequestMapping(path = "/shippingEntry", method = RequestMethod.GET)
	public String viewShippingEntryForm(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("shipping", new ShippingInfo());
		handleErrors(request);
		
		return "ShippingEntryForm";
	}
	
	@RequestMapping(path = "/submitShipping", method = RequestMethod.POST)
	public String submitShipping(@ModelAttribute("shipping") ShippingInfo shippingInfo, HttpServletRequest request) {
		String error = validateShippingInfo(shippingInfo);
		if (error.length() == 0) {
			request.getSession().setAttribute("shipping", shippingInfo);
			return "redirect:/purchase/viewOrder";
		} else {
			request.getSession().setAttribute("errors", error);
			return "redirect:/purchase/shippingEntry";
		}
	}
	
	@RequestMapping(path = "/viewOrder", method = RequestMethod.GET)
	public String viewOrderForm(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("order", request.getSession().getAttribute("order"));
		request.setAttribute("payment", request.getSession().getAttribute("payment"));
		request.setAttribute("shipping", request.getSession().getAttribute("shipping"));
		request.setAttribute("total", getTotalAmount((Order) request.getAttribute("order")));
		return "ViewOrder";
	}
	
	@RequestMapping(path = "/confirmOrder", method = RequestMethod.POST)
	public String confirmOrder(HttpServletRequest request) {
		return "redirect:/purchase/viewConfirmation";
	}
	
	@RequestMapping(path = "/viewConfirmation", method = RequestMethod.GET)
	public String viewConfirmation(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("orderId", ThreadLocalRandom.current().nextInt());
		return "Confirmation";
	}
	
	private Order instantiateStore() {	
		Order order = new Order();
		
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
		
		order.setItems(items);
		return order;
	}
	
	private String validatePaymentInfo(PaymentInfo paymentInfo) {
		String error = "";
		if (paymentInfo.cardNumber.length() != 16 || !isStringNumeric(paymentInfo.cardNumber)) {
			error += "Card Number";
		}
		if (paymentInfo.cvvCode.length() != 3 || !isStringNumeric(paymentInfo.cvvCode)) {
			error += error.length() == 0 ? "CVV Code" : ", CVV Code";
		}
		if (paymentInfo.personName.isEmpty()) {
			error += error.length() == 0 ? "Person Name" : ", Person Name";
		}
		
		if (paymentInfo.expiryDate.isEmpty() || !isExpiryDateValid(paymentInfo.expiryDate)) {
			error += error.length() == 0 ? "Expiry Date": ", Expiry Date";
		}
		return error.length() == 0 ? error : error + " fields cannot be left empty/have invalid data. Please specify valid data.";
	}
	
	private String validateShippingInfo(ShippingInfo shippingInfo) {
		String error = "";
		if (shippingInfo.addressLine1.isEmpty()) {
			error += "Address";
		}
		if (shippingInfo.city.isEmpty()) {
			error += error.length() == 0 ? "City" : ", City";
		}
		if (shippingInfo.state.isEmpty()) {
			error += error.length() == 0 ? "State" : ", State";
		}
		
		if (shippingInfo.zipCode.length() !=5 || !isStringNumeric(shippingInfo.zipCode)) {
			error += error.length() == 0 ? "Zip Code": ", Zip Code";
		}
		return error.length() == 0 ? error : error + " fields cannot be left empty/have invalid data. Please specify valid data.";
	}
	
	private void handleErrors(HttpServletRequest request) {
		if (request.getSession().getAttribute("errors") != null) {
			request.setAttribute("errors", request.getSession().getAttribute("errors"));
			request.getSession().removeAttribute("errors");
		}
	}
	
	private Boolean isStringNumeric(String str) {
		for (int i = 0; i < str.length(); i++) {
			if (str.charAt(i) < '0' || str.charAt(i) > '9') {
				return false;
			}
		}
		return true;
	}
	
	private Boolean isExpiryDateValid(String str) {
		try {
			DateTimeFormatter inputParser = DateTimeFormatter.ofPattern("MM/yyyy");
			YearMonth expiry = YearMonth.parse(str, inputParser);
			YearMonth now = YearMonth.now();
			if (expiry.isAfter(now) || (expiry.getMonthValue() == now.getMonthValue() &&
										expiry.getYear() == now.getYear())) {
				return true;
			} else {
				return false;
			}
		} catch (DateTimeParseException e) {
			return false;
		}
	}
	
	private double getTotalAmount(Order placedOrder) {
		double total = 0;
		for (Item item : placedOrder.getItems()) {
			total += (Double.parseDouble(item.price) * Integer.parseInt(item.quantity));
		}
		
		return total;
	}
}
