package com.mxbc.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.mxbc.entity.Administrator;

public class AdministratorDaoImpl extends HibernateDaoSupport implements AdministratorDao {

	@Override
	public void addDao(Administrator administrator) {
		// TODO Auto-generated method stub
		super.getHibernateTemplate().save(administrator);
	}

	@Override
	public void delDao(int a_id) {
		// TODO Auto-generated method stub
		super.getHibernateTemplate().delete(getHibernateTemplate().get(Administrator.class, a_id));
	}

	@Override
	public Administrator toUpdateDao(int a_id) {
		// TODO Auto-generated method stub
		return (Administrator)getHibernateTemplate().get(Administrator.class, a_id);
	}

	@Override
	public void updateDao(Administrator administrator) {
		// TODO Auto-generated method stub
		super.getHibernateTemplate().update(administrator);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Administrator> findAllDao() {
		// TODO Auto-generated method stub
		return super.getHibernateTemplate().find("from Administrator");
	}

	@Override
	public Administrator findByNumDao(int a_id) {
		// TODO Auto-generated method stub
		Administrator administrator = new Administrator();
		try{
			administrator = (Administrator)getHibernateTemplate().find("from Administrator as a where a.a_id="+a_id).get(0);
		}catch(java.lang.Exception e){
			return administrator;
		}
		return administrator;
	}

}
