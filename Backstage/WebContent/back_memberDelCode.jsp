<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="order.category.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
Member m = new Member(request.getParameter("id"), "", "","","");
MemberDAO dao = new MemberDAODBImpl();
dao.remove(m);
response.sendRedirect("back_member.jsp");
%>   