<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN" style="height:auto">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>银行日记账</title>
    <link rel="icon" href="<c:url value='/logo/logo.png'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/dashboard.css'/>">
    <script src="<c:url value='/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/js/html5shiv.min.js'/>"></script>
    <script src="<c:url value='/js/respond.js'/>"></script>
    <script type="text/javascript">
    	function edit(id,project){
    	//按照类型-project 和 唯一主键id
    		var total = $("#edit_"+project+"_total_"+id).val();
    		var sur = $("#edit_"+project+"_surplus_"+id).val();
    		var end_time = $("#edit_end_time").val();
    		var begin_time = $("#edit_begin_time").val();
    		var code = $("#edit_code").val();
    		location.href="List_Bank_Servlet?method=edit&project="+project+"&id="+id+"&code="+code+"&total="+total+"&surplus="+sur+"&end_time="+end_time+"&begin_time="+begin_time;
    	}
    	function del(id,project,num){
			password = prompt("请输入密码:","管理员密码");
			if(password != "99886"){
				alert("密码错误，删除失败!");
			}else{
				var end_time = $("#edit_end_time").val();
	    		var begin_time = $("#edit_begin_time").val();
	    		var code = $("#edit_code").val();
				alert("删除成功!");
				location.href="List_Bank_Servlet?method=del&num="+num+"&project="+project+"&id="+id+"&code="+code+"&end_time="+end_time+"&begin_time="+begin_time;
			}
    	}
    </script>
  </head>
  <body style="padding:0px;background:#f1f2f3 url(<%=request.getContextPath()%>/back_pic/back_pic.jpg);height:auto" >
  <nav class="navbar navbar-default" style="margin-top:2%;height:auto">
  <div class="container-fluid" style="height:auto">
        <div class="main" style="height:auto">
          <h2 class="sub-header">银行日记账——修改浏览</h2>
          <form id="bank_form" action="<c:url value='List_Bank_Servlet?method=list&pages_num=1'/>" method="post">
          <div class="form-group">
          		<input type="hidden" value="${begin_time}" id="edit_begin_time"/>
          		<input type="hidden" value="${end_time}" id="edit_end_time"/>
          		<input type="hidden" value="${code}" id="edit_code"/>
			    <label for="exampleInputEmail1">单位:${name}</label>
			    <label for="exampleInputEmail1">时间:${begin_time}至${end_time}</label>
			    <label for="exampleInputEmail1">共${rows}行/${pages}页</label>
			    <input type="hidden" value="${name}" id="p_name">
			    <input type="hidden" value="${rows}" id="p_rows">
			    <input type="hidden" value="${pages}" id="p_pages">
			    <!-- 
			    <span class="input-group-btn">
	        			<button id="return_button" onclick="viewToExcel();" class="btn btn-default" style="font-weight:bolder" type="button">确认修改</button>
	      		</span> 
	      		-->
		  </div>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>时间</th>
                  <th>编号</th>
                  <th>摘要</th>
                  <th>收入</th>
                  <th>支出</th>
                  <th>结余</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody style="font-size:14px;">
                <c:forEach var="a" items="${list}">
                	<tr>
                		<td class="print_time">${a.time}</td>
	                    <td class="print_num">${a.num}</td>
	                    <c:if test="${a.project == 1}">
	                    	<td class="print_project" style="color:red">存入</td>
	                    </c:if>
	                    <c:if test="${a.project == 2}">
	                    	<td class="print_project" style="color:green">抵用</td>
	                    </c:if>
	                    <c:if test="${a.project == 1}">
	                    	<td class="print_refund_total" style="color:red">￥<input id="edit_${a.project}_total_${a.id}" type="text" value="${a.pay_refund_total}"/></td>
	                    	<td></td>
	                    </c:if>
	                    <c:if test="${a.project == 2}">
	                    	<td></td>
	                    	<td class="print_refund_total" style="color:green">￥<input id="edit_${a.project}_total_${a.id}" type="text" value="${a.pay_refund_total}"/></td>
	                    </c:if>
	                    <td class="print_surplus">￥<input id="edit_${a.project}_surplus_${a.id}" type="text" value="${a.surplus}"/></td>
	                    <td><button type="button" class="btn btn-primary btn-xs" onclick="edit(${a.id},${a.project})" data-toggle="modal" data-target="#add_update_Modal">保存</button></td>
	                    <!--<td><button type="button" class="btn btn-primary btn-xs" onclick="del(${a.id},${a.project},${a.num})" data-toggle="modal" data-target="#add_update_Modal">删除</button></td>-->
               	    </tr>
                </c:forEach>
              </tbody>
            </table>
			</div>
          </div>
        </div>
      </div>
	</nav>
  </body>
</html>