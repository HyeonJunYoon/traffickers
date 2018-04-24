<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 	<%@ page import="model1.BoardTO" %>
   <%@ page import="model1.BoardDAO" %>

   
   <%
		int flag = (Integer)request.getAttribute("flag");
   		
	   out.println("<script type='text/javascript'>");
	   if(flag == 0){
		   out.println("alert('글삭제에 성공하셨습니다.')");
		   out.println("location.href='list.do';");
	   }else if(flag == 1){
		   out.println("alert('비밀번호 잘못되었습니다.')");
		   out.println("history.back();");
	   }else if(flag == 2){
		   out.println("alert('글 삭제 실패했습니다.')");
		   out.println("history.back();");
	   }
	   out.println("</script>");
   %>