<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" import="order.category.*,java.util.*"%>

<%
request.setCharacterEncoding("utf-8");
String acc=request.getParameter("member_id");
String pwd=request.getParameter("member_password");
MemberDAO dao=new MemberDAODBImpl();
Member mber=dao.findById(acc);
String chk;
if(pwd.compareTo(mber.member_password)==0){ //字串判斷相等
	chk=pwd;

}else{
	MD5 md=new MD5();
	chk=md.changepwd(pwd);
}

Member m = new Member(0,request.getParameter("member_account"), request.getParameter("member_password"),request.getParameter("member_tel"),request.getParameter("member_email"));
MemberDAO dao2 = new MemberDAODBImpl();
dao2.add(m);
response.sendRedirect("index.jsp");       
%>    
