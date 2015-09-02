<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="order.category.*"%>
    
    <!-- 加入需要的函式庫 -->
<%@ page import="java.io.*"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.io.FilenameUtils"%>
<%@ page import="org.apache.commons.fileupload.util.Streams"%>

<%	
		String product_id="";
		String filename_big="";
		String filename_small="";

		request.setCharacterEncoding("utf-8");
		String saveDirectory = "C:/eclipse/JavaWeb0824/WebContent/upload";
	    File dir = new File(saveDirectory);
	    if (!dir.exists()) {
	    	boolean success = dir.mkdir();
	        //if (success) {
	        //    System.out.println("Directory: " + saveDirectory + " created");
	        //} 
	    }
	    
	    //out.println("file.encoding=" + System.getProperty("file.encoding") + "<br>");
	        
	    // Solve Chinese filename problem: use original form encoding
	    String encoding = "UTF-8";
	    request.setCharacterEncoding(encoding);
	    
	    // Check that we have a file upload request
	    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	    out.println("isMultipart=" + isMultipart + "<br>");
	    
	    // Create a new file upload handler
	    ServletFileUpload upload = new ServletFileUpload();

	    //Create a progress listener
	    ProgressListener progressListener = new ProgressListener(){
	       private long megaBytes = -1;
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

		
		// Parse the request
		// Parse the request
	    FileItemIterator iter = upload.getItemIterator(request);
	    while (iter.hasNext()) {
	        FileItemStream item = iter.next();
	        String name = item.getFieldName();
	        InputStream stream = item.openStream();
		
		    if (item.isFormField()) { //判斷表單是否為text類型
		        // Process a regular form field
		        //processFormField(item);
		       // out.println("<p>a FormField</p>");
		        
		        String value = Streams.asString(stream, encoding);
		        if(name.compareTo("product_id2")==0){
		        	product_id=value;
		        }
		        
		       // out.println(name + "=" + value+"<br>");
		        
		        
		    } else { //否則為file類型
		        // Process a file upload
		        //processUploadedFile(item);
		        
		        
		        //out.println("<p>a file Field</p>");
		        
		        String fieldName = item.getFieldName();
		        String fileName = item.getName();
		        String contentType = item.getContentType();

		        
		        //out.println("fieldName="+fieldName+"<br>");
		        //out.println("fileName="+fileName+"<br>");
		        //out.println("contentType="+contentType+"<br>");
		        //out.println("isInMemory="+isInMemory+"<br>");
		        //out.println("sizeInBytes="+sizeInBytes+"<br>");
		        
		        if (fileName != null && !"".equals(fileName)) {
		            fileName= FilenameUtils.getName(fileName);
		            if(fieldName.compareTo("filename_big")==0){
		            	filename_big=fileName;
			        }
			        if(fieldName.compareTo("filename_small")==0){
			        	filename_small=fileName;
			        }
		            //out.println("fileName saved="+fileName+"<br>");
			        File uploadedFile = new File(saveDirectory, fileName);
	                FileOutputStream uploadedFileStream =new FileOutputStream(uploadedFile);
	                Streams.copy(stream, uploadedFileStream, true);
		        }
		        
		    }
		}
		/*
		out.println("product_id:"+product_id);
		out.println("category_id:"+category_id);
		out.println("product_name:"+product_name);
		out.println("product_name_en:"+product_name_en);
		out.println("price:"+price);
		out.println("summary:"+summary);
		out.println("filename_big:"+filename_small);
		out.println("filename_small:"+filename_small);
		*/
/*
String pname = request.getParameter("product_name");
String smay= request.getParameter("summary");
*/
Product p=new Product(product_id,filename_big,filename_small);	
ProductDAO dao=new ProductDAODBImpl();

dao.upDateFile(p);

response.sendRedirect("product.jsp");
%>  