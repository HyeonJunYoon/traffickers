<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>공연 등록</title>
<link rel="stylesheet" href="css/bootstrap.css">
	<script src="js/bootstrap.js"></script>
	<link rel="stylesheet" href="css/traffickers.css">
	<script type="text/javascript" src="./js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script>
	$(document).ready(function(){
		$("input[name=subject]").css("border", "2px #ff0909 solid");
		$("select[name=view_yn]").css("border", "2px #ff0909 solid");
		$("input[name=ctime]").css("border", "2px #ff0909 solid");
		$("input[name=cplace]").css("border", "2px #ff0909 solid");
		$("textarea[name=contents]").css("border", "2px #ff0909 solid");
		$("input[name=cDate]").css("border", "2px #ff0909 solid");
		$("input[name=poster]").css("border", "2px #ff0909 solid");
		 		 
		
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
				} else{
					alert("공연 이미지를 업로드 해주세요.");
					$("input[name=poster]").focus();
					return false;
				}
				
				$("form[name=frm]").submit();
		});		
	});
</script>
</head>

<body>

<div class="row affix-row" >
	<form action="./concert_write_ok.tk" method="post" name="frm"  enctype="multipart/form-data">
	<input type="hidden" name="idx" value="0">
	<input type="hidden" name="mem_idx" value="1" alt="등록자 idx">
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
							<span class="glyphicon glyphicon-edit" style="margin-left: 8%; color:#009d06;"></span>&nbsp; 등록 페이지
							<span style="float:right; margin-right: 8%">
							<a href="concert_list.tk"><button type="button" class="btn btn-primary" style="font-size: 15px; background-color: #009d06; border-color: #009d06">목록</button></a>		  							  							  					
		  					<button type="button" class="btn btn-primary" id="submit1" style="font-size: 15px; background-color: #009d06; ">등록</button>
		  					</span>			  												
					</div>
				</div>
				<!-- 검색 end -->					

		<!-- 게시판 start -->		
		<div class='container'>
		<div class='row'>
			<div class='col-xs-12' >
				<div class='panel panel-primary' 
				style='background-color: #009d06; border-style: solid; border-width: 15px; border-radius: 20px;
				-webkit-border-after-color: #009d06; -webkit-border-before-color: #009d06;
				-webkit-border-end-color: #009d06; -webkit-border-start-color: #009d06;
				'>
					<div class='panel-heading' style="background-color: #009d06; border-color: #009d06">
						<div class='panel-title' style='height: 25px; font-size: 25px ;background-color: #009d06; text-align: right;'>
							No.*&nbsp;<span class='glyphicon glyphicon-new-window'></span>
							</div>
						<div class='panel-title' style='height: 25px; font-size: 25px ;background-color: #009d06;'>
							[제목] : <input type="text" name="subject" style="color:black;" value=""/>												
						</div>							
					</div>
					<div class='panel-body' style='background-color: white; border: solid #009d06; border-width:15px; border-radius: 30px'>
						<div class='media'>

						
						
							<div class='media-body'>
								<!-- 테이블 -->															
							<table class='table table table-bordered' style='text-align: center;'>								
								<thead>										
									<tr>
									<th class='col-md-2' style='text-align: center; background-color: #009d06 ; color: white;'>장르</th>
									<td class='col-md-4' style='text-align: center; background-color: white;'>
									<select name="ctype" style="width: 100%; margin-top: 3px">	
										<option value="0">인디</option>
										<option value="1">공연</option>
										<option value="2">락,메탈</option>
										<option value="3">힙합,랩</option>
										<option value="4">재즈</option>
										<option value="5">포크</option>
										<option value="6">내한</option>								    		
									</select>									
									</td>
									<th class='col-md-2' style='text-align: center; background-color: #009d06 ; color: white;'>노출등급</th>
									<td class='col-md-4' style='text-align: center;'>
									<select name="view_level" style="width: 100%; margin-top: 3px">
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
										<option value="10">10</option>							
									</select>
									</td>
									</tr>
								</thead>
							</table>
							<table class='table table table-bordered' style='text-align: center;'>								
								<thead>										
									<tr>
									<th class='col-md-2' style='text-align: center; background-color: #009d06 ; color: white;'>공연시간</th>
									<td class='col-md-4' style='text-align: center; background-color: white;'>
									<input type="text" name="ctime" value="" style="width: 100%;"/></td>
									<th class='col-md-2' style='text-align: center; background-color: #009d06 ; color: white;'>승인상태</th>
									<td class='col-md-4' style='text-align: center; background-color: white;'>
									<select name="view_yn" style="width: 100%; margin-top: 3px">
									<option value="0">대기</option>
									<option value="1">승인</option>
									<option value="2">보류</option>										
									</select>
									</td>								
									</tr>
								</thead>
							</table>	
							
							<!-- cdate추가 -->
							<table class='table table table-bordered' style='text-align: center;'>								
								<thead>										
									<tr>
									<th class='col-md-2' style='text-align: center; background-color: #009d06 ; color: white;'>공연날짜</th>
									<td class='col-md-10' style='text-align: center; background-color: white;'><input type="text" name="cDate" style="width: 100%" value="0000-00-00 ~ 0000-00-00"/></td>
									</tr>
								</thead>
							</table>
							<!-- cdate추가 -->
							
							<table class='table table table-bordered' style='text-align: center;'>								
								<thead>										
									<tr>
									<th class='col-md-2' style='text-align: center; background-color: #009d06 ; color: white;'>공연장소</th>
									<td class='col-md-10' style='text-align: center; background-color: white;'><input type="text" name="cplace" style="width: 100%" value=""/></td>
									</tr>
								</thead>
							</table>
							<table class='table table table-bordered' style='text-align: center;'>								
								<thead>										
									<tr>
									<th class='col-md-2' style='text-align: center; background-color: #009d06 ; color: white;'>홍보 사이트</th>
									<td class='col-md-10' style='text-align: center; background-color: white;'><input type="text" name="clink" style="width: 100%";" value=""/></td>
									</tr>
								</thead>
							</table>
							<table class='table table table-bordered' style='text-align: center;'>								
								<thead>										
									<tr>
									<th class='col-md-2' style='text-align: center; background-color: #009d06 ; color: white;'>예매 사이트</th>
									<td class='col-md-10' style='text-align: center; background-color: white;'><input type="text" name="curl" style="width: 100%;" value=""/></td>
									</tr>
								</thead>
							</table>
							<table class='table table table-bordered' style='text-align: center;'>								
								<thead>										
									<tr>
									<th class='col-md-2' style='text-align: center; background-color: #009d06 ; color: white;'>금액</th>
									<td class='col-md-10' style='text-align: center; background-color: white;'><input name="cprice" style="width: 100%;"value=""/></td>
									</tr>
								</thead>
							</table>
							<table class='table table table-bordered' style='text-align: center;'>								
								<thead>										
									<tr>
									<th class='col-md-2' style='text-align: center; background-color: #009d06 ; color: white;'>파일첨부</th>
									<td class='col-md-10' style='text-align: center; background-color: white;'>
									<input type="file" name="poster" class="board_view_input_one"></td>																	
									</tr>
								</thead>
							</table>		
							</div>								
						</div>							
					</div>				
					<!-- 인용구 삽입 -->
					<div class='panel-footer' style='background-color: #009d06;'>																											
									<h2 class='glyphicon glyphicon-tag' style='color: white;'>&nbsp;공연정보</h2>															
										<blockquote style='border-style: solid #009d06;border-image-width:15px; border-radius: 5px; font-size:120%;'>
											<textarea name="contents" class="board_editor_area2" style="width: 100%; overflow:hidden; height: 250px; text-align: left;"></textarea>					
										</blockquote>
									<h2 class='glyphicon glyphicon-tags' style='color: white'>&nbsp;기타정보</h2>																									
										<blockquote style='border-style: solid #009d06;border-image-width:15px; border-radius: 5px; font-size:120%;'>
											<textarea name="cetc" class="board_editor_area2" style="width: 100%; overflow:hidden; height: 250px; text-align: left;"></textarea>												
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
