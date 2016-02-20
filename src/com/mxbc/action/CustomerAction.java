package com.mxbc.action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.mxbc.dao.CustomerDao;
import com.mxbc.entity.Customer;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


public class CustomerAction extends ActionSupport implements ModelDriven<Customer>{
	
	//private EmployeeDao employeeDao = EmployeeDaoImpl.getInstance();
	BeanFactory beanFactory = new ClassPathXmlApplicationContext("applicationContext-*.xml");
	CustomerDao customerDao = (CustomerDao)beanFactory.getBean("customerDao");
	
	private List<Customer> list;
	private Customer customer = new Customer();
	
//---------------------------------------------------------------
	public String add(){
		//获得 当前 系统 时间
		java.util.Date date = new java.util.Date();
		customer.setC_time(date);
		customer.setC_state(0);
		customerDao.addDao(customer);
		return SUCCESS;
	}
	
	public String delete(){
		customerDao.delDao(customer.getC_num());
		return SUCCESS;
	}
	
	public String toUpdate(){
		customer = customerDao.toUpdateDao(customer.getC_num());
		return SUCCESS;
	}
	
	public String update(){
		customerDao.updateDao(customer);
		return SUCCESS;
	}
	
	public String findAll(){
		list = customerDao.findAllDao();
		return SUCCESS;
	}
	
	public String findByNum(){
		customer = customerDao.findByNumDao(customer.getC_num());
		list = customerDao.findAllDao();
		return SUCCESS;
	}
//---------------------------------------------------------------
	public List<Customer> getList() {
		return list;
	}
	public void setList(List<Customer> list) {
		this.list = list;
	}
	public Customer getcustomer() {
		return customer;
	}
	public void setcustomer(Customer customer) {
		this.customer = customer;
	}
	
	public Customer getModel() {
		return customer;
	}
}