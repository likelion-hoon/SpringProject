<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<a href="registerform.do"> 회원가입</a>


<table border="1">
	<c:forEach var="m" items="${ml}">
		<tr>
			<td>${m.mem_id}</td>
			<td>${m.mem_name}</td>
			<td>${m.mem_pwd}</td>
			<td><a href=delete_member.do?mem_id=${m.mem_id}> 삭제 </a></td>
			<td><a href=edit_member_form.do?mem_id=${m.mem_id}> 수정 </a></td>
		</tr>
	</c:forEach>
</table>


