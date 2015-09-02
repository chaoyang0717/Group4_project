<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="order.category.*"%>


<%	
		request.setCharacterEncoding("utf-8");
		
String product_name = request.getParameter("product_name");
String summary= request.getParameter("summary");

Product p=new Product(request.getParameter("product_id"), Integer.valueOf(request.getParameter("category_id")), product_name, request.getParameter("product_name_en"), Integer.valueOf(request.getParameter("price")),summary);	
ProductDAO dao=new ProductDAODBImpl();

dao.upDate(p);

response.sendRedirect("product.jsp");
%>  