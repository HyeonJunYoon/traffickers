<%@page import="com.mysql.fabric.xmlrpc.base.Array"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	  
	int flag = (Integer)request.getAttribute("flag");
	
	JSONObject jsonObj		= new JSONObject();
	JSONArray jArray 			= new JSONArray();
	
	System.out.println("########################");

	HashMap<String, Integer> map = new HashMap<String, Integer>();
	map.put("result", flag);
	jArray.add(0, map);
	
	jsonObj.put("return", jArray);
	out.println(jsonObj);
	out.flush();
%>