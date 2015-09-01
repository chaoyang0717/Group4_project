<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="order.category.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>


</style>
</head>
<body>
<div id="wrapper">
<div id="header">
</div>

<div id="content">
<div class="row">
			<% 
			ProductDAO dao=new ProductDAODBImpl();
			ArrayList<Product> list=dao.getByCategoryId(1);
			for (int i = 0; i < list.size(); i+=2) { %>
	<table>
		<tr>
		<td>
		<%if((i)<list.size()){
		%>
		<p><%=list.get(i).product_name%></p><br/>
		<p><%=list.get(i).filename_big%></p><br/>
		<p><%=list.get(i).price%></p><br/>
		<p><%=list.get(i).summary%></p><br/>
	<%}else{%>
		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<%} %>
		</td>
		<td>
		<% if((i+1)<list.size()){%>
		<p><%=list.get(i+1).product_name%></p><br/>
		<p><%=list.get(i+1).filename_big%></p><br/>
		<p><%=list.get(i+1).price%></p><br/>
		<p><%=list.get(i+1).summary%></p><br/>
		
		<%}else{%>

		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<%} %>
		</td>
		<td>
		<%if((i+2)<list.size()){%>
		<p><%=list.get(i+2).product_name%></p><br/>
		<p><%=list.get(i+2).filename_big%></p><br/>
		<p><%=list.get(i+2).price%></p><br/>
		<p><%=list.get(i+2).summary%></p><br/>
		
		<%}else{%>

		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<%
			}%>
		</td>	
		</tr>
			
		<%} %>
		
			
</table>

</div>
</div>
</body>
</html>