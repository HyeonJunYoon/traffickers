<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@page import="org.json.simple.JSONArray"%>
	<%@page import="java.util.HashMap"%>
	<%@page import="org.json.simple.JSONObject"%>    
   <%@ page import="java.util.ArrayList" %>
   <%@ page import="model1.ConcertTO" %>
   <%
	ConcertTO listViewTO = (ConcertTO)request.getAttribute("lists");

	StringBuffer html = new StringBuffer();

	ArrayList<ConcertTO> ConcertLists = listViewTO.getConcertlists();
	JSONObject jsonObj		= new JSONObject();
	JSONArray jArray 			= new JSONArray();
	
	int flag = ConcertLists.size() > 0 ? 1 : 0; 
	HashMap<String, Integer> map = new HashMap<String, Integer>();
	map.put("result", flag);
	jArray.add(0, map);
	
	HashMap<String, String> map2 = new HashMap<String, String>();			
	for (int i = 0; i < ConcertLists.size(); i++) {
		ConcertTO cto = ConcertLists.get(i);

		map2.put("subject", cto.getSubject());
		map2.put("cPlace", cto.getCplace());
		map2.put("cTime", cto.getCtime());
		map2.put("fileName", cto.getPosterData());
		jArray.add(i, map2);
	}
	
	jsonObj.put("return", jArray);
	out.println(jsonObj);
	out.flush();	
%>