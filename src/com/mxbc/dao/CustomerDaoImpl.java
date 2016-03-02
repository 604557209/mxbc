package com.mxbc.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.mxbc.entity.Customer;


public class CustomerDaoImpl extends HibernateDaoSupport implements CustomerDao {

	public void addDao(Customer customer) {
		super.getHibernateTemplate().save(customer);
	}

	public void delDao(int c_num) {
		super.getHibernateTemplate().delete(getHibernateTemplate().get(Customer.class, c_num));
	}

	public Customer toUpdateDao(int c_id) {
		return (Customer)getHibernateTemplate().get(Customer.class, c_id);
	}

	public void updateDao(Customer customer) {
		super.getHibernateTemplate().update(customer);
	}

	@SuppressWarnings("unchecked")
	public List<Customer> findAllDao() {
		return super.getHibernateTemplate().find("from Customer customer order by customer.c_id desc");
	}

	public Customer findByNumDao(int c_num) {
		Customer customer = new Customer();
		try{
			customer = (Customer)getHibernateTemplate().find("from Customer as e where e.c_num="+c_num).get(0);
		}catch(java.lang.Exception e){
			return customer;
		}
		return customer;
	}

	@SuppressWarnings("unchecked")
	public List<Customer> findAllByAreaDao(int c_area) {
		return super.getHibernateTemplate().find("from Customer customer where customer.c_area="+c_area+" order by customer.c_id desc");
	}

}