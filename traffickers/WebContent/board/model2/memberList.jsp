<%@page import="model1.MemberTO"%>

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

	ArrayList<MemberTO> Memberlists = listTO.getMemberlists();
	int cpage = listTO.getCpage();
	
	String pageingUrl = "/form/pageing.jsp";
	int startBlock = listTO.getStartBlock();
	int endBlock = listTO.getEndBlock();	
	
	html.append("<div style='border:0px solid #000; position:relative;'>");	
	
	for (int i = 0; i < Memberlists.size(); i++) {
		MemberTO mto = Memberlists.get(i);

		int idx				= mto.getUserIdx();
		String id			= mto.getUserID();
		String nickName		= mto.getNickName();
		String birth		= mto.getBirth();
		String sex			= mto.getSex() == 0 ? "남" : "여";
		String mtype		= mto.getJoinType() == 1 ? "kakao" :  mto.getJoinType() == 2 ? "fackbook" : "일반";
		String wdate		= mto.getJoinDate();
		int State			= mto.getStatus();
		String StateTxt	= mto.getStatus() == 0 ? "정상" : "차단";	

		String date = wdate.substring(0, 10);
		
			html.append("						<thead>");										
			html.append("							<tr>");
			html.append("							<th class='col-md-1' style='text-align: center; background-color: white ; color: black;'>"+ idx +"</th>");
			html.append("							<th class='col-md-1' style='text-align: center; background-color: white ; color: black;'>"+id+"</th>");
			html.append("							<th class='col-md-1' style='text-align: center; background-color: white ; color: black;'>"+nickName+"</th>");
			html.append("							<th class='col-md-1' style='text-align: center; background-color: white ; color: black;'>"+birth+"</th>");
			html.append("							<th class='col-md-1' style='text-align: center; background-color: white ; color: black;'>"+sex+"</th>");
			html.append("							<th class='col-md-1' style='text-align: center; background-color: white ; color: black;'>"+mtype+"</th>");
			html.append("							<th class='col-md-1' style='text-align: center; background-color: white ; color: black;'>"+date+"</th>");
			html.append("							<th class='col-md-1' style='text-align: center; background-color: white ; color: black;'>");
			html.append("						    <input class='allatbox'  value='"+StateTxt+"' id='submit1' type='button' name='btn_js_prompt' id='btn_js_prompt' onclick='memberChange_click("+idx+","+State+","+State+")'");	
			html.append(" 							</th>");
			html.append("							</tr>");
			html.append("						</thead>");
		}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<title>회원 리스트</title>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/traffickers.css">
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript" src="./js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="./js/jquery-ui.js"></script>

<script type="text/javascript">
	/* window.onload = function() {
		document.getElementById('submit1').onclick = function() {
			document.frm.submit();
		};		
	}; */
	
	function memberChange_click(num,Txt,state){ 
		console.log("실행중")
		var sTxt = Txt == 0 ? "정상" : "차단"
	  	var check = confirm("현재 '" + sTxt + "' 상태입니다."+ "\n" +"변경하시겠습니까?")
	  	console.log(check)
		if(check == true){
			location.href="memberStatusChange.tk?idx="+num+"&s="+state;
		} else if(check == false) {
			alert("취소되었습니다.");
		}
    }

</script>
<style type="text/css">
.table > thead > tr > th {
	vertical-align: middle;
}
.panel-primary {
	border-color: #00c73c;
}
.panel-primary > .panel-heading{
	background-color: #00c73c;
	border-color: #00c73c;
}
.allatbox{
	background-color: #009316;
}
.pagination > li > a, .pagination > li > span{
	color:#00c73c;
}

</style>
</head>
<body>
	<div class="row affix-row">
		<%@ include file="/form/menu.jsp" %>
		
		<div class="col-sm-9 col-md-10 affix-content" style="padding-right: 0px; padding-left: 0px;">
			<div class="container">
				<%@ include file="/form/search.jsp" %>
				<!-- 검색 end -->					

		<!-- 게시판 start -->		
			<div class='container'>
			<div class='row'>
				<div class='col-xs-12' >
					<div class='panel panel-primary' style='background-color: #00c73c; border-style: solid; border-width: 15px; border-radius: 20px'>
						<div class='panel-heading' style='padding:0px;'>
							<div class='panel-title' style='font-size: 5px ;background-color: #00c73c;'>						
							</div>							
						</div>
						<div class='panel-body' style='background-color: white; border: solid #00c73c; border-width:15px; border-radius: 30px'>
							<div class='media'>			
								<div class='media-body'>							
								<table class='table table table-bordered' style='text-align: center; margin-bottom: 0px'>								
									<thead>										
										<tr>
										<th class='col-md-1' style='text-align: center; background-color: #00c73c ; color: white;'>번호</th>
										<th class='col-md-1' style='text-align: center; background-color: #00c73c ; color: white;'>ID</th>
										<th class='col-md-1' style='text-align: center; background-color: #00c73c ; color: white;'>닉네임</th>
										<th class='col-md-1' style='text-align: center; background-color: #00c73c ; color: white;'>생년월일</th>
										<th class='col-md-1' style='text-align: center; background-color: #00c73c ; color: white;'>성별</th>
										<th class='col-md-1' style='text-align: center; background-color: #00c73c ; color: white;'>연동정보</th>
										<th class='col-md-1' style='text-align: center; background-color: #00c73c ; color: white;'>가입일자</th>
										<th class='col-md-1' style='text-align: center; background-color: #00c73c ; color: white;'>차단여부</th>
										</tr>
									</thead>
		
									<%=html%>
									</table>				
								</div>								
							</div>							
						</div>				
					</div>
				</div>
			</div>
			</div>
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