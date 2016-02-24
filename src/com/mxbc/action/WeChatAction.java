package com.mxbc.action;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
	private String message = new String();
	public String findByNum() {
		System.out.println(customer.getC_num()+"--------------->>>>>>>>>");
		String c_name = customer.getC_name();
		customer = customerDao.findByNumDao(customer.getC_num());
		if(c_name.equals(customer.getC_name())){
			message = "详情请拨打400-***-**，进行人工查询。";
			//审核通过
			if(customer.getC_state() == 4){
				return "pass";
			}
			//审核未通过
			else if(customer.getC_state() == 5){
				return "fail";
			}
		}
		//编号与姓名不匹配
		else{
			message = "请输入正确的编号与姓名！如有问题请拨打400-***-**人工服务！";
			customer = null;
			return "error";
		}
		return "normal";
	}
	
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

	public Customer getModel() {
		return customer;
	}
	
}