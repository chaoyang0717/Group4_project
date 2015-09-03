<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="order.category.*"%><%         //改為order.member
	String s = request.getParameter("name");
    
    //設定取得網頁後的變數，EX:http://xxxxx.xxx?name=??，取得name後的值設定為s
    BackAccount bacc = null;//新增一個BackAccount物件(java)
    if (s != null)//當s不是null
    {
    	try
    	{    		
    		BackAccountDAO dao = new BackAccountDAODBImpl();    //BackAccountDAO 和 Impl 都要改為MemberDAO
    		bacc = dao.findByAccount(s);//到資料庫取出資料
    		
    	    if (bacc == null)//如果取不到資料
    	    {
    	    	out.print("0");	// 0 代表沒有此ACC
    	    }
    	    else
    	    {
    	    	out.print("1");	// 1 代表有此ACC
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