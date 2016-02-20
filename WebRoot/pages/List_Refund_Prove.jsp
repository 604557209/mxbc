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

    <title>退款信息列表</title>
    <link rel="icon" href="<c:url value='/logo/logo.png'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/dashboard.css'/>">
    <script src="<c:url value='/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/js/html5shiv.min.js'/>"></script>
    <script src="<c:url value='/js/respond.js'/>"></script>
	<script type="text/javascript">
		function notes(order_in){
			var notes_one = new Array();
			var notes_one_in = new Array();
			notes_one = order_in.split(";");
			for(var j = 0;j < 3;j++){
				$("#tr_name_"+j).attr("style","display:");
				$("#name_"+j).text("");
				$("#numb_"+j).text("");
				$("#nume_"+j).text("");
				$("#nums_"+j).text("");
				$("#price_"+j).text("");	
			}
			for(var i = 0;i < notes_one.length;i++){
				notes_one_in = notes_one[i].split(",");
				$("#name_"+i).text(notes_one_in[0]);
				$("#numb_"+i).text(notes_one_in[1]);
				$("#nume_"+i).text(notes_one_in[2]);
				$("#nums_"+i).text(notes_one_in[3]);
				if(notes_one_in[4]){
					$("#price_"+i).text("￥"+notes_one_in[4]);					
				}
			}
			
			for(var j = 0;j < 3;j++){
				if($("#name_"+j).text() == ""){
					$("#tr_name_"+j).attr("style","display:none");
				}
			}
		}
		
		$(function() {
			var bys = $("#begin_year_select").val();
			var eys = $("#end_year_select").val();
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
				if($("#sb_y_"+i).text() == bys){
					$("#sb_y_"+i).attr("selected",true);
				} 
				if($("#se_y_"+i).text() == eys){
					$("#se_y_"+i).attr("selected",true);
				}
			}
		
			var page = $("#page_servlet").val();//选中跳转至的页数
			$("li").each(function(){
			    $(this).attr("class","");
			});
			var n = 4;
			var end = $("#pages_servlet").val();
			for(var m = 1;m <= end;m++,n++){
				//var s = document.getElementById('pages_ul');
				//$("#pages_ul").append("<li id=li_"+m+" class=><a href=List_Refund_Prove_Servlet?method=list&page="+m+" >"+m+"</a></li>");
				$("#pages_ul").append("<li id=li_"+m+" class=><a href=# onclick=fanye("+m+");>"+m+"</a></li>");
				/*var t = s.childNodes.length;
				var li = document.createElement("li");
				li.id = "li_"+m;
				li.className = "";
				li.innerHTML = "<a href=List_Refund_Prove_Servlet?method=list&page="+m+" >"+m+"</a>";
				for (var i = 0; i < t; i++) {
					if (n == -1) {
						s.appendChild(li);
					} else if (i == n - 1) {
						s.insertBefore(li, s.childNodes[i]);
					}
				}*/
			}
			$("#pages_ul").append("<li>"
			      +"<a href=# aria-label=Next>"
			       + "<span aria-hidden=true>&raquo;</span>"
			     + "</a>"
			   + "</li>");
			$("#li_"+page).attr("class","active");
		});
		function fanye(pages){
			$("#refund_form").attr("action","List_Refund_Prove_Servlet?method=list&page="+pages);
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
			$("#refund_form").submit();
		}
	</script>
  </head>
  <body style="padding:0px;background:#f1f2f3 url(<%=request.getContextPath()%>/back_pic/back_pic.jpg);height:auto" >
  <div class="modal fade" id="Notes_Model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"  align="left">
  <div class="modal-dialog" role="document">
  <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="add_update_ModalLabel">凭证票据详情：</h4>
	      </div>
	      <div class="modal-body">
	        <table class="table table-striped">
              <thead>
                <tr>
                  <th>票据名称</th>
                  <th>起号</th>
                  <th>止号</th>
                  <th>张数</th>
                  <th>款额</th>
                </tr>
              </thead>
              <tbody>
	                <tr id="tr_name_0">
	                  <td id="name_0">现付货票</td>
	                  <td id="numb_0">0</td>
	                  <td id="nume_0">0</td>
	                  <td id="nums_0">0</td>
	                  <td id="price_0">100.0</td>
	                </tr>
	                <tr id="tr_name_1">
	                  <td id="name_1"></td>
	                  <td id="numb_1"></td>
	                  <td id="nume_1"></td>
	                  <td id="nums_1"></td>
	                  <td id="price_1"></td>
	                </tr>
	                <tr id="tr_name_2">
	                  <td id="name_2"></td>
	                  <td id="numb_2"></td>
	                  <td id="nume_2"></td>
	                  <td id="nums_2"></td>
	                  <td id="price_2"></td>
	                </tr>
	                <tr id="tr_name_3">
	                  <td id="name_3"></td>
	                  <td id="numb_3"></td>
	                  <td id="nume_3"></td>
	                  <td id="nums_3"></td>
	                  <td id="price_3"></td>
	                </tr>
              </tbody>
            </table>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	      </div>
	    </div>
	    </div>
	    </div>
  <nav class="navbar navbar-default" style="margin-top:2%;height:auto">
  <div class="container-fluid" style="height:auto">
        <div class="main" style="height:auto">
          <h2 class="sub-header">预付款抵用（退款）凭证列表</h2>
          <div class="table-responsive">
            <table class="table table-striped" style="font-size:14px;">
              <thead>
                <tr>
                  <th>编号</th>
                  <th>预付款单位或个人</th>
                  <th>票据内容</th>
                  <th>退款金额</th>
                  <th>经办人</th>
                  <th>时间</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach var="a" items="${list}">
	                <tr>
	                  <td>${a.num}</td>
	                  <td><a href="List_Bank_Servlet?method=list&name=${a.code}&pages_num=1">${a.name}</a></td>
	                  <td><a href="#" data-toggle="modal" data-target="#Notes_Model" onclick="javascript:notes('${a.order_in}');">详情</a></td>
	                  <td>￥${a.refund_total}</td>
	                  <td>${a.operator}</td>
	                  <td>${a.time}</td>
	                  <c:if test="${a.nullify == 0}">
	                  	<td>
	                  		<a href="List_Refund_Prove_Servlet?method=nullify&id=${a.id}&code=${a.code}&money=${a.refund_total}&state=1">作废</a>
	                  	</td>
	                  </c:if>
	                  <c:if test="${a.nullify == 1}">
	                  	<td>
	                  		<a style="color:red" href="List_Refund_Prove_Servlet?method=nullify&id=${a.id}&code=${a.code}&money=${a.refund_total}&state=0">恢复</a>
	                  	</td>
	                  </c:if>
	                </tr>
                </c:forEach>
              </tbody>
            </table>
            <form id="refund_form" action="<c:url value='List_Refund_Prove_Servlet?method=list&page=1'/>" method="post">
            <nav margin="0px">
			  <ul class="pagination" id="pages_ul">
			    <li>
			      <a href="#" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			  </ul>
			  </nav>
          <select id="select_begin_year" class="form-control list_begin_year" style="width:8%;display:inline" name="begin_year">
		   	    <option id="sb_y_0"></option>
				<option id="sb_y_1"></option>
				<option id="sb_y_2"></option>
				<option id="sb_y_3"></option>
			  </select>
			  年
			  <select id="select_begin_month" class="form-control list_begin_month" style="width:6%;display:inline" name="begin_month">
			  		
			   	  <c:forEach var="month" begin="1" end="12">
				    	<option value="${month}" <c:if test="${month == begin_month_select}">selected="selected"</c:if>>${month}</option>
				    </c:forEach>
			  </select>
			  月
			  <select id="select_begin_day" class="form-control list_bank_time" style="width:6%;display:inline" name="begin_day">
			  		
			   	  <c:forEach var="day" begin="1" end="31">
				    	<option value="${day}" <c:if test="${day == begin_day_select}">selected="selected"</c:if>>${day}</option>
				    </c:forEach>
			  </select>
			  日-
			  <select id="select_end_year" class="form-control list_bank_time" style="width:8%;display:inline" name="end_year">
		   	    <option id="se_y_0"></option>
				<option id="se_y_1"></option>
				<option id="se_y_2"></option>
				<option id="se_y_3"></option>
			  </select>
			  年
			  <select id="select_end_month" class="form-control list_bank_time" style="width:6%;display:inline" name="end_month">
			  	
			   	  <c:forEach var="month" begin="1" end="12">
				    	<option value="${month}" <c:if test="${end_month_select == month}">selected="selected"</c:if>>${month}</option>
				    </c:forEach>
			  </select>
			  月
			  <select id="select_end_day" class="form-control list_bank_time" style="width:6%;display:inline" name="end_day">
			  	
			   	  <c:forEach var="day" begin="1" end="31">
				    	<option value="${day}" <c:if test="${end_day_select == day}">selected="selected"</c:if>>${day}</option>
				    </c:forEach>
			  </select>
			  日
			  <input type="hidden" id="select_begin_time" name="begin_time">
			  <input type="hidden" id="select_end_time" name="end_time">
			  <input type="hidden" id="begin_year_select" value="${begin_year_select}">
			  <input type="hidden" id="end_year_select" value="${end_year_select}">
			  <input type="button" class="btn btn-default" onclick="fanye(1)" value="查看"/>
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