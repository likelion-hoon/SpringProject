<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html>

<head>

<!--  JQuery CDN 추가 -->
<script src="http://code.jquery.com/jquery.js"></script>
<meta charset="UTF-8">
<title>you know me</title>

<style>
@font-face {
	font-family: 'highSpeed';
	src: url('HIGHSPEED.TTF');
}

.pre {
	font-family: 'highSpeed' !important;
	color: red;
	font-size: 30px;
}

#num_circle, #num_wrong {
	text-align: center;
}

#circle, #wrong {
	align: right;
}
</style>

</head>
<body>

	<table border="1">
		<tr>
			<td style="text-align: center" class="pre">time : <span
				id="time"></span> Sec
			</td>
			<td>남은문제 :</td>
			<td><span id="reser"> 21 / 21 </span></td>

		</tr>
		<tr>
			<td rowspan="2"><img id="pic" src="" width="250px" height="200"></td>
			<td style="text-align: center"><img id="circle" src="circle.png"
				width="50" height="50"></td>
			<td id="num_circle">0</td>
		</tr>
		<tr>
			<td style="text-align: center"><img id="wrong" src="wrong.png"
				width="50" height="50"></td>
			<td id="num_wrong">0</td>
		</tr>
		<tr>
			<td colspan="3"><input type="button" value="초기화"
				style="width: 100px" id="btn_reset"> <input id="txt1"
				type="text" size="10px"> <input type="button" value="정답확인"
				style="width: 100px" id="btn_ans"></td>
		</tr>
	</table>

	<textarea style="overflow: auto; resize: both" id="memo" rows="10"
		cols="54" readonly="true"></textarea>
	<div id="msg"></div>

	<script>
		var i = 0, j = 0; // i는 정답의 수, j는 오답의 수를 나타냄 
		var circle_cnt = 0;
		var wrong_cnt = 0;
		var totalText = ' '; // textarea에 만
		var timeId = null;
		// 현재문제
		var index = 0;
		// 문제순서
		var idxs = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
				17, 18, 19, 20 ];
		//문제
		var imgs = [ "라이언.png", "무지.png", "어피치.png", "재이지.png", "프로도.png",
				"구데타마.png", "네오.png", "튜브.png", "루.png", "마시마로.png", "맹구.png",
				"메타몽.png", "뿌까.png", "앵그리버드.png", "어노잉오렌지.png", "에비츄.png",
				"네티.png", "케로.png", "파피몬.png", "햄토리.png", "헬로키티.png" ];
		// 정답
		var corrects = [ "라이언", "무지", "어피치", "재이지", "프로도", "구데타마", "네오", "튜브",
				"루", "마시마로", "맹구", "메타몽", "뿌까", "앵그리버드", "어노잉오렌지", "에비츄", "네티",
				"케로", "파피몬", "햄토리", "헬로키티" ];
		// 시작하면 자동으로 실행하는 함수 

		function shuffle(a) {
			// 순서 뒤섞기 
			var j, x, i;
			for (i = a.length; i; i--) {
				j = Math.floor(Math.random() * i);
				x = a[i - 1];
				a[i - 1] = a[j];
				a[j] = x;
			}
		}

		// 타이머 시작 함수 
		function starttime() {
			
			sum = 60; 
	
			timeId = setInterval(function() {
				if (sum > 0) {
					sum -= 1;
					$("#time").html(sum);
				} else {
					alert("시간이 초과되었습니다!");
					$("#memo").text(
							"맞은문제 : " + i + "개, 틀린문제 : " + j + "개 , 남은문제 :"
									+ (imgs.length - (i + j)) + "개 , 정답률 :" + i
									/ (i + j) + "%");
					timeover();
				}
			}, 1000);

		}

		// 타이머 멈추는 함수 
		function timeover() {
			clearInterval(timeId);
		}
	</script>

	<script>
		starttime(); // 타이머 시작
		$("#memo").text("");
		shuffle(idxs);
		index = idxs[0];
		$("#pic").attr("src", imgs[idxs[index]]);
		console.log(corrects[idxs[index]]);

		// 정답확인 버튼을 눌렀을 때
		$("#btn_ans").click(function() {

			if ($("#txt1").val() == corrects[idxs[index]]) {
				index++;
				index = index % imgs.length; // 배열의 범위를 벗어 나는 것을 방지한다. 
				$("#pic").attr("src", imgs[idxs[index]]);
				$("#memo").html("정답!!").css("color", "red");
				$("#num_circle").text(++i);
			} else {
				index++;
				index = index % imgs.length;
				$("#pic").attr("src", imgs[idxs[index]]);
				$("#memo").html("오답입니다!!").css("color", "blue");
				$("#num_wrong").text(++j);
			}

			$("#reser").text(imgs.length - (i + j) + " / " + imgs.length);
			$("#txt1").val(""); // html(),text()  
			$("#txt1").focus();
		});

		// 초기화 버튼을 눌렀을 때
		$("#btn_reset").click(function() {
			var answer = confirm("게임을 다시 시작하겠습니까?");
			if (answer) {
				timeover(); // 일단 타이머를 멈춘다
				$("#txt1").val(""); // 입력칸 초기화 
				$("#memo").text(""); // textarea 초기화 
				i = 0;
				$("#num_circle").text(i);
				j = 0;
				$("#num_wrong").text(j);
				starttime(); // 멈춘후 다시 시작한다. 
			}
		});
	</script>

</body>
</html>