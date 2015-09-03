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
<script language="JavaScript">


function check55()//判斷欄位是否空白
{
   var flag = true;

   // ---------- Check ----------
   var member_pwd = document.getElementById('member_password');
   if(member_pwd.value=='')
   {
	   var img1 = document.getElementById("img1");
	   img1.src = "img/a1.png";
	   flag = false;
   }
// ---------- Check----------
   var member_tel = document.getElementById('member_tel');
   if(member_tel.value=='')
   {
	   var img2 = document.getElementById("img2");
	   img2.src = "img/a1.png";
	   flag = false;
   }

// ---------- Check----------
   var member_email = document.getElementById('member_email');
   if(member_email.value=='')
   {
	   var img3 = document.getElementById("img3");
	   img3.src = "img/a1.png";
	   flag = false;
   }

   return flag;
}

</script>

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
							  <div class="panel-heading">會員修改</div>
								<div class="panel-body">
								<%
									String s = request.getParameter("id");
									Member stu =null;
									if (s != null)
									{
										try
										{
											MemberDAO dao=new MemberDAODBImpl();
											stu = dao.findById(s);
											
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
						
							<form class="form-horizontal" name="memberedit" action="back_memberEditCode.jsp" method="post" onsubmit="return check55();" >
								<div class="form-group">
									<input type="hidden" id="member_id" name="member_id" value="<%=stu.member_id%>">
							    	<label for="inputEmail3" class="col-sm-4 control-label">會員帳號</label>
							    <div class="col-sm-6">
							      <input type="text" class="form-control" id="member_account" name="member_account" value="<%=stu.member_account%>" readonly width="60px" >
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword3" class="col-sm-4 control-label">會員密碼</label>
							    <div class="col-sm-6">
							      <input type="password" class="form-control" id="member_password" name="member_password" value="<%=stu.member_password%>">
							    </div>
							    <div class="col-sm-2">
				                	<img id="img1" src="img/aa.png" style="width:25px;height:25px;margin-top:5px;"/>
				                </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword3" class="col-sm-4 control-label">電話</label>
							    <div class="col-sm-6">
							      <input type="text" class="form-control" id="member_tel" name="member_tel" value="<%=stu.member_tel%>">
							    </div>
							    <div class="col-sm-2">
				                	<img id="img2" src="img/aa.png" style="width:25px;height:25px;margin-top:5px;"/>
				                </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword4" class="col-sm-4 control-label">E-Mail</label>
							    <div class="col-sm-6">
							      <input type="text" class="form-control" id="member_email" name="member_email" value="<%=stu.member_email%>">
							    </div>
							    <div class="col-sm-2">
				                	<img id="img3" src="img/aa.png" style="width:25px;height:25px;margin-top:5px;"/>
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