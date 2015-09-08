<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="order.category.*,java.util.*"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>R202線上點餐系統</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"><!--bootstrap讀取的檔案-->
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<script language="Javascript" type="text/javascript" src='resize_image.js'></script>
<script src="jquery/jquery.js"></script><!--js讀取的檔案-->
<script src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="lightbox/lightbox.css" type="text/css" />
<script type="text/javascript" src="lightbox/lightbox.js"></script>  <!--使用lightbox JS，點小圖跳出大圖-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>   <!--W3C School的Ajax -->

<style>
body {background-color:#D2E9FF}
h2 {cursor:pointer; margin:2px; padding:10px; }
button {border-width:0px;background-color:#F0F0F0;}
ul {list-style-type: none;
    padding: 0;
    margin: 0;
  }
li {padding-right:0;}
li:before {
  content:"\f046"; /* FontAwesome char code inside the '' */
  font-family: FontAwesome; /* FontAwesome or whatever */
  display: inline-block;
  width: 1.2em; /* same as padding-left set on li */
  margin-left: 0px; /* same as padding-left set on li */
}​
table, th, td {
    border-collapse: collapse;
    border-width: 10px;
    width: 300px;
    text-align:center;
    word-break: break-all;    
}
</style>

<!--Shopping Cart Rolling Sticky 的CSS設定-->
<style type="text/css">  
.fixed {    
    position: fixed;     
    top: 30px;    
    margin-left: 83%;  
    background-color: #fff ! important; 
} 
</style>

<script language="JavaScript">          //會員註冊
var request;
function getData()
{
	var addAccount = document.getElementById("addAccount");
	request = new XMLHttpRequest();
	request.open("GET", "MemberAddChk.jsp?name=" + addAccount.value, true);
	// 這行是設定 request 要去哪取資料，尚未開始取
	// 第三個參數打 true 可以想成，利用另外一個執行緒處理 Request
	// 第三個參數打 false 可以想成，利用這一個執行緒處理 Request
	
	var img1 = document.getElementById("img1");
	img1.src = "img/wait.gif";
	
	request.onreadystatechange = updateData;
	// 當記憶體中的瀏覽器狀態改變時，呼叫 updateData 這個 function
	
	request.send(null); // 發動 request 去取資料		
}

function updateData()
{
	if (request.readyState == 4)
	{
		// alert(request.responseText);
		var dup = document.getElementById("dup");
		dup.value = request.responseText.trim();
		
		if (dup.value == "1")
			{
			var img1 = document.getElementById("img1");
			img1.src = "img/a1.png";
			}
		else
			{
			var img1 = document.getElementById("img1");
			img1.src = "img/a0.png";
			}
		// alert(dup.value);
	}
}
</script>

<script language="JavaScript">              //會員登入判斷
var requestlogin
function getDatalogin(){ //加入Ajax判斷
	var memAcc=document.getElementById('memAcc')//取得使用者輸入的值
	requestlogin=new XMLHttpRequest();//在記憶體內開啟一個網頁
	requestlogin.open("GET", "memloginChk.jsp?name="+memAcc.value, true); //將名字的值傳入check的網頁判斷，有找到名字該網頁會顯示1(有重複)
	// 這行是設定 request 要去哪取資料，尚未開始取
	// 第三個參數打 true 可以想成，利用另外一個執行緒處理 Request
	// 第三個參數打 false 可以想成，利用這一個執行緒處理 Request
	
	var imglogin = document.getElementById("imglogin");//抓取資料時，顯示運作中的圖
	imglogin.src = "img/wait.gif";
	
	requestlogin.onreadystatechange = updateDatalogin;
	// 當記憶體中的瀏覽器狀態改變時，呼叫 updateDatalogin 這個 function
	 
	 requestlogin.send(null);// 發動 request 去取資料
	
}

function updateDatalogin(){
	
	if(requestlogin.readyState==4){
		var duplogin = document.getElementById("duplogin");
		duplogin.value = requestlogin.responseText.trim();
		
		//把check判斷抓取的值回送給dup，修改dup的value在進行判斷。trim<--消除左右空白以免判斷錯誤
		
		if (duplogin.value == "0")//取得的值為1，則顯示打V的圖
			{
			var imglogin = document.getElementById("imglogin");
			imglogin.src = "img/a1.png";
			}
		else
			{
			var imglogin = document.getElementById("imglogin");
			imglogin.src = "img/a0.png";
			}
	}
}
</script>

<script >           //點餐單-使用 Shopping Cart Rolling Sticky
$(document).ready(function() {  
    // check where the shoppingcart-div is  
    var offset = $('#shopping-cart').offset();  
    $(window).scroll(function () {    
        var scrollTop = $(window).scrollTop(); 
        // check the visible top of the browser     
        if (offset.top<scrollTop) {
            $('#shopping-cart').addClass('fixed'); 
        } else {
            $('#shopping-cart').removeClass('fixed');   
        }
    }); 
}); 
</script>

<script>      // 餐點類別折疊，第一個類別自動展開
$(document).ready( function () {  

  $('h2').next().hide();  // 本文都隱藏

  $('h2:first').next().show();  // 第一個本文顯示

  // 指定標題具切換功能
  $('h2').click( function () { 
    $(this).next().slideToggle();
  });

 });
</script>

<script type="text/javascript">             //使用Javascript加入id的value內容至點餐單
function add(id) { 
    var ul = document.getElementById("ul");    
    var li = document.createElement("li");
    li.id="li";
    var msg = document.getElementById("Append_" + id);
    var quantity = document.getElementById("quantity_" + id);
    ul.appendChild(li);
    li.appendChild(document.createTextNode(msg.name + " 數量 : " + quantity.value));
    //計算金額加總
    var price = document.getElementById(msg.value);
    var items = document.getElementsByTagName(li);                                //取得加入項目
    var itemCount = items.length;                                                                  //取得項目個數
    var totalprice = 0;                                                                                      //宣告總金額
    for(var i = 0; i < itemCount; i++)                                                               //計算金額
    {
	    totalprice = totalprice +  parseInt(quantity*price);               //totalprice = totalprice +  parseInt(items[i].quantity*items[i].price);      
	}
    document.getElementById("money").innerHTML = totalprice.innerHTML;     //印出金額  
  }
function del(){                            //清空點餐單
    var div = document.getElementById("div");
    var ul = document.getElementById("ul");      
    var li = document.getElementById("li");   
    ul.parentNode.removeChild(ul);
    var rul =document.createElement("ul");
    rul.id="ul";
    div.appendChild(rul);
 }
  
</script>

<script>                          //使用button +1與-1  http://jsfiddle.net/laelitenetwork/puJ6G/
jQuery(document).ready(function(){
    // This button will increment the value
    $('.qtyplus').click(function(e){
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        fieldName = $(this).attr('field');
        // Get its current value
        var currentVal = parseInt($('input[name='+fieldName+']').val());
        // If is not undefined
        if (!isNaN(currentVal)) {
            // Increment
            $('input[name='+fieldName+']').val(currentVal + 1);
        } else {
            // Otherwise put a 0 there
            $('input[name='+fieldName+']').val(0);
        }
    });
    // This button will decrement the value till 0
    $(".qtyminus").click(function(e) {
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        fieldName = $(this).attr('field');
        // Get its current value
        var currentVal = parseInt($('input[name='+fieldName+']').val());
        // If it isn't undefined or its greater than 0
        if (!isNaN(currentVal) && currentVal > 0) {
            // Decrement one
            $('input[name='+fieldName+']').val(currentVal - 1);
        } else {
            // Otherwise put a 0 there
            $('input[name='+fieldName+']').val(0);
        }
    });
});
</script>

</head>
<br>
<br>
<body align="center">

<nav class="navbar navbar-inverse navbar-fixed-top" role=navigation>
<div class=container>
     <div class=navbar-header>
        <button type=button class="navbar-toggle collapsed" data-toggle=collapse data-target=#navbar aria-expanded=false aria-controls=navbar> 
          <span class=sr-only>Toggle navigation</span> 
          <span class=icon-bar></span> 
          <span class=icon-bar></span> 
          <span class=icon-bar></span> 
        </button> 
        <a class=navbar-brand href=#>R202義式料理線上點餐系統</a>
     </div>
        <div id=navbar class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" role=form>
            <button type=submit class="btn btn-success" data-toggle="modal" data-target="#mySignIn">Sign in</button>
          </form>
        </div>
     </div>
</nav>
<img src="images/banner-01.jpg">

 <div class=jumbotron>

<div class="row">
     <div class="col-xs-3"></div>

     <div class="col-xs-6">
                <div class="container clearfix">              
                  <class="breadcrumb">
                    <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#mySignIn">登入</a>&nbsp;
                    <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#myRegister">註冊會員</a>&nbsp;
                    <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#myIntroduction">使用說明</a>                  
                </div>
       <p>
       
       <h2><div class="bg-primary"> 比薩 Pizza</div></h2>

       <div style="display: block;">
       <div class=container>
<div class="row">

			<% 
			ProductDAO dao=new ProductDAODBImpl();
			ArrayList<Product> list=dao.getByCategoryId(1);
			for (int i = 0; i < list.size(); i+=3) { %>
	<center>
	<table>
		<tr>
		<td>
		<%if((i)<list.size()){
		%>
		<h3><%=list.get(i).product_name%></h3><br/>
		<a href="upload/<%=list.get(i).filename_big%>" rel="lightbox" title="<%=list.get(i).product_name%>" ><img src="upload/<%=list.get(i).filename_small%>" /><br/></a>
		<h4>金額<span class="glyphicon glyphicon-usd" aria-hidden="true"><%=list.get(i).price%></span></h4><br/>
		<h4><%=list.get(i).summary%></h4><br/>
		<input type='button' value='-' class='qtyminus' field='quantity_<%=list.get(i).product_id%>' />
        <input type='text' id='quantity_<%=list.get(i).product_id%>' name="quantity_<%=list.get(i).product_id%>" value='0' size="3" />
        <input type='button' value='+' class='qtyplus' field='quantity_<%=list.get(i).product_id%>' />
		<!-- <button type="submit" id="Append_<%=list.get(i).product_id%>" onclick="add('<%=list.get(i).product_id%>')" value="<%=list.get(i).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button> -->	
		 <button type="submit" id="Append_<%=list.get(i).product_id%>" onclick="add('<%=list.get(i).product_id%>')" value="<%=list.get(i).price%>" name="<%=list.get(i).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button> 
	    <%}else{%>
		<p></p><br/>
	    <p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<%} %>
		</td>
		<td>
		<% if((i+1)<list.size()){%>
		<h3><%=list.get(i+1).product_name%></h3><br/>
		<a href="upload/<%=list.get(i+1).filename_big%>" rel="lightbox" title="<%=list.get(i+1).product_name%>" ><img src="upload/<%=list.get(i+1).filename_small%>" /><br/></a>
		<h4>金額<span class="glyphicon glyphicon-usd" aria-hidden="true"><%=list.get(i+1).price%></span></h4><br/>
		<h4><%=list.get(i+1).summary%></h4><br/>
		<input type='button' value='-' class='qtyminus'  field='quantity_<%=list.get(i+1).product_id%>' />
        <input type='text' id='quantity_<%=list.get(i+1).product_id%>' name="quantity_<%=list.get(i+1).product_id%>" value='0' size="3" />
        <input type='button' value='+' class='qtyplus'  field='quantity_<%=list.get(i+1).product_id%>' />
		<!--  <button type="submit" id="Append_<%=list.get(i+1).product_id%>" onclick="add('<%=list.get(i+1).product_id%>')" value="<%=list.get(i+1).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button> -->
		<button type="submit" id="Append_<%=list.get(i+1).product_id%>" onclick="add('<%=list.get(i+1).product_id%>')" value="<%=list.get(i+1).price%>" name="<%=list.get(i+1).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button> 
		<%}else{%>
		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<%} %>
		</td>
		<td>
		<%if((i+2)<list.size()){%>
		<h3><%=list.get(i+2).product_name%></h3><br/>
		<a href="upload/<%=list.get(i+2).filename_big%>" rel="lightbox" title="<%=list.get(i+2).product_name%>" ><img src="upload/<%=list.get(i+2).filename_small%>" /><br/></a>
		<h4>金額<span class="glyphicon glyphicon-usd" aria-hidden="true"><%=list.get(i+2).price%></span></h4><br/>
		<h4><%=list.get(i+2).summary%></h4><br/>
		<input type='button' value='-' class='qtyminus' field='quantity_<%=list.get(i+2).product_id%>' />
        <input type='text' id='quantity_<%=list.get(i+2).product_id%>' name="quantity_<%=list.get(i+2).product_id%>" value='0' size="3" />
        <input type='button' value='+' class='qtyplus' field='quantity_<%=list.get(i+2).product_id%>' />
		<!--  <button type="submit" id="Append_<%=list.get(i+2).product_id%>" onclick="add('<%=list.get(i+2).product_id%>')" value="<%=list.get(i+2).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button>-->		
		<button type="submit" id="Append_<%=list.get(i+2).product_id%>" onclick="add('<%=list.get(i+2).product_id%>')" value="<%=list.get(i+2).price%>" name="<%=list.get(i+2).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button> 
		<%}else{%>
		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<%
			}%>
		</td>	
		</tr>
			
		<%} %>		
			
</table>
</center>
</div>
</div>
</div>

<h2><div class="bg-primary"> 義大利麵 Pasta</div></h2>
       <div style="display: block;">
       <div class=container>
       <div class="row">

			<% 
			ProductDAO dao2=new ProductDAODBImpl();
			ArrayList<Product> list1=dao2.getByCategoryId(2);
			for (int i = 0; i < list1.size(); i+=3) { %>
	<center>
	<table>
		<tr>
		<td>
		<%if((i)<list1.size()){
		%>
		<h3><%=list1.get(i).product_name%></h3><br/>
		<a href="upload/<%=list1.get(i).filename_big%>" rel="lightbox" title="<%=list1.get(i).product_name%>" ><img src="upload/<%=list1.get(i).filename_small%>" /><br/></a>
		<h4>金額<span class="glyphicon glyphicon-usd" aria-hidden="true"><%=list1.get(i).price%></span></h4><br/>
		<h4><%=list1.get(i).summary%></h4><br/>
		<input type='button' value='-' class='qtyminus' field='quantity_<%=list1.get(i).product_id%>' />
        <input type='text' id='quantity_<%=list1.get(i).product_id%>' name="quantity_<%=list1.get(i).product_id%>" value='0' size="3" />
        <input type='button' value='+' class='qtyplus' field='quantity_<%=list1.get(i).product_id%>' />
		<!--  <button type="submit" id="Append_<%=list1.get(i).product_id%>" onclick="add('<%=list1.get(i).product_id%>')" value="<%=list1.get(i).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button> -->
		<button type="submit" id="Append_<%=list1.get(i).product_id%>" onclick="add('<%=list1.get(i).product_id%>')" value="<%=list1.get(i).price%>" name="<%=list1.get(i).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button> 		
	<%}else{%>
		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<%} %>
		</td>
		<td>
		<% if((i+1)<list1.size()){%>
		<h3><%=list1.get(i+1).product_name%></h3><br/>
		<a href="upload/<%=list1.get(i+1).filename_big%>" rel="lightbox" title="<%=list1.get(i+1).product_name%>" ><img src="upload/<%=list1.get(i+1).filename_small%>" /><br/></a>
		<h4>金額<span class="glyphicon glyphicon-usd" aria-hidden="true"><%=list1.get(i+1).price%></span></h4><br/>
		<h4><%=list1.get(i+1).summary%></h4><br/>
		<input type='button' value='-' class='qtyminus' field='quantity_<%=list1.get(i+1).product_id%>' />
        <input type='text' id='quantity_<%=list1.get(i+1).product_id%>' name="quantity_<%=list1.get(i+1).product_id%>" value='0' size="3" />
        <input type='button' value='+' class='qtyplus' field='quantity_<%=list1.get(i+1).product_id%>' />
		<!--  <button type="submit" id="Append_<%=list1.get(i+1).product_id%>" onclick="add('<%=list1.get(i+1).product_id%>')" value="<%=list1.get(i+1).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button> -->
		<button type="submit" id="Append_<%=list1.get(i+1).product_id%>" onclick="add('<%=list1.get(i+1).product_id%>')" value="<%=list1.get(i+1).price%>" name="<%=list1.get(i+1).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button> 		
		
		<%}else{%>

		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<%} %>
		</td>
		<td>
		<%if((i+2)<list1.size()){%>
		<h3><%=list1.get(i+2).product_name%></h3></p><br/>
		<a href="upload/<%=list1.get(i+2).filename_big%>" rel="lightbox" title="<%=list1.get(i+2).product_name%>" ><img src="upload/<%=list1.get(i+2).filename_small%>" /><br/></a>
		<h4>金額<span class="glyphicon glyphicon-usd" aria-hidden="true"><%=list1.get(i+2).price%></span></h4><br/>
		<h4><%=list1.get(i+2).summary%></h4><br/>
		<input type='button' value='-' class='qtyminus' field='quantity_<%=list1.get(i+2).product_id%>'  />
        <input type='text' id='quantity_<%=list1.get(i+2).product_id%>' name="quantity_<%=list1.get(i+2).product_id%>" value='0' size="3" />
        <input type='button' value='+' class='qtyplus' field='quantity_<%=list1.get(i+2).product_id%>' />
		<!--  <button type="submit" id="Append_<%=list1.get(i+2).product_id%>" onclick="add('<%=list1.get(i+2).product_id%>')" value="<%=list1.get(i+2).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button> -->
		<button type="submit" id="Append_<%=list1.get(i+2).product_id%>" onclick="add('<%=list1.get(i+2).product_id%>')" value="<%=list1.get(i+2).price%>" name="<%=list1.get(i+2).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button> 		
		<%}else{%>
		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<%
			}%>
		</td>	
		</tr>
			
		<%} %>
		
			
</table>
</center>
</div>
</div>
</div>

<h2><div class="bg-primary"> 主餐 Rice</div></h2>

       <div style="display: block;">
       <div class=container>
<div class="row">

			<% 
			ProductDAO dao3=new ProductDAODBImpl();
			ArrayList<Product> list2=dao3.getByCategoryId(3);
			for (int i = 0; i < list2.size(); i+=3) { %>
	<center>
	<table>
		<tr>
		<td>
		<%if((i)<list2.size()){
		%>
		<h3><%=list2.get(i).product_name%></h3><br/>
		<a href="upload/<%=list2.get(i).filename_big%>" rel="lightbox" title="<%=list2.get(i).product_name%>" ><img src="upload/<%=list2.get(i).filename_small%>" /><br/></a>
		<h4>金額<span class="glyphicon glyphicon-usd" aria-hidden="true"><%=list2.get(i).price%></span></h4><br/>
		<h4><%=list2.get(i).summary%></h4><br/>
		<input type='button' value='-' class='qtyminus' field='quantity_<%=list2.get(i).product_id%>' />
        <input type='text' id='quantity_<%=list2.get(i).product_id%>' name="quantity_<%=list2.get(i).product_id%>" value='0' size="3" />
        <input type='button' value='+' class='qtyplus' field='quantity_<%=list2.get(i).product_id%>' />
		<!--  <button type="submit" id="Append_<%=list2.get(i).product_id%>" onclick="add('<%=list2.get(i).product_id%>')" value="<%=list2.get(i).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button> -->
		<button type="submit" id="Append_<%=list2.get(i).product_id%>" onclick="add('<%=list2.get(i).product_id%>')" value="<%=list2.get(i).price%>" name="<%=list2.get(i).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button> 		
	<%}else{%>
		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<%} %>
		</td>
		<td>
		<% if((i+1)<list2.size()){%>
		<h3><%=list2.get(i+1).product_name%></h3><br/>
		<a href="upload/<%=list2.get(i+1).filename_big%>" rel="lightbox" title="<%=list2.get(i+1).product_name%>" ><img src="upload/<%=list2.get(i+1).filename_small%>" /><br/></a>
		<h4>金額<span class="glyphicon glyphicon-usd" aria-hidden="true"><%=list2.get(i+1).price%></span></h4><br/>
		<h4><%=list2.get(i+1).summary%></h4><br/>
		<input type='button' value='-' class='qtyminus' field='quantity_<%=list2.get(i+1).product_id%>' />
        <input type='text' id='quantity_<%=list2.get(i+1).product_id%>' name="quantity_<%=list2.get(i+1).product_id%>" value='0' size="3" />
        <input type='button' value='+' class='qtyplus' field='quantity_<%=list2.get(i+1).product_id%>' />
		<!--  <button type="submit" id="Append_<%=list2.get(i+1).product_id%>" onclick="add('<%=list2.get(i+1).product_id%>')" value="<%=list2.get(i+1).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button>-->
		<button type="submit" id="Append_<%=list2.get(i+1).product_id%>" onclick="add('<%=list2.get(i+1).product_id%>')" value="<%=list2.get(i+1).price%>" name="<%=list2.get(i+1).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button> 		
		<%}else{%>
		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<%} %>
		</td>
		<td>
		<%if((i+2)<list2.size()){%>
		<h3><%=list2.get(i+2).product_name%></h3><br/>
		<a href="upload/<%=list2.get(i+2).filename_big%>" rel="lightbox" title="<%=list2.get(i+2).product_name%>" ><img src="upload/<%=list2.get(i+2).filename_small%>" /><br/></a>
		<h4>金額<span class="glyphicon glyphicon-usd" aria-hidden="true"><%=list2.get(i+2).price%></span></h4><br/>
		<h4><%=list2.get(i+2).summary%></h4><br/>
		<input type='button' value='-' class='qtyminus' field='quantity_<%=list2.get(i+2).product_id%>' />
        <input type='text' id='quantity_<%=list2.get(i+2).product_id%>' name="quantity_<%=list2.get(i+2).product_id%>" value='0' size="3" />
        <input type='button' value='+' class='qtyplus' field='quantity_<%=list2.get(i+2).product_id%>' />
		<!--  <button type="submit" id="Append_<%=list2.get(i+2).product_id%>" onclick="add('<%=list2.get(i+2).product_id%>')" value="<%=list2.get(i+2).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button> -->
		<button type="submit" id="Append_<%=list2.get(i+2).product_id%>" onclick="add('<%=list2.get(i+2).product_id%>')" value="<%=list2.get(i+2).price%>" name="<%=list2.get(i+2).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button> 				
		<%}else{%>
		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<%
			}%>
		</td>	
		</tr>			
		<%} %>	
			
</table>
</center>
</div>
</div>
</div>

<h2><div class="bg-primary"> 飲料 Drink</div></h2>

       <div style="display: block;">
       <div class=container>
<div class="row">

			<% 
			ProductDAO dao4=new ProductDAODBImpl();
			ArrayList<Product> list3=dao4.getByCategoryId(4);
			for (int i = 0; i < list3.size(); i+=3) { %>
	<center>
	<table>
		<tr>
		<td>
		<%if((i)<list3.size()){
		%>
		<h3><%=list3.get(i).product_name%></h3><br/>
		<a href="upload/<%=list3.get(i).filename_big%>" rel="lightbox" title="<%=list3.get(i).product_name%>" ><img src="upload/<%=list3.get(i).filename_small%>" /><br/></a>
		<h4>金額<span class="glyphicon glyphicon-usd" aria-hidden="true"><%=list3.get(i).price%></span></h4><br/>
		<h4><%=list3.get(i).summary%></h4><br/>
		<input type='button' value='-' class='qtyminus' field='quantity_<%=list3.get(i).product_id%>' />
        <input type='text' id='quantity_<%=list3.get(i).product_id%>'  name="quantity_<%=list3.get(i).product_id%>" value='0' size="3" />
        <input type='button' value='+' class='qtyplus' field='quantity_<%=list3.get(i).product_id%>' />
		<!--  <button type="submit" id="Append_<%=list3.get(i).product_id%>" onclick="add('<%=list3.get(i).product_id%>')" value="<%=list3.get(i).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button> -->
		<button type="submit" id="Append_<%=list3.get(i).product_id%>" onclick="add('<%=list3.get(i).product_id%>')" value="<%=list3.get(i).price%>" name="<%=list3.get(i).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button> 		
		
	<%}else{%>
		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<%} %>
		</td>
		<td>
		<% if((i+1)<list3.size()){%>
		<h3><%=list3.get(i+1).product_name%></h3><br/>
		<a href="upload/<%=list3.get(i+1).filename_big%>" rel="lightbox" title="<%=list3.get(i+1).product_name%>" ><img src="upload/<%=list3.get(i+1).filename_small%>" /><br/></a>
		<h4>金額<span class="glyphicon glyphicon-usd" aria-hidden="true"><%=list3.get(i+1).price%></span></h4><br/>
		<h4><%=list3.get(i+1).summary%></h4><br/>
		<input type='button' value='-' class='qtyminus' field='quantity_<%=list3.get(i+1).product_id%>' />
        <input type='text' id='quantity_<%=list3.get(i+1).product_id%>'  name="quantity_<%=list3.get(i+1).product_id%>" value='0' size="3" />
        <input type='button' value='+' class='qtyplus' field='quantity_<%=list3.get(i+1).product_id%>' />
		<!--  <button type="submit" id="Append_<%=list3.get(i+1).product_id%>" onclick="add('<%=list3.get(i+1).product_id%>')" value="<%=list3.get(i+1).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button> -->
		<button type="submit" id="Append_<%=list3.get(i+1).product_id%>" onclick="add('<%=list3.get(i+1).product_id%>')" value="<%=list3.get(i+1).price%>" name="<%=list3.get(i+1).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button> 				
		<%}else{%>

		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<%} %>
		</td>
		<td>
		<%if((i+2)<list3.size()){%>
		<h3><%=list3.get(i+2).product_name%></h3><br/>
		<a href="upload/<%=list3.get(i+2).filename_big%>" rel="lightbox" title="<%=list3.get(i+2).product_name%>" ><img src="upload/<%=list3.get(i+2).filename_small%>" /><br/></a>
		<h4>金額<span class="glyphicon glyphicon-usd" aria-hidden="true"><%=list3.get(i+2).price%></span></h4><br/>
		<h4><%=list3.get(i+2).summary%></h4><br/>
		<input type='button' value='-' class='qtyminus' field='quantity_<%=list3.get(i+2).product_id%>' />
        <input type='text' id='quantity_<%=list3.get(i+2).product_id%>' name="quantity_<%=list3.get(i+2).product_id%>" value='0' size="3" />
        <input type='button' value='+' class='qtyplus' field='quantity_<%=list3.get(i+2).product_id%>' />
		<!--  <button type="submit" id="Append_<%=list3.get(i+2).product_id%>" onclick="add('<%=list3.get(i+2).product_id%>')" value="<%=list3.get(i+2).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button> -->
		<button type="submit" id="Append_<%=list3.get(i+2).product_id%>" onclick="add('<%=list3.get(i+2).product_id%>')" value="<%=list3.get(i+2).price%>" name="<%=list3.get(i+2).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button> 				
		<%}else{%>

		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<%
			}%>
		</td>	
		</tr>
			
		<%} %>
		
			
</table>
</center>
</div>
</div>
</div>

<p>  
   
     </div>
     
     <div class="span-3 last" id="shopping-cart">    <!-- 使用 Sticky -->
        
        <h3>
        <span class="glyphicon glyphicon-cutlery" aria-hidden="true"></span>&nbsp;您 的 點 餐 單&nbsp;<i class="fa fa-coffee"></i></h3>
        <hr>
           <h4>
           
             <p><li><font color="Red">已加入的餐點 :</font>
             </li>
             <div id="div">
             <ul id="ul">
             </ul>
             </div>
             </p>
 
           </h4>
        <form>   
        <h4><i class="fa fa-motorcycle"></i>
        <td><select name="s1" id="s1">
            <option value="X" SELECTED>請選擇外送或自取</option>
            <option value="1">外送(加收服務費)</option>
            <option value="2">自取</option>
            </select>
        </td></h4>
        <hr><footer></footer>
       金額總計:<h4 id="money">  </h4>   
        <hr><footer></footer>   
        <button input type="submit" class="btn btn-success" action="orderListpage.jsp">確認送出</button> 
        <button type="button" class="btn btn-success" onclick="del()">清除清單</button> 
        </form>
        <hr><footer></footer>   
      </div>              <!-- 使用 Sticky 結尾-->
     
     <div class="col-xs-3"></div> 
</div>

</div>
</p>
   
          <div class=container>
             <div class=row>
               <div class=col-md-4>
                 <h3>簡介</h3>
                 <h4><p>Java與Web整合程式設計師班</p>
                 <p>專題題目:線上點餐系統</p>
                 <p>選定的餐點是義式料理</p></h4>
               </div>
               <div class=col-md-4>
                 <h3>理念</h3>
                 <p><h4>"線上點餐系統"讓消費者經由網路在任何地方，透過網頁呈現方式，方便快速容易使用的網頁點餐。並且建立了後台管理系統，能管理菜單、會員、訂單等所有相關資料庫內容。</h4></p>                
               </div>
               <div class=col-md-4>
               <h3>成員</h3>
               <h4><p>文化大學推廣部建國分部 R202教室</p>
               <p>林秀玲、黃芷萱、黃朝暘、鐘欣志</p>
               <p>劉建宏、林靖凱、何宗庭</p></h4>
               </div>
             </div>
          </div>
          <hr>
          <footer>
          <p>&copy; Copyright : The 4th Group 2015</footer>

<!-- 會員登入 Modal Sign in按鈕 -->
<div class="modal fade" id="mySignIn" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">請登入</h4>
      </div>
      <div class="modal-body">
      <div class="container">   <!-- Sign in /container start-->
        <form class="form-signin" action="memberChk.jsp">
          <div class="col-md-6" >
          <h5>帳號</h5>
          <label for="inputAccount" class="sr-only">Account</label>
          <input type="account" name="memAcc" id="memAcc" class="form-control" placeholder="帳號" required autofocus onblur="getDatalogin()"> 
          <img id="imglogin" src="img/aa.png" width="20px" height="20px" />
          <br>
          <input type="hidden" id="duplogin" value="0" />
          <label for="inputPassword" class="sr-only">Password</label>
          <input type="password" name="memPSW" id="memPSW" class="form-control" placeholder="密碼" required>
          <br>
          <!--  
          <div class="checkbox">
            <label>
              <input type="checkbox" value="remember-me"> 記住我
            </label>
          </div>
          -->
          <br>
          <button class="btn btn-lg btn-primary btn-block" type="submit" value="Login">登入</button>
          </div>
        </form>
      </div> <!-- Sign in/container end-->

      </div>
    </div>
  </div>
</div>  <!-- Sign in按鈕結束-->

<!--會員註冊  Modal Register 按鈕 -->
<div class="modal fade" id="myRegister" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">會員註冊</h4>
      </div>
      <div class="modal-body">
      <div class="container">   <!-- Sign in /container start-->
        <form class="form-signin" name="member" action="MemberAddCode_MD5.jsp">
         <div class="col-md-6 "> 
          <label for="inputAccount" class="sr-only">帳號</label>   
          <h5>帳號</h5>
          <input type="account" id="addAccount" name="member_account" class="form-control" onblur="getData()" placeholder="帳號" required autofocus> 
          <img id="img1" width="20px" height="20px" />
          <p>
          <input type="hidden" id="dup" value="1" />
          <label for="inputPassword" class="sr-only">Password</label>
          <h5>密碼</h5>
          <input type="password" id="addPassword" name="member_password" class="form-control" placeholder="密碼" required >
          <p>
          <label for="inputEmail" class="sr-only">ID number</label>   
          <h5>電子信箱</h5>
          <input type="email" id="addEmail" name="member_email" class="form-control" placeholder="電子信箱" required > 
          <p>
          <label for="inputTelNo" class="sr-only">PhoneNO</label>
          <h5>電話號碼</h5>
          <input type="TelphoneNo" id="addTelphoneNo" name="member_tel" class="form-control" placeholder="電話號碼" required>
          <br>
          <button class="btn btn-lg btn-primary btn-block" type="submit">註冊</button>
         </div>
        </form>
      </div> <!-- Register/container end-->
      </div>
    </div>
  </div>
</div>  <!-- Register按鈕結束-->

<!-- Modal Introduction 按鈕 -->
<div class="modal fade" id="myIntroduction" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">使用說明</h4>
      </div>
      <div class="modal-body">
        <br><h3>由於時程緊迫</h3></br>
        <br><h3>來不及做使用說明</h3></br>
        <br><h3>請見諒</h3></br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>  <!-- Introduction按鈕結束-->
          
</body>
</html>
	