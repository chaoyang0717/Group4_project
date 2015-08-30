<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="order.category.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Menu_addProduct</title>
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
						  <div class="panel-heading">菜單新增</div>
							<div class="panel-body">
							<form class="form-horizontal" name="product" action="productAddCode.jsp" method="post" >
								<div class="form-group">
							    	<label for="input3" class="col-sm-2 control-label">產品編號</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="product_id" name="product_id" placeholder="請輸入編號" width="60px" >
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="input3" class="col-sm-2 control-label">種類編號</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="category_id" name="category_id" placeholder="請輸入種類">
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword4" class="col-sm-2 control-label">產品名稱</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="product_name" name="product_name" placeholder="請輸入名稱">
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword4" class="col-sm-2 control-label">英文名稱</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="product_name_en" name="product_name_en" placeholder="請輸入英文名稱">
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword4" class="col-sm-2 control-label">價格</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="price" name="price" placeholder="請輸入價格">
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword4" class="col-sm-2 control-label">產品說明</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="summary" name="summary" placeholder="請輸入說明">
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword4" class="col-sm-2 control-label">檔案上傳(b)</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="filename_big" name="filename_big" placeholder="請上傳檔案">
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword4" class="col-sm-2 control-label">檔案上傳(s)</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="filename_small" name="filename_small" placeholder="請上傳檔案">
							    </div>
							  </div>
	
							  <div class="form-group">
							    <div class="col-sm-offset-2 col-sm-10">
							      <button type="submit" class="btn btn-default"> 送 出 </button>
							    </div>
							  </div>
							</form>
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