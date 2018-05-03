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
	
	html.append("<div style='border:0px solid #000; position:relative;'>");	
	for (int i = 0; i < ConcertLists.size(); i++) {
		ConcertTO cto = ConcertLists.get(i);

		int idx			= cto.getCidx(); 			//콘서트 고유값
		String subject	= cto.getSubject();    	// 제목
		String pName	= cto.getPosterName();// 포스트 이미지 네임
		String dName	= cto.getPosterData(); // 포스트 이미지 변경 파일네임		
		String User_id	= cto.getUser_id(); 		//유저 아이디
		String wdate	= cto.getWdate(); 		//등록시간
		int ctype 		= cto.getCtype(); 		//장르 
		int view_level	= cto.getView_level(); 	// 1 ~ 10 메인 노출
		String ctime	= cto.getCtime();  		//공연시간		
		int view_yn		= cto.getView_yn(); 	// 대기 - 0, 승인 - 1, 보류 - 2
		String cplace 	= cto.getCplace(); 		//장소
		String curl		= cto.getCurl(); 			//예메사이트		
		String cprice	= cto.getCprice(); 		//가격
		String contents = cto.getContents(); 	//공연정보
		String cetc 		= cto.getCetc(); 				//공연기타

		//pk ,제목 ,작성자 ,파일네임 ,등록일자 ,장르 ,노출등급 ,공연시간 ,승인상태 ,공연장소  ,예메사이트 ,가격 ,공연정보 ,기타정보						
		
		String view_yn_text = view_yn == 0 ? "대기" : view_yn == 1 ? "승인" : "보류" ;
		String ctype_text = ctype == 0 ? "인디" : ctype == 1 ? "공연" : "보류";
		String curl_text = curl == null ? "" : curl;
		String contents_text = contents == null ? "-" : contents.replace("\r\n", "<br>"); 
		String cetc_br = cetc == null ? "-" : cetc.replace("\r\n", "<br>");
		

			html.append("<div class='container'>");
			html.append("<div class='row'>");
			html.append("	<div class='col-xs-12' >");
			html.append("		<div class='panel panel-primary' style='background-color: #337ab7; border-style: solid; border-width: 15px; border-radius: 20px'>");
			html.append("			<div class='panel-heading'>");
			html.append("				<div class='panel-title' style='height: 40px; font-size: 25px ;background-color: #337ab7; text-align: right;'>");
			html.append("					No."+idx+"&nbsp;<span class='glyphicon glyphicon-new-window'></span>");
			html.append("					</div>");
			html.append("				<div class='panel-title' style='height: 25px; font-size: 25px ;background-color: #337ab7;'>");
			html.append("					["+ctype_text+"] : "+subject+""); //제목
			html.append("					<span style='float:right;'>	");
			html.append("						<a href='concert_modify.tk?idx=" + idx + "&cpage=" + cpage+ "'><button class='btn btn-primary' style='background-color: #403179;'>수정</button></a>");									
			html.append("						<input class='allatbox' id='submit1' type='button' name='btn_js_prompt' id='btn_js_prompt' onclick='btn_js_prompt_click();' value='삭제'>");			
			html.append("					</span>	");
			html.append("				</div>");							
			html.append("			</div>");
			html.append("			<div class='panel-body' style='background-color: white; border: solid #337ab7; border-width:15px; border-radius: 30px'>");
			html.append("				<div class='media'>");
			html.append("					<div class='media-left'>");		
			html.append("							<img class='media-object' src='upload/"+dName+"' style='height:330px;width:250px ;border-style: solid ; border-image-width:15px; border-radius: 20px'>");		
			html.append("					</div>");
			html.append("					<div class='media-body'>");
									/* 테이블 */ 									
			html.append("					<table class='table table table-bordered' style='text-align: center;'>");								
			html.append("						<thead>");										
			html.append("							<tr>");
			html.append("							<th class='col-md-2' style='text-align: center; background-color: #337ab7 ; color: white;'>작성자</th>");
			html.append("							<td class='col-md-4' style='text-align: center; background-color: white;'>"+User_id+"</td>");
			html.append("							<th class='col-md-2' style='text-align: center; background-color: #337ab7 ; color: white;'>등록일자</th>");
			html.append("							<td class='col-md-4' style='text-align: center; background-color: white;'>"+wdate+"</td>");
			html.append("							</tr>");
			html.append("						</thead>");
			html.append("					</table>");								
			html.append("					<table class='table table table-bordered' style='text-align: center;'>");								
			html.append("						<thead>");										
			html.append("							<tr>");
			html.append("							<th class='col-md-2' style='text-align: center; background-color: #337ab7 ; color: white;'>장르</th>");
			html.append("							<td class='col-md-4' style='text-align: center; background-color: white;'>"+ctype_text+"</td>");
			html.append("							<th class='col-md-2' style='text-align: center; background-color: #337ab7 ; color: white;'>노출등급</th>");
			html.append("							<td class='col-md-4' style='text-align: center; background-color: white;'>"+view_level+"</td>");
			html.append("							</tr>");
			html.append("						</thead>");
			html.append("					</table>");
			html.append("					<table class='table table table-bordered' style='text-align: center;'>");								
			html.append("						<thead>");										
			html.append("							<tr>");
			html.append("							<th class='col-md-2' style='text-align: center; background-color: #337ab7 ; color: white;'>공연시간</th>");
			html.append("							<td class='col-md-4' style='text-align: center; background-color: white;'>"+ctime+"</td>");
			html.append("							<th class='col-md-2' style='text-align: center; background-color: #337ab7 ; color: white;'>승인상태</th>");
			html.append("							<td class='col-md-4' style='text-align: center; background-color: white;'>"+view_yn_text+"</td>");
			html.append("							</tr>");
			html.append("						</thead>");
			html.append("					</table>");	
			html.append("					<table class='table table table-bordered' style='text-align: center;'>");								
			html.append("						<thead>");										
			html.append("							<tr>");
			html.append("							<th class='col-md-2' style='text-align: center; background-color: #337ab7 ; color: white;'>공연장소</th>");
			html.append("							<td class='col-md-10' style='text-align: center; background-color: white;'>"+cplace+"</td>");
			html.append("							</tr>");
			html.append("						</thead>");
			html.append("					</table>");
			html.append("					<table class='table table table-bordered' style='text-align: center;'>");								
			html.append("						<thead>");										
			html.append("							<tr>");
			html.append("							<th class='col-md-2' style='text-align: center; background-color: #337ab7 ; color: white;'>예매 사이트</th>");
			html.append("							<td class='col-md-10' style='text-align: center; background-color: white;'>");
			html.append("								<a href='"+curl_text+"' style='color: blue'>");
			html.append("							"+curl_text+"</a></td>");
			html.append("							</tr>");
			html.append("						</thead>");
			html.append("					</table>");
			html.append("					<table class='table table table-bordered' style='text-align: center;'>");								
			html.append("						<thead>");										
			html.append("							<tr>");
			html.append("							<th class='col-md-2' style='text-align: center; background-color: #337ab7 ; color: white;'>금액</th>");
			html.append("							<td class='col-md-10' style='text-align: center; background-color: white;'>"+cprice+"</td>");
			html.append("							</tr>");
			html.append("						</thead>");
			html.append("					</table>");		
			html.append("					</div>");								
			html.append("				</div>");							
			html.append("			</div>");				
						/* <!-- 인용구 삽입 --> */
			html.append("			<div class='panel-footer' style='background-color: #337ab7;'>");																											
			html.append("							<h2 class='glyphicon glyphicon-tag' style='color: white;'>&nbsp;공연정보</h2>");															
			html.append("								<blockquote style='border-style: solid #337ab7;border-image-width:15px; border-radius: 5px; font-size:120%;'>");
			html.append("									"+contents_text+"<br>");			
			html.append("								</blockquote>");
			html.append("							<h2 class='glyphicon glyphicon-tags' style='color: white'>&nbsp;기타정보</h2>");																									
			html.append("								<blockquote style='border-style: solid #337ab7;border-image-width:15px; border-radius: 5px; font-size:120%;'>");
			html.append("									"+cetc_br+"<br>");
			html.append("								</blockquote>");
			html.append("			</div>");
			 						/* <!-- 인용구 end --> */
			html.append("		</div>");
			html.append("	</div>");
			html.append("</div>");
			html.append("</div>");
			html.append("<hr>");
		}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<script type="text/javascript">
	/* window.onload = function() {
		document.getElementById('submit1').onclick = function() {
			document.frm.submit();
		};		
	}; */
	
	function btn_js_prompt_click(){
			title : "게시물 삭제 알림"
    	  /* prompt(문자열, 초기값) */
    	  var name_value = prompt("게시물 삭제를 원하시면 '삭제' 를 입력해주세요.");
    	  /* if(name_value == true) else false */    
    	  console.log(name_value);
    	  if(name_value == "삭제"){
    		  document.getElementById('submit1').submit();
    		  alert("게시물이 삭제되었습니다.");
    		  
    	  } else if(name_value == null) {
    		  alert("취소되었습니다.");
    	  } else {
    		  alert("잘못 입력하셨습니다."); 
    	  } 	  
    }

