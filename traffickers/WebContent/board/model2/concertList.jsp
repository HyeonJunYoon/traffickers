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
	String pageURL = listTO.getPageURL();
	
	StringBuffer html = new StringBuffer();

	ArrayList<ConcertTO> ConcertLists = listTO.getConcertlists();
	int cpage = listTO.getCpage();
	
	String pageingUrl = "/form/pageing.jsp";
	int startBlock = listTO.getStartBlock();
	int endBlock = listTO.getEndBlock();
	
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
		String ctype_text ="";
		if(ctype == 0 ){
			ctype_text = "인디";
		}else if(ctype == 1){
			ctype_text = "발라드";
		}else if(ctype == 2){
			ctype_text = "락,메탈";
		}else if(ctype == 3){
			ctype_text = "힙합,랩";
		}else if(ctype == 4){
			ctype_text = "재즈";
		}else if(ctype == 5){
			ctype_text = "포크";
		}else if(ctype == 6){
			ctype_text = "내한";			
		}
		
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
			html.append("						<input class='allatbox' id='submit1' type='button' name='btn_js_prompt' id='btn_js_prompt' onclick='btn_js_prompt_click("+idx+");' value='삭제'>");			
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
<title>공연리스트</title>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/traffickers.css">
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript" src="./js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="./js/jquery-ui.js"></script>
	
	<script type="text/javascript">
	function btn_js_prompt_click(num){
			title : "게시물 삭제 알림"
    	  /* prompt(문자열, 초기값) */
    	  var name_value = prompt("게시물 삭제를 원하시면 '삭제' 를 입력해주세요.");
    	  /* if(name_value == true) else false */    
    	  //console.log(name_value);
    	  if(name_value == "삭제"){
    		  //document.getElementById('submit1').submit();
    		  location.href="concert_delete_ok.tk?idx="+num;
    		  
    	  } else if(name_value == null) {
    		  alert("취소되었습니다.");
    	  } else {
    		  alert("잘못 입력하셨습니다."); 
    	  } 	  
    }
</script>

</head>
<body>
	<div class="row affix-row">
		<%@ include file="/form/menu.jsp" %>
		
		<div class="col-sm-9 col-md-10 affix-content">
			<div class="container">
			<%@ include file="/form/search.jsp" %>

				<!-- 검색 end -->					

		<!-- 게시판 start -->		
		<%=html%>
		<!-- 게시판 end -->
	

			</div>
			
			<jsp:include page="<%=pageingUrl%>" flush="false">		
				<jsp:param name="startBlock" value="<%=startBlock%>" />
				<jsp:param name="endBlock" value="<%=endBlock%>" />
				<jsp:param name="totalPage" value="<%=totalPage%>" />
				<jsp:param name="cpage" value="<%=cpage%>" />
				<jsp:param name="blockPerPage" value="<%=blockPerPage%>" />
				<jsp:param name="pageURL" value="<%=pageURL%>" />
			</jsp:include>
		</div>
	</div>
</body>
</html>