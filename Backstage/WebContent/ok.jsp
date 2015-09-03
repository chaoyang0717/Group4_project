<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="order.category.*,java.util.*"%>
<% 
	if(session.getAttribute("Login")==null){
		response.sendRedirect("login.jsp");
	}

%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>點餐後台管理</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-modal.css">
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/jquery.js"></script>
<link rel="stylesheet" href="css/mysite.css">



</head>
<body>
<div id="wrapper"> <!--最外框start-->

    <div id="header"><!--最上方標題列start-->
  		<jsp:include page="header.jsp"></jsp:include>
    </div><!--最上方標題列end-->
	
	<div div="header2">
		<div class="row">
		  <div class="col-md-1"></div>
		  <div class="col-md-10">
	      </div>
		  <div class="col-md-1"></div>
		</div>
	</div>
	
    <div id="content"><!--標題列下方內文start-->
    	<div class="row">
		  <div class="col-md-1"></div>
		  <div class="col-md-10">
		  
		  	 <div>
		  	 	<br/>
					<div class="panel panel-default">
						  <div class="panel-heading">訂單列表</div>
							<div class="panel-body">
							<%
									String PPage2 = request.getParameter("ord"); //設定一個變數判斷網頁後面的切分頁頁數
							
									int ord;
									if (PPage2 == null)
									{
										ord = 1;
									} else
									{
										try
										{
											ord = Integer.valueOf(PPage2);
											if (ord < 0)
											{
												ord = 1;
											}
										} catch (Exception e)
										{
											ord = 1;
										}
							
									}
							
									final int o_PAGE_SIZE = 5; //每頁顯示幾筆
									int o_start_loc = (ord - 1) * o_PAGE_SIZE + 1; //起始抓的筆數
									OrderDAO odao = new OrderDAOImpl();
									ArrayList<Order> mylist3 = odao.getRangeOrders(o_start_loc, o_PAGE_SIZE);
							
									int o_TotalRows = odao.getSize(); //計算總筆數
									int o_TotalPages = (int) Math.ceil((double) o_TotalRows / (double) o_PAGE_SIZE); //計算總頁數
								%>
	
								<table class="table table-hover table-striped "><!--加入Table，套用bootstrape-->
									<tr >
										<th style="text-align:center;">&nbsp;</th>
										<th style="text-align:center;">訂單編號</th>
										<th style="text-align:center;">會員編號</th>
										<th style="text-align:center;">客戶姓名</th>
										<th style="text-align:center;">客戶電話</th>
										<th style="text-align:center;">取貨方式</th>
										<th style="text-align:center;"> 住    址 </th>
										<th style="text-align:center;">Operate</th>
									</tr>
									<%
										for (Order order : mylist3)
										{
									%>
									
									<tr class="parent2" id="<%=order.order_id%>">
										<td align="center"><i class="glyphicon glyphicon-plus"></i></td>
										<td align="center"><%=order.order_id%></td>
										<td align="center"><%=order.member_id%></td>
										<td align="center"><%=order.customer_name%></td>
										<td align="center"><%=order.customer_tel%></td>
										<td align="center"><%=order.take%></td>
										<td align="center"><%=order.address%></td>
										<td align="center">
											<a href="back_orderEdit.jsp?id=<%=order.order_id%>">
											<i class="glyphicon glyphicon-edit"></i></a>
											<a href="back_orderDelCode.jsp?id=<%=order.order_id%>" onclick="return confirm('確認刪除?')">
											<i class="glyphicon glyphicon-remove"></i></a>
										</td>
									</tr>
									<tr class="child2_<%=order.order_id%>">
											
										<td colspan="7">
										<% 
											for(OrderList list:order.Detail){
											%>
										產品編號:<%=list.product_id%><br/>產品名稱:<%=list.product_id%><br/>價錢:<%=list.price%><br/>數量:<%=list.quantity%><br/>
										***********************************	<br/>
											<!-- <table class="table">
											<tr >
												<td style="text-align:center;">產品編號</td>
												<td style="text-align:center;">產品名稱</td>
												<td style="text-align:center;">價錢</td>
												<td style="text-align:center;">數量</td>
											</tr>

											
											<tr>
												<td align="center"><%//=list.product_id%></td>
												<td align="center"><%//=list.product_name_ch%></td>
												<td align="center"><%//=list.price%></td>
												<td align="center"><%//=list.quantity%></td>
											</tr>
											 -->
											<%} %>
											</td>
											<!-- </table> -->

									</tr>
									<%
										}
									%>
													
								</table>
								<script type="text/javascript">
								$(function(){ //table摺疊打開
									 $('tr.parent2').click(function(){   // 獲取所謂的父行 
										   $(this) 
										    .siblings('.child2_'+this.id).toggle();  // 隱藏/顯示所謂的子行 
										 }).click(); 
										}) 
									
									
								</script>
									
							</div>
						  </div>
						  <div >
							<table id="example" class="table table-striped table-bordered">
							<tr>
							<% 
								final int o_PAGE_RANGE = 5;//要顯示幾個分頁
								int o_loc = (ord-1) / o_PAGE_RANGE;
								int o_start_num = o_loc*o_PAGE_RANGE+1;//切換上X頁後的第一個頁數
								int o_end_num = o_loc*o_PAGE_RANGE+o_PAGE_RANGE;//切換下X頁後的第一個頁數
								int o_uplimit = (o_TotalPages > o_end_num) ? o_end_num : o_TotalPages;
								int r=o_start_num;
								
								
									if (o_start_num > o_PAGE_RANGE)
									{
									%>
										<td class="text-center"><a href="back_ok.jsp?ord=<%=r-o_PAGE_RANGE %>"><i class="glyphicon glyphicon-backward"></i></a></td>
										
									<%
									}else{
									%>
										<td class="text-center"><i class="glyphicon glyphicon-backward"></i></td>
									<%
									}
								
								for (;r<=o_uplimit;r++) {
								%>
								<% 
								
								if (ord != r) { %>
								<td class="text-center" width="30px"> <a href="back_ok.jsp?ord=<%=r %>"><%=r %></a> </td>
								<% } else { %>
								<td class="text-center" width="30px"> <%=r %> </td>
								<% } %>
							<%		
								}
								
									if (o_TotalPages > o_end_num)
									{
									%>
										<td class="text-center"><a href="back_ok.jsp?ord=<%=r %>"><i class="glyphicon glyphicon-forward"></i></a></td>
									<%
									}else{
										%>
										<td class="text-center"><i class="glyphicon glyphicon-forward"></i></td>
									<%
									}
								
								
							%>
							
							</tr>
							</table>
						</div>
			</div>

		  </div>
		  <div class="col-md-1"></div>
		</div>
    
    </div><!--標題列下方內文end-->

</div><!--最外框end-->
</body>
</html>