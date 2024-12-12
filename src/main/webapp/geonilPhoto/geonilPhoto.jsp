<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>geonilPhoto</title>
<link rel="stylesheet" href="style.css">
<script language="javascript" src="script.js" defer></script>
<script src="https://kit.fontawesome.com/9dc02b3074.js" defer crossorigin="anonymous"></script>
</head>
<body onload="call_js()">
	<div class="main_page">
		<header>
			<div class="header_logo">
				<i class="fa-solid fa-camera-retro"></i> <a href="#"><h1>GEONIL PHOTO</h1></a>
			</div>
			<ul class="header_menu">
				<a href="#"><li>menu</li></a>
				<a href="#"><li>menu</li></a>
				<a href="#"><li>menu</li></a>
				<a href="#"><li>menu</li></a>
			</ul>
			<div class="header_icons">
				<a href="https://www.facebook.com/"><i class="fa-brands fa-facebook"></i></a> 
				<a href="https://www.twitter.com/"><i class="fa-brands fa-twitter"></i></a>
			</div>
		</header>
		<div class="slideshow">
			<div class="slideshow_slide">
				<a href="#"><img src="./image/slide-1.jpg" alt="image1"></a> <a
					href="#"><img src="./image/slide-2.jpg" alt="image2"></a> <a
					href="#"><img src="./image/slide-3.jpg" alt="image3"></a> <a
					href="#"><img src="./image/slide-4.jpg" alt="image4"></a>
			</div>
			<div class="slideshow_nav">
				<a href="#" id="prev"> <i
					class="fa-solid fa-circle-chevron-left"></i>
				</a> <a href="#" id="next"> <i
					class="fa-solid fa-circle-chevron-right"></i>
				</a>
			</div>
			<div class="slideshow_indicator">
				<a href="#" class="active"><i class="fa-solid fa-circle"></i></a> <a
					href="#"><i class="fa-solid fa-circle"></i></a> <a href="#"><i
					class="fa-solid fa-circle"></i></a> <a href="#"><i
					class="fa-solid fa-circle"></i></a>
			</div>
		</div>
		<main>
			<nav>
				<h2>NAV</h2>
			</nav>
			<section>
				<h2>회원가입</h2>
				<form method="post" action="regProc.jsp" name="regForm">
				<table border="1">
					<tr>
						<td align="right">아이디 :</td>
						<td><input type="text" name="id" /><input type="button" value="중복확인" onClick="idCheck()" /></td>
					</tr>
					<tr>
						<td align="right">패스워드 :</td>
						<td><input type="password" name="pass" /></td>
					</tr>
					<tr>
						<td align="right">패스워드 확인:</td>
						<td><input type="password" name="repass" /></td>
					</tr>
					<tr>
						<td align="right">이름 :</td>
						<td><input type="text" name="name" /></td>
					</tr>
					<tr>
						<td align="right">전화번호 :</td>
						<td><select name="phone1">
								<option value="02">02</option>
								<option value="010">010</option>
						</select> - <input type="text" name="phone2" size="5" /> - <input
							type="text" name="phone3" size="5" /></td>
					</tr>
					<tr>
						<td align="right">이메일 :</td>
						<td><input type="text" name="email" /></td>
					</tr>
					<tr>
						<td align="right">우편번호 :</td>
						<td><input type="text" name="zipcode" /> <input type="button" value="찾기" onClick="zipCheck()" /></td>
					</tr>
					<tr>
						<td align="right">주소1 :</td>
						<td><input type="text" name="address1" size="50" /></td>
					</tr>
					<tr>
						<td align="right">주소2 :</td>
						<td><input type="text" name="address2" size="30" /></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="button"
							value="회원가입" onClick="inputCheck()" />&nbsp;&nbsp; <input type="reset" value="다시입력" /></td>
					</tr>
				</table>
				</form>
			</section>
			<aside>
				<h2>ASIDE</h2>
			</aside>
		</main>
		<footer>
			<h2>FOOTER</h2>
		</footer>
	</div>
</body>
</html>