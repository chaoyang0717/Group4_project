<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<script>

</script>


</head>

<body>
<nav class="navbar navbar-default navbar-inverse" role="navigation"><!--最上方功能列-->

  <div class="row">
  <div class="col-xs-14 col-md-10">
      <div class="container-fluid">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" >
          <span class="sr-only"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>

        </button>
        <a class="navbar-brand" href="Home.jsp"><span class="glyphicon glyphicon-bookmark"></span> 點餐後台管理</a>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
          <li class="active"><a href="Home.jsp">Home</a></li>
          <li><a href="ok.jsp">Order</a></li>
          <li><a href="product.jsp">Menu</a></li>
          <li><a href="back_member.jsp">Member</a></li>

        </ul>
      </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
  </div>

  <div class="col-xs-4 col-md-2">
    <form class="navbar-form navbar-left" role="" action="logout.jsp" method="POST"><!--功能列上的搜尋bar-->
      <div class="form-group">

      </div>
        <button type="submit" class="btn btn-default btn">
        <span class="glyphicon glyphicon-log-out" aria-hidden="true"></span> 登出
      </button>
    </form>
  </div>
  </div>
  
</nav>
</body>
</html>
