package com.mxbc.dao;

import java.util.List;

import com.mxbc.entity.Customer;


public interface CustomerDao {
	public void addDao(Customer customer);
	
	public void delDao(int c_num);
	
	public Customer toUpdateDao(int c_id);
	
	public void updateDao(Customer customer);
	
	public List<Customer> findAllDao();
	
	public Customer findByNumDao(int c_num);
}
