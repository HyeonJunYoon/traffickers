<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ page import="java.util.ArrayList" %>
   <%@ page import="model1.BoardTO" %>
   <%@ page import="model1.BoardDAO" %>
 
   <%
   		BoardDAO dao = new BoardDAO();
   		ArrayList<BoardTO> lists = dao.boardList();
   		
   		StringBuffer html = new StringBuffer();
   		
   		for(BoardTO to : lists){
   			String seq = to.getSeq();
	    	String subject = to.getSubject();
	    	String writer = to.getWriter();
	    	String wdate = to.getWdate();
	    	String hit = to.getHit();
	    	int wgap = to.getWgap();
	    	
				html.append("<tr>");
				html.append("	<td>&nbsp;</td>");
				html.append("	<td>"+seq+"</td>");
				html.append("	<td class='left'>");
				html.append("<a href='view.do?seq="+seq+"'>"+subject+"</a>&nbsp;");
				if(wgap == 0){
				html.append("	<img src='./images/icon_hot.gif' alt='HOT'>");
				}
				html.append("	</td>");				
				html.append("	<td>"+writer+"</td>");
				html.append("	<td>"+wdate+"</td>");
				html.append("	<td>"+hit+"</td>");
				html.append("	<td>&nbsp;</td>");
				html.append("</tr>");
   		}
	%>
	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board_list.css">
</head>

<body>
<!-- 상단 디자인 -->
<div class="con_title">
	<h3>게시판</h3>
	<p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
	<div class="contents_sub">
		<div class="board_top">
			<div class="bold">총 <span class="txt_orange">1</span>건</div>
		</div>

		<!--게시판-->
		<div class="board">
			<table>
			<tr>
				<th width="3%">&nbsp;</th>
				<th width="5%">번호</th>
				<th>제목</th>
				<th width="10%">글쓴이</th>
				<th width="17%">등록일</th>
				<th width="5%">조회</th>
				<th width="3%">&nbsp;</th>
			</tr>
			<%= html %>
			</table>
		</div>	
		<!--//게시판-->

		<div class="align_right">
			<button type="button" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='write.do'">쓰기</button>
		</div>
	</div>
</div>
<!--//하단 디자인 -->

</body>
</html>
