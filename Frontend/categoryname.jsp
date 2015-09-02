<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="order.category.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
<%
String s = request.getParameter("id");
if (s != null)
{
	try
	{
		int category_id = Integer.valueOf(s);
		CategoryDAO dao = new CategoryDAODBImpl();
		Category c = dao.findById(category_id);
		
		out.println("Name:" + c.category_name);
	}
	catch(Exception e)
	{
		out.println("No Data!");
	}
		
}
else
{
	out.println("No Data!");
}

%>
</body>
</html>