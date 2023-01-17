<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="jdbc.*"%>
<%@ page import="util.FileUtil2"%>


<%
	request.setCharacterEncoding("utf-8"); //한글 처리

	String fbtitle = null;   //게시물 제목
	String fbcontent = null; //게시물 내용
	String fbfile = null;    //사진 이름
	String fbfile2 = null;
	String fbwriter = "someone"; //작성자는 임시로 설정, 실제로는 세션에서 읽어오자
	byte[] fbu = null;     //사진
	byte[] fbu2 = null;     

	ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
	
	List items = sfu.parseRequest(request);
	
	Iterator iter = items.iterator();
	
	while(iter.hasNext()) {
		FileItem item = (FileItem) iter.next();
		String name = item.getFieldName();  //키값 속성 추출
		if(item.isFormField()) { // 키값 밸류값 형태의 데이터 추출
			String value = item.getString("utf-8");
			if (name.equals("fbtitle")) fbtitle = value;
			else if (name.equals("fbcontent")) fbcontent = value;
		} else {
			if (name.equals("fbfile")) {
				fbfile = item.getName();
				fbu = item.get();
				String root = application.getRealPath(java.io.File.separator);
				FileUtil2.saveImage(root, fbfile, fbu);
			}
			else if (name.equals("fbfile2")) {
				fbfile2 = item.getName();
				fbu2 = item.get();
				String root = application.getRealPath(java.io.File.separator);
				FileUtil2.saveImage(root, fbfile2, fbu2);
			}
		}
		
	}
	
	int result = FboardDAO.insert(fbtitle, fbwriter, fbcontent, fbfile, fbfile2);
	
	if (result == 1) {
		out.print("success");
	}else {
		out.print("fail");
	}

%>