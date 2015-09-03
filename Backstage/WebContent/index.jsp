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

<script language="JavaScript">              //會員登入判斷
var request
function getData(){ //加入Ajax判斷
	var memAcc=document.getElementById('memAcc')//取得使用者輸入的值
	request=new XMLHttpRequest();//在記憶體內開啟一個網頁
	request.open("GET", "mem_nameChk.jsp?name="+memAcc.value, true); //將名字的值傳入check的網頁判斷，有找到名字該網頁會顯示1(有重複)
	// 這行是設定 request 要去哪取資料，尚未開始取
	// 第三個參數打 true 可以想成，利用另外一個執行緒處理 Request
	// 第三個參數打 false 可以想成，利用這一個執行緒處理 Request
	
	//var img1 = document.getElementById("img1");//抓取資料時，顯示運作中的圖
	//img1.src = "img/wait.gif";
	
	request.onreadystatechange = updateData;
	// 當記憶體中的瀏覽器狀態改變時，呼叫 updateData 這個 function
	 
	 request.send(null);// 發動 request 去取資料
	
}

function updateData(){
	
	if(request.readyState==4){
		var dup = document.getElementById("dup");
		dup.value = request.responseText.trim();
		
		//把check判斷抓取的值回送給dup，修改dup的value在進行判斷。trim<--消除左右空白以免判斷錯誤
		
		//if (dup.value == "0")//取得的值為1，則顯示打V的圖
		//	{
		//	var img1 = document.getElementById("img1");
		//	img1.src = "img/a1.png";
		//	}
		//else
		//	{
		//	var img1 = document.getElementById("img1");
		//	img1.src = "img/a0.png";
		//	}
	}
}
</script>

<script >           //使用 Shopping Cart Rolling Sticky
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

<script src="./js/jquery.js"></script>
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
function add() {
      var ul = document.getElementById("list");
      var li = document.createElement("li");
      var msg = document.getElementById("id");
      li.appendChild(document.createTextNode(msg.value));
      //li.innerHTML ="<button type='submit' onclick='del()'>X</button>";
      //var quantity =document.getElementById("quantity_"+id);
      //li.appendChild(document.createTextNode(msg[0].value+" 數量 : "+quantity.value));
      ul.appendChild(li);
    }
