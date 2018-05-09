<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%		
   		int flag = (Integer)request.getAttribute("flag");
   		
   	   out.println("<script type='text/javascript'>");
	   if(flag == 0){
		   out.println("alert('공연 등록에 성공하셨습니다.')");
		   out.println("location.href='concert_list.tk';");
	   }else if(flag == 1){
		   out.println("alert('공연 등록에 실패하셨습니다.')");
		   out.println("history.back();");
	   }
	   out.println("</script>");
%>