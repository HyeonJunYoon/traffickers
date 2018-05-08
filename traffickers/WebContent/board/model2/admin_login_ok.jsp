<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page import="model1.MemberTO" %>
<%@ page import="model1.MemberDAO" %>

   <%
	request.setCharacterEncoding("utf-8");
   
   MemberTO to = (MemberTO)request.getAttribute("to");   
	
	String aid 	= to.getAdminID();
	int alevel	= to.getAdminLevel();	
	
	System.out.println("아이디는" + aid);
  		  		
	   out.println("<script type='text/javascript'>");
	   if(to.getFlag() == 1){
		   out.println("alert('정상적으로 로그인 되었습니다.')");
		   out.println("location.href='concert_list.tk'");
	   }else{
		   out.println("alert('패스워드를 잘못 입력하였습니다.')");
		   out.println("history.back();");
	   }
	   out.println("</script>");
   %>