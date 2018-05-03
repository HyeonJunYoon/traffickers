<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@page import="org.json.simple.JSONArray"%>
	<%@page import="java.util.HashMap"%>
	<%@page import="org.json.simple.JSONObject"%>    
   <%@ page import="java.util.ArrayList" %>
   <%@ page import="model1.ConcertTO" %>
   <%
	ArrayList<ConcertTO> lists = (ArrayList<ConcertTO>)request.getAttribute("lists");
	
	JSONObject jsonObj		= new JSONObject();
	JSONArray jArray 			= new JSONArray();	
	
	HashMap<String, Integer> map = new HashMap<String, Integer>();
	map.put("result", lists.size());
	jArray.add(0, map);	
	
	for(int i = 0; i<lists.size(); i++){
		HashMap<String, String> map2 = new HashMap<String, String>();		
		map2.put("cidx", Integer.toString(lists.get(i).getCidx()));		
		map2.put("fileName", lists.get(i).getPosterName());
		jArray.add(i, map2);
	}
		
	jsonObj.put("return", jArray);
	out.println(jsonObj);
	out.flush();	
%>