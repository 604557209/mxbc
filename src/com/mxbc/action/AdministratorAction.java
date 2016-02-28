package com.mxbc.action;

import java.util.List;

import com.mxbc.dao.AdministratorDao;
import com.mxbc.entity.Administrator;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


public class AdministratorAction extends ActionSupport implements ModelDriven<Administrator>{
	
	private static final long serialVersionUID = -7996771675564687912L;
	//private EmployeeDao employeeDao = EmployeeDaoImpl.getInstance();
//	BeanFactory beanFactory = new ClassPathXmlApplicationContext("applicationContext-*.xml");
//	CustomerDao customerDao = (CustomerDao)beanFactory.getBean("customerDao");
	
	private AdministratorDao administratorDao;
	
	private List<Administrator> list;
	private Administrator administrator = new Administrator();
	
//---------------------------------------------------------------
	public String add(){
		administratorDao.addDao(administrator);
		return SUCCESS;
	}
	
	public String delete(){
		administratorDao.delDao(administrator.getA_id());
		return SUCCESS;
	}
	
	public String toUpdate(){
		administrator = administratorDao.toUpdateDao(administrator.getA_id());
		return SUCCESS;
	}
	
	public String update(){
		administratorDao.updateDao(administrator);
		return SUCCESS;
	}
	
	public String findAll(){
		list = administratorDao.findAllDao();
		return SUCCESS;
	}
	
	public String findByNum(){
		administrator = administratorDao.findByNumDao(administrator.getA_id());
		list = administratorDao.findAllDao();
		return SUCCESS;
	}
//---------------------------------------------------------------

	public AdministratorDao getAdministratorDao() {
		return administratorDao;
	}

	public void setAdministratorDao(AdministratorDao administratorDao) {
		this.administratorDao = administratorDao;
	}

	public List<Administrator> getList() {
		return list;
	}

	public void setList(List<Administrator> list) {
		this.list = list;
	}

	public Administrator getAdministrator() {
		return administrator;
	}

	public void setAdministrator(Administrator administrator) {
		this.administrator = administrator;
	}
	public Administrator getModel() {
		return administrator;
	}
}