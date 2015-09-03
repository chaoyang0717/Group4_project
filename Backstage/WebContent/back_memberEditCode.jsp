<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="order.category.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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


Member ber = new Member(request.getParameter("member_id"), request.getParameter("member_account"), chk,request.getParameter("member_tel"),request.getParameter("member_email"));
MemberDAO dao2 = new MemberDAODBImpl();
dao2.update(ber);
response.sendRedirect("back_member.jsp");
%>   