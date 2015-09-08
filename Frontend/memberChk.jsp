<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="order.category.*"%>

<% 	
	request.setCharacterEncoding("utf-8"); 
	String acc=(request.getParameter("memAcc")).trim();
	String pwd=(request.getParameter("memPSW")).trim();
	MemberDAO dao=new MemberDAODBImpl();
	Member mem=dao.findByAccount(acc);
	MD5 md=new MD5();
	String chk=md.changepwd(pwd);



	if(chk.compareTo(mem.member_password)==0){ //字串判斷相等
		response.sendRedirect("indexok.jsp"); //傳送至某個頁面
		session.setAttribute("Login", "ok");

	}else{
		response.sendRedirect("index.jsp?error=yes"); 
		session.setAttribute("ATT", "fail");

	}

%>
