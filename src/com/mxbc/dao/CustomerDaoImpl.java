package com.mxbc.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.mxbc.entity.Customer;
import com.mxbc.util.PageModel;


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

	//分页
	@SuppressWarnings("unchecked")
	public PageModel findByPage(final int pageNo,final int pageSize){
		List<Customer> list = getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				return session.createQuery("from Customer")
						.setFirstResult((pageNo - 1) * pageSize)
						.setMaxResults(pageSize)
						.list();
			}
		});
		PageModel pageModel = new PageModel();
		pageModel.setPageNo(pageNo);
		pageModel.setPageSize(pageSize);
		pageModel.setList(list);
		pageModel.setTotalRecords((int)getTotalRecords());
		
		return pageModel;
	}
	
	private long getTotalRecords(){
		return (Long)getHibernateTemplate().find("select count(id) from Customer").get(0);
	}
	
	@SuppressWarnings("unchecked")
	public PageModel findByPage_ByArea(final int pageNo,final int pageSize,final int c_area){
		List<Customer> list = getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				return session.createQuery("from Customer where c_area="+c_area)
						.setFirstResult((pageNo - 1) * pageSize)
						.setMaxResults(pageSize)
						.list();
			}
		});
		PageModel pageModel = new PageModel();
		pageModel.setPageNo(pageNo);
		pageModel.setPageSize(pageSize);
		pageModel.setList(list);
		pageModel.setTotalRecords((int)getTotalRecords_ByArea(c_area));
		
		return pageModel;
	}
	
	private long getTotalRecords_ByArea(int c_area){
		return (Long)getHibernateTemplate().find("select count(id) from Customer where c_area="+c_area).get(0);
	}
	
}