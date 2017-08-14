<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<html>
<head>

<!--  JQuery CDN 추가 -->
<script src="http://code.jquery.com/jquery.js"></script>
<!--  JQuery UI CDN 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script> 
<meta charset="UTF-8">
<title>Game 1-to-50</title>

<style>
.btn {
	width: 50px;
	height: 50px;
}
</style>

</head>
<body>
	<table>
		<tr>
			<td><button class="btn">1</button></td>
			<td><button class="btn">1</button></td>
			<td><button class="btn">1</button></td>
			<td><button class="btn">1</button></td>
			<td><button class="btn">1</button></td>
		</tr>
		<tr>
			<td><button class="btn">2</button></td>
			<td><button class="btn">2</button></td>
			<td><button class="btn">2</button></td>
			<td><button class="btn">2</button></td>
			<td><button class="btn">2</button></td>
		</tr>
		<tr>
			<td><button class="btn">3</button></td>
			<td><button class="btn">3</button></td>
			<td><button class="btn">3</button></td>
			<td><button class="btn">3</button></td>
			<td><button class="btn">3</button></td>
		</tr>
		<tr>
			<td><button class="btn">4</button></td>
			<td><button class="btn">4</button></td>
			<td><button class="btn">4</button></td>
			<td><button class="btn">4</button></td>
			<td><button class="btn">4</button></td>
		</tr>
		<tr>
			<td><button class="btn">5</button></td>
			<td><button class="btn">5</button></td>
			<td><button class="btn">5</button></td>
			<td><button class="btn">5</button></td>
			<td><button class="btn">5</button></td>
		</tr>
	</table>

	<div id="timeCount"></div>
</body>

<script>
	// 시간 함수 정의 
	var count = 0; 
	var d = new Date(); 
	
    setInterval(function() {
    	count += 1;
    	//$("#timeCount").html('시간 ' + M + '분 ' + S + '초 지나갔습니다.');
    }, 1000);

	// data 배열 정의 
	var data = new Array(25);
	for (var k = 0; k < data.length; k++)
		data[k] = k + 1;

	// findOver 배열 정의
	var findOver = new Array(data.length);
	for (var q = 0; q < findOver.length; q++)
		findOver[q] = data[q] + data.length;

	// 함수정의 부분	
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
</script>
<script>
	// 실행 부분 
	shuffle(data); // data함수 섞기 
	shuffle(findOver); // findOver함수 섞기 
	var btn = $(".btn");
	btn.each(function(i, j) {
		$(j).text(data[i]);
	});

	var value = 1;
	// 버튼을 클릭했을때 
	btn.click(function() {
		var answer = $(this).text();
		if (answer == value) {
			if (value <= data.length) {
				$(this).fadeOut(500,function() {        // 숫자 바뀌는 시점이 다르다.
					$(this).text(findOver[value - 1]);   // -> 동기,비동기 문제( 각자의 스레드로 동작한다.)
					console.log(value); 
				});	                                      // 익명함수가 쓰인다. 
				                                     
				$(this).fadeIn(500);              
                                                				
			} else 
				$(this).text("");
			
			if (value == 50)
				alert("수고했습니다!");
			
			value++;
		} else  { // 틀렸을때
			$(this).effect("shake");
		}
	});

	// j는 자바스크립트 객체 text는 jQuery 함수이므로 $를 씌워서 바꿔야 한다.
	// j = docuent.getElementById("") 
	// 자바스크립트는 국제표준, jQuery는 국제표준 아니다. 
	// $(document.getElementById("msg").innerHTML = 'ckt';)
	// $(document.getElementById("msg")).html('ckt'); 
	// $("#msg").html("ckt");
</script>

</html>