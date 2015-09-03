<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="order.category.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Menu_Product</title>
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
					<div class="panel panel-default">
						  <div class="panel-heading">會員列表</div>
							<div class="panel-body">
							<%
									String PPage = request.getParameter("ber"); //設定一個變數判斷網頁後面的切分頁頁數
							
									int ber;
									if (PPage == null)
									{
										ber = 1;
									} else
									{
										try
										{
											ber = Integer.valueOf(PPage);
											if (ber < 0)
											{
												ber = 1;
											}
										} catch (Exception e)
										{
											ber = 1;
										}
							
									}
							
									final int m_PAGE_SIZE = 5; //每頁顯示幾筆
									int m_start_loc = (ber - 1) * m_PAGE_SIZE + 1; //起始抓的筆數
									MemberDAO mdao = new MemberDAODBImpl();
									ArrayList<Member> mylist2 = mdao.getRangeMembers(m_start_loc, m_PAGE_SIZE);
							
									int m_TotalRows = mdao.getSize(); //計算總筆數
									int m_TotalPages = (int) Math.ceil((double) m_TotalRows / (double) m_PAGE_SIZE); //計算總頁數
								%>
	
								<table class="table table-hover table-striped "><!--加入Table，套用bootstrape-->
									<tr >
										<th style="text-align:center;">會員編號</th>
										<th style="text-align:center;">會員帳號</th>
										<th style="text-align:center;">電話</th>
										<th style="text-align:center;">E-Mail</th>
										<th style="text-align:center;">Operate</th>
									</tr>
									<%
										for (Member mem : mylist2)
										{
									%>
									<tr>
										<td align="center"><%=mem.member_id%></td>
										<td align="center"><%=mem.member_account%></td>
										<td align="center"><%=mem.member_tel%></td>
										<td align="center"><%=mem.member_email%></td>
										<td align="center">
											<a href="back_memberEdit.jsp?id=<%=mem.member_id%>">
											<i class="glyphicon glyphicon-edit"></i></a>
											<a href="back_memberDelCode.jsp?id=<%=mem.member_id%>" onclick="return confirm('確認刪除?')">
											<i class="glyphicon glyphicon-remove"></i></a>
										</td>
									</tr>
									<%
										}
									%>
									<tr>
									</tr>				
								</table>
									
							</div>
						  </div>
						  <div >
							<table id="example" class="table table-striped table-bordered">
							<tr>
							<% 
								final int m_PAGE_RANGE = 5;//要顯示幾個分頁
								int m_loc = (ber-1) / m_PAGE_RANGE;
								int m_start_num = m_loc*m_PAGE_RANGE+1;//切換上X頁後的第一個頁數
								int m_end_num = m_loc*m_PAGE_RANGE+m_PAGE_RANGE;//切換下X頁後的第一個頁數
								int m_uplimit = (m_TotalPages > m_end_num) ? m_end_num : m_TotalPages;
								int k=m_start_num;
								
								
									if (m_start_num > m_PAGE_RANGE)
									{
									%>
										<td class="text-center"><a href="back_member.jsp?ber=<%=k-m_PAGE_RANGE %>"><i class="glyphicon glyphicon-backward"></i></a></td>
										
									<%
									}else{
									%>
										<td class="text-center"><i class="glyphicon glyphicon-backward"></i></td>
									<%
									}
								
								for (;k<=m_uplimit;k++) {
								%>
								<% 
								
								if (ber != k) { %>
								<td class="text-center" width="30px"> <a href="back_member.jsp?ber=<%=k %>"><%=k %></a> </td>
								<% } else { %>
								<td class="text-center" width="30px"> <%=k %> </td>
								<% } %>
							<%		
								}
								
									if (m_TotalPages > m_end_num)
									{
									%>
										<td class="text-center"><a href="back_member.jsp?m=<%=k %>"><i class="glyphicon glyphicon-forward"></i></a></td>
									<%
									}else{
										%>
										<td class="text-center"><i class="glyphicon glyphicon-forward"></i></td>
									<%
									}
								
								
							%>
							
							</tr>
							</table>
						</div>
			</div>

		  </div>
		  <div class="col-md-1"></div>
		</div>
    
    </div><!--標題列下方內文end-->

</div><!--最外框end-->
	
</body>
</html>