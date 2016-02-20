<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>预付款信息列表</title>
<link rel="icon" href="<c:url value='/logo/logo.png'/>">
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/css/dashboard.css'/>" rel="stylesheet">
<script src="<c:url value='/js/html5shiv.min.js'/>"></script>
<script src="<c:url value='/js/respond.js'/>"></script>
<script src="<c:url value='/js/jquery.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<script type="text/javascript">
    $(function() {
   			var svby = $("#select_value_begin_year").val();
   			var svey = $("#select_value_end_year").val();
			var page = $("#page_servlet").val();//选中跳转至的页数
			$("li").each(function(){
			    $(this).attr("class","");
			});
			var n = 4;
			var end = $("#pages_servlet").val();
			for(var m = 1;m <= end;m++,n++){
				//var s = document.getElementById('pages_ul');
				$("#pages_ul").append("<li id=li_"+m+" class=><a href=# onclick=fanye("+m+");>"+m+"</a></li>");
			}
			$("#pages_ul").append("<li>"
			      +"<a href=# aria-label=Next>"
			       + "<span aria-hidden=true>&raquo;</span>"
			     + "</a>"
			   + "</li>");
			$("#li_"+page).attr("class","active");
			//增加票据时，自动生成时间中的年份
			//获得当前年份
			var today = new Date();
	        year1 = today.getFullYear();
	        year2 = year1 + 1;
	        year3 = year2 + 1;
	        year0 = year1 - 1;
	        $("#sb_y_0").text(year0);
			$("#sb_y_1").text(year1);
			$("#sb_y_2").text(year2);
			$("#sb_y_3").text(year3);
			$("#se_y_0").text(year0);
			$("#se_y_1").text(year1);
			$("#se_y_2").text(year2);
			$("#se_y_3").text(year3);
			for(var i = 0;i < 4;i++){
				if($("#sb_y_"+i).text() == svby){
					$("#sb_y_"+i).attr("selected",true);
				} 
				if($("#se_y_"+i).text() == svey){
					$("#se_y_"+i).attr("selected",true);
				}
			}
		});
		function fanye(pages){
			$("#pay_form").attr("action","List_Pay_Prove_Servlet?method=list&page="+pages);
			tijiao();
		}
		function tijiao(){
			var change_times = new Array();
			change_times.push($("#select_begin_month").val());
			change_times.push($("#select_begin_day").val());
			change_times.push($("#select_end_month").val());
			change_times.push($("#select_end_day").val());
			for(i=0;i<change_times.length;i++){
				if(change_times[i].length==1){
					change_times[i] = "0"+change_times[i];
				}
			}
			begin_time = $("#select_begin_year").val()+"-"+change_times[0]+"-"+change_times[1];
			end_time = $("#select_end_year").val()+"-"+change_times[2]+"-"+change_times[3];
			$("#select_begin_time").val(begin_time);
			$("#select_end_time").val(end_time);
			$("#pay_form").submit();
		}
		function addFun(){
			var date;
	        var month;
	        var year;
	        var today = new Date();
	        year = today.getFullYear()+"";
	        month = today.getMonth() + 1;
	        month+="";
	        date = today.getDate()+"";
       		hour = today.getHours()+"";
			minute = today.getMinutes()+"";
			second = today.getSeconds()+"";
			if(month.length == 1){
				month = "0"+month;
			}if(date.length == 1){
				date = "0"+date;
			}if(hour.length == 1){
				hour = "0"+hour;
			}if(minute.length == 1){
				minute = "0"+minute;
			}if(second.length == 1){
				second = "0"+second;
			}
			
			var ok_time = year+"-"+month+"-"+date+" "+hour+":"+minute+":"+second;
	        $("#addpay_time").val(ok_time);
		}
		
		function update_customer(num){
			$("#up_c_num").val($("#l_c_num_"+num).text());
			$("#up_c_name").val($("#l_c_name_"+num).text());
			$("#up_c_phone").val($("#l_c_phone_"+num).text());
			$("#up_c_address").val($("#l_c_address_"+num).text());
			$("#up_c_area").val($("#l_c_area_"+num).text());
			$("#up_w_name").val($("#l_w_name_"+num).text());
			$("#up_w_phone").val($("#l_w_phone_"+num).text());
			$("#up_c_state").val($("#l_c_state_"+num).text());
			$("#up_c_time").val($("#l_c_time_"+num).text());
		}
    </script>
