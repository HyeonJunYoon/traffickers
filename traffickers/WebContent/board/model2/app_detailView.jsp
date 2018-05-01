<%@page import="java.util.HashMap"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ page import="model1.ConcertTO" %>
   <%@ page import="model1.ConcertDAO" %>
   
   <%   
   		request.setCharacterEncoding("utf-8");
   
		ConcertTO to = (ConcertTO)request.getAttribute("cto");
		   		
		JSONObject jsonObj		= new JSONObject();
		JSONArray jArray 			= new JSONArray();
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("result", to.getcFlag());
		jArray.add(0, map);
		
		HashMap<String, String> map2 = new HashMap<String, String>();			
			map2.put("view_level", Integer.toString(to.getView_level()));
			map2.put("subject", to.getSubject());
			map2.put("ctime", to.getCtime());
			map2.put("cplace", to.getCplace());
			map2.put("cprice", to.getCprice());
			map2.put("cdate", to.getcDate());
			map2.put("content", to.getContents());
			map2.put("etc", to.getCetc());
			map2.put("cType" , Integer.toString(to.getCtype()));
			map2.put("clink", to.getClink());
			map2.put("fileName", to.getPosterName());
			
			jArray.add(0, map2);
		
		jsonObj.put("return", jArray);
		out.println(jsonObj);
		out.flush();	
   %>
