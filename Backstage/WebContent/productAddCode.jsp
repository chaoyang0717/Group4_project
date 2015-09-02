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

<%	
		String product_id="";
		String category_id="";
		String product_name="";
		String product_name_en="";
		String price="";
		String summary="";
		String filename_big="";
		String filename_small="";

		request.setCharacterEncoding("utf-8");
		String saveDirectory = application.getRealPath("/upload");
		//out.println(saveDirectory);		// 設定好絕對路徑
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		//out.println("<br />isMultipart="+isMultipart+"<br>");

		
		// Create a factory for disk-based file items
		FileItemFactory factory = new DiskFileItemFactory();
		
		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);
		
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
		List /* FileItem */ items = upload.parseRequest(request);
		
		// Process the uploaded items
		Iterator iter = items.iterator(); 
		while (iter.hasNext()) {
		    FileItem item = (FileItem) iter.next();
		
		    if (item.isFormField()) { //判斷表單是否為text類型
		        // Process a regular form field
		        //processFormField(item);
		       // out.println("<p>a FormField</p>");
		        
		        String name = item.getFieldName();
		        String value = item.getString("UTF-8");
		        if(name.compareTo("product_id")==0){
		        	product_id=value;
		        }
		        if(name.compareTo("category_id")==0){
		        	category_id=value;
		        }
		        if(name.compareTo("product_name")==0){
		        	product_name=value;
		        }
		        if(name.compareTo("product_name_en")==0){
		        	product_name_en=value;
		        }
		        if(name.compareTo("price")==0){
		        	price=value;
		        }
		        if(name.compareTo("summary")==0){
		        	summary=value;
		        }
		        
		       // out.println(name + "=" + value+"<br>");
		        
		        
		    } else { //否則為file類型
		        // Process a file upload
		        //processUploadedFile(item);
		        
		        
		        //out.println("<p>a file Field</p>");
		        
		        String fieldName = item.getFieldName();
		        String fileName = item.getName();
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
		            if(fieldName.compareTo("filename_big")==0){
		            	filename_big=fileName;
			        }
			        if(fieldName.compareTo("filename_small")==0){
			        	filename_small=fileName;
			        }
		            //out.println("fileName saved="+fileName+"<br>");
		            File uploadedFile = new File(saveDirectory, fileName);
		            item.write(uploadedFile);
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
Product p=new Product(product_id, Integer.valueOf(category_id), product_name, product_name_en, Integer.valueOf(price),summary,filename_big,filename_small);	
ProductDAO dao=new ProductDAODBImpl();

dao.add(p);

response.sendRedirect("product.jsp");
%>  