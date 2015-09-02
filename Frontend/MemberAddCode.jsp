<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" import="order.category.*"%>
<%
Member m = new Member(0, request.getParameter("member_account"), request.getParameter("member_password"),request.getParameter("member_tel"));
MemberDAO dao = new MemberDAODBImpl();
dao.add(m);
response.sendRedirect("MemberList.jsp");        //後台建立MemberList.jsp
%>    
