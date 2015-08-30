<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="order.category.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
request.setCharacterEncoding("utf-8");
String pname = request.getParameter("product_name");
String smay= request.getParameter("summary");

Product p=new Product(request.getParameter("product_id"), Integer.valueOf(request.getParameter("category_id")), pname, request.getParameter("product_name_en"), Integer.valueOf(request.getParameter("price")),smay, request.getParameter("filename_big"),request.getParameter("filename_small"));	
ProductDAO dao=new ProductDAODBImpl();

dao.add(p);


response.sendRedirect("product.jsp");
%>  