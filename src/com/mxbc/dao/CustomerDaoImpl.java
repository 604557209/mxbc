package com.mxbc.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.mxbc.entity.Customer;

public class CustomerDaoImpl extends HibernateDaoSupport implements CustomerDao {

	public void addDao(Customer customer) {
		getHibernateTemplate().save(customer);
	}

	public void delDao(int id) {
		getHibernateTemplate().delete(getHibernateTemplate().get(Customer.class, id));
	}

	public Customer toUpdateDao(int c_num) {
		return (Customer)getHibernateTemplate().get(Customer.class, c_num);
	}

	public void updateDao(Customer customer) {
		getHibernateTemplate().update(customer);
	}

	@SuppressWarnings("unchecked")
	public List<Customer> findAllDao() {
		return getHibernateTemplate().find("from Customer");
	}

	public Customer findByNumDao(int c_num) {
		return (Customer)getHibernateTemplate().find("from Customer as e where e.c_num="+c_num).get(0);
	}

}