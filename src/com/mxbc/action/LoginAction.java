package com.mxbc.action;

import java.util.List;

import com.mxbc.dao.AdministratorDao;
import com.mxbc.entity.Administrator;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	private static final long serialVersionUID = -1399567227108158639L;
	private String username;
	private String password;
	
	private AdministratorDao administratorDao;
	
	public String login(){
		if("admin".equals(username) && "password".equals(password)){
			return "success_admin";
		}else{
			List<Administrator>list = administratorDao.findAllDao();
			for(Administrator admin:list){
				if(admin.getA_username().equals(username) && admin.getA_password().equals(password)){
					return "success_general";
				}
			}
		}
		return ERROR;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public AdministratorDao getAdministratorDao() {
		return administratorDao;
	}
	public void setAdministratorDao(AdministratorDao administratorDao) {
		this.administratorDao = administratorDao;
	}
}
