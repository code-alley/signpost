package kr.co.inslab.codealley.signpost.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.stripe.exception.APIConnectionException;
import com.stripe.exception.APIException;
import com.stripe.exception.AuthenticationException;
import com.stripe.exception.CardException;
import com.stripe.exception.InvalidRequestException;
import com.stripe.model.Charge;
import com.stripe.model.Customer;
import com.stripe.model.CustomerCollection;
import com.stripe.model.Plan;
import com.stripe.net.RequestOptions;

@Repository("billingService")
public class BillingService {
	
	/**
	 * Create a customer
	 * @param userId
	 * @param email
	 * @param stripeToken
	 * @param requestOptions
	 */
	public Customer createCustomer(String userId, String email, String stripeToken) {
		Customer customer = null;
		Map<String, Object> customerParams = new HashMap<String, Object>();
        customerParams.put("description", userId);
        customerParams.put("email", email);
        customerParams.put("source", stripeToken);
        
		try {
			customer = Customer.create(customerParams);
			System.out.println(customer);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return customer;
	}
	
	
	public void selectAllCustomer(RequestOptions requestOptions) {
		
		Map<String, Object> customerParams = new HashMap<String, Object>();
		customerParams.put("limit", 100);
        
		try {
			CustomerCollection allCustomerList = Customer.all(customerParams);
			System.out.println(allCustomerList);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	/**
	 * Create a charge
	 * @param amount
	 * @param name
	 * @param email
	 * @param number
	 * @param cvc
	 * @param card_expiry_month
	 * @param card_expiry_year
	 * @param requestOptions
	 */
	public void createCharge(String amount, String userId, String email, String number, String cvc, String card_expiry_month, String card_expiry_year) {
		
		Map<String, Object> chargeParams = new HashMap<String, Object>();
        chargeParams.put("amount", amount);
        chargeParams.put("currency", "usd");
        chargeParams.put("receipt_email", email);
        
        Map<String, Object> cardParams = new HashMap<String, Object>();
        cardParams.put("name", userId);
        cardParams.put("number", number);
        cardParams.put("cvc", cvc);
        cardParams.put("exp_month", card_expiry_month);
        cardParams.put("exp_year", card_expiry_year);
        
        chargeParams.put("card", cardParams);
        
		try {
			Charge charge = Charge.create(chargeParams);            
            System.out.println(charge);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	/**
	 * Create a plan
	 * @param amount
	 * @param interval
	 * @param requestOptions
	 */
	public void createPlan(String amount, String interval, String customerId) {
		
		Map<String, Object> planParams = new HashMap<String, Object>();
		planParams.put("amount", amount);
		planParams.put("interval", interval);
		planParams.put("currency", "usd");
		planParams.put("name", customerId);
		planParams.put("id", customerId);
        
		try {
			Plan plan = Plan.create(planParams);
            System.out.println(plan);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public void createSubscription(String customerId) {		
		Customer cu;
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("plan", customerId);
		
		try {
			cu = Customer.retrieve(customerId);
			cu.createSubscription(params);
		} catch (AuthenticationException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (InvalidRequestException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (APIConnectionException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (CardException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (APIException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
