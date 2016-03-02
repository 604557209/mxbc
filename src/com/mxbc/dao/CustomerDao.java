package com.mxbc.dao;

import java.util.List;

import com.mxbc.entity.Customer;
import com.mxbc.util.PageModel;


public interface CustomerDao {
	public void addDao(Customer customer);
	
	public void delDao(int c_num);
	
	public Customer toUpdateDao(int c_id);
	
	public void updateDao(Customer customer);
	
	public List<Customer> findAllDao();
	
	public Customer findByNumDao(int c_num);
	
	public List<Customer> findAllByAreaDao(int c_area);
	
	public PageModel findByPage(final int pageNo,final int pageSize);
	
	public PageModel findByPage_ByArea(final int pageNo,final int pageSize,int c_area);
}
