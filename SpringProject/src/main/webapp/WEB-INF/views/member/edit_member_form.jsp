<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title> 회원 수정 폼 </title>
</head>

<form action="edit_member.do"> 
	아이디 : <input type="text" name="emem_id" readonly value=${m.mem_id}><br/>
	패스워드 : <input type="password" name="emem_pwd" value=${m.mem_pwd}><br/>
	이름:<input type="text" name="emem_name" value=${m.mem_name}><br/>
	성별:<input type="radio" value="man" name="egender" ${gender[0]}> 남자
	<input type="radio" value="man" name="egender" ${gender[1]}>여자<br/>
	취미:
		<input type="checkbox" value="운동 " name="ehobby" ${hobby[0]}>운동
		<input type="checkbox" value="영화" name="ehobby" ${hobby[1]}>영화
		<input type="checkbox" value="여행 " name="ehobby" ${hobby[2]}>여행
		<input type="checkbox" value="게임" name="ehobby" ${hobby[3]}>게임
		<input type="checkbox" value="독서" name="ehobby" ${hobby[4]}>독서
		<input type="checkbox" value="낚시 " name="ehobby" ${hobby[5]}>낚시<br/>
	<input type="submit" value="보내기"/> 
	<input type="reset" value="다시입력"/>
</form>


</body>
</html>