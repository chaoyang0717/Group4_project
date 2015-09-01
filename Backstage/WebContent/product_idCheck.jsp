<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="order.category.*"%><%
	String s = request.getParameter("pid");
    if (s!= null) {
    	s = new String(s.getBytes("ISO-8859-1"),"UTF-8");
    	}
    
    //設定取得網頁後的變數，EX:http://xxxxx.xxx?name=??，取得name後的值設定為s
    Product c = null;//新增一個BackAccount物件(java)
    if (s != null)//當s不是null
    {
    	try
    	{    		
    		ProductDAO dao = new ProductDAODBImpl(); 
    		c = dao.findById(s);//到資料庫取出資料
    		
    	    if (c == null)//如果取不到資料
    	    {
    	    	out.print("1");	// 0 代表沒有此ACC
    	    }
    	    else
    	    {
    	    	out.print("0");	// 1 代表有此ACC
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