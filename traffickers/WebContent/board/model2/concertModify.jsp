<%@page import="model1.ConcertDAO"%>
<%@page import="model1.ConcertTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
	System.out.println("6.jsp시작");
   		request.setCharacterEncoding("utf-8");
   
   		int idx = Integer.parseInt(request.getParameter("idx"));		
   		ConcertTO cto = new ConcertTO();
   		cto.setCidx(idx); 	
   		
   		ConcertDAO dao = new ConcertDAO();   		
   		cto = dao.ConcertModify(cto);
   		
   		String id = cto.getUser_id();//아이디*
   		int ctype = cto.getCtype();
   		String subject = cto.getSubject(); //제목*
   		int view_yn = cto.getView_yn();//등록승인상태*
   		int view_level = cto.getView_level();//메인페이지 노출 레벨*
   		String ctime = cto.getCtime();//공연시간*
   		String cplace = cto.getCplace();//장소*
   		String cprice = cto.getCprice();//금액  * 		
   		String clink = cto.getClink(); //공연 홍보사이트
   		String curl = cto.getCurl(); //예메사이트*
   		String contents = cto.getContents(); //내용*
		String cetc = cto.getCetc(); //기타사항*
		String fileName = cto.getPosterName(); //원본파일명*
		String fileDate = cto.getPosterData(); //서버 보유파일명*	
		
		System.out.println("url 가져와 : "+curl);
		
   %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>공연 등록</title>
<link rel="stylesheet" href="css/bootstrap.css">
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript" src="./js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script>
	$(document).ready(function(){
		$("input[name=subject]").css("border", "2px #3822ff solid");
		$("select[name=view_yn]").css("border", "2px #3822ff solid");
		$("input[name=ctime]").css("border", "2px #3822ff solid");
		$("input[name=cplace]").css("border", "2px #3822ff solid");
		$("textarea[name=contents]").css("border", "2px #3822ff solid");
		/* $("input[name=poster]").css("border", "2px #3822ff solid"); */
		
		
		$("#submit1").on("click", function(){
				if($("input[name=subject]").val() == ""){
					alert("제목을 입력해주세요");
					$("input[name=subject]").focus();
					return false;
				}
								
				if($("input[name=ctime]").val() == ""){
					alert("공연 시간을 입력해주세요");
					$("input[name=ctime]").focus();
					return false;
				}
				
				if($("input[name=cplace]").val() == ""){
					alert("공연 장소를 입력해주세요");
					$("input[name=cplace]").focus();
					return false;
				}	
				
				if($("textarea[name=contents]").val() == ""){
					alert("내용을 입력해주세요");
					$("textarea[name=contents]").focus();
					return false;
				}
				
				if($("input[name=poster]").val() != ""){
					var ext = $("input[name=poster]").val().split('.').pop().toLowerCase();										
					if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1){
						alert("이미지 파일만 업로드가 가능합니다.");
						$("input[name=poster]").focus();
						return false;						
					}
				}/* else{
					alert("공연 이미지를 업로드 해주세요.");
					$("input[name=poster]").focus();
					return false;
				} */
				
				$("form[name=frm]").submit();
		});		
	});
</script>
</head>

<body>
<!-- css -->
<style type="text/css">
blockquote {
		background: white;
		border-left: 10px solid #d61515;
		margin: auto;
		padding: auto;
		quotes: "\201C" "\201D" "\2018" "\2019";
			}
/* make sidebar nav vertical */
@media ( min-width : 768px) {
	.affix-content .container {
		width: 700px;
	}
	html, body {		
		background-color: #f8f8f8;
		height: 100%;
		/* overflow: hidden; */
	}
	.affix-content .container .page-header {
		margin-top: 0;
	}
	.sidebar-nav {
		position: fixed;
		width: 100%;
	}
	.affix-sidebar {
		padding-right: 0;
		font-size: small;
		padding-left: 0;
		
	}
	.affix-row, .affix-container, .affix-content {
		height: 100%;
		margin-left: 0;
		margin-right: 0;
	}
	.affix-content {
		/* background-image: url("images/background_image00.jpg"); */
		/* background-size: 90%; */	
		 background-color: white;
	}
	.sidebar-nav .navbar .navbar-collapse {
		padding: 0;
		max-height: none;
	}
	.sidebar-nav .navbar {
		border-radius: 0;
		margin-bottom: 0;
		border: 0;
	}
	.sidebar-nav .navbar ul {
		float: none;
		display: block;
	}
	.sidebar-nav .navbar li {
		float: none;
		display: block;
	}
	.sidebar-nav .navbar li a {
		padding-top: 12px;
		padding-bottom: 12px;
	}
}

