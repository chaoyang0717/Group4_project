<!-- 註冊會員檢查重覆 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" import="order.category.*,java.util.*"%>
<%
    String m = request.getParameter("name");
    Member mem = null;
    if (m != null)
    {
    	try
    	{    		
    		MemberDAO dao = new MemberDAODBImpl();
    		mem = dao.findByAccount(m);
    		
    	    if (mem == null)
    	    {
    	    	out.print("0");	// 0 代表沒有重複可以新增
    	    }
    	    else
    	    {
    	    	out.print("1");	// 1 代表有重複不可以新增
    	    }
    		
    	}
    	catch(Exception e)
    	{
    		out.print("1");
    	}
    		
    }
    else
    {
    	out.print("1");
    }


    
    
    
    %>