</script>
<title>Insert title here</title>
	<link rel="stylesheet" href="css/bootstrap.css">
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript" src="./js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="./js/jquery-ui.js"></script>
	<!-- css -->
<style type="text/css">
.allatbox{
	display: inline-block;
	padding:6px 12px;
	margin-bottom: 0;
	font-size: 14px;
	font-weight:normal;
	line-height: 1.42857143;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;	
	touch-action: manipulation;
	cursor: pointer;
	user-select: none;		
	border: 1px solid transparent;
	border-radius: 4px;	
	
	background-color:#403179;
	color:white;
	
}


blockquote {
		background: white;
		border-left: 10px solid #403179;
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
</head>
<body>
	<div class="row affix-row">
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
							<li class="active"><a href="concert_list.tk"><img src="images/traffickers_icon3.jpg"; ></a></li>							
							<li style="background-color: black;"><a href="concert_list.tk" style="color:white; font-size: 15px">
							<span class="glyphicon glyphicon-star-empty" style="color:white;"></span>&nbsp; 공연 관리</a></li>
							<li><a href="concert_list_indie.tk" style="font-size: 15px"><span class="glyphicon glyphicon-music"></span>&nbsp;
									인디 관리 <span class="badge pull-right">42</span></a></li>
							<li><a href="memberList.tk" style="font-size: 15px"><span class="glyphicon glyphicon-user"></span>&nbsp;
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
							<span class="glyphicon glyphicon-th-list" style="margin-left: 8%; color:#337ab7;"></span>&nbsp; 공연 리스트
		  					<span style="float:right; margin-right: 8%">
		  					<input type="text" id="search" class="nav-right" style="font-size: 70%;">		  					
		  					<button class="btn btn-primary" style="font-size: 15px;">검색</button>
		  					<button type="button" class="btn btn-primary" style="font-size: 15px;" onclick="location.href">쓰기</button>
		  					</span>		
					</div>
				</div>
				<!-- 검색 end -->					

		<!-- 게시판 start -->		
		<%=html%>
		<!-- 게시판 end -->
	

			</div>				
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
		</div>
	</div>
</body>
</html>