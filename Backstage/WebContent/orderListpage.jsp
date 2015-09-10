<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="order.category.*,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
  
  <style>
  .table td,th,tr {
   text-align: center;   
  }
  </style>
</head>

<body  align="center">
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand">客戶點餐訂單</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="index.jsp"><i class="fa fa-home" fa-2x></i>回到首頁</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
 <div class="jumbotron">
 <img src="images/banner-01.jpg" >
<div class="container">
  <ul class="list-group">
    <li class="list-group-item active"><h3><i class="fa fa-cutlery"></i>&nbsp;您的點餐訂單&nbsp;<i class="fa fa-coffee"></i></h3></li>
    <h4>
    <li class="list-group-item">
    <table class="table" >
    <thead>
      <tr>
        <th>餐點菜名</th>
        <th>數量</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><%
        String p1[] = request.getParameterValues("product");
	
	for (String p : p1)
	{
		String product = new String(p.getBytes("ISO-8859-1"), "UTF-8");
		out.println(product);
		
	}

       %> </td>
         <td><%
	String c1[] = request.getParameterValues("count");
	//out.println(s1.length);
	
	for (String c : c1)
	{
		String count = new String(c.getBytes("ISO-8859-1"), "UTF-8");
		out.println(count);
		
	}

     %>  
        </td>
      </tr>
      
      <tr>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td></td>
      </tr>  
    </tbody>
    </table>
    </li>
    <p>
    <li class="list-group-item list-group-item-info"><i class="fa fa-motorcycle">取餐方式 : </i>
         <form>
         <select id="takeSelect" onchange="takeFunction()">
         <option>請選自取或外送</option>
         <option id="takeself" value="takeself">自取</option>
         <option id="delivery" value="delivery">外送</option>
         </select>
         </form> 
    </li>  
    <p>
    <div ng-app="">  <!-- 使用AngularJS效果 -->
    <li class="list-group-item list-group-item-info">請輸入外送地址 : <input type="text" id="address" name="address" value="" size="50" ng-model="addr"></li>
           您的地址是 : {{addr}}
    <p>    
    <li class="list-group-item list-group-item-info">請輸入連絡電話 : <input type="text" id="custom_tel" name="custom_tel" value="" ng-model="tel"></li>  
           您的電話是: {{tel}}
    <p>
    </div>
    </h4>
    <li class="list-group-item list-group-item-danger">
    <h4>金額總計<span class="glyphicon glyphicon-usd" aria-hidden="true"  />
    <%
        String price1[] = request.getParameterValues("price");
	
	for (String pri : price1)
	{
		String price = new String(pri.getBytes("ISO-8859-1"), "UTF-8");
		out.println(price);
		
	}

       %>
    </h4></li>
  </ul>
  <form action="orderListpageOK.jsp" method="post">
  <button input type="submit" class="btn btn-success" action="orderListpageOK.jsp">確認送出</button>
  </form> 
</div>
</div>
          <div class=container>
             <div class=row>
               <div class=col-md-4>
                 <h3>與我們聯絡</h3>               
               </div>
               <div class=col-md-4>
                 <h3>客戶服務</h3>                              
               </div>
               <div class=col-md-4>
               <h3>技術支援</h3>             
               </div>
             </div>
          </div>
          <hr>
          <footer>
          <p>&copy; Copyright : The 4th Group 2015</footer>
</body>
</html>