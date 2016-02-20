<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Pragrma","no-cache"); 
response.setDateHeader("Expires",0); 
%>
<html lang="zh-CN" style="height:auto">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户列表</title>
    <link rel="icon" href="<c:url value='/logo/logo.png'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/dashboard.css'/>">
    <script src="<c:url value='/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
	
    <script src="<c:url value='/js/html5shiv.min.js'/>"></script>
    <script src="<c:url value='/js/respond.js'/>"></script>
	<script type="text/javascript">
	//修改信息
	function update_add(num,code,name,surplus,id){
		if(num == 1){
			$("#user-code").val(code);
			$("#user-name").val(name);
			$("#user-surplus").val(surplus);
			$("#user-id").val(id);
			$("#add_update_ModalLabel").text("修改该账户信息：");
			$("#test_id").attr("action","User_List_Servlet?method=update");
			$("#exist_code_remind").attr("style","display:none");
			$("#exist_name_remind").attr("style","display:none");
			$("#whether_update").val("1");
			$("#admin_update").val(code);
			$("#admin_update_name").val(name);
		}else if(num == 2){
			$("#user-code").val("");
			$("#user-name").val("");
			$("#user-surplus").val("");
			$("#user-id").val("");
			$("#add_update_ModalLabel").text("添加账户：");
			$("#test_id").attr("action","User_List_Servlet?method=add");
			$("#exist_code_remind").attr("style","display:none");
			$("#exist_name_remind").attr("style","display:none");
			$("#whether_update").val("2");
		}
	}
		/* 
			判断输入框的内容
			1.判断代码是否重复
		 */
		 
	//添加功能-判断
	function judge_each_add(ac){
		$(".code_td_class").each(function(){
			if((Number)($(this).text()) == (Number)($("#user-code").val())){
				ac = 1;
				//如果重复-显示提示
			}
		});	
		$(".name_td_class").each(function(){
			if($(this).text() == $("#user-name").val()){
				ac = 2;
			}
		});
		return ac;
	}
	//修改功能-判断
	function judge_each_update(ac){
		$(".code_td_class").each(function(){
			if((Number)($(this).text()) == (Number)($("#user-code").val())){
				if((Number)($(this).text()) != (Number)($("#admin_update").val())){
					ac = 1;
					//如果重复-显示提示
				}
			}
		});
		$(".name_td_class").each(function(){
			if($(this).text() == $("#user-name").val()){
				if($(this).text() != $("#admin_update_name").val()){
					ac = 2;
					//如果重复-显示提示
				}
			}
		});
		return ac;
	}
	//显示或隐藏提示，聚焦输入框
	function judge_doit(ac){
		if(ac == "0"){
			//隐藏
			$("#exist_code_remind").attr("style","display:none");
			$("#exist_name_remind").attr("style","display:none");
		}else if(ac == "1"){
			//显示
			$("#exist_code_remind").attr("style","color:red");
			//焦点至输入框
			$("#user-code").focus();
			//全选输入框的内容
			$("#user-code").select();
			$("#exist_name_remind").attr("style","display:none");
		}else if(ac == "2"){
			//显示
			$("#exist_name_remind").attr("style","color:red");
			//焦点至输入框
			$("#user-name").focus();
			//全选输入框的内容
			$("#user-name").select();
			$("#exist_code_remind").attr("style","display:none");
		}
	}
		$(function() {
			$(".form-control").click(function(){
				//添加账户
				if($("#whether_update").val() == 2){
					$("#exist_code_remind").attr("style","display:none");
					var ac = 0;
					ac = judge_each_add(ac);
					judge_doit(ac);
					//修改账户
				}else if($("#whether_update").val() == 1){
					$("#exist_code_remind").attr("style","display:none");
					var ac = 0;
					ac = judge_each_update(ac);	
					judge_doit(ac);
				}
			});
		});
		//保存信息
		function tijiao(){
			var bool = true;
			if($("#user-code").val() == "" || $("#user-name").val() == "" || $("#user-surplus").val() == ""){
				alert("请填写完整");
				bool = false;
			}
			if($("#whether_update").val() == 2){
				var ac = 0;
				ac = judge_each_add(ac);
				judge_doit(ac);
				if(ac != "0"){
					bool = false;
				}
			}else if($("#whether_update").val() == 1){
				var ac = 0;
				ac = judge_each_update(ac);
				judge_doit(ac);
				if(ac != "0"){
					bool = false;
				}
			}
			if(bool){
				$("#test_id").submit();
			}
		}
		//冻结账户
		function delete_user(){
			var id = $("#delete_user_id").val();
			location.href="User_List_Servlet?method=delete&id="+id;
		}
		//解冻账户
		function undelete_user(){
			var id = $("#delete_user_id").val();
			location.href = "User_List_Servlet?method=undelete&id="+id;
		}
		//更改提示框显示内容
		function firm(type,id){
			if(type == 1){
				$("#delete_ModalLabel").text("解冻该账户");
				$("#dongjie_button").text("解冻");
				$("#delete_user_id").val(id);
				$("#dongjie_button").attr("onclick","undelete_user();");
			}else if(type == 0){
				$("#delete_ModalLabel").text("冻结该账户");
				$("#dongjie_button").text("冻结");
				$("#delete_user_id").val(id);
				$("#dongjie_button").attr("onclick","delete_user();");
			}
		}
	</script>
  </head>
  <body style="padding:0px;background:#f1f2f3 url(<%=request.getContextPath()%>/back_pic/back_pic.jpg);height:auto" >
  <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" id="delete_user_ModalLabel">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    	<div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="delete_ModalLabel">冻结该账户：</h4>
	        <input type="hidden" name="delete_street" id="delete_user_id">
	    </div>
       <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" id="dongjie_button" class="btn btn-primary" onclick="delete_user();">冻结</button>
	   </div>
    </div>
  </div>
