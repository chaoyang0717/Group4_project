<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="order.category.*"%>

<% 	
	request.setCharacterEncoding("utf-8"); 
	String acc=request.getParameter("acc");
	String pwd=request.getParameter("pwd");
	BackAccountDAO dao=new BackAccountDAODBImpl();
	BackAccount bacc=dao.findByAccount(acc);



	if(bacc.password==pwd){
		response.sendRedirect("fail.jsp"); 
		session.setAttribute("ATT", "fail");
		//response.sendRedirect("ok.jsp"); //jsp內的指令，傳送至某個頁面
		//session.setAttribute("Login", "ok");
		
	}else{
		//response.sendRedirect("fail.jsp"); 
		//session.setAttribute("ATT", "fail");
		response.sendRedirect("Home.jsp"); //jsp內的指令，傳送至某個頁面
		session.setAttribute("Login", "ok");

	}

%>
