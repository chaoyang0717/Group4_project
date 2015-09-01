<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="order.category.*,java.util.*"%><%
	String s = request.getParameter("cid");
    
    //設定取得網頁後的變數，EX:http://xxxxx.xxx?name=??，取得name後的值設定為s
    int c = 0;
    if (s != null)//當s不是null
    {
    	try
    	{    		
    		ProductDAO dao = new ProductDAODBImpl(); 
    		c=dao.findByCategoryid(Integer.valueOf(s));
    		
    	    if (c == 0)//如果取不到資料
    	    {
    	    	out.print("1");	
    	    }
    	    else
    	    {
    	    	out.print("0");	
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