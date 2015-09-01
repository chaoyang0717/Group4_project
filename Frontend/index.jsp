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

</style>

<!--Shopping Cart Rolling Sticky 的CSS設定-->
<style type="text/css">  
.fixed {    
    position: fixed;     
    top: 30px;    
    margin-left: 890px;  
    background-color: #fff ! important; 
} 
</style>

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
function add(id) {
      var ul = document.getElementById("list");
      var li = document.createElement("li");
      var msg = document.getElementById("Append_"+id);
      li.appendChild(document.createTextNode(msg.value));
      ul.appendChild(li);
    }
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
   <div class=container>
     
     <div class="col-xs-3">
     </div>

     <div class="col-xs-6">
                <div class="container clearfix">              
                  <class="breadcrumb">
                    <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#mySignIn">登入</a>&nbsp;
                    <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#myRegister">註冊會員</a>&nbsp;
                    <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#myIntroduction">使用說明</a>
                  
                </div>
       <p>
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
           <a href="#"><button type="submit" id="Append_1" onclick="add(1)" value="義大利麵A"><i class="fa fa-cart-plus fa-2x"></i></button></a>
            
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
           <a href="#"><button type="submit" id="Append_2" onclick="add(2)" value="義大利麵B"><i class="fa fa-cart-plus fa-2x"></i></button></a>
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
           <a href="#"><button type="submit" id="Append_3" onclick="add(3)" value="義大利麵C"><i class="fa fa-cart-plus fa-2x"></i></button></a>

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
           <a href="#"><button type="submit" id="Append_4" onclick="add(4)" value="義大利麵D"><i class="fa fa-cart-plus fa-2x"></i></button></a>
         </div>
         <div class="col-xs-6 col-lg-4">

           <h3>菜名</h3>
           <p>
           <a href="images_b/05.jpg" rel="lightbox" title="義大利麵"><img src="images_s/05.jpg" width="150" height="94"  /></a>
           </p>
           <h4>簡介</h4>
              <input type="button" value="-" > 
              <input type="text" value="請選擇數量" size="6" >
              <input type="button" value="+" >
         </div>
         <div class="col-xs-6 col-lg-4">
           <h3>菜名</h3>
           <p>
           <a href="images_b/07.jpg" rel="lightbox" title="義大利麵"><img src="images_s/07.jpg" width="150" height="94"  /></a>
           </p>
           <h4>簡介</h4>
              <td><select name="s1" id="s1">
            <option value="X" SELECTED>請選擇數量</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
          </select>
           </td>
         </div>
      </div>
       </div>
       </div>
       <p>
       <h2><div class="bg-primary"> 披薩 Pizza</div></h2>
       <div style="display: none;">
       <div class=container>
        <div class="row">
         <div class="col-xs-6 col-lg-4">  
           <h3>菜名</h3>
           <p>
           <img src="images_s/pizza01.jpg" width="150" height="94" />
           </p>
           <h4>簡介</h4>
              <input type="button" value="-" > 
              <input type="text" value="請選擇數量" size="6" >
              <input type="button" value="+" >
         </div>
         <div class="col-xs-6 col-lg-4">  
           <h3>菜名</h3>
           <p>
           <img src="images_s/pizza02.jpg" width="150" height="94" />
           </p>
           <h4>簡介</h4>
              <input type="button" value="-" > 
              <input type="text" value="請選擇數量" size="6" >
              <input type="button" value="+" >
         </div>
         <div class="col-xs-6 col-lg-4">  
           <h3>菜名</h3>
           <p>
           <img src="images_s/pizza03.jpg" width="150" height="94" />
           </p>
           <h4>簡介</h4>
              <input type="button" value="-" > 
              <input type="text" value="請選擇數量" size="6" >
              <input type="button" value="+" >
         </div>
         </div>
         <div class="row">
         <div class="col-xs-6 col-lg-4">  
           <h3>菜名</h3>
           <p>
           <img src="images_s/pizza04.jpg" width="150" height="94" />
           </p>
           <h4>簡介</h4>
              <input type="button" value="-" > 
              <input type="text" value="請選擇數量" size="6" >
              <input type="button" value="+" >
         </div>
         <div class="col-xs-6 col-lg-4">  
           <h3>菜名</h3>
           <p>
           <img src="images_s/pizza05.jpg" width="150" height="94" />
           </p>
           <h4>簡介</h4>
              <input type="button" value="-" > 
              <input type="text" value="請選擇數量" size="6" >
              <input type="button" value="+" >
         </div>
         <div class="col-xs-6 col-lg-4">  
           <h3>菜名</h3>
           <p>
           <img src="images_s/pizza06.jpg" width="150" height="94" />
           </p>
           <h4>簡介</h4>
              <input type="button" value="-" > 
              <input type="text" value="請選擇數量" size="6" >
              <input type="button" value="+" >
         </div>
         </div>
         <div class="row">
         <div class="col-xs-6 col-lg-4">  
           <h3>菜名</h3>
           <p>
           <img src="images_s/pizza07.jpg" width="150" height="94" />
           </p>
           <h4>簡介</h4>
              <input type="button" value="-" > 
              <input type="text" value="請選擇數量" size="6" >
              <input type="button" value="+" >
         </div>
       </div>
       </div>
       </div>
       <p>  
       <h2><div class="bg-primary"> 飲料 - 茶類或咖啡 </div></h2>
       <div style="display: none;">
       <div class=container>
       <div class="row">
         <div class="col-xs-6 col-lg-4">  
           <h3>菜名</h3>
           <p>
           <img src="images_s/drink_01.jpg" width="150" height="94" />
           </p>
           <h4>簡介</h4>
              <input type="button" value="-" > 
              <input type="text" value="請選擇數量" size="6" >
              <input type="button" value="+" >
         </div>
         <div class="col-xs-6 col-lg-4">  
           <h3>菜名</h3>
           <p>
           <img src="images_s/drink_02.jpg" width="150" height="94" />
           </p>
           <h4>簡介</h4>
              <input type="button" value="-" > 
              <input type="text" value="請選擇數量" size="6" >
              <input type="button" value="+" >
         </div>
         <div class="col-xs-6 col-lg-4">  
           <h3>菜名</h3>
           <p>
           <img src="images_s/drinK_03.jpg" width="150" height="94" />
           </p>
           <h4>簡介</h4>
              <input type="button" value="-" > 
              <input type="text" value="請選擇數量" size="6" >
              <input type="button" value="+" >
         </div>
         </div>
         <div class="row">
         <div class="col-xs-6 col-lg-4">  
           <h3>菜名</h3>
           <p>
           <img src="images_s/drink_05.jpg" width="150" height="94" />
           </p>
           <h4>簡介</h4>
              <input type="button" value="-" > 
              <input type="text" value="請選擇數量" size="6" >
              <input type="button" value="+" >
         </div>
         <div class="col-xs-6 col-lg-4">  
           <h3>菜名</h3>
           <p>
           <img src="images_s/drink_06.jpg" width="150" height="94" />
           </p>
           <h4>簡介</h4>
              <input type="button" value="-" > 
              <input type="text" value="請選擇數量" size="6" >
              <input type="button" value="+" >
         </div>
         <div class="col-xs-6 col-lg-4">  
           <h3>菜名</h3>
           <p>
           <img src="images_s/drink_07.jpg" width="150" height="94" />
           </p>
           <h4>簡介</h4>
              <input type="button" value="-" > 
              <input type="text" value="請選擇數量" size="6" >
              <input type="button" value="+" >
         </div>
         </div>
         <div class="row">
         <div class="col-xs-6 col-lg-4">  
           <h3>菜名</h3>
           <p>
           <img src="images_s/drink_08.jpg" width="150" height="94" />
           </p>
           <h4>簡介</h4>
              <input type="button" value="-" > 
              <input type="text" value="請選擇數量" size="6" >
              <input type="button" value="+" >
         </div>
         <div class="col-xs-6 col-lg-4">  
           <h3>菜名</h3>
           <p>
           <img src="images_s/drink_09.jpg" width="150" height="94" />
           </p>
           <h4>簡介</h4>
              <input type="button" value="-" > 
              <input type="text" value="請選擇數量" size="6" >
              <input type="button" value="+" >
         </div>
         <div class="col-xs-6 col-lg-4">  
           <h3>菜名</h3>
           <p>
           <img src="images_s/drink_10.jpg" width="150" height="94"  />
           </p>
           <h4>簡介</h4>
              <input type="button" value="-" > 
              <input type="text" value="請選擇數量" size="6" >
              <input type="button" value="+" >
         </div>
         </div>
       </div>
       </div>
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
           <p>
           <i class="fa fa-check-square-o"></i>&nbsp; X X X X X 
           <a href="#"><i class="fa fa-minus-square"></i></a>
           <text type="text"> 數量</text> 
           <a href="#"><i class="fa fa-plus-square"></i></a>
           </p>
           <p>
           <i class="fa fa-check-square-o"></i>&nbsp; X X X X X 
           <a href="#"><i class="fa fa-minus-square"></i></a>
           <text type="text"> 數量</text> 
           <a href="#"><i class="fa fa-plus-square"></i></a>
           </p>
                   
        <h4><i class="fa fa-motorcycle"></i>
        <td><select name="s1" id="s1">
            <option value="X" SELECTED>請選擇外送或自取</option>
            <option value="1">外送(加收服務費)</option>
            <option value="2">自取</option>
            </select>
        </td></h4>
        <hr><footer></footer>
        <h4>金額總計</h4>   
        <hr><footer></footer>   
        <button type="button" class="btn btn-success">確認送出</button> 
        <hr><footer></footer>   
      </div>              <!-- 使用 Sticky 結尾-->
     
     <div class="col-xs-3">
     </div> 

