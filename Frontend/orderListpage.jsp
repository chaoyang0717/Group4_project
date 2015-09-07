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
    <li class="list-group-item active"><h3><i class="fa fa-thumbs-o-up"></i>&nbsp;您的點餐訂單</h3></li>
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
        <td>明太子雞肉芝麻葉比薩</td>
        <td>1</td>
      </tr>
      <tr>
        <td>蒜香白酒干貝蛤蜊義大利麵</td>
        <td>2</td>
      </tr>
      <tr>
        <td>松露風野菇起士燉飯</td>
        <td>3</td>
      </tr>
      <tr>
        <td>冰焦糖奶茶</td>
        <td>4</td>
      </tr>
    </tbody>
    </table>
    </li>
    <p>
    <li class="list-group-item"><i class="fa fa-motorcycle">取餐方式 : 
         <form>
         <select id="takeSelect" onchange="takeFunction()">
         <option>請選自取或外送</option>
         <option id="takeself" value="takeself">自取</option>
         <option id="delivery" value="delivery">外送</option>
         </select>
         </form> 
         <!--  加到另一頁中  
         <p id="demo"></p></i></li>
         <script>
         function takeFunction() {     
         var ddl = document.getElementById("takeSelect");
         var selectedValue = ddl.options[ddl.selectedIndex].value;
            if (selectedValue == "takeself")
           {
            	document.getElementById("demo").innerHTML = "自取地址:台北市大安區建國南路二段231號";
           }
         </script>
         -->
    <p>
    <li class="list-group-item">請輸入外送地址 : <input type="text" id="address" name="address" value=""></li>
    <p>    
    <li class="list-group-item">請輸入連絡電話 : <input type="text" id="custom_tel" name="custom_tel" value=""></li>   
    <p>
    </h4>
    <li class="list-group-item"><h4>金額總計<span class="glyphicon glyphicon-usd" aria-hidden="true"  />2000</h4></li>
  </ul>
  <script>
  function checkinfo() {
	  document.getElementById("address").value;

	  var x;
	  if(confirm(document.getElementById("address").value;)==true
      {
		  x ="已經收到您的訂單";
	  }else{
		  x ="您取消了訂單";
	  }
			  
  }
  </script>
  <button input type="submit" class="btn btn-success" onclick="checkinfo()">確認送出</button> 
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