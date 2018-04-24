<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>공연 등록</title>
<link rel="stylesheet" type="text/css" href="./css/board_write.css">
<script src="./js/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function(){
		$("input[name=subject]").css("border", "1px #ff0000 solid");
		$("select[name=view_yn]").css("border", "1px #ff0000 solid");
		$("input[name=ctime]").css("border", "1px #ff0000 solid");
		$("input[name=cplace]").css("border", "1px #ff0000 solid");
		$("textarea[name=contents]").css("border", "1px #ff0000 solid");
		$("input[name=poster]").css("border", "1px #ff0000 solid");
		
		
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
				}else{
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
<!-- 상단 디자인 -->
<div class="con_title">
	<h3>공연 등록</h3>
	<p>HOME &gt; <strong>공연등록</strong></p>
</div>
<div class="con_txt">
	<form action="./concert_write_ok.tk" method="post" name="frm"  enctype="multipart/form-data">
	<input type="hidden" name="ctype" value="0">
	<input type="hidden" name="mem_idx" value="1" alt="등록자 idx">
		<div class="contents_sub">	
			<!--게시판-->
			<div class="board_write">
				<table>
				<tr>
					<th>제목</th>
					<td colspan="3"><input type="text" name="subject" value="" class="board_view_input_one" /></td>
				</tr>
				<tr>
					<th>승인</th>
					<td>
						<select name="view_yn">
						<option value="0">대기</option>
						<option value="1">승인</option>
						<option value="2">보류</option>
						</select>
					</td>
					<th>노출</th>
					<td>
						<select name="view_level">
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
				<tr>
					<th>공연시간</th>
					<td><input type="text" name="ctime" value="" class="board_view_input_text" /></td>
					<th>장소</th>
					<td><input type="text" name="cplace" value="" class="board_view_input_text" /></td>					
				</tr>
				<tr>
					<th>공연 금액</th>
					<td colspan="3"><textarea name="cprice" class="board_editor_area2"></textarea></td>
				</tr>
				<tr>
					<th>공연 홍보사이트</th>
					<td colspan="3"><input type="text" name="clink" class="board_view_input_one" /></td>
				</tr>
				<tr>
					<th>예매사이트</th>
					<td colspan="3"><input type="text" name="curl" class="board_view_input_one" /></td>
				</tr>								
				<tr>
					<th>내용</th>
					<td colspan="3"><textarea name="contents" class="board_editor_area"></textarea></td>
				</tr>
				<tr>
					<th>기타사항</th>
					<td colspan="3"><textarea name="cetc" class="board_editor_area2"></textarea></td>
				</tr>				
				<tr>
					<th>공연 포스터 이미지</th>
					<td colspan="3"><input type="file" name="poster" class="board_view_input_one"></td>
				</tr>			
				</table>
				
			</div>
			
			<div class="btn_area">
				<div class="align_left">
					<button type="button" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_list1.jsp'">목록</button>
				</div>
				<div class="align_right">
					<button type="button" id="submit1" class="btn_write btn_txt01" style="cursor: pointer;">등록</button>
				</div>
			</div>
			<!--//게시판-->
		</div>
	</form>
</div>
<!-- 하단 디자인 -->

</body>
</html>
