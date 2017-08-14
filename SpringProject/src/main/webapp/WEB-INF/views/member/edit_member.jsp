<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.sk.db.*"%>

<%
	String mem_id = request.getParameter("emem_id");
	String mem_pwd = request.getParameter("emem_pwd");
	String mem_name = request.getParameter("emem_name");
	String gender = request.getParameter("egender");
	String hobbys[] = request.getParameterValues("ehobby");
	String hobby = Arrays.toString(hobbys).toString();

	MemberManager mm = new MemberManager();

	mm.insert(new Member(mem_id, mem_pwd, mem_name, gender, hobby));
	mm.close();
%>