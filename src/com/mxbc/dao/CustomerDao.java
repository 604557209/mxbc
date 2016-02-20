package com.mxbc.dao;

import java.util.List;

import com.mxbc.entity.Customer;


public interface CustomerDao {
	public void addDao(Customer customer);
	
	public void delDao(int id);
	
	public Customer toUpdateDao(int id);
	
	public void updateDao(Customer customer);
	
	public List<Customer> findAllDao();
	
	public Customer findByNumDao(int c_num);
}
