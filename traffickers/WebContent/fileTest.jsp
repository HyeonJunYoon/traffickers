<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<title>Insert title here</title>
<style>
input[type="text"] {width:300px;}
</style>
</head>
<body>
<form method="post" action="./indie_write.app" enctype="multipart/form-data">
<table border='1' cellpadding='0' cellspacing='0' width='80%'>
<tr>
	<td width='20%'>회원번호</td>
	<td width='80%'><input type="text" name="mem_idx" value="1"></td>
</tr>
<tr>
	<td>제목</td>
	<td><input type="text" name="subject" value="나의 PS 파트너"></td>
</tr>
<tr>
	<td>공연시간</td>
	<td><input type="text" name="ctime" value="90분"></td>
</tr>
<tr>
	<td>장소</td>
	<td><input type="text" name="cplace" value="대학로 마루아트홀"></td>
</tr>
<tr>
	<td>금액</td>
	<td><input type="text" name="cprice" value="3000원"></td>
</tr>
<tr>
	<td>공연일자</td>
	<td><input type="text" name="cDate" value="2018.04.29"></td>
</tr>
<tr>
	<td>내용</td>
	<td><textarea cols='100' rows='5' name="content">안녕하세요.별 생각없이 보러 갔는데 너무 재미있게보고 왔습니다 </textarea></td>
</tr>
<tr>
	<td>기타사항</td>
	<td><textarea cols='100' rows='5' name="etc">기타사항</textarea></td>
</tr>
<tr>
	<td>포스터이미지</td>
	<td><input type="file" name="filename" value=""></td>
</tr>
<tr>
	<td colspan='2' align="center"><input type="submit" value="버튼"></td>
</tr>
</table>
</form>
</body>
</html>
