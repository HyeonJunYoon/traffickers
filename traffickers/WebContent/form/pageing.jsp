<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 페이징 -->
<nav aria-label="Page navigation example" style="text-align: center;">
  <ul class="pagination justify-content-center">
  	<%
	int startBlock = Integer.parseInt(request.getParameter("startBlock"));
	int endBlock = Integer.parseInt(request.getParameter("endBlock"));
	int totalPage = Integer.parseInt(request.getParameter("totalPage"));
	int cpage = Integer.parseInt(request.getParameter("cpage"));
	int blockPerPage = Integer.parseInt(request.getParameter("blockPerPage"));
	String pageURL = request.getParameter("pageURL");
	
		if (endBlock >= totalPage) {
			endBlock = totalPage;
		}
	%>						  						  
  	<li class="page-item">
  	<%
  	if (cpage == 1) {
  		out.println("<span class='page-link' tabindex='-1' style='background-color:#00c73c; color:white;'>이전</span>");
  	}else {
  		out.println("<a class='page-link' href='./"+ pageURL +"?cpage=" + (cpage - 1) + "' tabindex='-1' style='background-color:#00c73c; color:white;'>이전</a>");
  	}						      
    %>
    </li>
    <%
		for (int i = startBlock; i <= endBlock; i++) {
			if (cpage == i) {
				out.println("<li class='page-link'><span class='page-link' style='background-color:#009316; color:white;'>"+i+"</span></li>");
			} else {
				out.println("<li class='page-link'><a class='page-link' href='./"+ pageURL +"?cpage=" + i + "'>" + i + "</a></li>");
			}
		}
	%>
    						    						    						
    <li class="page-item">
    <%
		if (cpage == totalPage) {
			out.println("<span class='page-link' tabindex='-1'style='background-color:#00c73c; color:white;'>다음</span>");
		} else {
			out.println("<a class='page-link' href='./"+ pageURL +"?cpage=" + (cpage + 1) + "'style='background-color:#00c73c; color:white;'>다음</a>");
		}
	%>
    </li>
  </ul>
</nav> 
<!-- 페이징 end -->		