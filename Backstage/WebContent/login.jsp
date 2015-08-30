<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>後台工具登入</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-modal.css">
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/jquery.js"></script>
<link rel="stylesheet" href="css/mysite.css">

<script language="JavaScript">

var request
function getData(){ //加入Ajax判斷
	var acc=document.getElementById('acc')//取得使用者輸入的值
	request=new XMLHttpRequest();//在記憶體內開啟一個網頁
	request.open("GET", "login_nameCheck.jsp?name="+acc.value, true); //將名字的值傳入check的網頁判斷，有找到名字該網頁會顯示1(有重複)
	// 這行是設定 request 要去哪取資料，尚未開始取
	// 第三個參數打 true 可以想成，利用另外一個執行緒處理 Request
	// 第三個參數打 false 可以想成，利用這一個執行緒處理 Request
	
	var img1 = document.getElementById("img1");//抓取資料時，顯示運作中的圖
	img1.src = "img/wait.gif";
	
	request.onreadystatechange = updateData;
	// 當記憶體中的瀏覽器狀態改變時，呼叫 updateData 這個 function
	 
	 request.send(null);// 發動 request 去取資料
	
}

function updateData(){
	
	if(request.readyState==4){
		var dup = document.getElementById("dup");
		dup.value = request.responseText.trim();
		
		//把check判斷抓取的值回送給dup，修改dup的value在進行判斷。trim<--消除左右空白以免判斷錯誤
		if (dup.value == "0")//取得的值為1，則顯示打V的圖
			{
			var img1 = document.getElementById("img1");
			img1.src = "img/a1.png";
			}
		else
			{
			var img1 = document.getElementById("img1");
			img1.src = "img/a0.png";
			}
	}
}


function check_data()//判斷欄位是否空白
{
   var flag = true;

   // ---------- Check ----------
   var acc = document.getElementById('acc');
   if(acc.value=='')
   {
	   var img1 = document.getElementById("img1");
	   img1.src = "img/a1.png";
	   flag = false;
   }
   // ---------- Check ----------
   var pwd = document.getElementById('pwd');
   if(pwd.value=='')
   {
	   var img2 = document.getElementById("img2");
	   img2.src = "img/a1.png";
	   flag = false;
   }

   return flag;
}
</script>

</head>

<body>

<div id="wrapper"> <!--最外框start-->

    <div id="header"><!--最上方標題列start-->

    </div><!--最上方標題列end-->

    <div id="content"><!--標題列下方內文start-->
    	<div class="row">
		  <div class="col-md-1"></div>
		  <div class="col-md-10">
		  	<div class="jumbotron other-color"><!--製作大看板-->
			      <br/>
			      <br/>
			      <h1>後台管理系統</h1>
			      <br/>
			      <br/>
			      <br/>
			 </div>
			 <br />
			 <br />
		  	 <div class="panel panel-default" id="login">
		        <div class="panel-heading">登入</div>
		          <div class="panel-body">
		            <form class="form-horizontal" role="form" action="chk.jsp" method="POST" onsubmit="return check_data();">
		              <div class="form-group">
		                <label for="inputtextl3" class="col-sm-2 control-label">帳號</label>
		                <div class="col-sm-8">
		                  <input type="text" class="form-control" name="acc" id="acc" placeholder="ACCOUNT" onblur="getData()">
		               	  <input type="hidden" id="dup" value="0" /> <!-- 新增隱藏的值，把value給ajax判斷 getData() -->
		               	</div>
		                <div class="col-sm-2">
		                <img id="img1" src="img/aa.png" style="width:25px;height:25px;margin-top:5px;"/>
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="inputPassword3" class="col-sm-2 control-label">密碼</label>
		                <div class="col-sm-8">
		                  <input type="password" class="form-control" name="pwd" id="pwd" placeholder="PASSWORD">
		                </div>
		                <div class="col-sm-2">
		                <img id="img2" src="img/aa.png" style="width:25px;height:25px;margin-top:5px;"/>
		                </div>
		              </div>
		              <!-- 
		              <div class="form-group">
		                <div class="col-sm-offset-2 col-sm-10">
		                  <div class="checkbox">
		                    <label>
		                      <input type="checkbox"> 記住我
		                    </label>
		                  </div>
		                </div>
		              </div>
		               -->
		              <div class="form-group">
		                <div class="col-sm-offset-2 col-sm-10">
		                  <button type="submit" class="btn btn-default" value="Login">登入</button>
		                </div>
		              </div>
		            </form>
		        </div>
		      </div>

		  </div>
		  <div class="col-md-1"></div>
		</div>
    
    </div><!--標題列下方內文end-->

</div><!--最外框end-->

</body>
</html>