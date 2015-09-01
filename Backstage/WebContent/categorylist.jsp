<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="order.category.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<script src="jquery/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/mysite.css">

</head>
<body>
<%
									String strPage = request.getParameter("p"); //設定一個變數判斷網頁後面的切分頁頁數
							
									int p;
									if (strPage == null)
									{
										p = 1;
									} else
									{
										try
										{
											p = Integer.valueOf(strPage);
											if (p < 0)
											{
												p = 1;
											}
										} catch (Exception e)
										{
											p = 1;
										}
							
									}
							
									final int PAGE_SIZE = 5; //每頁顯示幾筆
									int start_loc = (p - 1) * PAGE_SIZE + 1; //起始抓的筆數
									CategoryDAO dao = new CategoryDAODBImpl();
									ArrayList<Category> list = dao.getRangeCategory(start_loc, PAGE_SIZE);
							
									int TotalRows = dao.getSize(); //計算總筆數
									int TotalPages = (int) Math.ceil((double) TotalRows / (double) PAGE_SIZE); //計算總頁數
								%>
						<div class="panel panel-default">
							<div class="panel-heading">菜單種類</div>
							<div class="panel-body">
	
	
								<table class="table table-hover table-striped "><!--加入Table，套用bootstrape-->
									<tr>
										<th style="text-align:center;">編號</th>
										<th style="text-align:center;">種類名稱</th>
										<th style="text-align:center;">英文名稱</th>
										<th style="text-align:center;">Operate</th>
									</tr>
									<%
										for (Category c : list)
										{
									%>
									<tr>
										<td align="center"><%=c.category_id%></td>
										<td align="center"><%=c.category_name%></td>
										<td align="center"><%=c.category_name_en%></td>
										<td align="center">
											<a data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo" class="edit ml10" href="#" title="Edit">
											<i class="glyphicon glyphicon-edit"></i></a>
											<a data-toggle="modal" data-target="#exampleModal2" data-whatever="@fat" class="remove ml10" href="#" title="Remove">
											<i class="glyphicon glyphicon-remove"></i></a>
										</td>
									</tr>
									<%
										}
									%>								
								</table>
									
							</div>
	
						</div>
						<div >
							<table id="example" class="table table-striped table-bordered">
							<tr>
							<% 
								final int PAGE_RANGE = 3;//分頁顯示幾個
								int loc = (p-1) / PAGE_RANGE;//抓取到p判斷頁數
								int start_num = loc*PAGE_RANGE+1;//起始頁面的數字
								int end_num = loc*PAGE_RANGE+PAGE_RANGE;//最後頁面的數字
								int uplimit = (TotalPages > end_num) ? end_num : TotalPages;//當總頁數>最後顯示頁數，顯示最後頁數
								int i=start_num;
								if (start_num >PAGE_RANGE )
								{
								%>
									<td class="text-center"><a href="category.jsp?t=category&p=<%=i-PAGE_RANGE %>"><i class="glyphicon glyphicon-backward"></i></a></td>
									
								<%
								}else{
								%>
									<td class="text-center"><a href="#"><i class="glyphicon glyphicon-backward"></i></a></td>
								<%
								}
								
								for (;i<=uplimit;i++) {
								%>
								<% 
								
								if (p != i) { %>
								<td class="text-center" width="30px"> <a href="category.jsp?t=category&p=<%=i %>"><%=i %></a> </td>
								<% } else { %>
								<td class="text-center" width="30px"> <%=i %> </td>
								<% } %>
							<%		
								}
								if (TotalPages > end_num)
								{
								%>
									<td class="text-center"><a href="category.jsp?t=category&p=<%=i %>"><i class="glyphicon glyphicon-forward"></i></a></td>
								<%
								}else{
									%>
									<td class="text-center"><a href="#"><i class="glyphicon glyphicon-forward"></i></a></td>
								<%
								}
					
								
							%>
							
							</tr>
							</table>
						</div>
</body>
</html>