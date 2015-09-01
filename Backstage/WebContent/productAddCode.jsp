<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="order.category.*"%>
    
    <!-- 加入需要的函式庫 -->
<%@ page import="java.io.File"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.io.FilenameUtils"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
		String fileName=null;
		request.setCharacterEncoding("utf-8");
		String saveDirectory = application.getRealPath("/upload");// 設定好絕對路徑
		//out.println(saveDirectory);
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		//判斷是否為enctype=multipart
		//out.println("<br />isMultipart="+isMultipart+"<br>");
		
		//以下為處理request的情況
			// Create a factory for disk-based file items
		FileItemFactory factory = new DiskFileItemFactory();
		
		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);
		//Create a progress listener，顯示進度條
		ProgressListener progressListener = new ProgressListener(){
		   private long megaBytes = -1;//監聽Mb為單位的變動
		   public void update(long pBytesRead, long pContentLength, int pItems) {
		       long mBytes = pBytesRead / 1000000;
		       if (megaBytes == mBytes) {
		           return;
		       }
		       megaBytes = mBytes;
		       System.out.println("We are currently reading item " + pItems);
		       if (pContentLength == -1) {
		           System.out.println("So far, " + pBytesRead + " bytes have been read.");
		       } else {
		           System.out.println("So far, " + pBytesRead + " of " + pContentLength
		                              + " bytes have been read.");
		       }
		   }
		};
		upload.setProgressListener(progressListener);
		
		// Parse the request，分析request可以得到一個List，裡面是實作了FileItem 介面
		List /* FileItem */ items = upload.parseRequest(request);
		
		// Process the uploaded items，處理上傳的items
		Iterator iter = items.iterator(); 
		while (iter.hasNext()) {
		    FileItem item = (FileItem) iter.next();
		    if (item.isFormField()) {
		        // Process a regular form field
		        //processFormField(item);
		        //out.println("<p>a FormField</p>");
		        
		        //String name = item.getFieldName();
		        String value = item.getString("UTF-8");
		        //out.println(name + "=" + value+"<br>");
		        
		        
		    } else {
		        // Process a file upload
		        //processUploadedFile(item);
		        
		        
		       // out.println("<p>a file Field</p>");
		        
		        //String fieldName = item.getFieldName();
		        fileName = item.getName();
		        String contentType = item.getContentType();
		        boolean isInMemory = item.isInMemory();
		        long sizeInBytes = item.getSize();
		        //out.println("fieldName="+fieldName+"<br>");
		        //out.println("fileName="+fileName+"<br>");
		        //out.println("contentType="+contentType+"<br>");
		        //out.println("isInMemory="+isInMemory+"<br>");
		        //out.println("sizeInBytes="+sizeInBytes+"<br>");
		        
		        if (fileName != null && !"".equals(fileName)) {
		            fileName= FilenameUtils.getName(fileName);
		            //out.println("fileName saved="+fileName+"<br>");
		            File uploadedFile = new File(saveDirectory, fileName);
		            item.write(uploadedFile);
		        }
		        
		    }
		} 
	

String pname = request.getParameter("product_name");
String smay= request.getParameter("summary");

Product p=new Product(request.getParameter("product_id"), Integer.valueOf(request.getParameter("category_id")), pname, request.getParameter("product_name_en"), Integer.valueOf(request.getParameter("price")),smay,fileName,request.getParameter("filename_small"));	
ProductDAO dao=new ProductDAODBImpl();

dao.add(p);


response.sendRedirect("product.jsp");
%>  