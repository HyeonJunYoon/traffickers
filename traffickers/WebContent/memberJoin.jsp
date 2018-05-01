<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<title>회원가입</title>
<style>
	p {font-size:15px; background-color:#ccc; line-height:50px; padding:0px; margin:0px; text-align:center;}
	.td1 {width:20%; background-color:#f0f0f0; margin-left:15px;}
	input[type=text] {width:300px}
</style>
</head>

<body>
<form method="post" action="./member_join.app">
<table border='1' cellspacing='0' cellspacing='0' width="80%">
	<tr>
		<td colspan="2"><p>회원가입 테스트 페이지</p></td>
	</tr>
	<tr>
		<td  class='td1'>id</td>
		<td><input type="text" name="id" value='test2'></td>
	</tr>
	<tr>
		<td class='td1'>pwd</td>
		<td><input type="Password" name="pwd" value='1111'></td>
	</tr>
	<tr>
		<td class='td1'>nickName</td>
		<td><input type="text" name="nickname" value="장재용"></td>
	</tr>
	<tr>
		<td class='td1'>birth</td>
		<td><input type="text" name="birth"></td>
	</tr>
	<tr>
		<td class='td1'>ctype</td>
		<td>
			<select name="ctype">
			<option value="0">일반</option>
			<option value="1">카카오</option>
			<option value="2">facebook</option>
			</select>
	</td>
	</tr>
	<tr>
		<td class='td1'>gender</td>
		<td>
			<select name="gender">
			<option value="0">남</option>
			<option value="1">여</option>
			</select>
		</td>
	</tr>	
	<tr>
		<td colspan='2' style='text-align:center'><input type="submit" value="확인"></td>
	</tr>
	
</table>
</form>
</body>

</html>
