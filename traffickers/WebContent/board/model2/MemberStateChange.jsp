<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <%
		int flag = (Integer)request.getAttribute("flag");
   		
	   out.println("<script type='text/javascript'>");
	   if(flag == 1){
		   out.println("alert('회원 상태 변경에 성공하셨습니다.')");
		   out.println("location.href='memberList.tk';");
	   }else if(flag == 0){
		   out.println("alert('회원 상태 변경에 실패하셨습니다.')");
		   out.println("history.back();");
	   }
	   out.println("</script>");
   %>