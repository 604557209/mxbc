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

		//¥
	function viewToExcel(){
		//alert("开始取值");
		var Ar_time = new Array();
		var Ar_num = new Array();
		var Ar_project = new Array();
		var Ar_price = new Array();
		var Ar_sur = new Array();
		$(".print_time").each(function(){
			var time_date = $(this).text().split(" ");
			Ar_time.push(time_date[0]);
		});
		$(".print_num").each(function(){
			Ar_num.push($(this).text());
		});
		$(".print_project").each(function(){
			Ar_project.push($(this).text());
		});
		$(".print_refund_total").each(function(){
			Ar_price.push($(this).text());
		});
		$(".print_surplus").each(function(){
			Ar_sur.push($(this).text());
		});
		
		//alert("遍历取值完毕");
		var i_rows=0;
		var all_rows = $("#p_rows").val();//总行数
		var all_pages = $("#p_pages").val();//总页数
		
		//alert("servlet取值完毕");
		for(var i=1;i<=all_pages;i++){
			//alert("开始打印第"+i+"页");
			var filepath = "d:\\bank.xls";
	    	var xlApp;
	    	var xlBook;
	    	var xlSheet;
	    	try {  
	            xlApp = new ActiveXObject("Excel.Application");  
	        }  
	        catch (e) {  
	        	alert("请使用IE浏览器，并检查安全选项");
	            return;  
	        }
	        xlBook = xlApp.Workbooks.Open(filepath);
	        xlSheet = xlBook.ActiveSheet;
	        
			xlSheet.Cells(5,39).value="第  "+i+" 页";
			xlSheet.Cells(5,3).value=$("#p_name").val();
			xlSheet.Cells(7,1).value="2015年";
			//alert("页头信息填入完毕");
			//每一页
			for(var j=9;j<=25;j++){
				if((i_rows) != all_rows){
				var time = Ar_time[i_rows].split("-");
				xlSheet.Cells(j,1).value=time[1];
				xlSheet.Cells(j,2).value=time[2];
				xlSheet.Cells(j,4).value=Ar_num[i_rows];
				xlSheet.Cells(j,7).value=Ar_project[i_rows];
				//alert("日期信息填入完毕");
				//收入 / 支出
				var price_all = Ar_price[i_rows].split(".");
				var xiaoshu_price = new Array();
	    		var zhengshu_price = new Array();
				if(price_all[1] == null){
					price_all[1] = "00";
				}
				xiaoshu_price = price_all[1];
	    		zhengshu_price = price_all[0];
	    		if(xiaoshu_price.length == 1){
					xiaoshu_price = xiaoshu_price + "0";
				}
				//alert("小数整数已处理");
				if(Ar_project[i_rows] == "存入"){
					for(var j_s=12,j_s1=9;j_s<=20;j_s++,j_s1--){
						//整数
						var li = zhengshu_price.length-j_s1;
						//alert("("+j+","+j_s+")"+"("+li+"+)");
						xlSheet.Cells(j,j_s).value=zhengshu_price[zhengshu_price.length-j_s1];
					}
					xlSheet.Cells(j,21).value=xiaoshu_price[0];xlSheet.Cells(j,22).value=xiaoshu_price[1];
				}else if(Ar_project[i_rows] == "抵用"){
					for(var j_c=23,j_c1=9;j_c<=31;j_c++,j_c1--){
						//整数
						xlSheet.Cells(j,j_c).value=zhengshu_price[zhengshu_price.length-j_c1];
					}
					xlSheet.Cells(j,32).value=xiaoshu_price[0];xlSheet.Cells(j,33).value=xiaoshu_price[1];
				}
				//alert("收入填入完毕")
				//结余
				var price_sur = Ar_sur[i_rows].split(".");
				var xiaoshu_sur = new Array();
	    		var zhengshu_sur = new Array();
				if(price_sur[1] == null){
					price_sur[1] = "00";
				}
				xiaoshu_sur = price_sur[1];
	    		zhengshu_sur = price_sur[0];
	    		if(xiaoshu_sur.length == 1){
					xiaoshu_sur = xiaoshu_sur + "0";
				}
				for(var j_j=35,j_j1=9;j_j<=43;j_j++,j_j1--){
					//整数
					xlSheet.Cells(j,j_j).value=zhengshu_sur[zhengshu_sur.length-j_j1];
				}
				xlSheet.Cells(j,44).value=xiaoshu_sur[0];xlSheet.Cells(j,45).value=xiaoshu_sur[1];
				//alert("结余填入完毕");
				i_rows++;
			}
			}
			alert("开始打印第"+i+"页");
			//xlBook.SaveAs("d:\\bank_ac_"+i+".xls");
			xlBook.PrintOut;
			xlBook.Close(false);
		}
		alert("打印完成");
		
    }
	</script>
  </head>
  <body style="padding:0px;background:#f1f2f3 url(<%=request.getContextPath()%>/back_pic/back_pic.jpg);height:auto" >
  <nav class="navbar navbar-default" style="margin-top:2%;height:auto">
  <div class="container-fluid" style="height:auto">
        <div class="main" style="height:auto">
          <h2 class="sub-header">银行日记账——打印浏览</h2>
          <form id="bank_form" action="<c:url value='List_Bank_Servlet?method=list&pages_num=1'/>" method="post">
          <div class="form-group">
			    <label for="exampleInputEmail1">单位:${name}</label>
			    <label for="exampleInputEmail1">时间:${begin_time}至${end_time}</label>
			    <label for="exampleInputEmail1">共${rows}行/${pages}页</label>
			    <input type="hidden" value="${name}" id="p_name">
			    <input type="hidden" value="${rows}" id="p_rows">
			    <input type="hidden" value="${pages}" id="p_pages">
			    <span class="input-group-btn">
	        			<button id="return_button" onclick="viewToExcel();" class="btn btn-default" style="font-weight:bolder" type="button">开始打印</button>
	      		</span>
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
	                    	<td class="print_refund_total" style="color:red">￥${a.pay_refund_total}</td>
	                    	<td></td>
	                    </c:if>
	                    <c:if test="${a.project == 2}">
	                    	<td></td>
	                    	<td class="print_refund_total" style="color:green">￥${a.pay_refund_total}</td>
	                    </c:if>
	                    <td class="print_surplus">￥${a.surplus}</td>
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