package com.mxbc.action;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.mxbc.dao.CustomerDao;
import com.mxbc.entity.Customer;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class WeChatAction extends ActionSupport implements ModelDriven<Customer>{
	private static final long serialVersionUID = 5814015623149869328L;
	BeanFactory beanFactory = new ClassPathXmlApplicationContext("applicationContext-*.xml");
	CustomerDao customerDao = (CustomerDao)beanFactory.getBean("customerDao");
	
	private Customer customer = new Customer();
	
	public String findByNum() {
		customer = customerDao.findByNumDao(customer.getC_num());
		return SUCCESS;
	}
	
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Customer getModel() {
		return customer;
	}
	
}