</head>
<body
	style="padding:0px;background:#f1f2f3 url(<%=request.getContextPath()%>/back_pic/back_pic.jpg);height:auto">

	<div class="modal fade" id="add_update_Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"  align="left">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="add_update_ModalLabel">修改该顾客信息：</h4>
	      </div>
	      <div class="modal-body">
	        <form name="test_id" id="test_id" action="Manager_AddressServlet?method=add" method="post">
	        	<table width="100%" style="line-height:32px">
			  	</th>
			  	<tr>
			  		<td width="125">编号</td>
			  		<td>
			  			<input readonly id="up_c_num" name="c_num" style="line-height:22px;font-size:13px"">
			  		</td>
			  	</tr>
			  	<tr>
			  		<td width="125">顾客姓名</td>
			  		<td>
			  			<input id="up_c_name" name="c_name" style="line-height:22px;font-size:13px"">
			  		</td>
			  	</tr>
			  	<tr>
			  		<td width="125">顾客电话</td>
			  		<td>
			  			<input id="up_c_phone" name="c_phone" style="line-height:22px;font-size:13px"">
			  		</td>
			  	</tr>
			  	<tr>
			  		<td width="125">店面地址</td>
			  		<td>
			  			<input id="up_c_address" name="c_address" style="line-height:22px;size:120;width:300px;font-size:13px">
			  		</td>
			  	</tr>
			  	<tr>
			  		<td width="125">所属区域</td>
			  		<td>
			  			<input id="up_c_area" name="c_area" style="line-height:22px;font-size:13px">
			  		</td>
			  	</tr>
			  	<tr>
			  		<td width="125">区域督导姓名</td>
			  		<td>
			  			<input id="up_w_name" name="w_name" style="line-height:22px;font-size:13px"">
			  		</td>
			  	</tr>
			  	<tr line-height="32px">
			  		<td width="125">督导电话</td>
			  		<td>
			  			<input id="up_w_phone" name="w_phone" style="line-height:22px;font-size:13px"">
			  		</td>
			  	</tr>
			  	<tr line-height="32px">
			  		<td width="125">信息状态</td>
			  		<td>
			  			<select>
			  				<option>审核中</option>
			  				<option>审核通过</option>
			  			</select>
			  		</td>
			  	</tr>
			  	<tr line-height="32px">
			  		<td width="125">时间</td>
			  		<td>
			  			<input readonly id="up_c_time" name="c_time" style="line-height:22px;font-size:13px"">
			  		</td>
			  	</tr>
			  </table>
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
				<h2 class="sub-header">顾客信息列表</h2>
				<div class="table-responsive">
					<table class="table table-striped" style="font-size:14px;">
						<thead>
							<tr>
								<th>编号</th>
								<th>顾客姓名</th>
								<th>顾客电话</th>
								<th>店面地址</th>
								<th>所属区域</th>
								<th>督导姓名</th>
								<th>督导电话</th>
								<th>当前状态</th>
								<th>时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="c" items="${list}">
								<tr>
									<td id="l_c_num_${c.c_num}">${c.c_num}</td>
									<td id="l_c_name_${c.c_num}">${c.c_name}</td>
									<td id="l_c_phone_${c.c_num}">${c.c_phone}</td>
									<td id="l_c_address_${c.c_num}">${c.c_address}</td>
									<td id="l_c_area_${c.c_num}">${c.c_area}</td>
									<td id="l_w_name_${c.c_num}">${c.w_name}</td>
									<td id="l_w_phone_${c.c_num}">${c.w_phone}</td>
									<c:if test="${c.c_state == 0}">
										<td id="l_c_state_${c.c_num}" style="color:green">审核中</td>
									</c:if>
									<c:if test="${c.c_state == 1}">
										<td id="l_c_state_${c.c_num}" style="color:red">审核通过</td>
									</c:if>
									<td id="l_c_time_${c.c_num}">${c.c_time}</td>
									<td>
										<button type="button" class="btn btn-primary btn-xs" onclick="update_customer(${c.c_num})" data-toggle="modal" data-target="#add_update_Modal">修改</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<form id="pay_form"
						action="<c:url value='List_Pay_Prove_Servlet?method=list&page=1'/>"
						method="post">
						<nav margin="0px">
							<ul class="pagination" id="pages_ul">
								<li><a href="#" aria-label="Previous"> <span
										aria-hidden="true">&laquo;</span>
								</a></li>
							</ul>
						</nav>

						<select id="select_begin_year" class="form-control list_begin_year" style="width:8%;display:inline" name="begin_year">
							<option id="sb_y_0"></option>
							<option id="sb_y_1"></option>
							<option id="sb_y_2"></option>
							<option id="sb_y_3"></option>
						</select> 年 
						<select id="select_begin_month"
							class="form-control list_begin_month"
							style="width:6%;display:inline" name="begin_month">
							<c:forEach var="month" begin="1" end="12">
								<option value="${month}"
									<c:if test="${month == begin_month_select}">selected="selected"</c:if>>${month}</option>
							</c:forEach>
						</select> 月 <select id="select_begin_day"
							class="form-control list_bank_time"
							style="width:6%;display:inline" name="begin_day">
							<c:forEach var="day" begin="1" end="31">
								<option value="${day}"
									<c:if test="${day == begin_day_select}">selected="selected"</c:if>>${day}</option>
							</c:forEach>
						</select> 日- 
						<select id="select_end_year" class="form-control list_bank_time" style="width:8%;display:inline" name="end_year">
							<option id="se_y_0"></option>
							<option id="se_y_1"></option>
							<option id="se_y_2"></option>
							<option id="se_y_3"></option>
						</select> 年 <select id="select_end_month"
							class="form-control list_bank_time"
							style="width:6%;display:inline" name="end_month">
							<c:forEach var="month" begin="1" end="12">
								<option value="${month}"
									<c:if test="${end_month_select == month}">selected="selected"</c:if>>${month}</option>
							</c:forEach>
						</select> 月 <select id="select_end_day" class="form-control list_bank_time"
							style="width:6%;display:inline" name="end_day">
							<c:forEach var="day" begin="1" end="31">
								<option value="${day}"
									<c:if test="${end_day_select == day}">selected="selected"</c:if>>${day}</option>
							</c:forEach>
						</select> 日 
						<input type="hidden" id="select_value_begin_year" value="${begin_year_select}">
						<input type="hidden" id="select_value_end_year" value="${end_year_select}">
						<input type="hidden" id="select_begin_time" name="begin_time">
						<input type="hidden" id="select_end_time" name="end_time">
						<input type="button" class="btn btn-default" onclick="fanye(1)" value="查看" />
						<!-- <button type="button" class="btn btn-primary" onclick="addFun()" data-toggle="modal" data-target="#add_update_Modal">添加</button> -->
					</form>
				</div>
			</div>
		</div>
		</div>
	</nav>
	<input type="hidden" id="pages_servlet" value="${pages}">
	<input type="hidden" id="page_servlet" value="${pages_num}">
</body>
</html>