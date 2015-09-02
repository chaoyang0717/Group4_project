<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="order.category.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Menu_Product</title>
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
	    	<jsp:include page="header2.jsp"></jsp:include>
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
						  <div class="panel-heading">菜單列表</div>
							<div class="panel-body">
							<%
									String strPPage = request.getParameter("m"); //設定一個變數判斷網頁後面的切分頁頁數
							
									int m;
									if (strPPage == null)
									{
										m = 1;
									} else
									{
										try
										{
											m = Integer.valueOf(strPPage);
											if (m < 0)
											{
												m = 1;
											}
										} catch (Exception e)
										{
											m = 1;
										}
							
									}
							
									final int P_PAGE_SIZE = 5; //每頁顯示幾筆
									int p_start_loc = (m - 1) * P_PAGE_SIZE + 1; //起始抓的筆數
									ProductDAO pdao = new ProductDAODBImpl();
									ArrayList<Product> mylist = pdao.getRangeProduct(p_start_loc, P_PAGE_SIZE);
							
									int p_TotalRows = pdao.getSize(); //計算總筆數
									int p_TotalPages = (int) Math.ceil((double) p_TotalRows / (double) P_PAGE_SIZE); //計算總頁數
								%>
	
								<table class="table table-hover table-striped " id="AAAA"><!--加入Table，套用bootstrape-->
									<tr >
										<th style="text-align:center;">&nbsp;</th>
										<th style="text-align:center;">產品編號</th>
										<th style="text-align:center;">種類編號</th>
										<th style="text-align:center;">中文名稱</th>
										<th style="text-align:center;">英文名稱</th>
										<th style="text-align:center;">單價</th>
										<th style="text-align:center;">Operate</th>
									</tr>
									<%
										for (Product p : mylist)
										{
									%>
									<tr class="parent" id="<%=p.product_id%>">
										<td align="center"><i class="glyphicon glyphicon-plus"></i></td>
										<td align="center"><%=p.product_id%></td>
										<td align="center"><%=p.category_id%></td>
										<td align="center"><%=p.product_name%></td>
										<td align="center"><%=p.product_name_en%></td>
										<td align="center"><%=p.price%></td>
										<td align="center">
											<a href="productEdit.jsp?id=<%=p.product_id%>">
											<i class="glyphicon glyphicon-edit"></i></a>
											<a href="productDelCode.jsp?id=<%=p.product_id%>" onclick="return confirm('確認刪除?')">
											<i class="glyphicon glyphicon-remove"></i></a>
										</td>
									</tr>
									<tr class="child_<%=p.product_id%>">
										
										<td colspan="7">摘要:<%=p.summary%><br/>檔案(b):<%=p.filename_big%><br/>檔案(s):<%=p.filename_small%></td>

									</tr>
									
									<%
										}
									%>
									<tr>
									</tr>				
								</table>
								<script type="text/javascript">
								$(function(){ //table摺疊打開
									 $('tr.parent').click(function(){   // 獲取所謂的父行 
										   $(this) 
										    .siblings('.child_'+this.id).toggle();  // 隱藏/顯示所謂的子行 
										 }).click(); 
										}) 
									
									
								</script>
									
							</div>
						  </div>
						  <div >
							<table id="example" class="table table-striped table-bordered">
							<tr>
							<% 
								final int P_PAGE_RANGE = 5;//要顯示幾個分頁
								int p_loc = (m-1) / P_PAGE_RANGE;
								int p_start_num = p_loc*P_PAGE_RANGE+1;//切換上X頁後的第一個頁數
								int p_end_num = p_loc*P_PAGE_RANGE+P_PAGE_RANGE;//切換下X頁後的第一個頁數
								int p_uplimit = (p_TotalPages > p_end_num) ? p_end_num : p_TotalPages;
								int j=p_start_num;
								
								
									if (p_start_num > P_PAGE_RANGE)
									{
									%>
										<td class="text-center"><a href="product.jsp?m=<%=j-P_PAGE_RANGE %>"><i class="glyphicon glyphicon-backward"></i></a></td>
										
									<%
									}else{
									%>
										<td class="text-center"><i class="glyphicon glyphicon-backward"></i></td>
									<%
									}
								
								for (;j<=p_uplimit;j++) {
								%>
								<% 
								
								if (m != j) { %>
								<td class="text-center" width="30px"> <a href="product.jsp?m=<%=j %>"><%=j %></a> </td>
								<% } else { %>
								<td class="text-center" width="30px"> <%=j %> </td>
								<% } %>
							<%		
								}
								
									if (p_TotalPages > p_end_num)
									{
									%>
										<td class="text-center"><a href="product.jsp?m=<%=j %>"><i class="glyphicon glyphicon-forward"></i></a></td>
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