<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" import="order.category.*,java.util.*"%>
<%
Member m = new Member(0,request.getParameter("member_account"), request.getParameter("member_password"),request.getParameter("member_tel"),request.getParameter("member_email"));
MemberDAO dao = new MemberDAODBImpl();
dao.add(m);
response.sendRedirect("indexok.jsp");       
%>    
