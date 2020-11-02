package edu.osu.cse5234.controller;

import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.osu.cse5234.business.OrderProcessingServiceBean;
import edu.osu.cse5234.business.view.Inventory;
import edu.osu.cse5234.business.view.InventoryService;
import edu.osu.cse5234.model.Item;
import edu.osu.cse5234.model.LineItem;
import edu.osu.cse5234.model.Order;
import edu.osu.cse5234.model.PaymentInfo;
import edu.osu.cse5234.model.ShippingInfo;
import edu.osu.cse5234.util.ServiceLocator;

@Controller
@RequestMapping("/purchase")
public class Purchase {
	
	@RequestMapping(method = RequestMethod.GET)
	public String viewOrderEntryForm(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Order order = new Order();
		InventoryService inventoryService = ServiceLocator.getInventoryService();
		Inventory inventory = inventoryService.getAvailableInventory();
		
		ArrayList<LineItem> items = new ArrayList<>();
		for (@SuppressWarnings("unused") Item item : inventory.getItems()) {
			items.add(new LineItem());
		}

		order.setItems(items);
		request.setAttribute("order", order);
		request.setAttribute("inventory", inventory);
		handleErrors(request);

		return "OrderEntryForm";
	}

	@RequestMapping(path = "/checkInventory", method = RequestMethod.GET)
	@ResponseBody
	public String checkQuantity(HttpServletRequest request, HttpServletResponse response) {
		Item item = new Item();
		item.setName(request.getParameter("name"));
		item.setQuantity(request.getParameter("quantity"));

		InventoryService inventoryService = ServiceLocator.getInventoryService();
		if (inventoryService.validateQuantity(Collections.singletonList(item))) {
			return Boolean.TRUE.toString();
		} else {
			return Boolean.FALSE.toString();
		}
	}

	@RequestMapping(path = "/submitItems", method = RequestMethod.POST)
	public String submitItems(@ModelAttribute("order") Order order, HttpServletRequest request) {
		
		List<LineItem> selectedItems = new ArrayList<>(); 
		for (LineItem item : order.getItems()) {
			if (item.getQuantity() > 0) { 
				selectedItems.add(item); 
			}
		}
		Order selectedOrder = new Order();
		selectedOrder.setItems(selectedItems);
		
		OrderProcessingServiceBean orderProcessingServiceBean = ServiceLocator.getOrderProcessingService();
		if (orderProcessingServiceBean.validateItemAvailability(selectedOrder)) {
			request.getSession().setAttribute("order", selectedOrder);
			request.getSession().removeAttribute("errors");
			return "redirect:/purchase/paymentEntry";
		} else {
			request.getSession().setAttribute("errors",
					"No item was selected/invalid quantity specified. Please select items you want to purchase.");
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
		Order order = (Order) request.getSession().getAttribute("order");
		order.setShippingInfo((ShippingInfo) request.getSession().getAttribute("shipping"));
		order.setPaymentInfo((PaymentInfo) request.getSession().getAttribute("payment"));
		OrderProcessingServiceBean orderProcessingServiceBean = ServiceLocator.getOrderProcessingService();
		String confirmationCode = orderProcessingServiceBean
				.processOrder(order);
		request.getSession().setAttribute("orderId", confirmationCode);
		return "redirect:/purchase/viewConfirmation";
	}

	@RequestMapping(path = "/viewConfirmation", method = RequestMethod.GET)
	public String viewConfirmation(HttpServletRequest request, HttpServletResponse response) {
		/* request.setAttribute("orderId", ThreadLocalRandom.current().nextInt()); */
		return "Confirmation";
	}

	private String validatePaymentInfo(PaymentInfo paymentInfo) {
		String error = "";
		if (paymentInfo.getCardNumber().length() != 16 || !isStringNumeric(paymentInfo.getCardNumber())) {
			error += "Card Number";
		}
		if (paymentInfo.getCvvCode().length() != 3 || !isStringNumeric(paymentInfo.getCvvCode())) {
			error += error.length() == 0 ? "CVV Code" : ", CVV Code";
		}
		if (paymentInfo.getPersonName().isEmpty()) {
			error += error.length() == 0 ? "Person Name" : ", Person Name";
		}

		if (paymentInfo.getExpiryDate().isEmpty() || !isExpiryDateValid(paymentInfo.getExpiryDate())) {
			error += error.length() == 0 ? "Expiry Date" : ", Expiry Date";
		}
		return error.length() == 0 ? error
				: error + " fields cannot be left empty/have invalid data. Please specify valid data.";
	}

	private String validateShippingInfo(ShippingInfo shippingInfo) {
		String error = "";
		if (shippingInfo.getAddressLine1().isEmpty()) {
			error += "Address";
		}
		if (shippingInfo.getCity().isEmpty()) {
			error += error.length() == 0 ? "City" : ", City";
		}
		if (shippingInfo.getState().isEmpty()) {
			error += error.length() == 0 ? "State" : ", State";
		}

		if (shippingInfo.getZipCode().length() != 5 || !isStringNumeric(shippingInfo.getZipCode())) {
			error += error.length() == 0 ? "Zip Code" : ", Zip Code";
		}
		return error.length() == 0 ? error
				: error + " fields cannot be left empty/have invalid data. Please specify valid data.";
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
			if (expiry.isAfter(now)
					|| (expiry.getMonthValue() == now.getMonthValue() && expiry.getYear() == now.getYear())) {
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
		for (LineItem item : placedOrder.getItems()) {
			total += (item.getPrice() * item.getQuantity());
		}

		return total;
	}
}
