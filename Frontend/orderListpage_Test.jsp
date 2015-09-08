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
  
  <script>
    function takeFunction() {
        var select = document.getElementById("takeSelect").value;
        var address = document.getElementById("address");
    	var custom_tel = document.getElementById("custom_tel");
        document.getElementById("demo").innerHTML = "您選擇的是: " + select;
        info1 = 
        info2 = document.createTextNode(address.value);
    	info3 = document.createTextNode(custom_tel.value);
        
    }
  </script>
    
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
    <li class="list-group-item list-group-item-info"><i class="fa fa-motorcycle">取餐方式 : </i>
         <form>
         <select id="takeSelect" onchange="takeFunction()">
         <option>請選自取或外送</option>
         <option id="takeself" value="自取">自取</option>
         <option id="delivery" value="外送(外送服務請填入下方資料)">外送</option>
         </select>
         </form> 
    <p id="demo"></p> </li>
    <p>
    <li class="list-group-item list-group-item-info">請輸入外送地址 : <input type="text" id="address" name="address" value="" size="50"></li>
    <p>    
    <li class="list-group-item list-group-item-info">請輸入連絡電話 : <input type="text" id="custom_tel" name="custom_tel" value=""></li>   
    <p>
    </h4>
    <li class="list-group-item list-group-item-danger"><h4>金額總計<span class="glyphicon glyphicon-usd" aria-hidden="true"  />1900</h4></li>
  </ul>
  <button input type="submit" class="btn btn-success" formaction="orderListpageOK.jsp" method="post">確認送出</button> 
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