</div>
</div>
</p>
   
          <div class=container>
             <div class=row>
               <div class=col-md-4>
                 <h3>簡介</h3>
                 <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
               </div>
               <div class=col-md-4>
                 <h3>理念</h3>
                 <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>                
               </div>
               <div class=col-md-4>
               <h3>成員</h3>
               <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
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
        <form class="form-signin">
          <div class="col-md-6" >
          <h5>電子信箱</h5>
          <label for="inputEmail" class="sr-only">Email address</label>
          <input type="email" id="inputEmail" class="form-control" placeholder="電子信箱" required autofocus> 
          <br>
          <label for="inputPassword" class="sr-only">Password</label>
          <input type="password" id="inputPassword" class="form-control" placeholder="密碼" required>
          <br>
          <div class="checkbox">
            <label>
              <input type="checkbox" value="remember-me"> 記住我
            </label>
          </div>
          <br>
          <button class="btn btn-lg btn-primary btn-block" type="submit">登入</button>
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
        <form class="form-signin ">
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
        <br><h3>由於時程緊迫，來不及做使用說明</h3></br>
        <br><h3>反正這個網頁很好懂很容易使用</h3></br>
        <br><h3>應該不用多做使用說明了吧( ^.＜ ) 啾咪</h3></br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>  <!-- Introduction按鈕結束-->
          
</body>
</html>
