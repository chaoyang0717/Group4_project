<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="order.category.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
Product p=new Product(request.getParameter("id"), 0, "","",0,"","","");
ProductDAO dao = new ProductDAODBImpl();
dao.remove(p);
response.sendRedirect("product.jsp");
%>   