@media ( min-width : 769px) {
	.affix-content .container {
		width: 600px;
	}
	.affix-content .container .page-header {
		margin-top: 0;
	}
	img{
		margin:auto;
		width: 22%;
	}
}

@media ( min-width : 992px) {
	.affix-content .container {
		width: 900px;
	}
	.affix-content .container .page-header {
		margin-top: 0;
	}
	img{
		margin:auto;
		width: 14%;
	}
}

@media ( min-width : 1220px) {
	.affix-row {
		/* overflow: hidden; */
	}
	.affix-content {
		overflow: auto;
	}
	.affix-content .container {
		width: 90%;
	}
	.affix-content .container .page-header {
		margin-top: 0;
	}
	.affix-content {
		padding-right: 30px;
		padding-left: 30px;
	}
	.affix-title {
		border-bottom: 1px solid #ecf0f1;
		padding-bottom: 10px;
	}
	.navbar-nav {
		margin: 0;
	}
	.navbar-collapse {
		padding: 0;
	}
	.sidebar-nav .navbar li a:hover {
		background-color: #428bca;
		color: white;
	}
	.sidebar-nav .navbar li a>.caret {
		margin-top: 8px;
	}
	img{
		margin:auto;
		width: 14%;
	}
}
</style>
<!-- css end -->
<div class="row affix-row" >
	<form action="./concert_modify_ok.tk" method="post" name="frm"  enctype="multipart/form-data">
	<input type="hidden" name="idx" value="<%=idx %>">
		<div class="col-sm-3 col-md-2 affix-sidebar">
			<div class="sidebar-nav">
				<div class="navbar navbar-default" role="navigation">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".sidebar-navbar-collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					<div class="navbar-collapse collapse sidebar-navbar-collapse">
						<ul class="nav navbar-nav" id="sidenav01">
							<li class="active"><a href="concert_list.tk"><img src="images/traffickers_icon3.jpg"></a></li>							
							<li><a href="concert_list.tk" style="font-size: 15px">
							<span class="glyphicon glyphicon-star-empty"></span>&nbsp; 공연 관리</a></li>
							<li><a href="concert_list_indie.tk" style="font-size: 15px"><span class="glyphicon glyphicon-music"></span>&nbsp;
									인디 관리 <span class="badge pull-right">42</span></a></li>
							<li><a href="#" style="font-size: 15px"><span class="glyphicon glyphicon-user"></span>&nbsp;
									회원 관리</a></li>
						</ul>
					</div>
					<!--/.nav-collapse -->
				</div>
			</div>
		</div>
		
		<div class="col-sm-9 col-md-10 affix-content">
			<div class="container">
				<div class="page-header">
					<div style="font-size: 30px;margin-top: 20px">						
						<!-- 검색 -->						
							<span class="glyphicon glyphicon-edit" style="margin-left: 8%; color:#d61515;"></span>&nbsp; 수정 페이지
							<span style="float:right; margin-right: 8%">
							<a href="concert_list.tk"><button type="button" class="btn btn-primary" style="font-size: 15px; background-color: #d61515; border-color: #d61515">목록</button></a>		  							  							  					
		  					<button type="button" class="btn btn-primary" id="submit1" style="font-size: 15px; background-color: #d61515; ">등록</button>
		  					</span>			  												
					</div>
				</div>
				<!-- 검색 end -->					

		<!-- 게시판 start -->		
		<div class='container'>
		<div class='row'>
			<div class='col-xs-12' >
				<div class='panel panel-primary' 
				style='background-color: #d61515; border-style: solid; border-width: 15px; border-radius: 20px;
				-webkit-border-after-color: #d61515; -webkit-border-before-color: #d61515;
				-webkit-border-end-color: #d61515; -webkit-border-start-color: #d61515;
				'>
					<div class='panel-heading' style="background-color: #d61515; border-color: #d61515">
						<div class='panel-title' style='height: 25px; font-size: 25px ;background-color: #d61515; text-align: right;'>
							No.<%=idx %>&nbsp;<span class='glyphicon glyphicon-new-window'></span>
							</div>
						<div class='panel-title' style='height: 25px; font-size: 25px ;background-color: #d61515;'>
							[제목] : <input type="text" name="subject" style="color:black;" value="<%=subject%>"/>												
						</div>							
					</div>
					<div class='panel-body' style='background-color: white; border: solid #d61515; border-width:15px; border-radius: 30px'>
						<div class='media'>
							<div class='media-left'>		
								<img class='media-object' src='upload/<%=fileName%>' style='height:330px;width:250px ;border-style: solid ; border-image-width:15px; border-radius: 20px'>
								<table class='table table table-bordered' style='text-align: center; margin-top: 10%'>
								<thead>
									<tr>
										<th style='text-align: center; background-color: #d61515 ; color: white; border-color:#d61515 '>등록된 이미지</th>																																	
									</tr>
								</thead>
								<thead>
									<tr>
										<th style='text-align: center;'><%=fileName %></th>																																	
									</tr>
								</thead>
								</table>		
							</div>
						
						
							<div class='media-body'>
								<!-- 테이블 -->															
							<table class='table table table-bordered' style='text-align: center;'>								
								<thead>										
									<tr>
									<th class='col-md-2' style='text-align: center; background-color: #d61515 ; color: white;'>장르</th>
									<td class='col-md-4' style='text-align: center; background-color: white;'>
									<select name="ctype" style="width: 100%; margin-top: 3px">	
								    <%
									if(ctype == 0){
										%>
										<option selected value="0">인디</option>
										<option value="1">발라드</option>	
										<option value="2">락,메탈</option>
										<option value="3">힙합,랩</option>
										<option value="4">재즈</option>
										<option value="5">포크</option>
										<option value="6">내한</option>									
										<%
									}else if(ctype == 1) {
										%>
										<option value="0">인디</option>
										<option selected value="1">발라드</option>
										<option value="2">락,메탈</option>
										<option value="3">힙합,랩</option>
										<option value="4">재즈</option>
										<option value="5">포크</option>
										<option value="6">내한</option>
										<%
									}else if(ctype == 2) {							
										%>
										<option value="0">인디</option>
										<option value="1">발라드</option>
										<option selected value="2">락,메탈</option>
										<option value="3">힙합,랩</option>
										<option value="4">재즈</option>
										<option value="5">포크</option>
										<option value="6">내한</option>
										<%
									}else if(ctype == 3) {							
										%>
										<option value="0">인디</option>
										<option value="1">발라드</option>
										<option value="2">락,메탈</option>
										<option selected value="3">힙합,랩</option>
										<option value="4">재즈</option>
										<option value="5">포크</option>
										<option value="6">내한</option>
										<%
									}else if(ctype == 4) {							
										%>
										<option value="0">인디</option>
										<option value="1">발라드</option>
										<option value="2">락,메탈</option>
										<option value="3">힙합,랩</option>
										<option selected value="4">재즈</option>
										<option value="5">포크</option>
										<option value="6">내한</option>
										<%
									}else if(ctype == 5) {							
										%>
										<option value="0">인디</option>
										<option value="1">발라드</option>
										<option value="2">락,메탈</option>
										<option value="3">힙합,랩</option>
										<option value="4">재즈</option>
										<option selected value="5">포크</option>
										<option value="6">내한</option>
										<%
									}else if(ctype == 6) {							
										%>
										<option value="0">인디</option>
										<option value="1">발라드</option>
										<option value="2">락,메탈</option>
										<option value="3">힙합,랩</option>
										<option value="4">재즈</option>
										<option value="5">포크</option>
										<option selected value="6">내한</option>
										<%
									}					
										%>
										
									</select>
									
									</td>
									<th class='col-md-2' style='text-align: center; background-color: #d61515 ; color: white;'>노출등급</th>
									<td class='col-md-4' style='text-align: center;'>
									<select name="view_level" style="width: 100%; margin-top: 3px">
									<%
						if(view_level == 0) {						
							%>
							<option selected value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<%
						} else if (view_level == 1) {
							%>
							<option value="0">0</option>
							<option selected value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<%
						} else if (view_level == 2) {
							%>
							<option value="0">0</option>
							<option value="1">1</option>
							<option selected value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<%
						} else if (view_level == 3) {
							%>
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option selected value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<%
						} else if (view_level == 4) {
							%>
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option selected value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
 							<%
						} else if (view_level == 5) {
							%>
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option selected value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<%
						} else if (view_level == 6) {
							%>
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option selected value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<%
						} else if (view_level == 7) {
							%>
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option selected value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<%
						} else if (view_level == 8) {
							%>
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option selected value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<%
						} else if (view_level == 9) {
							%>
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option selected value="9">9</option>
							<option value="10">10</option>
							<%
						} else if (view_level == 10) {
							%>
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option selected value="10">10</option>
							<%
						}						
						%>						
						</select>
									</td>
									</tr>
								</thead>
							</table>
							<table class='table table table-bordered' style='text-align: center;'>								
								<thead>										
									<tr>
									<th class='col-md-2' style='text-align: center; background-color: #d61515 ; color: white;'>공연시간</th>
									<td class='col-md-4' style='text-align: center; background-color: white;'><input type="text" name="ctime" value="<%=ctime%>"/></td>
									<th class='col-md-2' style='text-align: center; background-color: #d61515 ; color: white;'>승인상태</th>
									<td class='col-md-4' style='text-align: center; background-color: white;'>
									<select name="view_yn" style="width: 100%; margin-top: 3px">	
					    <%
						if(view_yn == 0){
							%>
							<option selected value="0">대기</option>
							<option value="1">승인</option>
							<option value="2">보류</option>
							<%
						}else if(view_yn == 1) {
							%>
							<option value="0">대기</option>
							<option selected value="1">승인</option>
							<option value="2">보류</option>
							<%
						}else if(view_yn == 2) {
							%>
							<option value="0">대기</option>
							<option value="1">승인</option>
							<option selected value="2">보류</option>
							<%
						}							
							%>						
						</select>
									</td>								
									</tr>
								</thead>
							</table>	
							<table class='table table table-bordered' style='text-align: center;'>								
								<thead>										
									<tr>
									<th class='col-md-2' style='text-align: center; background-color: #d61515 ; color: white;'>공연장소</th>
									<td class='col-md-10' style='text-align: center; background-color: white;'><input type="text" name="cplace" style="width: 100%" value="<%=cplace%>"/></td>
									</tr>
								</thead>
							</table>
							<table class='table table table-bordered' style='text-align: center;'>								
								<thead>										
									<tr>
									<th class='col-md-2' style='text-align: center; background-color: #d61515 ; color: white;'>홍보 사이트</th>
									<td class='col-md-10' style='text-align: center; background-color: white;'><input type="text" name="clink" style="width: 100%";" value="<%=clink%>"/></td>
									</tr>
								</thead>
							</table>
							<table class='table table table-bordered' style='text-align: center;'>								
								<thead>										
									<tr>
									<th class='col-md-2' style='text-align: center; background-color: #d61515 ; color: white;'>예매 사이트</th>
									<td class='col-md-10' style='text-align: center; background-color: white;'><input type="text" name="curl" style="width: 100%;" value="<%=curl%>"/></td>
									</tr>
								</thead>
							</table>
							<table class='table table table-bordered' style='text-align: center;'>								
								<thead>										
									<tr>
									<th class='col-md-2' style='text-align: center; background-color: #d61515 ; color: white;'>금액</th>
									<td class='col-md-10' style='text-align: center; background-color: white;'><input name="cprice" style="width: 100%;"value="<%=cprice%>"/></td>
									</tr>
								</thead>
							</table>
							<table class='table table table-bordered' style='text-align: center;'>								
								<thead>										
									<tr>
									<th class='col-md-2' style='text-align: center; background-color: #d61515 ; color: white;'>파일첨부</th>
									<td class='col-md-10' style='text-align: center; background-color: white;'>
									<input type="file" name="poster" class="board_view_input_one"></td>																	
									</tr>
								</thead>
							</table>		
							</div>								
						</div>							
					</div>				
					<!-- 인용구 삽입 -->
					<div class='panel-footer' style='background-color: #d61515;'>																											
									<h2 class='glyphicon glyphicon-tag' style='color: white;'>&nbsp;공연정보</h2>															
										<blockquote style='border-style: solid #d61515;border-image-width:15px; border-radius: 5px; font-size:120%;'>
											<textarea name="contents" class="board_editor_area2" style="width: 100%; overflow:hidden; height: 250px; text-align: left;"><%=contents %></textarea>					
										</blockquote>
									<h2 class='glyphicon glyphicon-tags' style='color: white'>&nbsp;기타정보</h2>																									
										<blockquote style='border-style: solid #d61515;border-image-width:15px; border-radius: 5px; font-size:120%;'>
											<textarea name="cetc" class="board_editor_area2" style="width: 100%; overflow:hidden; height: 250px; text-align: left;"><%=cetc %></textarea>												
										</blockquote>
					</div>
		 						<!-- 인용구 end-->
				</div>
			</div>
		</div>
		</div>
		<hr>
		<!-- 게시판 end -->
	

			</div>				
	</div>
	</form>
</div>

</body>
</html>
