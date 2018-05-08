<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--페이지넘버-->
	<div class="paginate_regular">
		<div class="board_pagetab" style="text-align:center">
			<%
			int startBlock = Integer.parseInt(request.getParameter("startBlock"));
			int endBlock = Integer.parseInt(request.getParameter("endBlock"));
			int totalPage = Integer.parseInt(request.getParameter("totalPage"));
			int cpage = Integer.parseInt(request.getParameter("cpage"));
			int blockPerPage = Integer.parseInt(request.getParameter("blockPerPage"));

				if (endBlock >= totalPage) {
					endBlock = totalPage;
				}
				if (startBlock == 1) {
					out.println("<span class='off'>&lt;&lt;</span>");
				} else {
					out.println("<span class='on'><a href='./concert_list.tk?cpage=" + (startBlock - blockPerPage)
							+ "'>&lt;&lt;</a></span>");
				}
			%>
			&nbsp;
			<%
				if (cpage == 1) {
					out.println("<span class='on'>&lt;</span>");
				} else {
					out.println("<span class='on'><a href='./concert_list.tk?cpage=" + (cpage - 1) + "'>&lt;</a></span>");
				}
			%>
			&nbsp;&nbsp;
			<%
				for (int i = startBlock; i <= endBlock; i++) {
					if (cpage == i) {
						out.println("<span class='on'>[" + i + "]</span>");
					} else {
						out.println("<span class='off'><a href='./concert_list.tk?cpage=" + i + "'>" + i + "</a></span>");
					}
				}
			%>
			&nbsp;&nbsp;
			<%
				if (cpage == totalPage) {
					out.println("<span class='on'>&gt;</span>");
				} else {
					out.println("<span class='on'><a href='./concert_list.tk?cpage=" + (cpage + 1) + "'>&gt;</a></span>");
				}
			%>
			<%
				if (endBlock == totalPage) {
					out.println("<span class='off'>&gt;&gt;</span>");
				} else {
					out.println("<span class='on'><a href='./concert_list.tk?cpage=" + (startBlock + blockPerPage)
							+ "'>&gt;&gt;</a></span>");
				}
			%>
			&nbsp;
		</div>
	</div>
	<!--//페이지넘버-->