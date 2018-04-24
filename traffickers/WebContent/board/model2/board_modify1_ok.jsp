<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
   
   <%
		String seq = (String)request.getAttribute("seq");
   		int flag = (Integer)request.getAttribute("flag");
   		
   		System.out.println(flag);
   		
	   out.println("<script type='text/javascript'>");
	   if(flag == 0){
		   out.println("alert('수정에 성공하셨습니다.')");
		   out.println("location.href='list.do?seq="+seq+"'");
	   }else if(flag == 1){
		   out.println("alert('비밀번호 잘못되었습니다.')");
		   out.println("history.back();");
	   }else{
		   out.println("alert('글 수정 실패했습니다.')");
		   out.println("history.back();");
	   }
	   out.println("</script>");
   %>