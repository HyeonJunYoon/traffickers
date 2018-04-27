<%@page import="com.mysql.fabric.xmlrpc.base.Array"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="model1.MemberTO" %>
<%@ page import="model1.MemberDAO" %>

<%
	request.setCharacterEncoding("utf-8");
	  
	MemberTO to = (MemberTO)request.getAttribute("to");
	
	int flag = to.getFlag();
	JSONObject jsonObj		= new JSONObject();
	JSONArray jArray 			= new JSONArray();

	HashMap<String, Integer> map = new HashMap<String, Integer>();
	map.put("result", flag);
	jArray.add(0, map);

	HashMap<String, String> map2 = new HashMap<String, String>();
	map2.put("UserID", to.getUserID());
	map2.put("UserIdx", String.valueOf(to.getUserIdx()));
	map2.put("nickName", to.getNickName());
	map2.put("cType", Integer.toString(to.getJoinType()));	
	jArray.add(0, map2);
	
	jsonObj.put("return", jArray);
	out.println(jsonObj);
	out.flush();
%>