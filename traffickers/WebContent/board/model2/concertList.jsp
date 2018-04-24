<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ page import="java.util.ArrayList" %>
   <%@ page import="model1.ListTO" %>
   <%@ page import="model1.ConcertTO" %>
   
 
   <%
	ListTO listTO = (ListTO)request.getAttribute("lists");

	int recordPerPage = listTO.getTotalRecord();
	int totalPage = listTO.getTotalPage();
	int blockPerPage = listTO.getBlockPerPage();
	
	StringBuffer html = new StringBuffer();

	ArrayList<ConcertTO> ConcertLists = listTO.getConcertlists();
	int cpage = listTO.getCpage();
	
	html.append("<div style='border:1px solid #000; position:relative;'>");	
	for (int i = 0; i < ConcertLists.size(); i++) {
		ConcertTO cto = ConcertLists.get(i);

		int idx 			= cto.getCidx();
		int ctype 		= cto.getCtype();
		int mem_idx 	= cto.getMem_idx();
		String User_id	= cto.getUser_id();
		int view_yn		= cto.getView_yn();
		int view_level	= cto.getView_level();
		String subject	= cto.getSubject();
		String pName	= cto.getPosterName();
		String dName	= cto.getPosterData();
		String ctime	= cto.getCtime();
		String cprice	= cto.getCprice();
		String cplace 	= cto.getCplace();
		String wdate	= cto.getWdate();

		String view_yn_text = view_yn == 0 ? "대기" : view_yn == 1 ? "승인" : "보류" ;
		
		//int wgap = to.getWgap();
		html.append("<div style='float:left; position:relative;'>");
		html.append("<table width='100%'>");
		html.append("<tr>");
		html.append("<td class='listStyle1'>");
		html.append("				<div class='boardThumb'>");
		if (!pName.equals("")) {
			html.append("					<a href='view.do?seq=" + idx + "&cpage=" + cpage
					+ "'><img src='./upload/" + dName + "' border='0' class='concert_admin_img'' /></a>");
		} else {
			html.append("						<img src='./images/noimage.jpg' border='0' width='100%' />");
		}
		html.append("		</div>");
		html.append("</td>");
		html.append("<td class='listStyle2'>");
		html.append("		<div class='boardItem' style='float:left; width:100%; border:1px solid #ccc;'>");
		html.append("			<table border='1' cellpadding='0' cellspacing='0' width='100%'>");
		html.append("				<tr><td colspan='4'><p style='text-align:left;'><strong>" + subject + "</strong></p></td></tr>");		
		html.append("				<tr><td width='20%'>노출</td><td width='20%'>메인노출</td><td width='20%'>등록자</td><td width='20%'>등록일자</td></tr>");
		html.append(" 				<tr><td>"+view_yn_text+"</td><td>"+view_level+"</td><td>"+User_id+"</td><td>"+wdate+"</td>");
		html.append("			</table>");
		html.append("		</div>");
		html.append("</td>");
		html.append("</tr>");	
		html.append("</table");
	}
	html.append("</div>");	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<script type="text/javascript">
	window.onload = function() {
		document.getElementById('submit1').onclick = function() {

			document.frm.submit();
		};
	};
</script>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board_list.css">
<style type="text/css">
<!--
.board_pagetab {
	text-align: center;
}

.board_pagetab a {
	text-decoration: none;
	font: 12px verdana;
	color: #000;
	padding: 0 3px 0 3px;
}

.board_pagetab a:hover {
	text-decoration: underline;
	background-color: #f2f2f2;
}

.on a {
	font-weight: bold;
}
-->
</style>
</head>

<body>
	<!-- 상단 디자인 -->
	<form action="write.do" method="post" name="frm">
		<input type="hidden" name="cpage" value="<%=cpage%>" />
		<div class="contents1">
			<div class="con_title">
				<p style="margin: 0px; text-align: right">
					<img style="vertical-align: middle" alt=""
						src="./images/home_icon.gif" /> &gt; 공연 &gt; <strong>공연리스트</strong>
				</p>
			</div>
			<div class="contents_sub">
				<div class="board_top">
					<div class="bold">
						<p>
							총 <span class="txt_orange"><%=recordPerPage %></span>건
						</p>
					</div>
				</div>

				<!--게시판-->
				<table class="board_list">
					<tr>
						<%=html%>
					</tr>
				</table>
				<!--//게시판-->

				<div class="align_right">
					<button type="button" id="submit1" class="btn_write btn_txt01"
						style="cursor: pointer;" onclick="location.href='concert_write.tk'">쓰기</button>
				</div>
	</form>
	<!--페이지넘버-->
	<div class="paginate_regular">
		<div class="board_pagetab">
			<%
				int startBlock = listTO.getStartBlock();
				int endBlock = listTO.getEndBlock();
				if (endBlock >= totalPage) {
					endBlock = totalPage;
				}
				if (startBlock == 1) {
					out.println("<span class='off'>&lt;&lt;</span>");
				} else {
					out.println("<span class='on'><a href='./list.do?cpage=" + (startBlock - blockPerPage)
							+ "'>&lt;&lt;</a></span>");
				}
			%>
			&nbsp;
			<%
				if (cpage == 1) {
					out.println("<span class='on'>&lt;</span>");
				} else {
					out.println("<span class='on'><a href='./list.do?cpage=" + (cpage - 1) + "'>&lt;</a></span>");
				}
			%>
			&nbsp;&nbsp;
			<%
				for (int i = startBlock; i <= endBlock; i++) {
					if (cpage == i) {
						out.println("<span class='on'>[" + i + "]</span>");
					} else {
						out.println("<span class='off'><a href='./list.do?cpage=" + i + "'>" + i + "</a></span>");
					}
				}
			%>
			&nbsp;&nbsp;
			<%
				if (cpage == totalPage) {
					out.println("<span class='on'>&gt;</span>");
				} else {
					out.println("<span class='on'><a href='./list.do?cpage=" + (cpage + 1) + "'>&gt;</a></span>");
				}
			%>
			<%
				if (endBlock == totalPage) {
					out.println("<span class='off'>&gt;&gt;</span>");
				} else {
					out.println("<span class='on'><a href='./list.do?cpage=" + (startBlock + blockPerPage)
							+ "'>&gt;&gt;</a></span>");
				}
			%>
			&nbsp;
		</div>
	</div>
	<!--//페이지넘버-->
	</div>
	</div>
	<!--//하단 디자인 -->

</body>
</html>
   		