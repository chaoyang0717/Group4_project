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


var request5
function getData5(){ //加入Ajax判斷
	var category_name=document.getElementById('category_name')//取得使用者輸入的值
	request5=new XMLHttpRequest();//在記憶體內開啟一個網頁
	request5.open("GET", "category_nameCheck.jsp?name="+category_name.value, true); //將名字的值傳入check的網頁判斷
	// 這行是設定 request 要去哪取資料，尚未開始取
	// 第三個參數打 true 可以想成，利用另外一個執行緒處理 Request
	// 第三個參數打 false 可以想成，利用這一個執行緒處理 Request

	var img2 = document.getElementById("img2");//抓取資料時，顯示運作中的圖
	img2.src = "img/wait.gif";

	request5.onreadystatechange = updateData5;
	// 當記憶體中的瀏覽器狀態改變時，呼叫 updateData 這個 function

	 request5.send(null);
	
}


function updateData5(){
	
	if(request5.readyState==4){
		var dup5 = document.getElementById("dup2");
		dup2.value = request5.responseText.trim();
		//把check判斷抓取的值回送給dup，修改dup的value在進行判斷。trim<--消除左右空白以免判斷錯誤
		if (dup2.value == "1")//取得的值為1，則顯示打V的圖
			{
			var img2 = document.getElementById("img2");
			img2.src = "img/a0.png";
			}
		else
			{
			var img2 = document.getElementById("img2");
			img2.src = "img/a1.png";
			}
	}
}

function check33()//判斷欄位是否空白
{
   var flag = true;

   // ---------- Check ----------
   var category_name = document.getElementById('category_name');
   if(category_name.value=='')
   {
	   var img2 = document.getElementById("img2");
	   img2.src = "img/a1.png";
	   flag = false;
   }
// ---------- value的值是否為1(ajax)----------
   var dup2 = document.getElementById('dup2');
   if(dup2.value=='0')
   {
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
							  <div class="panel-heading">種類修改</div>
								<div class="panel-body">
								<%
									String s = request.getParameter("id");
									Category stu =null;
									if (s != null)
									{
										try
										{
											int category_id = Integer.valueOf(s);
											CategoryDAO dao=new CategoryDAODBImpl();
											stu = dao.findById(category_id);
											
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
						
							<form class="form-horizontal" name="category" action="categoryEditCode.jsp" method="post" onsubmit="return check33();" >
								<div class="form-group">
							    	<label for="inputEmail3" class="col-sm-4 control-label">種類編號</label>
							    <div class="col-sm-6">
							      <input type="text" class="form-control" id="category_id" name="category_id" value="<%=stu.category_id%>" readonly width="60px" >
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword3" class="col-sm-4 control-label">種類名稱</label>
							    <div class="col-sm-6">
							      <input type="text" class="form-control" id="category_name" name="category_name" value="<%=stu.category_name%>" onblur="getData5()">
							    	<input type="hidden" id="dup2" value="1" />
							    </div>
							    <div class="col-sm-2">
				                	<img id="img2" src="img/aa.png" style="width:25px;height:25px;margin-top:5px;"/>
				                </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword4" class="col-sm-4 control-label">英文名稱</label>
							    <div class="col-sm-6">
							      <input type="text" class="form-control" id="category_name_en" name="category_name_en" value="<%=stu.category_name_en%>">
							      
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