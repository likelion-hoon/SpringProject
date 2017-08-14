<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.sk.db.*" %>

<!--  3초 후에 메인 페이지가 실행하게 만든다 -->
<!-- <meta http-equiv="Refresh" content="3; url=index.jsp">  -->
<%
	String mem_id = request.getParameter("mem_id"); 

	MemberManager mm = new MemberManager();
	
	int cnt = mm.delete(mem_id); 
	mm.close(); 
%>

삭제 레코드 <%= cnt %>
<a href="listmember.jsp"> 목록 </a>