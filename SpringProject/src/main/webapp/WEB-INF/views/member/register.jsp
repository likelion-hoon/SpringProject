<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--  3초 후에 메인 페이지가 실행하게 만든다 -->
<meta http-equiv="Refresh" content="3; url=home.do"> 

<!--  뷰는 철저하게 뷰 역할만 해야한다.  -->

이름 : ${member.mem_name} <br>
아이디 : ${member.mem_id} <br>
패스워드 : ${member.mem_pwd} <br>
성별 : ${member.gender} <br>
취미 : ${member.hobby} <br>.

<a href="/mvcproject"> 메인화면(3초후자동이동) </a> 