</div>
  
  <div class="modal fade" id="add_update_Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"  align="left">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="add_update_ModalLabel">修改该账户信息：</h4>
	      </div>
	      <div class="modal-body">
	        <form name="test_id" id="test_id" action="Manager_AddressServlet?method=add" method="post">
	        	<input type="hidden" id="whether_update" value="0">
	        	<input type="hidden" id="admin_update" value="0">
	        	<input type="hidden" id="admin_update_name" value="0">
	        	<div class="form-group">
	        		<label for="recipient-name" class="control-label" id="label_address">账户代码：<span id="exist_code_remind">已存在此代码</span></label>
	        		<input type="text" name="form_code" class="form-control" id="user-code">
	        	</div>
	        	<div class="form-group">
	        		<label for="recipient-name" class="control-label" id="label_address">账户名：<span id="exist_name_remind">已存在此账户</span></label>
	        		<input type="text" name="form_name" class="form-control" id="user-name">
	        	</div>
	        	<div class="form-group">
	        		<label for="recipient-name" class="control-label" id="label_address">账户余额：</label>
	        		<input type="text" name="form_surplus" class="form-control" id="user-surplus">
	        		<input type="hidden" id="user-id" name="form_id">
	        	</div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" onclick="tijiao();">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
  
  <nav class="navbar navbar-default" style="margin-top:2%;height:auto">
  <div class="container-fluid" style="height:auto">
        <div class="main" style="height:auto">
          <h2 class="sub-header">"预付款单位或个人"信息列表</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th width="10%">账户代码</th>
                  <th width="20%">账户名</th>
                  <th width="20%">账户余额</th>
                  <th width="20%">账户状态</th>
                  <th width="20%">操作</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="a" items="${list}">
                <tr>
                  <td class="code_td_class">${a.code}</td>
                  <td class="name_td_class">${a.name}</td>
                  <td>${a.surplus}</td>
                  <c:if test="${a.showd == 0}">
                  	<td>正常</td>	
                  </c:if>
                  <c:if test="${a.showd == 1}">
                  	<td>已冻结</td>	
                  </c:if>
                  <td>
                  	  <button type="button" class="btn btn-primary btn-xs" onclick="update_add(1,${a.code},'${a.name}','${a.surplus}',${a.id})" data-toggle="modal" data-target="#add_update_Modal">修改</button>
                  	  <c:if test="${a.showd == 0}">
                  	  	<button type="button" class="btn btn-primary btn-danger btn-xs" onclick="firm(0,${a.id})" data-toggle="modal" data-target="#delete_user_ModalLabel">冻结</button>	
                  	  </c:if>
                  	  <c:if test="${a.showd == 1}">
                  	  	<button type="button" class="btn btn-primary btn-danger btn-xs" onclick="firm(1,${a.id})" data-toggle="modal" data-target="#delete_user_ModalLabel">解冻</button>
                  	  </c:if>
                  </td>
                </tr>
	           </c:forEach>
	           <tr>
	           	<td><button type="button" class="btn btn-primary btn-xs" onclick="update_add(2,'','','')" data-toggle="modal" data-target="#add_update_Modal">添加</button></td>
	           	<td> </td><td> </td><td> </td><td></td>
	           </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
	</nav>
  </body>
</html>