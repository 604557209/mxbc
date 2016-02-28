package com.mxbc.dao;

import java.util.List;

import com.mxbc.entity.Administrator;


public interface AdministratorDao {
	public void addDao(Administrator administrator);
	
	public void delDao(int a_id);
	
	public Administrator toUpdateDao(int a_id);
	
	public void updateDao(Administrator administrator);
	
	public List<Administrator> findAllDao();
	
	public Administrator findByNumDao(int a_id);
}
