<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.io.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 5초후에 chat.jsp를 호출한다. -->

<title>채팅 프로그램 만들기</title>
<script src="http://code.jquery.com/jquery.js"></script>
<style>
#div1 {
	background-color: lightblue;
	width: 100%;
	height: 200px;
	overflow-y: auto;
}
</style>
</head>

<body>
	
	<h1>여기는 채팅 페이지 입니다.</h1>
	
	<%
		String msg = " ";

		// 1. 1000배가 빠르다. 무조건 써야한다.
		// 2. 데이터를 한번에 가져온다. 
		BufferedReader br = new BufferedReader(new FileReader("c:/chat.txt"));

		String line = " ";

		// 내용이 몇줄인지 모르기 때문에 
		while ((line = br.readLine()) != null) {
			msg += line;
		}
		
		br.close();
		String chat = request.getParameter("chat");
		
		if (chat != null) {
			
			String id = (String) session.getAttribute("id"); 
			msg += "["+ id + "]" + chat + "<br>";
			// 저장하는 방법
			BufferedWriter bw = new BufferedWriter(new FileWriter("c:/chat.txt"));
			bw.write(msg);
			bw.close();
		}
	%>

	<div id="div1">
		<%=msg%>
	</div>
	<!--  자기 자신을 호출한다. -->
	<form action="chat.jsp">
		<input type="text" name="chat" id="chat">
	</form>
	


	<script>
	
		$("#chat").focus();
		var h = $("#div1").prop('scrollHeight'); 
		$("#div1").scrollTop(h); 
		
		$("img").click(function() {
			$("#chat").val("<img src=" +
					$(this).attr("src")+" width='70' height='70'>");
			$("#chat").focus(); 
		});
		
	</script>

	<a href=logout.jsp>logout</a>

</body>
</html>