function del(){
   var del = document.getElementById("list");

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
            <div class=form-group>
              <input placeholder=Email class=form-control>
            </div>
            &nbsp;
            <div class=form-group>
              <input type=password placeholder=Password class=form-control>
            </div>
            &nbsp;
            <button type=submit class="btn btn-success">Sign in</button>
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
		<input type='button' value='-' class='qtyminus' field='<%=list.get(i).product_name%>' />
        <input type='text' id='<%=list.get(i).product_id%>' name="<%=list.get(i).product_name%>" value='0' size="3" />
        <input type='button' value='+' class='qtyplus' field='<%=list.get(i).product_name%>' />
		<button type="submit" id="<%=list.get(i).product_id%>" onclick="add()" value="<%=list.get(i).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button>
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
		<input type='button' value='-' class='qtyminus'  field='<%=list.get(i+1).product_name%>' />
        <input type='text' id='<%=list.get(i+1).product_id%>' name="<%=list.get(i+1).product_name%>" value='0' size="3" />
        <input type='button' value='+' class='qtyplus'  field='<%=list.get(i+1).product_name%>' />
		<button type="submit" id="<%=list.get(i+1).product_id%>" onclick="add()" value="<%=list.get(i+1).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button>
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
		<input type='button' value='-' class='qtyminus' field='<%=list.get(i+2).product_name%>' />
        <input type='text' id='<%=list.get(i+2).product_id%>' name="<%=list.get(i+2).product_name%>" value='0' size="3" />
        <input type='button' value='+' class='qtyplus' field='<%=list.get(i+2).product_name%>' />
		<button type="submit" id="<%=list.get(i+2).product_id%>" onclick="add()" value="<%=list.get(i+2).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button>		
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
			ArrayList<Product> list2=dao2.getByCategoryId(2);
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
		<input type='button' value='-' class='qtyminus' field='<%=list2.get(i).product_name%>' />
        <input type='text' id='<%=list2.get(i).product_id%>' name="<%=list2.get(i).product_name%>" value='0' size="3" />
        <input type='button' value='+' class='qtyplus' field='<%=list2.get(i).product_name%>' />
		<button type="submit" id="<%=list2.get(i).product_id%>" onclick="add()" value="<%=list2.get(i).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button>		
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
		<input type='button' value='-' class='qtyminus' field='<%=list2.get(i+1).product_name%>' />
        <input type='text' id='<%=list2.get(i+1).product_id%>' name="<%=list2.get(i+1).product_name%>" value='0' size="3" />
        <input type='button' value='+' class='qtyplus' field='<%=list2.get(i+1).product_name%>' />
		<button type="submit" id="<%=list2.get(i+1).product_id%>" onclick="add()" value="<%=list2.get(i+1).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button>
		
		<%}else{%>

		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<%} %>
		</td>
		<td>
		<%if((i+2)<list2.size()){%>
		<h3><%=list2.get(i+2).product_name%></h3></p><br/>
		<a href="upload/<%=list2.get(i+2).filename_big%>" rel="lightbox" title="<%=list2.get(i+2).product_name%>" ><img src="upload/<%=list2.get(i+2).filename_small%>" /><br/></a>
		<h4>金額<span class="glyphicon glyphicon-usd" aria-hidden="true"><%=list2.get(i+2).price%></span></h4><br/>
		<h4><%=list2.get(i+2).summary%></h4><br/>
		<input type='button' value='-' class='qtyminus' field='<%=list2.get(i+2).product_name%>'  />
        <input type='text' id='<%=list2.get(i+2).product_id%>' name="<%=list2.get(i+2).product_name%>" value='0' size="3" />
        <input type='button' value='+' class='qtyplus' field='quantity_1' />
		<button type="submit" id="<%=list2.get(i+2).product_id%>" onclick="add()" value="<%=list2.get(i+2).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button>
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
			ArrayList<Product> list3=dao3.getByCategoryId(3);
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
		<input type='button' value='-' class='qtyminus' field='<%=list3.get(i).product_name%>' />
        <input type='text' id='<%=list3.get(i).product_id%>' name="<%=list3.get(i).product_name%>" value='0' size="3" />
        <input type='button' value='+' class='qtyplus' field='<%=list3.get(i).product_name%>' />
		<button type="submit" id="<%=list3.get(i).product_id%>" onclick="add()" value="<%=list3.get(i).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button>
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
		<input type='button' value='-' class='qtyminus' field='quantity_1' />
        <input type='text' id='<%=list3.get(i+1).product_name%>' name="<%=list3.get(i+1).product_id%>" value='0' size="3" />
        <input type='button' value='+' class='qtyplus' field='quantity_1' />
		<button type="submit" id="<%=list3.get(i+1).product_id%>" onclick="add()" value="<%=list3.get(i+1).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button>
		
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
		<input type='button' value='-' class='qtyminus' field='<%=list3.get(i+2).product_name%>' />
        <input type='text' id='<%=list3.get(i+2).product_id%>' name="<%=list3.get(i+2).product_name%>" value='0' size="3" />
        <input type='button' value='+' class='qtyplus' field='<%=list3.get(i+2).product_name%>' />
		<button type="submit" id="<%=list3.get(i+2).product_id%>" onclick="add()" value="<%=list3.get(i+2).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button>
		
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
			ArrayList<Product> list4=dao4.getByCategoryId(4);
			for (int i = 0; i < list4.size(); i+=3) { %>
	<center>
	<table>
		<tr>
		<td>
		<%if((i)<list4.size()){
		%>
		<h3><%=list4.get(i).product_name%></h3><br/>
		<a href="upload/<%=list4.get(i).filename_big%>" rel="lightbox" title="<%=list4.get(i).product_name%>" ><img src="upload/<%=list4.get(i).filename_small%>" /><br/></a>
		<h4>金額<span class="glyphicon glyphicon-usd" aria-hidden="true"><%=list4.get(i).price%></span></h4><br/>
		<h4><%=list4.get(i).summary%></h4><br/>
		<input type='button' value='-' class='qtyminus' field='<%=list4.get(i).product_name%>' />
        <input type='text' id='<%=list4.get(i).product_id%>'  name="<%=list4.get(i).product_name%>" value='0' size="3" />
        <input type='button' value='+' class='qtyplus' field='<%=list4.get(i).product_name%>' />
		<button type="submit" id="<%=list4.get(i).product_id%>" onclick="add()" value="<%=list4.get(i).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button>
	<%}else{%>
		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<%} %>
		</td>
		<td>
		<% if((i+1)<list4.size()){%>
		<h3><%=list4.get(i+1).product_name%></h3><br/>
		<a href="upload/<%=list4.get(i+1).filename_big%>" rel="lightbox" title="<%=list4.get(i+1).product_name%>" ><img src="upload/<%=list4.get(i+1).filename_small%>" /><br/></a>
		<h4>金額<span class="glyphicon glyphicon-usd" aria-hidden="true"><%=list4.get(i+1).price%></span></h4><br/>
		<h4><%=list4.get(i+1).summary%></h4><br/>
		<input type='button' value='-' class='qtyminus' field='<%=list4.get(i+1).product_name%>' />
        <input type='text' id='<%=list4.get(i+1).product_id%>'  name="<%=list4.get(i+1).product_name%>" value='0' size="3" />
        <input type='button' value='+' class='qtyplus' field='<%=list4.get(i+1).product_name%>' />
		<button type="submit" id="<%=list4.get(i+1).product_id%>" onclick="add()" value="<%=list4.get(i+1).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button>
		
		<%}else{%>

		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<p></p><br/>
		<%} %>
		</td>
		<td>
		<%if((i+2)<list4.size()){%>
		<h3><%=list4.get(i+2).product_name%></h3><br/>
		<a href="upload/<%=list4.get(i+2).filename_big%>" rel="lightbox" title="<%=list4.get(i+2).product_name%>" ><img src="upload/<%=list4.get(i+2).filename_small%>" /><br/></a>
		<h4>金額<span class="glyphicon glyphicon-usd" aria-hidden="true"><%=list4.get(i+2).price%></span></h4><br/>
		<h4><%=list4.get(i+2).summary%></h4><br/>
		<input type='button' value='-' class='qtyminus' field='<%=list4.get(i+2).product_name%>' />
        <input type='text' id='<%=list4.get(i+2).product_id%>' name="<%=list4.get(i+2).product_name%>" value='0' size="3" />
        <input type='button' value='+' class='qtyplus' field='<%=list4.get(i+2).product_name%>' />
		<button type="submit" id="<%=list4.get(i+2).product_id%>" onclick="add()" value="<%=list4.get(i+2).product_name%>"><i class="fa fa-cart-plus fa-2x"></i></button>
		
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

<!-- 網頁假資料做樣版用 
       <h2><div class="bg-primary"> 義大利麵 Pasta</div></h2>
       <div style="display: block;">
       <div class=container>
       <div class="row">
         <div class="col-xs-6 col-lg-4">  
           <h3>義大利麵A</h3>
           <p>
           <a href="images_b/01.jpg" rel="lightbox" title="義大利麵" ><img src="images_s/01.jpg" width="150" height="94" /></a>
           </p> 
           <h4>簡介</h4>
           <h4>金額&nbsp;
           <span class="glyphicon glyphicon-usd" aria-hidden="true">123</span>
           </h4>&nbsp;&nbsp;
           <input type='button' value='-' class='qtyminus' field='quantity_1' />
           <input type='text' id='quantity_1' name="quantity_1" value='0' size="3" />
           <input type='button' value='+' class='qtyplus' field='quantity_1' />
           <button type="submit" id="Append_1" onclick="add(1)" value="義大利麵A"><i class="fa fa-cart-plus fa-2x"></i></button>
            
         </div>
         <div class="col-xs-6 col-lg-4">
           <h3>義大利麵B</h3>
           <p>
           <a href="images_b/02.jpg" rel="lightbox" title="義大利麵"><img src="images_s/02.jpg" width="150" height="94"  /></a>
           </p> 
           <h4>簡介</h4>
           <h4>金額&nbsp;
           <span class="glyphicon glyphicon-usd" aria-hidden="true">123</span>
           </h4>&nbsp;&nbsp;
           <input type='button' value='-' class='qtyminus' field='quantity_2' />
           <input type='text' id='quantity_2' name="quantity_2" value='0' size="3" />
           <input type='button' value='+' class='qtyplus' field='quantity_2' />
           <button type="submit" id="Append_2" onclick="add(2)" value="義大利麵B"><i class="fa fa-cart-plus fa-2x"></i></button>
         </div>
         <div class="col-xs-6 col-lg-4">
           <h3>義大利麵C</h3>
           <p>
           <a href="images_b/03.jpg" rel="lightbox" title="義大利麵"><img src="images_s/03.jpg" width="150" height="94"  /></a>
           </p>
           <h4>簡介</h4>
           <h4>金額&nbsp;
           <span class="glyphicon glyphicon-usd" aria-hidden="true">123</span>
           </h4>&nbsp;&nbsp;
           <input type='button' value='-' class='qtyminus' field='quantity_3' />
            <input type='text' id='quantity_3' name="quantity_3" value='0' size="3" />
            <input type='button' value='+' class='qtyplus' field='quantity_3' />
           <button type="submit" id="Append_3" onclick="add(3)" value="義大利麵C"><i class="fa fa-cart-plus fa-2x"></i></button>

         </div>
         </div>
      <div class="row">
         <div class="col-xs-6 col-lg-4">
           <h3>義大利麵D</h3>
           <p>
           <a href="images_b/04.jpg" rel="lightbox" title="義大利麵"><img src="images_s/04.jpg" width="150" height="94"  /></a>
           </p>
           <h4>簡介</h4>
           <h4>金額&nbsp;
           <span class="glyphicon glyphicon-usd" aria-hidden="true">123</span>
           </h4>&nbsp;&nbsp;
           <input type='button' value='-' class='qtyminus' field='quantity_4' />
            <input type='text' id='quantity_4' name="quantity_4" value='0' size="3" />
            <input type='button' value='+' class='qtyplus' field='quantity_4' />
           <button type="submit" id="Append_4" onclick="add(4)" value="義大利麵D"><i class="fa fa-cart-plus fa-2x"></i></button>
         </div>

         <div class="col-xs-6 col-lg-4">
           <h3>義大利麵E</h3>
           <p>
           <a href="images_b/05.jpg" rel="lightbox" title="義大利麵"><img src="images_s/05.jpg" width="150" height="94"  /></a>
           </p>
           <h4>簡介</h4>
           <h4>金額&nbsp;
           <span class="glyphicon glyphicon-usd" aria-hidden="true">123</span>
           </h4>&nbsp;&nbsp;
           <input type='button' value='-' class='qtyminus' field='quantity_5' />
            <input type='text' id='quantity_5' name="quantity_5" value='0' size="3" />
            <input type='button' value='+' class='qtyplus' field='quantity_5' />
            <button type="submit" id="Append_5" onclick="add(5)" value="義大利麵E"><i class="fa fa-cart-plus fa-2x"></i></button>
         </div>
         <div class="col-xs-6 col-lg-4">
           <h3>義大利麵F</h3>
           <p>
           <a href="images_b/07.jpg" rel="lightbox" title="義大利麵"><img src="images_s/07.jpg" width="150" height="94"  /></a>
           </p>
           <h4>簡介</h4>
           <h4>金額&nbsp;
           <span class="glyphicon glyphicon-usd" aria-hidden="true">123</span>
           </h4>&nbsp;&nbsp;
           <input type='button' value='-' class='qtyminus' field='quantity_6' />
            <input type='text' id='quantity_6' name="quantity_6" value='0' size="3" />
            <input type='button' value='+' class='qtyplus' field='quantity_6' />
           <button type="submit" id="Append_6" onclick="add(6)" value="義大利麵F"><i class="fa fa-cart-plus fa-2x"></i></button>
         </div>

      </div>
       </div>
       </div>
-->
       <p>  
   
     </div>
     
     <div class="span-3 last" id="shopping-cart">    <!-- 使用 Sticky -->
        
        <h3>
        <span class="glyphicon glyphicon-cutlery" aria-hidden="true"></span>&nbsp;您 的 點 餐 單&nbsp;<i class="fa fa-coffee"></i></h3>
        <hr>
           <h4>
           <ul id="list">
             <p><li><font color="Red">已加入的餐點 :</font>
             </li></p>
           </ul>
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
        <h4> 金額總計: </h4>   
        <hr><footer></footer>   
        <button input type="submit" class="btn btn-success" cation="self.jsp" method="post">確認送出</button> 
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
                 <p><h4>"線上點餐系統"讓消費者經由網路在任何地方，透過網頁呈現方式，方便快速容易使用的網頁點餐。並且建立了後台管理系統，能管理菜單、會員、訂單等所有相關內容。</h4></p>                
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

<!-- Modal Sign in按鈕 -->
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
          <h5>電子信箱</h5>
          <label for="inputEmail" class="sr-only">Email address</label>
          <input type="email" name="memAcc" id="memAcc" class="form-control" placeholder="電子信箱" required autofocus onblur="getData()"> 
          <br>
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

<!-- Modal Register 按鈕 -->
<div class="modal fade" id="myRegister" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">會員註冊</h4>
      </div>
      <div class="modal-body">
      <div class="container">   <!-- Sign in /container start-->
        <form class="form-signin " >
         <div class="col-md-6 "> 
          <label for="inputEmail" class="sr-only">ID number</label>  <!-- Email address = ID number -->
          <h5>電子信箱</h5>
          <input type="email" id="inputEmail" class="form-control" placeholder="電子信箱" required autofocus> 
          <p>
          <label for="inputPassword" class="sr-only">Password</label>
          <h5>密碼</h5>
          <input type="password" id="inputPassword" class="form-control" placeholder="密碼" required>
          <p>
          <label for="inputPassword" class="sr-only">CheckPassword</label>
          <h5>確認密碼</h5>
          <input type="password" id="inputPassword" class="form-control" placeholder="請再輸入一次密碼" required>
          <p>
          <label for="inputPassword" class="sr-only">PhoneNO</label>
          <h5>行動電話號碼</h5>
          <input type="password" id="inputPassword" class="form-control" placeholder="行動電話號碼" required>
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
	