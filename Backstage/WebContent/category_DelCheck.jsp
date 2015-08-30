<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="order.category.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String s = request.getParameter("id");
    
    //設定取得網頁後的變數，EX:http://xxxxx.xxx?name=??，取得name後的值設定為s
    
    if (s != null)//當s不是null
    {
    	try
    	{    		
    		ProductDAO dao=new ProductDAODBImpl();
    		int a = dao.findByCategoryid(Integer.valueOf(s));//到資料庫取出資料
    		
    	    if (a == 0)//如果取不到資料
    	    {
    	    	out.print("1");	//可以刪
    	    	
    	    }
    	    else
    	    {
    	    	out.print("0");	//不可以刪
    	    
    	    }
    		
    	}
    	catch(Exception e)
    	{
    		out.print("-1");
    	}
    		
    }
    else
    {
    	out.print("-1");
    }
    %>