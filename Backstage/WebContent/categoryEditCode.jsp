<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="order.category.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
request.setCharacterEncoding("utf-8"); 
String name = request.getParameter("category_name");
Category s = new Category(Integer.valueOf(request.getParameter("category_id")), name, request.getParameter("category_name_en"));
CategoryDAO dao = new CategoryDAODBImpl();
dao.update(s);
response.sendRedirect("category.jsp");
%>   