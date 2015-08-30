<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="order.category.*,java.util.*"%>
<% 
	if(session.getAttribute("Login")==null){
		response.sendRedirect("login.jsp");
	}

%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>點餐後台管理</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<script src="jquery/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/mysite.css">



</head>
<body>
<div id="wrapper"> <!--最外框start-->

    <div id="header"><!--最上方標題列start-->
		<jsp:include page="header.jsp"></jsp:include>
    </div><!--最上方標題列end-->
	
	<div div="content2">
	    000000
	</div>
    
    <div id="content"><!--標題列下方內文start-->
    	<div class="row">
		  <div class="col-md-1">.col-md-1</div>
		  <div class="col-md-10">.col-md-10</div>
		  <div class="col-md-1">.col-md-1</div>
		</div>
    
    </div><!--標題列下方內文end-->

</div><!--最外框end-->
</body>
</html>