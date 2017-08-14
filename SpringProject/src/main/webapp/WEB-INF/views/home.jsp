<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
	<title>메인 페이지</title>
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
	crossorigin="anonymous">
	
alert("4조 홈페이지에 오신것을 환영합니다."); 	
</script>
</head>
<body>

<div align="center">
	<table> 
		<tr>
			<td colspan="4"> 4조 홈페이지 </td>
		</tr>
		<tr>
			<td colspan="4"> 현재시간 : ${serverTime} </td>
		</tr>
	
		<tr>
			<td> 게임목록 :
			<td> <a href="oneto50.do"> <button class="btn btn-success"> 1) 1to50 게임 </button></a> </td>
			<td> <a href="knowmejq.do"><button class="btn btn-success"> 2) 랜덤 캐릭터</button></a> <td>
			<td> <a href="chat.do">	<button class="btn btn-success"> 3) 우리들의 채팅 </button> </a> <td>
		</tr>
		<tr>
			<td><a href="listmember.do"> 회원목록</a></td>
		</tr>
	</table>
</div>


