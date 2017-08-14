<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>4조 로그인 페이지</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
</head>
<body>
	<div align="center">
		<form action="home.do" method="GET">
			<table>
			<tr>
				<p style="color:red"> 4조 홈페이지 </p>
			</tr>
			<tr>
				<div class="form-group">
						<td> 아이디 </td>
						<td> <input type="text" class="form-control" id="id"> </td>
				</div>
			</tr>
			
			<tr>
				<div class="form-group">
					<td> 비밀번호 </td> 
					<td><input type="password" class="form-control" id="passwd"> </td>
				</div>
			</tr>
			
			<tr>
				<td><button type="submit" class="btn btn-success">로그인</button></td>
				<td><button type="button" class="btn btn-success">회원가입</button></td>
			</tr>
			</table>
		</form>
	</div>
</body>
</html>
