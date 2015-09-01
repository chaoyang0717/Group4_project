<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="order.category.*"%>

<% 	
	request.setCharacterEncoding("utf-8"); 
	String acc=(request.getParameter("acc")).trim();
	String pwd=(request.getParameter("pwd")).trim();
	BackAccountDAO dao=new BackAccountDAODBImpl();
	BackAccount bacc=dao.findByAccount(acc);



	if(pwd.compareTo(bacc.password)==0){ //字串判斷相等
		response.sendRedirect("ok.jsp"); //傳送至某個頁面
		session.setAttribute("Login", "ok");

	}else{
		response.sendRedirect("login.jsp?error=yes"); 
		session.setAttribute("ATT", "fail");

	}

%>
