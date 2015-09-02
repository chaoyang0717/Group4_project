<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="order.category.*;"%>

<% 	
	request.setCharacterEncoding("utf-8"); 
	String acc=(request.getParameter("acc")).trim();
	String pwd=(request.getParameter("pwd")).trim();
	BackAccountDAO dao=new BackAccountDAODBImpl();
	BackAccount bacc=dao.findByAccount(acc);
	MD5 md=new MD5();
	String chk=md.changepwd(pwd);



	if(chk.compareTo(bacc.password)==0){ //字串判斷相等
		response.sendRedirect("ok.jsp"); //傳送至某個頁面
		session.setAttribute("Login", "ok");

	}else{
		
		response.sendRedirect("login.jsp");
		session.setAttribute("ATT", "fail");

	}

%>
