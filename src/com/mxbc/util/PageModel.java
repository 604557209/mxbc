package com.mxbc.util;

import java.util.List;

public class PageModel {
	//总记录数
	private int totalRecords;
	//结果集
	private List list;
	//当前页
	private int pageNo;
	//每页显示多少条
	private int pageSize;
	
	/**
	 * 取得总页数
	 */
	public int getTotalRecords() {
		return (totalRecords + pageSize - 1) / pageSize;
	}
	
}
