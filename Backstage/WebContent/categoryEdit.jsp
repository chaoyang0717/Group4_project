<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="order.category.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-modal.css">
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/jquery.js"></script>
<link rel="stylesheet" href="css/mysite.css">


</head>
<body>

<div id="wrapper"> <!--最外框start-->

    <div id="header"><!--最上方標題列start-->
  		<jsp:include page="header.jsp"></jsp:include>
    </div><!--最上方標題列end-->
	
	<div div="header2">
		<div class="row">
		  <div class="col-md-1"></div>
		  <div class="col-md-10">
	    	<jsp:include page="header2.jsp"></jsp:include>
	      </div>
		  <div class="col-md-1"></div>
		</div>
	</div>
	
    <div id="content"><!--標題列下方內文start-->
    	<div class="row">
		  <div class="col-md-1"></div>
		  <div class="col-md-10">
		  
		  	 <div>
		  	 	<br/>
					<div class="row">
						<div class="col-md-2"></div>
						<div class="col-md-8">
							<div class="panel panel-default" width="60px">
							  <div class="panel-heading">種類新增</div>
								<div class="panel-body">
								<%
									String s = request.getParameter("id");
									Category stu =null;
									if (s != null)
									{
										try
										{
											int category_id = Integer.valueOf(s);
											CategoryDAO dao=new CategoryDAODBImpl();
											stu = dao.findById(category_id);
											
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
						
							<form class="form-horizontal" name="category" action="categoryEditCode.jsp" method="post" >
								<div class="form-group">
							    	<label for="inputEmail3" class="col-sm-2 control-label">種類編號</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="category_id" name="category_id" value="<%=stu.category_id%>" readonly width="60px" >
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword3" class="col-sm-2 control-label">種類名稱</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="category_name" name="category_name" value="<%=stu.category_name%>">
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword4" class="col-sm-2 control-label">英文名稱</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="category_name_en" name="category_name_en" value="<%=stu.category_name_en%>">
							      
							    </div>
							  </div>
	
							  <div class="form-group">
							    <div class="col-sm-offset-2 col-sm-10">
							      <button type="submit" class="btn btn-default"> 修 改 </button>
							    </div>
							  </div>
							</form>
	
														
								
						</div>
						</div>
						</div>
						<div class="col-md-2"></div>
						</div>
			</div>

		  </div>
		  <div class="col-md-1"></div>
		</div>
    
    </div><!--標題列下方內文end-->

</div><!--最外框end-->


</body>
</html>