package com.mxbc.action;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	private static final long serialVersionUID = -1399567227108158639L;
	private String username;
	private String password;
	public String login(){
		if("admin".equals(username) && "password".equals(password)){
			return SUCCESS;
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
}
